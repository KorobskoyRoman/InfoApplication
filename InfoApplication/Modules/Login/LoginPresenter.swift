//
//  LoginPresenter.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 12.05.2022.
//  
//

import Foundation

final class LoginPresenter {
	weak var view: LoginViewInput?
    weak var moduleOutput: LoginModuleOutput?
    
	private let router: LoginRouterInput
	private let interactor: LoginInteractorInput
    
    init(router: LoginRouterInput, interactor: LoginInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension LoginPresenter: LoginModuleInput {
}

extension LoginPresenter: LoginViewOutput {
    func onCloseTap() {
        self.moduleOutput?.loginModuleDidFinish()
    }
    
    func onAuthTap() {
        self.interactor.authentificate()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    func authenticationCompleted() {
        
    }
}
