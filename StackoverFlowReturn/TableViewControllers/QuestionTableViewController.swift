//
//  ViewController.swift
//  StackoverFlowReturn
//
//  Created by John John on 9/4/18.
//  Copyright © 2018 John John. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController {
    
    private var questions: Questions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.fetchQuestions()
    }
    
     func fetchQuestions() {
        
        let urlpath = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=swift&site=stackoverflow"
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

                self.questions = try decoder.decode(Questions.self, from: data!)
                
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
       
        
        if let count = self.questions?.items.count {
            
            return count
        }
        return 0
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! QuestionTableViewCell
        
        if let questions = self.questions {
            cell.titleLabel.text = questions.items[indexPath.row].owner.displayName
        
            let url = URL(string: questions.items[indexPath.row].owner.profileImage)
        
            if let data = try? Data(contentsOf: url!) {
                
               cell.profileImageView.image = UIImage(data: data)
                
            }
            
            cell.ownersNameLabel.text = questions.items[indexPath.row].owner.displayName
//          cell.numberOfAnswersLabel.text = questions.items[indexPath.row]
        }
        return cell
     }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//        spinner.startAnimating()
//        spinner.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 44)
//        self.tableView.tableFooterView = spinner
        
        if let questions = self.questions {
            if (indexPath.row == questions.items.count - 1) {
                self.fetchQuestions()

                print("fetching items")
            }
        }
    }
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AnswerTableViewController Segue" {
            let segue = segue.destination as! AnswerTableViewController
            let path = self.tableView?.indexPath(for: sender as! AnswersTableViewCell)
            if let questions = self.questions {
            
            segue.fetchAnswer(identifer: questions.items[(path?.row)!].questionId)
            }
        }
     }
}


