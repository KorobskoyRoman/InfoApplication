//
//  LoginService.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 12.05.2022.
//

import Foundation
import AuthenticationServices

struct AuthResult {
    let fullName: String
    let token: String
}

final class LoginServiceFactory {
    static func makeApple() -> LoginService? {
        if #available(iOS 13.0, *) {
            return AppleLoginServices()
        } else {
            return nil
        }
    }
}

protocol LoginService {
    func login(completion: @escaping (Result<AuthResult, Error>) -> Void)
}

@available(iOS 13.0, *)
final class AppleLoginServices: NSObject, LoginService {
    
    private var resultHandler: ((Result<AuthResult, Error>) -> Void)?
    
    func login(completion: @escaping (Result<AuthResult, Error>) -> Void) {
        self.resultHandler = completion
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension AppleLoginServices: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credentials = authorization.credential as? ASAuthorizationAppleIDCredential,
              let identityToken = credentials.identityToken
        else {
            fatalError("error unwrap credentials")
        }
        
        let fullName = [credentials.fullName?.givenName, credentials.fullName?.familyName].compactMap {$0}.joined(separator: " ")
        let token = String(decoding: identityToken, as: UTF8.self)
        
        let authResult = AuthResult(fullName: fullName, token: token)
        self.resultHandler?(.success(authResult))
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.resultHandler?(.failure(error))
    }
}

@available(iOS 13.0, *)
extension AppleLoginServices: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        UIApplication.shared.keyWindow!
    }
}
