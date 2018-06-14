//
//  SummaryVC.swift
//  hackday-2018-blockchain-loan-application
//
//  Created by Rick Pearce on 6/14/18.
//  Copyright © 2018 Rick Pearce. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    

}
