//
//  ContactDetailViewController.swift
//  CloudKitAssesment
//
//  Created by ALIA M NEELY on 6/16/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit
import CloudKit

class ContactDetailViewController: UIViewController {
    
    var isEditingExistingContact: Bool = false
    var contact: Contact?
    var indexOfContact: Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if contact != nil {
            nameTextField.text = contact?.name
            phoneNumberTextField.text = contact?.phoneNumber
            emailTextField.text = contact?.emailAddress
        }
        
    }

   
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        if isEditingExistingContact == false {
        guard let name = nameTextField.text, name != "",
        let phoneNumber = phoneNumberTextField.text,
            let emailAddress = emailTextField.text else { return }
        
        ContactController.createContactWith(name: name, phoneNumber: phoneNumber, emailAddress: emailAddress)
        
        navigationController?.popViewController(animated: true)
        }
        
        else if isEditingExistingContact == true {
            
            guard let contact = contact,
                let indexOfContact = indexOfContact,
                let name = nameTextField.text, name != "",
                let phoneNumber = phoneNumberTextField.text,
                let emailAddress = emailTextField.text else { return }
            let newContact = Contact(name: name, phoneNumber: phoneNumber, emailAddress: emailAddress)
            
            let recordIDToMotify = CKRecordID.init(recordName: contact.CKRecordIDString)
            
            ContactController.modifyRecord(updatedRecord: newContact.cloudKitRecord, recordIdToModify: recordIDToMotify )
            
            ContactController.contacts.remove(at: indexOfContact)
            ContactController.contacts.insert(newContact, at: indexOfContact)
            
            
        }
        
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var saveAndUpdateButton: UIBarButtonItem!
    

}
