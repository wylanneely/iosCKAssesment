//
//  ContactsTableViewController.swift
//  CloudKitAssesment
//
//  Created by ALIA M NEELY on 6/16/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit
import CloudKit

class ContactsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshViews), name: ContactController.contactsWereUpdatedNotification, object: nil)
        ContactController.fetchContacts()
    }
    
    func refreshViews() {
        self.tableView.reloadData()
    }
    

        //MARK: - TableView Functions

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactController.contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        let contact = ContactController.contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        
        return cell
    }

   let contactController = ContactController()
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let contact = ContactController.contacts[indexPath.row]
            
            let ckRecordID = CKRecordID.init(recordName: contact.CKRecordIDString)
            
            
            ContactController.deleteRecordWithID(ckRecordID, completion: { (ckrecordId, error) in
                if let error = error {
                    NSLog("Error Deleting from CLOUDKIT: \(error.localizedDescription)")
                }
            })
            
            ContactController.contacts.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "toExistingContact" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? ContactDetailViewController else { return }
            
            let contact = ContactController.contacts[indexPath.row]
            
            detailVC.contact = contact
            detailVC.isEditingExistingContact = true
            detailVC.indexOfContact = indexPath.row
            detailVC.saveAndUpdateButton.title = "Update"
            detailVC.saveAndUpdateButton.tintColor = .red
            
            
        }
        
        
        
    }
    

}
