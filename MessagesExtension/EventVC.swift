//
//  EventVC.swift
//  SharingTime
//
//  Created by Dan Lindsay on 2016-10-24.
//  Copyright © 2016 Dan Lindsay. All rights reserved.
//

import UIKit
import Messages

class EventVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var dates = [Date]()
    var allVotes = [Int]()
    var ourVotes = [Int]()
    weak var delegate: MessagesViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1 - deque the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Date", for: indexPath)
        
        //2 - pull out the corresponding date and format it neatly
        let date = dates[indexPath.row]
        cell.textLabel?.text = DateFormatter.localizedString(from: date, dateStyle: .long, timeStyle: .short)
        
        //3 - add a checkmark if we voted for this date
        if ourVotes[indexPath.row] == 1 {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        //4 - add a vote if other people voted for this date
        if allVotes[indexPath.row] > 0 {
            cell.detailTextLabel?.text = "Votes: \(allVotes[indexPath.row])"
        } else {
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                ourVotes[indexPath.row] = 0
            } else {
                cell.accessoryType = .checkmark
                ourVotes[indexPath.row] = 1
            }
        }
    }
    
    func load(from message: MSMessage?) {
        
        guard let message = message else { return }
        guard let messageURL = message.url else { return }
        guard let urlComponents = URLComponents(url: messageURL, resolvingAgainstBaseURL: false) else { return }
        guard let queryItems = urlComponents.queryItems else { return }
        
        for item in queryItems {
            if item.name.hasPrefix("date-") {
                dates.append(date(from: item.value ?? ""))
            } else if item.name.hasPrefix("vote-") {
                let voteCount = Int(item.value ?? "") ?? 0
                allVotes.append(voteCount)
                ourVotes.append(0)
            }
        }
    }
    
    func date(from string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd-HH-mm"
        
        return dateFormatter.date(from: string) ?? Date()
    }
    
    @IBAction func saveSelectedDates(_ sender: AnyObject) {
        var finalVotes = [Int]()
        
        for (index, votes) in allVotes.enumerated() {
            finalVotes.append(votes + ourVotes[index])
        }
        
        delegate.createMessage(with: dates, votes: finalVotes)
    }
    
    @IBAction func addDate(_ sender: AnyObject) {
        
        //1 - add to the arrays
        dates.append(datePicker.date)
        allVotes.append(0)
        ourVotes.append(1)
        
        //2 - insert a row in the table using animation
        let newIndexpath = IndexPath(row: dates.count - 1, section: 0)
        tableView.insertRows(at: [newIndexpath], with: .automatic)
        
        //3 - scroll the new row into view
        tableView.scrollToRow(at: newIndexpath, at: .bottom, animated: true)
        
        //4 - flash the scroll bars so the user know something has changed
        tableView.flashScrollIndicators()
    }
    

}














