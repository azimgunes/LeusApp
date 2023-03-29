//
//  RegisterViewController.swift
//  LeusApp
//
//  Created by Azim Güneş on 29.03.2023.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var closeImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        closeImage.addGestureRecognizer(tapGestureRecognizer)
        closeImage.isUserInteractionEnabled = true


        }
    
    @IBAction func registerButton(_ sender: UIButton) {
        if mailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: mailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata!")
                }else {
                    self.performSegue(withIdentifier: "toViewController", sender: nil)
                }
            }
        }else {
            self.makeAlert(titleInput: "Bilgi!", messageInput: "Tüm alanların doldurulması zorunludur!")
        }
    }
    
    
    @objc func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    @objc func imageTapped(){
        self.performSegue(withIdentifier: "toViewController", sender: nil)
}

    }
