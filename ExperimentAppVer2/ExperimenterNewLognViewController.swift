//
//  ExperimenterNewLognViewController.swift
//  ExperimentApp
//
//  Created by XHQ on 2019/6/8.
//  Copyright © 2019 XHQ. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ExperimenterNewLognViewController: UIViewController, UITextFieldDelegate {
    
    let db = Firestore.firestore()

    @IBOutlet weak var newLogInLabel: UILabel!
    @IBOutlet weak var newUniversityTextField: UITextField!
    @IBOutlet weak var newIdTextField: UITextField!
    @IBOutlet weak var newMailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var newAlertLabel: UILabel!
    @IBOutlet weak var universityAlert: UILabel!
    @IBOutlet weak var studentIdAlert: UILabel!
    @IBOutlet weak var mailAlert: UILabel!
    @IBOutlet weak var passwordAlert: UILabel!
    
    @IBAction func backArrow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    func errorMessage(of error: Error?) {
        
        var message = "エラーが発生しました"
        guard let errcd = AuthErrorCode(rawValue: (error! as NSError).code) else { return }
        
        switch errcd {
        case .networkError:
            message = "ネットワークに接続できません"
            AlertContrller.showAlert(self, title: "Missing Info", message: message)
        case .invalidEmail:
            message = "*メールアドレスの形式が\n正しくありません"
            newAlertLabel.text = message
        case .emailAlreadyInUse:
            message = "*このメールアドレスはすでに\n使われています"
            newAlertLabel.text = message
        default: break
        }
    }
    
    @IBAction func newSignUpButton(_ sender: Any) {
    
        if let university = newUniversityTextField.text,
            let studentId = newIdTextField.text,
            let email = newMailTextField.text,
           let password = newPasswordTextField.text {

            if university == ""  {
                self.universityAlert.text = "*大学名を入力してください"
            } else if studentId == ""{
                self.studentIdAlert.text = "*学生番号を入力してください"
            } else {
                
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
               
//                let user = Auth.auth().currentUser
              
                    if user != nil {
                        
                        print("successfully")
                        self.addUniversityStudentId()
                        
                    } else {
                        print("fail")
                        self.errorMessage(of: error)
                        
                        if email == "" {
                            self.mailAlert.text = "*メールアドレスを入力してください"
                        }
                        if password == "" {
                            self.passwordAlert.text = "*パスワードを入力してください"
                        }
                    }
                }
            }

        } else {
            print("error")
            AlertContrller.showAlert(self, title: "Missing Info", message: "Error")
        }

    }
    
    func addUniversityStudentId () {
        
        guard let university = newUniversityTextField.text,
              let studentid = newIdTextField.text,
            let email = newMailTextField.text else { return }
        
//        var ref: DocumentReference? = nil
        db.collection("users").addDocument(data: [
            "University": university,
            "StudentId": studentid,
            "Email": email
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("成功した")
                self.performSegue(withIdentifier: "goToEditing", sender: self)
            }
        }
        
    
    }
    
    @IBAction func mailChanged(_ sender: UITextField) {
        newAlertLabel.text = ""
        mailAlert.text = ""
    }
    
    @IBAction func passwordChanged(_ sender: UITextField) {
        newAlertLabel.text = ""
        passwordAlert.text = ""
    }
    
    @IBAction func universityChanged(_ sender: UITextField) {
        universityAlert.text = ""
    }
    
    @IBAction func studentIdChanged(_ sender: UITextField) {
        studentIdAlert.text = ""
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newIdborder = CALayer()
        let newPsborder = CALayer()
        let newUnborder = CALayer()
        let newMailborder = CALayer()
        
        
        newIdborder.borderColor = #colorLiteral(red: 0.09080412239, green: 0.2870057821, blue: 0.5362405777, alpha: 1)
        newIdborder.frame = CGRect(x: 0, y: newIdTextField.frame.height, width: newIdTextField.frame.size.width, height: 1)
        newIdborder.borderWidth = CGFloat(2.0)
        
        newPsborder.borderColor = #colorLiteral(red: 0.09080412239, green: 0.2870057821, blue: 0.5362405777, alpha: 1)
        newPsborder.frame = CGRect(x: 0, y: newPasswordTextField.frame.height, width: newPasswordTextField.frame.size.width, height: 1)
        newPsborder.borderWidth = CGFloat(2.0)
        
        newUnborder.borderColor = #colorLiteral(red: 0.09080412239, green: 0.2870057821, blue: 0.5362405777, alpha: 1)
        newUnborder.frame = CGRect(x: 0, y: newUniversityTextField.frame.height, width: newUniversityTextField.frame.size.width, height: 1)
        newUnborder.borderWidth = CGFloat(2.0)
        
        newMailborder.borderColor = #colorLiteral(red: 0.09080412239, green: 0.2870057821, blue: 0.5362405777, alpha: 1)
        newMailborder.frame = CGRect(x: 0, y: newMailTextField.frame.height, width: newMailTextField.frame.size.width, height: 1)
        newMailborder.borderWidth = CGFloat(2.0)

        self.newIdTextField.layer.addSublayer(newIdborder)
        self.newIdTextField.borderStyle = .none
        self.newPasswordTextField.layer.addSublayer(newPsborder)
        self.newPasswordTextField.borderStyle = .none
        self.newUniversityTextField.layer.addSublayer(newUnborder)
        self.newUniversityTextField.borderStyle = .none
        self.newMailTextField.layer.addSublayer(newMailborder)
        self.newMailTextField.borderStyle = .none
        
        self.newIdTextField.delegate = self
        self.newPasswordTextField.delegate = self
        self.newUniversityTextField.delegate = self
        self.newMailTextField.delegate = self
        
        self.newUniversityTextField.attributedPlaceholder = NSAttributedString(string: "所属大学", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.7294, green: 0.7843, blue: 0.8275, alpha: 1.0)])
        self.newIdTextField.attributedPlaceholder = NSAttributedString(string: "学生番号", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.7294, green: 0.7843, blue: 0.8275, alpha: 1.0)])
        self.newMailTextField.attributedPlaceholder = NSAttributedString(string: "メールアドレス", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.7294, green: 0.7843, blue: 0.8275, alpha: 1.0)])
        self.newPasswordTextField.attributedPlaceholder = NSAttributedString(string: "パスワード", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.7294, green: 0.7843, blue: 0.8275, alpha: 1.0)])
    }
    
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
    
}
