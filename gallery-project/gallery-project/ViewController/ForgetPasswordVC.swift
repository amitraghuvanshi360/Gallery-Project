//
//  ForgetPasswordVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 07/04/23.
//

import Foundation
import UIKit

protocol GetDataFromForgetPasswordProtocol: AnyObject {
    
    func getData(email: String)
}


class ForgetPasswordVC: UIViewController{
    var isFieldShow: Bool = false
    var completionGetData: ( (String) -> Void )?
    weak var delegate: GetDataFromForgetPasswordProtocol?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var resetPasswordBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.passwordView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.passwordView.layer.borderWidth = 1
        self.passwordView.layer.cornerRadius = 20
        self.resetPasswordBttn.layer.cornerRadius = 20
    }
    @IBAction func resetPasswordAction(_ sender: Any) {
        
        guard let emailId = self.emailTextField.text else{
            return
        }
        if !Validation.isValidEmailAddress(email: emailId){
            AlertController.CreateAlertMessage(title: Constant.error, message: Constant.enteredInvalidEmail, viewController: self)
        }
        let moveToNextVC = self.storyboard?.instantiateViewController(withIdentifier: "NewPasswordVC") as! NewPasswordVC
        moveToNextVC.isHideShow = self.isFieldShow
        self.navigationController?.pushViewController(moveToNextVC, animated: true)
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
