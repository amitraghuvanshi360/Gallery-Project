//
//  NewPasswordVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 07/04/23.
//

import Foundation
import UIKit

class NewPasswordVC: BaseViewController{
    
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var confirmPasswordView: UIView!

    @IBOutlet private weak var newpasswordField: UITextField!
    @IBOutlet private weak var confirmPassField: UITextField!
    @IBOutlet private weak var setNewPassword: UIButton!

    @IBOutlet private weak var passwordVisibilityBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.initLayout()

    }

    @IBAction func backActionButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewPasswordVC{
     func initLayout(){
        self.passwordView.layer.borderWidth = 1
        self.passwordView.layer.cornerRadius = 25
        self.passwordView.layer.borderColor = ColorCode.defaultColor.cgColor

        self.confirmPasswordView.layer.borderWidth = 1
        self.confirmPasswordView.layer.cornerRadius = 25
        self.confirmPasswordView.layer.borderColor = ColorCode.defaultColor.cgColor

        self.passwordVisibilityBttn.layer.cornerRadius = 25
        self.passwordVisibilityBttn.layer.borderColor = ColorCode.defaultColor.cgColor
        
        self.setNewPassword.layer.cornerRadius = 25
        
    } // function end
} // extension end

