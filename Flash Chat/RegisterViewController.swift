//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        SVProgressHUD.show()
        //TODO: Set up a new user on our Firbase database
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            //all of this is a closure. it only gets called once the user creation
            //has completed. it is a callback method
            if(error != nil) {
                print(error!)
            }
            else {
                print("Registration Succesful!")
                SVProgressHUD.dismiss()
            }
            //take user from register view controller to chat view controller
            self.performSegue(withIdentifier: "goToChat", sender: self)
        }

        
        
    } 
    
    
}
