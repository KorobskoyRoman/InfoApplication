//
//  LoginInteractor.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 12.05.2022.
//  
//

import Foundation

final class LoginInteractor {
	weak var output: LoginInteractorOutput?
        
    private var loginSerivce: LoginService?
}

extension LoginInteractor: LoginInteractorInput {
    func authentificate() {
        self.loginSerivce = LoginServiceFactory.makeApple()
        self.loginSerivce?.login(completion: { result in
            switch result {
            case .success(let authResult):
                self.output?.authenticationCompleted()
            case .failure(let error):
                assertionFailure("handle \(error)")
            }
        })
    }
}
