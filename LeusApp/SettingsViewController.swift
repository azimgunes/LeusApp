//
//  SettingsViewController.swift
//  LeusApp
//
//  Created by Azim Güneş on 14.03.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signOutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch{
            print("Hata!")
        }
    }
    
    /*
     Örnek etkisiz yazı biçimi
    */

}
