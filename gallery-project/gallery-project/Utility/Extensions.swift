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


extension UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10) / 2
        return CGSize(width: size, height: size)
    }
}

