//
//  EventVC.swift
//  SharingTime
//
//  Created by Dan Lindsay on 2016-10-24.
//  Copyright © 2016 Dan Lindsay. All rights reserved.
//

import UIKit

class EventVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Date", for: indexPath)
        cell.textLabel?.text = "Date goes here"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    @IBAction func saveSelectedDates(_ sender: AnyObject) {
    }
    
    @IBAction func addDate(_ sender: AnyObject) {
    }
    

}
