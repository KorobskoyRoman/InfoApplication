//
//  BaseRouter.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 12.05.2022.
//

import Foundation
import UIKit

class BaseRouter {
    var navigationControllerProvider: (() -> UINavigationController?)? = nil
    
    var navigationController: UINavigationController? {
        self.navigationControllerProvider?()
    }
}
