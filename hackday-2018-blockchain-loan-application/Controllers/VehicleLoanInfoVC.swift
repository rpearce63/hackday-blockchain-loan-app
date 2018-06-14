//
//  VehicleLoanInfoVC.swift
//  hackday-2018-blockchain-loan-application
//
//  Created by Rick Pearce on 6/13/18.
//  Copyright © 2018 Rick Pearce. All rights reserved.
//

import UIKit
import CoreData

class VehicleLoanInfoVC: UIViewController {

    @IBOutlet weak var loanAmount: UITextField!
    @IBOutlet weak var loanTerm: UITextField!
    @IBOutlet weak var quoteSwitch: UISwitch!
    @IBOutlet weak var vehicleInfoView: UIView!
    @IBOutlet weak var vehYear: UITextField!
    @IBOutlet weak var vehMake: UITextField!
    @IBOutlet weak var vehModel: UITextField!
    @IBOutlet weak var vehCondition: UITextField!
    @IBOutlet weak var vehPrice: UITextField!
    
    
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
        self.loanAmount.text = loanApplication.loanAmount
        self.loanTerm.text = loanApplication.loanTerms
        self.quoteSwitch.isOn = loanApplication.quoteRequested
        if quoteSwitch.isOn {
            self.vehicleInfoView.isHidden = false
            self.vehYear.text = loanApplication.year
            self.vehMake.text = loanApplication.make
            self.vehModel.text = loanApplication.model
            self.vehCondition.text = loanApplication.condition
            self.vehPrice.text = loanApplication.price
        }
        
    }
    
    
    @IBAction func quoteSwitchChanged(_ sender: Any) {
        vehicleInfoView.isHidden = !quoteSwitch.isOn
    }
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        loanApplication?.loanAmount = self.loanAmount.text
        loanApplication?.loanTerms = self.loanTerm.text
        loanApplication?.quoteRequested = quoteSwitch.isOn
        if quoteSwitch.isOn {
            loanApplication?.year = self.vehYear.text
            loanApplication?.make = self.vehMake.text
            loanApplication?.model = self.vehModel.text
            loanApplication?.condition = self.vehCondition.text
            loanApplication?.price = self.vehPrice.text
            
            self.saveData()
            
            DataService.instance.sendData(loanApplication: loanApplication!)
            DataService.instance.getData()
        }
    }
    

}
