//
//  ViewController.swift
//  LeusApp
//
//  Created by Azim Güneş on 14.03.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
    }

    
    
    @IBAction func registerButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toRegisterVC", sender: nil)
    }
    
    
    @IBAction func signInButton(_ sender: Any) {
        
 
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata!")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else{
            self.makeAlert(titleInput: "Hata!", messageInput: "Hatalı e-posta ya da şifre!")

        }
        
    }
    

    
    @objc func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

