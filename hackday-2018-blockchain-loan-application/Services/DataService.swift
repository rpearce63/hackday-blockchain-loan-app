//
//  DataService.swift
//  hackday-2018-blockchain-loan-application
//
//  Created by Rick Pearce on 6/13/18.
//  Copyright © 2018 Rick Pearce. All rights reserved.
//

import UIKit
import CoreData


 class DataService {
    static let instance = DataService()

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveData(data: ApplicationData) {
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(data)
        let jsonObj = String(data: encoded, encoding: .ascii)
        UserDefaults.standard.set(jsonObj, forKey: "loanAppData")
    }
    
    func getData() -> ApplicationData {
        if let jsonData = UserDefaults.standard.object(forKey: "loanAppData") as? String {
            let decoder = JSONDecoder()
            if let data = jsonData.data(using: .ascii) {
                let appData = try! decoder.decode(ApplicationData.self, from: data)
                return appData
            }
        }
        return ApplicationData()
    }
    
}

extension NSManagedObject {
    func toJSON() -> String? {
        let keys = Array(self.entity.attributesByName.keys)
        let dict = self.dictionaryWithValues(forKeys: keys)
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            let reqJSONStr = String(data: jsonData, encoding: .utf8)
            return reqJSONStr
        }
        catch{}
        return nil
    }
}

