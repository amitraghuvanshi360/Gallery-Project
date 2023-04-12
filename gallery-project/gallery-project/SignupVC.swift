//
//  SignupVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 10/04/23.
//

import Foundation
import UIKit

class SignupVC: BaseViewController, UINavigationControllerDelegate {
    
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
    
    @IBOutlet weak var genderMaleBttn: UIButton!
    @IBOutlet weak var genderFemaleBttn: UIButton!
    @IBOutlet weak var genderOtherBttn: UIButton!
    
    
    @IBOutlet private weak var hobbyView: UIView!
    @IBOutlet private weak var hobbyTextField: UITextView!
    @IBOutlet private weak var continueBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInitialLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.profileOnTapGesture()

    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signupButtonAction(_ sender: Any) {
        
        let userName = self.nameTextField.text
        let userEmail = self.emailTextField.text
        let userPassword = self.passwordTextField.text
        let mobileNumber = self.mobileTextField.text
        let hobby = self.hobbyTextField.text
        guard  let name = userName, let email = userEmail, let password = userPassword, let mobile = mobileNumber, let hobbies = hobby else{
            return
        }
        let error = Validation.validateInputData(name: name, email: email, password: password, mobile: mobile , hobbies: hobbies)
        if !error.isEmpty{
            AlertController.CreateAlertMessage(title: Constant.error, message: error, viewController: self)
        }
    }
    
    @IBAction func genderButtonAction(_ sender: UIButton) {
        self.genderMaleBttn.isSelected = false
        self.genderFemaleBttn.isSelected = false
        self.genderFemaleBttn.isSelected = false
        self.genderMaleBttn.setImage(UIImage(named: "unselected"), for: .normal)
        self.genderFemaleBttn.setImage(UIImage(named: "unselected"), for: .normal)
        self.genderOtherBttn.setImage(UIImage(named: "unselected"), for: .normal)

        if !sender.isSelected{
            sender.setImage(UIImage(named: "record"), for: .normal)
            sender.isSelected = true
            print(sender.isSelected)
            return
        }else{
            sender.setImage(UIImage(named: "unselected"), for: .normal)
            sender.isSelected = false
            print(sender.isSelected)
            return
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
    
    
//    MARK: select profile image
    @objc func selectProfileImage(){
//        if picker.isSourceTypeAvailable(.photoLibrary){
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        present(picker, animated: true, completion: nil)
        
    }
    
   private func profileOnTapGesture(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectProfileImage))
        pickProfileImage.addGestureRecognizer(tapGestureRecognizer)
        pickProfileImage.isUserInteractionEnabled = true
    }
 
} // end extension body


extension SignupVC: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickProfileImage.image =  image
        }
    }
    
} // extension end body
