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
    
    
    func getData() {
        let urlString = "https://jsonplaceholder.typicode.com/posts/1"
        guard let url = URL(string: urlString) else { return }
        //print("got url: ", url)
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                let loanAppData = try JSONDecoder().decode(FakePost.self, from: data)
                DispatchQueue.main.async {
                    print(loanAppData)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    func sendData(loanApplication: LoanApplication) {
        let jsonLoanApp = loanApplication.toJSON()
        let loanEndpoint: String = "https://jsonplaceholder.typicode.com/posts"
        guard let loanURL = URL(string: loanEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        var loanUrlRequest = URLRequest(url: loanURL)
        loanUrlRequest.httpMethod = "POST"
        //let newTodo: FakePost = FakePost(userId: 1, id: nil, title: "A Title", body: "A Body")
        //let jsonTodo: Data
        //do {
            //jsonTodo = try JSONEncoder().encode(newTodo)
            loanUrlRequest.httpBody = jsonLoanApp
//        } catch {
//            print("Error: cannot create JSON from todo")
//            return
//        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: loanUrlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /todos/1")
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                print(responseData.debugDescription)
                let jsonData = try JSONSerialization.jsonObject(with: responseData, options: [.mutableContainers]) as? [String: AnyObject]
                DispatchQueue.main.async {
                    print(jsonData!)
                }
            } catch  {
                print("error parsing response from POST on /todos")
                return
            }
        }
        task.resume()
    }
}

struct FakePost: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}

extension NSManagedObject {
    func toJSON() -> Data? {
        let keys = Array(self.entity.attributesByName.keys)
        let dict = self.dictionaryWithValues(forKeys: keys)
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
            //let reqJSONStr = String(data: jsonData, encoding: .utf8)
            return jsonData
            
        }
        catch{}
        return nil
    }
}

