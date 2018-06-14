//
//  CustomerInfoVC.swift
//  hackday-2018-blockchain-loan-application
//
//  Created by Rick Pearce on 6/13/18.
//  Copyright © 2018 Rick Pearce. All rights reserved.
//

import UIKit
import CoreData

class CustomerInfoVC: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var street2: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
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
        self.firstName.text = loanApplication.firstName
        self.middleName.text = loanApplication.middleName
        self.lastName.text = loanApplication.lastName
        self.street.text = loanApplication.streetAddress
        self.city.text = loanApplication.city
        self.state.text = loanApplication.state
        self.zipCode.text = loanApplication.zipCode
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        loanApplication?.firstName = firstName.text!
        loanApplication?.middleName = middleName.text!
        loanApplication?.lastName = lastName.text!
        loanApplication?.streetAddress = street.text!
        loanApplication?.city = city.text!
        loanApplication?.state = state.text!
        loanApplication?.zipCode = zipCode.text!
        
        self.saveData()
    }
    
    

}
