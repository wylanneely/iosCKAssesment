//
//  Contact.swift
//  CloudKitAssesment
//
//  Created by ALIA M NEELY on 6/16/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation
import CloudKit

class Contact {
    
    //MARK: - Keys
    
    static let cKRecordTypeKey = "Contact"
    
    private let kName = "name"
    private let kPhoneNumeber = "phoneNumber"
    private let kEmailAddress = "emailAddress"
    
    //MARK: - Properties
    
    let name: String
    let phoneNumber: String
    let emailAddress: String
    
    var cloudKitRecord: CKRecord {
        
        let record = CKRecord(recordType: Contact.cKRecordTypeKey)
        
        record.setValue(name, forKey: kName)
        record.setValue(phoneNumber, forKey: kPhoneNumeber)
        record.setValue(emailAddress, forKey: kEmailAddress)
        
        return record
    }
    
    
    //MARK: - Inits
    
    init(name: String, phoneNumber: String, emailAddress: String){
        self.name = name
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
    }
    
    init?(cloudKitRecord: CKRecord){
        guard let name = cloudKitRecord[kName] as? String,
            let phoneNumber = cloudKitRecord[kPhoneNumeber] as? String,
            let emailAddress = cloudKitRecord[kEmailAddress] as? String else {return nil}
        self.name = name
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
        
    }
    
    
}
