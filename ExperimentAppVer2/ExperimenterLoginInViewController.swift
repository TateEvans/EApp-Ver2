//
//  ExperimenterLoginInViewController.swift
//  ExperimentApp
//
//  Created by XHQ on 2019/6/7.
//  Copyright © 2019 XHQ. All rights reserved.
//

import UIKit
import FirebaseAuth

class ExperimenterLoginInViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func backArrow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var logInLabel: UILabel!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    
    func errorMessage(of error: Error?) {
        
        var message = "エラーが発生しました"
        guard let errcd = AuthErrorCode(rawValue: (error! as NSError).code) else {
            return
        }
        switch errcd {
        case .networkError:
            message = "ネットワークに接続できません"
            AlertContrller.showAlert(self, title: "Missing Info", message: message)
        case .userNotFound:
            message = "*メールアドレスまたはパスワードは\n間違っています"
            alertLabel.text = message
        case .wrongPassword:
            message = "*メールアドレスまたはパスワードは\n間違っています"
            alertLabel.text = message
        default: break
        }
    }
    
    @IBAction func logInButton(_ sender: Any) {
        
        if let email = mailTextField.text,
            let password = passwordTextField.text{

            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                    print("successfully")
                } else {
                    self.errorMessage(of: error)
                    if email == ""{
                        self.alertLabel.text = "*メールアドレスまたはパスワードは\n間違っています"
                    }
                    print("fail")
                }
            }

        } else {
        AlertContrller.showAlert(self, title: "Missing Info", message: "Error")
        }
    }
    
    @IBAction func passwordResetButton(_ sender: UIButton) {
    
        guard let email = mailTextField.text else { return }
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            guard let self = self else { return }
            if error == nil {
               
            } else {
                AlertContrller.showAlert(self, title: "Missing Info", message: "Sending error")
            }
        }
       
        
    }

    @IBAction func mailTextField(_ sender: UITextField) {
        alertLabel.text = ""
    }
    @IBAction func passwordTextField(_ sender: UITextField) {
        alertLabel.text = ""
    }
    
    
    @IBAction func newLogButton(_ sender: UIButton) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let idborder = CALayer()
        let psborder = CALayer()
        
        idborder.borderColor = #colorLiteral(red: 0.09080412239, green: 0.2870057821, blue: 0.5362405777, alpha: 1)
        idborder.frame = CGRect(x: 0, y: mailTextField.frame.height, width: mailTextField.frame.size.width, height: 1)
        idborder.borderWidth = CGFloat(2.0)
        
        psborder.borderColor = #colorLiteral(red: 0.09080412239, green: 0.2870057821, blue: 0.5362405777, alpha: 1)
        psborder.frame = CGRect(x: 0, y: passwordTextField.frame.height, width: passwordTextField.frame.size.width, height: 1)
        psborder.borderWidth = CGFloat(2.0)
        
        self.mailTextField.layer.addSublayer(idborder)
        self.mailTextField.borderStyle = .none
        
        self.passwordTextField.layer.addSublayer(psborder)
        self.passwordTextField.borderStyle = .none
        
       
        self.mailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.mailTextField.attributedPlaceholder = NSAttributedString(string: "メールアドレス", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.7294, green: 0.7843, blue: 0.8275, alpha: 1.0)])
        self.passwordTextField.attributedPlaceholder = NSAttributedString(string: "パスワード", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.7294, green: 0.7843, blue: 0.8275, alpha: 1.0)])
        
        alertLabel.numberOfLines = 0
        
//       self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
}
