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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        self.initialLayout()
        
    }
    
    
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
    

}
extension LoginVC{
//    MARK: Layout setup
    func initialLayout(){
        self.emailView.layer.cornerRadius = 20
        self.passwordView.layer.cornerRadius = 20
        self.emailView.layer.borderWidth = 1
        self.passwordView.layer.borderWidth = 1
        self.emailView.layer.borderColor = ButtonColor.defaultColor.cgColor
        self.passwordView.layer.borderColor = ButtonColor.defaultColor.cgColor
        self.continueButton.layer.cornerRadius = 20
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
}
