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
    
    
    // Mark: - Global Variables
    /// Identify Variables
    
    var timer = Timer()
    var totalSeconds: Float = 0
    var lapHistoryArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLB.text = "Press Start."
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - tableView methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timerHistoryTableView.dequeueReusableCell(withIdentifier: "lapHistoryCell")
        cell?.textLabel?.text = lapHistoryArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapHistoryArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    // MARK: - UpdateTimer Function
    // function to update timer label every time the timer ticking
    func updateTimer() {
        
        totalSeconds += 0.01
        let totalSecondsMulti100: Int = Int(totalSeconds * 100)
        let min = Int(totalSeconds/60)
        let hour = Int(min/60)
        
        let minString = (min == 0) ? "00" : "\(min)"
        let hourString = (hour == 0) ? "00" : "\(hour)"
        let secondString = (totalSeconds < 10) ? "0\(Float(totalSecondsMulti100)/100)" : "\(Float(totalSecondsMulti100)/100)"
        
        timerLB.text = "\(hourString):\(minString):\(secondString)"
        
        
        
    }
    
    
    
    
    
    
    
    
    // MARK: - Buttons IBActions
    /// IBActions for the start, stop and lap Buttons
    
    // Button action for start the watch
    @IBAction func startBTPressed(_ sender: UIButton) {
        // test button pressed
        // print("Start Pressed")
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        
        
    }
    
    // Button action for stop the watch
    @IBAction func stopBTPressed(_ sender: UIButton) {
       // test button pressed
        //print("Stop Pressed")
        timer.invalidate()
        
    }
    
    // Button action for Lap the watch
    @IBAction func lapBTPressed(_ sender: UIButton) {
        // test button pressed
        //print("Lap Pressed")
       
        lapHistoryArray.append(timerLB.text!)
        timerHistoryTableView.reloadData()
        
        
        
    }
    
    
    
    
    

}

