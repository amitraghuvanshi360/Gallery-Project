//
//  ForgetPasswordVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 07/04/23.
//

import Foundation
import UIKit

class ForgetPasswordVC: UIViewController{
    
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
        let moveToNextVC = self.storyboard?.instantiateViewController(withIdentifier: "NewPasswordVC") as! NewPasswordVC
        self.navigationController?.pushViewController(moveToNextVC, animated: true)
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
