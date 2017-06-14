//
//  ContactDetailViewController.swift
//  CloudKitAssesment
//
//  Created by ALIA M NEELY on 6/16/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, name != "",
        let phoneNumber = phoneNumberTextField.text,
            let emailAddress = emailTextField.text else { return }
        
        ContactController.createContactWith(name: name, phoneNumber: phoneNumber, emailAddress: emailAddress)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    

}
