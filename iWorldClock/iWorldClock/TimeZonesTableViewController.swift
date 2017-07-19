//
//  TimeZonesTableViewController.swift
//  iWorldClock
//
//  Created by Michael Tanious on 7/19/17.
//  Copyright © 2017 WMWiOS. All rights reserved.
//

import UIKit

protocol WorldClockProtocol {
    func addTimeZone (timeZone: String)
}


class TimeZonesTableViewController: UITableViewController, UISearchBarDelegate {

    //Mark: - Variables
    var timeZones = [String]()
    var delegate: WorldClockProtocol?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var searchText: UISearchBar!
    
    
    
    
    
    
    
    
    // hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchText.delegate = self

        timeZones = NSTimeZone.knownTimeZoneNames
       
    }

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timeZones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeZoneCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = timeZones[indexPath.row]

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTimeZone = timeZones[indexPath.row]
        delegate?.addTimeZone(timeZone: selectedTimeZone)
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - UISearchBar Delegate Methods
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel")
        self.dismiss(animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            timeZones = NSTimeZone.knownTimeZoneNames.filter { $0.contains(searchText)}
        } else {
            timeZones = NSTimeZone.knownTimeZoneNames
            
        }
        tableView.reloadData()
    }
    
}










