//
//  NewPasswordVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 07/04/23.
//

import Foundation
import UIKit

class NewPasswordVC: BaseViewController{
    
//   MARK: IB outlets
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var confirmPasswordView: UIView!

    @IBOutlet private weak var newpasswordField: UITextField!
    @IBOutlet private weak var confirmPassField: UITextField!
    @IBOutlet private weak var setNewPassword: UIButton!
    @IBOutlet private weak var eyeButton1: UIButton!
    @IBOutlet private weak var eyeButton2: UIButton!
        
    @IBOutlet private weak var otpIndex1: UITextField!
    
    @IBOutlet private weak var otpIndex2: UITextField!
    
    @IBOutlet private weak var otpIndex3: UITextField!
    
    @IBOutlet private weak var otpIndex4: UITextField!
    
    @IBOutlet private weak var otpIndex5: UITextField!
    
    @IBOutlet private weak var otpIndex6: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.initLayout()

    }
//MARK: back to previous activity
    @IBAction func backActionButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
//   MARK: Password visibility action

    @IBAction func createPasswordVisibilityAction(_ sender: Any) {
        self.passwordViewAction(eyebutton: self.eyeButton1, textField: self.newpasswordField)
    }
    @IBAction func confirmPasswordVisibilityAction(_ sender: Any) {
        self.passwordViewAction(eyebutton: self.eyeButton2, textField: self.confirmPassField)
    }
    
}



extension NewPasswordVC{
//      MARK:   Setup field layout and styling
     func initLayout(){
        self.passwordView.layer.borderWidth = 1
        self.passwordView.layer.cornerRadius = 25
        self.passwordView.layer.borderColor = ColorCode.defaultColor.cgColor

        self.confirmPasswordView.layer.borderWidth = 1
        self.confirmPasswordView.layer.cornerRadius = 25
        self.confirmPasswordView.layer.borderColor = ColorCode.defaultColor.cgColor

        self.eyeButton1.layer.cornerRadius = 25
        self.eyeButton1.layer.borderColor = ColorCode.defaultColor.cgColor
        self.setNewPassword.layer.cornerRadius = 25
         
         self.otpIndex1.layer.borderWidth = 1
         self.otpIndex1.layer.cornerRadius = 10

         
         self.otpIndex2.layer.borderWidth = 1
         self.otpIndex2.layer.cornerRadius = 10

         self.otpIndex3.layer.borderWidth = 1
         self.otpIndex3.layer.cornerRadius = 10

         self.otpIndex4.layer.borderWidth = 1
         self.otpIndex4.layer.cornerRadius = 10

         self.otpIndex5.layer.borderWidth = 1
         self.otpIndex5.layer.cornerRadius = 10

         self.otpIndex6.layer.borderWidth = 1
         self.otpIndex6.layer.cornerRadius = 10

        
    } // function end
    
    //   MARK: Password Visibility action
    func passwordViewAction(eyebutton : UIButton , textField: UITextField){
            if eyebutton.isSelected{
                textField.isSecureTextEntry = true
                eyebutton.setImage(UIImage(named: "hidden"), for: .normal)
                eyebutton.isSelected = false
            }else{
                textField.isSecureTextEntry = false
                eyebutton.setImage(UIImage(named: "view"), for: .normal)
                eyebutton.isSelected = true
            }
        }
    
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength: Int = 0
        if textField == self.otpIndex1{
            maxLength = 1
        }else if textField == self.otpIndex2{
            maxLength = 1
        }else if textField == self.otpIndex3{
            maxLength = 1
        }else if textField == self.otpIndex4{
            maxLength = 1
        }else if textField == self.otpIndex5{
            maxLength = 1
        }else if textField == self.otpIndex6{
            maxLength = 1
        }
        let currentStr:NSString = textField.text as! NSString
        let newStr:NSString = currentStr.replacingCharacters(in: range, with: string) as! NSString
        return newStr.length <= maxLength
    }
    
} // extension end


// MARK: Textfield Delegate
