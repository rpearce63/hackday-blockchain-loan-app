//
//  SummaryVC.swift
//  hackday-2018-blockchain-loan-application
//
//  Created by Rick Pearce on 6/14/18.
//  Copyright © 2018 Rick Pearce. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController {

    @IBOutlet weak var loanNumber: UILabel!
    @IBOutlet weak var loanAmount: UILabel!
    @IBOutlet weak var approvalDate: UILabel!
    @IBOutlet weak var userPIN: UILabel!
    @IBOutlet weak var monthlyPremium: UILabel!
    
    var summary: Summary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loanNumber.text = summary?.loanNumber
        self.loanAmount.text = summary?.loanAmount
        self.approvalDate.text = summary?.loanApplicationDate
        self.userPIN.text = summary?.generatedUserPin
        self.monthlyPremium.text = summary?.monthlyInsurancePremium
    }

   
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    

}
