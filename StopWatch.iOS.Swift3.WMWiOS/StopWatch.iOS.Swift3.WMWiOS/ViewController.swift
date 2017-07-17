//
//  ViewController.swift
//  StopWatch.iOS.Swift3.WMWiOS
//
//  Created by Michael Tanious on 7/17/17.
//  Copyright © 2017 WMWiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    /// IB Outlets
    
    // IBOutlet for timer Label
    @IBOutlet weak var timerLB: UILabel!
    
     // IBOutlet for timer History TableView Label
    @IBOutlet weak var timerHistoryTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timerHistoryTableView.dequeueReusableCell(withIdentifier: "lapHistoryCell")
        cell?.textLabel?.text = "test"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    /// IBActions for the start, stop and lap Buttons
    
    // Button action for start the watch
    @IBAction func startBTPressed(_ sender: UIButton) {
        print("Start Pressed")
    }
    
    // Button action for stop the watch
    @IBAction func stopBTPressed(_ sender: UIButton) {
        print("Stop Pressed")
    }
    
    // Button action for Lap the watch
    @IBAction func lapBTPressed(_ sender: UIButton) {
        print("Lap Pressed")
    }
    
    
    
    
    

}

