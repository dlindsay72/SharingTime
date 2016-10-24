//
//  EventVC.swift
//  SharingTime
//
//  Created by Dan Lindsay on 2016-10-24.
//  Copyright © 2016 Dan Lindsay. All rights reserved.
//

import UIKit

class EventVC: UIViewController {
    
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func saveSelectedDates(_ sender: AnyObject) {
    }
    
    @IBAction func addDate(_ sender: AnyObject) {
    }
    

}
