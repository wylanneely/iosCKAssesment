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
    private let kCKRecordIdString = "recordIDString"
    
    //MARK: - Properties
    
    let name: String
    let phoneNumber: String
    let emailAddress: String
    let uuid: UUID
    var CKRecordIDString: String {
        return (uuid.uuidString)
    }
    
    
    
    
    
    
    var cloudKitRecord: CKRecord {
        
        let recordID = CKRecordID.init(recordName: CKRecordIDString)
        
        let record = CKRecord(recordType: Contact.cKRecordTypeKey, recordID: recordID)
        
        record.setValue(name, forKey: kName)
        record.setValue(phoneNumber, forKey: kPhoneNumeber)
        record.setValue(emailAddress, forKey: kEmailAddress)
        record.setValue(CKRecordIDString, forKey: kCKRecordIdString)
        
        return record
    }
    
    
    //MARK: - Inits
    
    init(name: String, phoneNumber: String, emailAddress: String, UUID: UUID = UUID()){
        self.name = name
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
        self.uuid = UUID
    }
    
    init?(cloudKitRecord: CKRecord){
        guard let name = cloudKitRecord[kName] as? String,
            let phoneNumber = cloudKitRecord[kPhoneNumeber] as? String,
            let emailAddress = cloudKitRecord[kEmailAddress] as? String,
        let cKRecordIdAsString = cloudKitRecord[kCKRecordIdString] as? String,
            //turn the record
        let uuid = UUID(uuidString: cKRecordIdAsString) else {return nil}
        
        self.uuid = uuid
        self.name = name
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
        
    }
    
    
    
}
