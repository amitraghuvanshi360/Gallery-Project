//
//  SignupVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 10/04/23.
//

import Foundation
import UIKit
import iOSDropDown

class SignupVC: BaseViewController, UINavigationControllerDelegate {
    private var country: Country?
    private var countrydata: [countryData]? = []
    let picker = UIImagePickerController()

    @IBOutlet private weak var profileView: UIView!
    @IBOutlet private weak var pickProfileImage: UIImageView!
    
    @IBOutlet private weak var nameView: UIView!
    @IBOutlet private weak var nameTextField: UITextField!
    
    @IBOutlet private weak var emailView: UIView!
    @IBOutlet private weak var emailTextField: UITextField!
    
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBOutlet private weak var mobileView: UIView!
    @IBOutlet private weak var mobileTextField: UITextField!
    
    @IBOutlet private weak var countryView: UIView!
    @IBOutlet private weak var countryTextField: DropDown!
    
    @IBOutlet private weak var genderView: UIView!
    
    @IBOutlet private weak var genderMaleBttn: UIButton!
    @IBOutlet private  weak var genderFemaleBttn: UIButton!
    @IBOutlet private weak var genderOtherBttn: UIButton!
    
    
    @IBOutlet private weak var hobbyTextField: DropDown!
    @IBOutlet private weak var hobbyView: UIView!
    @IBOutlet private weak var continueBttn: UIButton!
    
    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInitialLayout()
        self.setDropDownData()
        APIManager.countryListAPI{ data in
            self.country = data as? Country
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.profileOnTapGesture()

    }
    
    //MARK: - IB Button Actions
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    MARK: SignUp Button Action
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
    
//    MARK: Gender button action
    @IBAction func genderButtonAction(_ sender: UIButton) {
        self.genderMaleBttn.isSelected = false
        self.genderFemaleBttn.isSelected = false
        self.genderOtherBttn.isSelected = false
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
        
        self.nameView.setLayoutForSignUp()
        self.emailView.setLayoutForSignUp()
        self.passwordView.setLayoutForSignUp()
        self.mobileView.setLayoutForSignUp()
        self.countryView.setLayoutForSignUp(cornerRadius: 10.0)
        self.hobbyView.setLayoutForSignUp(cornerRadius: 10.0)
        
        self.continueBttn.layer.cornerRadius = 25
        self.continueBttn.layer.borderColor = ButtonColor.defaultColor.cgColor
        
    }
    
    
    func setDropDownData(){
        self.countryTextField.optionArray = ["India"]
        countryTextField.didSelect{(selectedText , index ,id) in
            self.countryTextField.text = "\(selectedText) \n index: \(index)"
        }
        self.hobbyTextField.optionArray = ["Singing" , "Dancing" ,"Cooking", "Running", "Painting"]
        self.hobbyTextField.didSelect{( selectedText , index , id) in
            self.hobbyTextField.text = "\(selectedText) \n index: \(index)"
        }

    }
   
} // end extension body



extension SignupVC: UIImagePickerControllerDelegate {
    //    MARK: select profile image
        @objc func selectProfileImage() {
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
            present(picker, animated: true, completion: nil)
            
        }
//        MARK: Profile tap gesture
       private func profileOnTapGesture(){
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectProfileImage))
            pickProfileImage.addGestureRecognizer(tapGestureRecognizer)
            pickProfileImage.isUserInteractionEnabled = true
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickProfileImage.image =  image
        }
    }
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength: Int = 0
        if textField == self.mobileTextField{
            maxLength = 10
        }
        let currentStr:NSString = textField.text as! NSString
        let newStr:NSString = currentStr.replacingCharacters(in: range, with: string) as! NSString
        return newStr.length <= maxLength
    }
} // extension end body
