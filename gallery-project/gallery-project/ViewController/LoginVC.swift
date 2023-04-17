//
//  LoginVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 07/04/23.
//

import Foundation
import UIKit

protocol ValidationProtocol {
    func validateEmail()
}


class LoginVC: BaseViewController {
 

    //    MARK: - IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var eyeButton: UIButton!
    @IBOutlet private weak var emailView: UIView!
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var signupButton: UIButton!
    

    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.initialLayout()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: - IB Button Actions

    @IBAction func moveToSignup(_ sender: Any) {
       let vc =  self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction func forgetPasswordAction(_ sender: Any) {
        let moveToNext = self.storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordVC") as! ForgetPasswordVC
        self.navigationController?.pushViewController(moveToNext, animated: true)
    }
    

    @IBAction func passwordHideShowAction(_ sender: Any) {
        self.passwordViewAction()
    }
    

    @IBAction func LoginButtonAction(_ sender: Any) {
        
        let userEmail = self.emailTextField.text
        let userPassword = self.passwordTextField.text
        guard let email = userEmail, let password = userPassword  else{
            return
        }
        let error = Validation.validateInputData(useremail: email , userpassword: password)
        if !error.isEmpty{
            AlertController.CreateAlertMessage(title: Constant.error, message: error, viewController: self)
        }


        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
//        APIMAnager.LoginRequestAPI{
//            data in
//            print(data)
//        }
    }
}


//    MARK: Layout styling
extension LoginVC{
    
//    MARK: Set initial layout
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
    
} // extension end

