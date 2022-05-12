//
//  LoginProtocols.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 12.05.2022.
//  
//

import Foundation

protocol LoginModuleInput {
	var moduleOutput: LoginModuleOutput? { get }
}

protocol LoginModuleOutput: AnyObject {
    func loginModuleDidFinish()
}

protocol LoginViewInput: AnyObject {
}

protocol LoginViewOutput: AnyObject {
    func onCloseTap()
    func onAuthTap()
}

protocol LoginInteractorInput: AnyObject {
    func authentificate()
}

protocol LoginInteractorOutput: AnyObject {
    func authenticationCompleted()
}

protocol LoginRouterInput: AnyObject {
}
