//
//  WorldClockTableViewController.swift
//  iWorldClock
//
//  Created by Michael Tanious on 7/19/17.
//  Copyright © 2017 WMWiOS. All rights reserved.
//

import UIKit

class WorldClockTableViewController: UITableViewController {
    
    
    //MARK: - Variables
    var timeZonesToDisplay = ["GMT", "Europe/Paris", "Asia/Dubai", "Europe/Dublin", "America/New_York"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add an Edit button on the left of the navigation bar
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timeZonesToDisplay.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorldClockCell", for: indexPath) as! WorldClockTableViewCell
        
        // Configure the cell...
        cell.timeZoneName.text = timeZonesToDisplay[indexPath.row]
        
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            timeZonesToDisplay.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
   
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
        let temp1 = timeZonesToDisplay[fromIndexPath.row]
        let temp2 = timeZonesToDisplay[to.row]
        timeZonesToDisplay[fromIndexPath.row] = temp2
        timeZonesToDisplay[to.row] = temp1
        tableView.reloadData()
        
     }
    
    
    
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    
     return true
     }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
