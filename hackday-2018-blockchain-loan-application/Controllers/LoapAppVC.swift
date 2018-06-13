//
//  LoapAppVC.swift
//  hackday-2018-blockchain-loan-application
//
//  Created by Rick Pearce on 6/13/18.
//  Copyright © 2018 Rick Pearce. All rights reserved.
//

import UIKit

class LoapAppVC: UIViewController {

    @IBOutlet weak var vehicleLoanView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func quoteSwitchChanged(_ sender: UISwitch) {
        vehicleLoanView.isHidden = !sender.isOn
    }
}
