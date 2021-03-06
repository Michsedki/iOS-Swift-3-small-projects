//
//  WorldClockTableViewCell.swift
//  iWorldClock
//
//  Created by Michael Tanious on 7/19/17.
//  Copyright © 2017 WMWiOS. All rights reserved.
//

import UIKit

class WorldClockTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var timeZoneName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
        
        
        RunLoop.current.add(timer, forMode: .commonModes)
        
        
        
    }
    
    func setTime() {
        timeLabel.text = getTime()
        
    }
    
    func getTime() -> String {
        var timeString = ""
        if timeZoneName.text != "" {
            let formatter = DateFormatter()
            formatter.timeStyle = .long
            formatter.timeZone = TimeZone(identifier: timeZoneName.text!)
            let timeNow = Date()
            timeString = formatter.string(from: timeNow) 
          
        }
        
        
        return timeString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}














