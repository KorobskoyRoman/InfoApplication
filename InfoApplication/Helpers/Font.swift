//
//  Font.swift
//  InfoApplication
//
//  Created by Roman Korobskoy on 09.05.2022.
//

import UIKit

enum Font {
    enum Weight {
        case regular, bold
    }
    
    static func system(ofSize size: CGFloat, weight: Weight) -> UIFont {
        switch weight {
        case .regular:
            return UIFont.systemFont(ofSize: size, weight: .regular)
        case .bold:
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}
