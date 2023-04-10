//
//  SignupVC.swift
//  gallery-project
//
//  Created by Ankush Sharma on 10/04/23.
//

import Foundation
import UIKit

class SignupVC: UIViewController{
    
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var genderView: UIView!
    
    @IBOutlet weak var hobbyView: UIView!
    @IBOutlet weak var hobbyTextField: UITextView!
    @IBOutlet weak var continueBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setInitialLayout()
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    private func setInitialLayout(){
        self.nameView.layer.borderWidth = 1
        self.nameView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.nameView.layer.cornerRadius = 25
        
        self.emailView.layer.borderWidth = 1
        self.emailView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.emailView.layer.cornerRadius = 25
        
        self.passwordView.layer.borderWidth = 1
        self.passwordView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.passwordView.layer.cornerRadius = 25
        
        self.nameView.layer.borderWidth = 1
        self.nameView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.nameView.layer.cornerRadius = 25
        
        self.countryView.layer.borderWidth = 1
        self.countryView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.countryView.layer.cornerRadius = 10
        
        self.hobbyView.layer.borderWidth = 1
        self.hobbyView.layer.borderColor = ColorCode.defaultColor.cgColor
        self.hobbyView.layer.cornerRadius = 10
     
        self.continueBttn.layer.cornerRadius = 25
        self.continueBttn.layer.borderColor = ButtonColor.defaultColor.cgColor
        
    }
}
