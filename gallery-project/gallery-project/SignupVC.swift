//
//  SignupVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 10/04/23.
//

import Foundation
import UIKit

class SignupVC: UIViewController, UINavigationControllerDelegate{
    
    let picker = UIImagePickerController()

    @IBOutlet private weak var profileView: UIView!
    @IBOutlet weak var pickProfileImage: UIImageView!
    
    @IBOutlet private weak var nameView: UIView!
    @IBOutlet private weak var nameTextField: UITextField!
    
    @IBOutlet private weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBOutlet private weak var mobileView: UIView!
    @IBOutlet private weak var mobileTextField: UITextField!
    
    @IBOutlet private weak var countryView: UIView!
    @IBOutlet private weak var countryTextField: UITextField!
    
    @IBOutlet private weak var genderView: UIView!
    
    @IBOutlet private weak var hobbyView: UIView!
    @IBOutlet private weak var hobbyTextField: UITextView!
    @IBOutlet private weak var continueBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectProfileImage))
        pickProfileImage.addGestureRecognizer(tapGestureRecognizer)
        pickProfileImage.isUserInteractionEnabled = true
        self.setInitialLayout()
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signupButtonAction(_ sender: Any) {
        
        let userName = self.nameTextField.text
        let userEmail = self.emailTextField.text
        let userPassword = self.passwordTextField.text
        let mobileNumber = self.mobileTextField.text
        guard  let name = userName, let email = userEmail, let password = userPassword, let mobile = mobileNumber else{
            return
        }
        let error = self.validateInputData(name: name, email: email, password: password, mobile: mobile)
        if !error.isEmpty{
            AlertController.CreateAlertMessage(title: Constant.error, message: error, viewController: self)
        }
    }
}

extension SignupVC {
//    MARK: setup layout initailization
    func setInitialLayout(){
        self.profileView.layer.cornerRadius = min(self.profileView.frame.size.height, self.profileView.frame.size.width) / 2.0
        self.profileView.layer.borderWidth = 1
        self.profileView.clipsToBounds = true

        self.profileView.backgroundColor = ColorCode.profileColor
        
        self.pickProfileImage.layer.cornerRadius = min(self.profileView.frame.size.height, self.pickProfileImage.frame.size.width) / 2.0
        self.pickProfileImage.clipsToBounds = true
        
        self.nameView.layer.borderWidth = 1
        self.nameView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.nameView.layer.cornerRadius = 25
        
        self.emailView.layer.borderWidth = 1
        self.emailView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.emailView.layer.cornerRadius = 25
        
        self.passwordView.layer.borderWidth = 1
        self.passwordView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.passwordView.layer.cornerRadius = 25
        
        self.mobileView.layer.borderWidth = 1
        self.mobileView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.mobileView.layer.cornerRadius = 25
        
        self.countryView.layer.borderWidth = 1
        self.countryView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.countryView.layer.cornerRadius = 10
        
        self.hobbyView.layer.borderWidth = 1
        self.hobbyView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.hobbyView.layer.cornerRadius = 10
     
        self.continueBttn.layer.cornerRadius = 25
        self.continueBttn.layer.borderColor = ButtonColor.defaultColor.cgColor
        
        self.hobbyTextField.text = "Placeholder"
    }
    
//    MARK: Validating input data
    func validateInputData(name: String, email: String , password: String , mobile: String) -> String{
        var errorMessage: String = ""
        if name.isEmpty {
            errorMessage = Constant.enterName
            return errorMessage
        }else if name.count < 3{
            errorMessage = Constant.isNameShort
            return errorMessage
        }
        
        else if email.isEmpty{
            errorMessage = Constant.isEmailEmpty
            return errorMessage
        }
        else if !Validation.isValidEmailAddress(email: email){
            errorMessage = Constant.enteredInvalidEmail
            return errorMessage
        }
        
        else if password.isEmpty {
            errorMessage = Constant.enterPassword
            return errorMessage
        }else if password.count < 6 {
            errorMessage = Constant.isPasswordShort
        }
        
        else if mobile.isEmpty {
            errorMessage = Constant.enterMobile
            return errorMessage
        }else if mobile.count < 10 {
            errorMessage = Constant.isMobileLength
            return errorMessage
        }else if mobile.count > 10 {
            errorMessage = Constant.isMobileEntered
            return errorMessage
        }
        
        return errorMessage
    } //end validation func validation  body
    
    
//    MARK: select profile image
    @objc func selectProfileImage(){
//        if picker.isSourceTypeAvailable(.photoLibrary){
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        present(picker, animated: true, completion: nil)
        
    }
} // end extension body




// MARK: TextField delegate methods
extension SignupVC : UITextFieldDelegate{
    
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


extension SignupVC: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickProfileImage.image =  image
        }
    }
}
