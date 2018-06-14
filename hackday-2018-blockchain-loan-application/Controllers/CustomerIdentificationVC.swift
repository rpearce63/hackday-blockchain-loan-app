//
//  CustomerIdentificationVC.swift
//  hackday-2018-blockchain-loan-application
//
//  Created by Rick Pearce on 6/13/18.
//  Copyright © 2018 Rick Pearce. All rights reserved.
//

import UIKit
import CoreData

class CustomerIdentificationVC: UIViewController {
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var driversLicenseNumber: UITextField!
    @IBOutlet weak var dlIssuingState: UITextField!
    @IBOutlet weak var dlIssuedDate: UITextField!
    @IBOutlet weak var dlRenewalDate: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var loanApplication : LoanApplication?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        let request : NSFetchRequest<LoanApplication> = LoanApplication.fetchRequest()
        do {
            loanApplication = try context.fetch(request).first
            populateFields(data: loanApplication!)
        } catch {
            print(error)
        }
    }

    
    func saveData() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func populateFields(data loanApplication: LoanApplication) {
        self.emailAddress.text = loanApplication.emailAddress
        self.phoneNumber.text = loanApplication.contactNumber
        self.ssn.text = loanApplication.ssn
        self.dateOfBirth.text = loanApplication.dateOfBirth
        self.driversLicenseNumber.text = loanApplication.driverLicenseNumber
        self.dlIssuedDate.text = loanApplication.driverLicenseIssueDate
        self.dlRenewalDate.text = loanApplication.driverLicenseExpirationDate
        self.dlIssuingState.text = loanApplication.driverLicenseIssuingState
        
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        loanApplication?.emailAddress = self.emailAddress.text
        loanApplication?.contactNumber = self.phoneNumber.text
        loanApplication?.ssn = self.ssn.text
        loanApplication?.dateOfBirth = self.dateOfBirth.text
        loanApplication?.driverLicenseNumber = self.driversLicenseNumber.text
        loanApplication?.driverLicenseIssueDate = self.dlIssuedDate.text
        loanApplication?.driverLicenseExpirationDate = self.dlRenewalDate.text
        loanApplication?.driverLicenseIssuingState = self.dlIssuingState.text
        
        self.saveData()
    }
    
    

}
