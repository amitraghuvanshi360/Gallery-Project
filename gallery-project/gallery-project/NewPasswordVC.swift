//
//  NewPasswordVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 07/04/23.
//

import Foundation
import UIKit

class NewPasswordVC: UIViewController{
    
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var confirmPasswordView: UIView!

    @IBOutlet private weak var newpasswordField: UITextField!
    @IBOutlet private weak var confirmPassField: UITextField!
    @IBOutlet weak var setNewPassword: UIButton!

    @IBOutlet weak var passwordVisibilityBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.initLayout()

    }

}

extension NewPasswordVC{
     func initLayout(){
        self.passwordView.layer.borderWidth = 1
        self.passwordView.layer.cornerRadius = 25
        self.passwordView.layer.borderColor = ButtonColor.defaultColor.cgColor

        self.confirmPasswordView.layer.borderWidth = 1
        self.confirmPasswordView.layer.cornerRadius = 25
        self.confirmPasswordView.layer.borderColor = ButtonColor.defaultColor.cgColor

        self.passwordVisibilityBttn.layer.cornerRadius = 25
        self.passwordVisibilityBttn.layer.borderColor = ButtonColor.defaultColor.cgColor
        
        self.setNewPassword.layer.borderWidth = 1
        self.setNewPassword.layer.cornerRadius = 25
        self.setNewPassword.layer.borderColor = ButtonColor.defaultColor.cgColor
        
    }
}
