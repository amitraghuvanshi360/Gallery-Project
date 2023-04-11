//
//  LoginVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 07/04/23.
//

import Foundation
import UIKit


class LoginVC: UIViewController{
    
//    var isEnable:Bool = false
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.initialLayout()
        
    }
    
    
//    MARK: Move to next controller SignupVC
    @IBAction func moveToSignup(_ sender: Any) {
       let vc =  self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    MARK: Forget password Action
    @IBAction func forgetPasswordAction(_ sender: Any) {
        let moveToNext = self.storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordVC") as! ForgetPasswordVC
        self.navigationController?.pushViewController(moveToNext, animated: true)
    }
    
//    MARK: Password hide show action
    @IBAction func passwordHideShowAction(_ sender: Any) {
        self.passwordViewAction()
    }
    
//    MARK: Login Action button and validating fields
    @IBAction func LoginButtonAction(_ sender: Any) {
        let userEmail = self.emailTextField.text
        let userPassword = self.passwordTextField.text
        guard let email = userEmail, let password = userPassword  else{
            return
        }
        let error = self.validateInputData(useremail: email , userpassword: password)
        if !error.isEmpty{
            AlertController.CreateAlertMessage(title: Constant.error, message: error, viewController: self)
        }
    }
    
}

// MARK: TextField delegate methods
extension LoginVC : UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
                return true;
            }
            return false
    }
}

//    MARK: Layout styling
extension LoginVC{

    func initialLayout(){
        self.emailView.layer.cornerRadius = 20
        self.passwordView.layer.cornerRadius = 20
        self.emailView.layer.borderWidth = 1
        self.passwordView.layer.borderWidth = 1
        self.emailView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.passwordView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.continueButton.layer.cornerRadius = 20
        self.signupButton.layer.cornerRadius = 20
    }
    
//    MARK: Password Visibility action
    func passwordViewAction(){
        if eyeButton.isSelected{
            self.passwordTextField.isSecureTextEntry = true
            self.eyeButton.setImage(UIImage(named: "hidden"), for: .normal)
            self.eyeButton.isSelected = false
        }else{
            self.passwordTextField.isSecureTextEntry = false
            self.eyeButton.setImage(UIImage(named: "view"), for: .normal)
            self.eyeButton.isSelected = true
        }
    }
    
//    MARK: field validations
    func validateInputData(useremail: String , userpassword: String) ->String {
            var errorMessage: String = ""
            if useremail.isEmpty {
                errorMessage = Constant.isEmailEmpty
                return errorMessage
            }else if !Validation.isValidEmailAddress(email: useremail){
                errorMessage = Constant.enteredInvalidEmail
                return errorMessage
            }else if userpassword.isEmpty {
                errorMessage = Constant.enterPassword
                return errorMessage
            }else if userpassword.count < 6 {
                errorMessage = Constant.isPasswordShort
                return errorMessage
            }
        return ""
        } // function end
    
} // extension end

