//
//  NewPasswordVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 07/04/23.
//

import Foundation
import UIKit

class NewPasswordVC: BaseViewController{
//  MARK:  Global variables
    
    var isHideShow:Bool = false
    
    //   MARK: IB outlets
    @IBOutlet private weak var buttonHeight: NSLayoutConstraint!
    @IBOutlet private weak var fieldStackVw: UIStackView!
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var confirmPasswordView: UIView!
    
    @IBOutlet private weak var verifyOtpButton: UIButton!
    @IBOutlet private weak var newpasswordField: UITextField!
    @IBOutlet private weak var confirmPassField: UITextField!
    @IBOutlet private weak var submitBttn: UIButton!
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
        self.checkFieldShouldHideOrShow()
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
    
//    MARK: Submit button action
    @IBAction func submitButtonAction(_ sender: Any) {
        let newpass = self.newpasswordField.text
        let confpass = self.confirmPassField.text
        
        guard let newpassword = newpass , let confirmpassword = confpass else {
            return
        }
        let error = Validation.isNewPasswordValid(newPassword: newpassword, confirmpPassword: confirmpassword)
        
        if !error.isEmpty{
            AlertController.CreateAlertMessage(title: Constant.error, message: error, viewController: self)
        }
    }
}



extension NewPasswordVC{
    //      MARK:   Setup field layout and styling
    func initLayout(){
        // view
        self.setViewlayout(view: self.passwordView)
        self.setViewlayout(view: self.confirmPasswordView)
        
        // button
        self.setButtonLayout(button: self.submitBttn)
        self.setButtonLayout(button: self.verifyOtpButton)
        
        // fields
        self.otpFieldLayout(textField: otpIndex1)
        self.otpFieldLayout(textField: otpIndex2)
        self.otpFieldLayout(textField: otpIndex3)
        self.otpFieldLayout(textField: otpIndex4)
        self.otpFieldLayout(textField: otpIndex5)
        self.otpFieldLayout(textField: otpIndex6)

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
    
    // checking for max length otp field
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


extension NewPasswordVC{
    //    Check field should hide or show
    func checkFieldShouldHideOrShow(){
        self.fieldStackVw.isHidden = self.isHideShow
        self.verifyOtpButton.isHidden = !self.isHideShow
        //        if self.isHideShow{
        //            self.buttonHeight.constant = 45
        //        }else{
        //            self.buttonHeight.constant = 0
        //        }
        self.buttonHeight.constant =  self.isHideShow ? 45 : 0
    }
    
    //      setup view styling
    func setViewlayout(view:  UIView){
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 25
        view.layer.borderColor = ColorCode.defaultColor.cgColor
    }
   
    //    setup button styling
    func setButtonLayout(button: UIButton){
        button.layer.cornerRadius = 25
    }
   
    //   setup textfield styling
    func otpFieldLayout(textField: UITextField){
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
    }
}
