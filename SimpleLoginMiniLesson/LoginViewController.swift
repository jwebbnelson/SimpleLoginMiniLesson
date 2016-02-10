//
//  LoginViewController.swift
//  SimpleLoginMiniLesson
//
//  Created by Jordan Nelson on 2/10/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func forgotPasswordTapped(sender: AnyObject) {
       
        let alert = UIAlertController(title: "Forgot Password? : (", message: "Enter email to reset.", preferredStyle: .Alert)
      
        // Add actions
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancel)
        
        
        let reset = UIAlertAction(title: "Reset", style: .Default) { (action) -> Void in
            if let textFields = alert.textFields {
                if textFields[0].hasText() {
                    if let forgottenEmail = textFields[0].text {
                        self.createAlert("Check your email ~ \(forgottenEmail) for password reset!", success: true)
                    }
                } else {
                    self.createAlert("Invalid Email", success: false)
                }
            }
        }
        alert.addAction(reset)
        
        // Add Textfield
        alert.addTextFieldWithConfigurationHandler { (emailField) -> Void in
            emailField.placeholder = "emailexample@gmail.com"
        }
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func signInTapped(sender: AnyObject) {
    
        // Check textfields for empty case -> t/f
        if checkTextFields() == true {
            // sign in user
            createAlert("Signed In \(emailField.text!)", success: true)
        } 
    }
    
    func checkTextFields() -> Bool {
        // Check for empty fields
        if emailField.text?.isEmpty == true || passwordField.text?.isEmpty == true {
            createAlert("Must enter required fields to sign in.", success: false)
            return false
        } else {
            // Checking email for @
            if emailField.text?.containsString("@") == false {
                createAlert("Enter valid  email address", success: false)
                return false
            } else {
                return true
            }
        }
    }
    
    
    func createAlert(alertMessage:String, success:Bool) {
       
        var titleString = ""
        if success == true {
            titleString = "SUCCESS"
        } else {
            titleString = "ERROR"
        }
        
        let alertController = UIAlertController(title: titleString, message: alertMessage, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // check for valid email ~ @
        if textField == emailField && textField.text?.containsString("@") == false {
            textField.textColor = UIColor.redColor()
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.textColor = UIColor.blackColor()
    }
}











