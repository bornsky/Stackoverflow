//
//  AnswerTableViewController.swift
//  StackoverFlowReturn
//
//  Created by John John on 9/4/18.
//  Copyright © 2018 John John. All rights reserved.
//

import UIKit

class AnswerTableViewController: UITableViewController {

    public var answers: Answers?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func fetchAnswer(identifer: Int) {
        
        let urlpath = "https://api.stackexchange.com/2.2/questions/\(identifer)/answers?order=desc&sort=activity&site=stackoverflow"
        let endpoint = URL(string: urlpath)
        var request = URLRequest(url: endpoint!)
        let session = URLSession.shared
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        let task = session.dataTask(with: request) { (data, response, err) in
            
            if let error = err {
                print(error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                self.answers = try decoder.decode(Answers.self, from: data!)
                
                DispatchQueue.main.async {
            
                    self.tableView.reloadData()
                }
                
            } catch let error as NSError {
                print("Error messages: \(error)")
            }
        }
        task.resume()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
