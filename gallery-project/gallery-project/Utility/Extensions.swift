//
//  Extensions.swift
//  gallery-project
//
//  Created by Ankush Sharma on 13/04/23.
//

import Foundation
import UIKit

extension UIView {
    
    func setLayoutForSignUp(cornerRadius: CGFloat = 25.0) {
        self.layer.borderWidth = 1
        self.layer.borderColor = ColorCode.defaultColor.cgColor
        self.layer.cornerRadius = cornerRadius
    }
}
