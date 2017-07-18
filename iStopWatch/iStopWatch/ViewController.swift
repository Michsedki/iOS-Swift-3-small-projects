//
//  ViewController.swift
//  iStopWatch
//
//  Created by Michael Tanious on 7/18/17.
//  Copyright © 2017 WMWiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    //MARK: - Global Variables
    var timer = Timer()
    var seconds:Int = 0
    var minutes: Int = 0
    var fractions:Int = 0
    var startStopWatch = true
    var addLap = false
    var displayString = ""
    
    
    
    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var DisplayLB: UILabel!
    @IBOutlet weak var lapsTableView: UITableView!
    @IBOutlet weak var startStopLB: UIButton!
    @IBOutlet weak var lapResetLB: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayLB.text = "00:00.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
cell.backgroundColor = self.view.backgroundColor
        cell.textLabel?.text = "Lap"
        cell.detailTextLabel?.text = "00:00:00"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //updateStopWatch function
    
    func updateStopWatch() {
        
        fractions += 1
        if fractions == 100 {
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        let fractionsString = (fractions > 9) ? "\(fractions)" : "0\(fractions)"
     
        let secondsString = (seconds > 9) ? "\(seconds)" : "0\(seconds)"
        let minutesString = (minutes > 9) ? "\(minutes)" : "0\(minutes)"
        
        displayString = "\(minutesString):\(secondsString).\(fractionsString)"
        DisplayLB.text = displayString
    }
    
    
    
    

    //MARK: - IBActions
    
    @IBAction func startStopBTPressed(_ sender: UIButton) {
        
        
        if startStopWatch == true {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateStopWatch), userInfo: nil, repeats: true)
            startStopWatch = false
            
            startStopLB.setImage(UIImage(named: "Stop.png"), for: .normal)
            lapResetLB.setImage(UIImage(named: "Lap.png"), for: .normal)
            addLap = true
            
            
            
        } else {
            timer.invalidate()
            startStopWatch =  true
            startStopLB.setImage(UIImage(named: "Start.png"), for: .normal)
            lapResetLB.setImage(UIImage(named: "Reset.png"), for: .normal)
            addLap = false
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    @IBAction func lapResetBTPressed(_ sender: UIButton) {
    }
    
    

}

