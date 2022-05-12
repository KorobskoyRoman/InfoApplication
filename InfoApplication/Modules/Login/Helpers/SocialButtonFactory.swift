//
//  SocialButtonFactory.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 12.05.2022.
//

import UIKit
import AuthenticationServices

final class SocialButtonFactory: UIButton {
    
    func makeApple() -> UIControl? {
        
        if #available(iOS 13.0, *) {
            return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
        } else {
            return nil
        }
    }
}
