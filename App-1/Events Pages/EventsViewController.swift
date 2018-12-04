//
//  ViewController.swift
//  App-1
//
//  Created by J. Lozano on 11/28/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class EventsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var artistEvents: Artist!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        artistEvents = Artist()
        artistEvents.getConcerts(){
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEvent" {
            let destination = segue.destination as! EventDetailViewController
            
            let selectedIndex = tableView.indexPathForSelectedRow!
            destination._artist.artistName = artistEvents.eventArray[selectedIndex.row].artist
            
            destination._artist.eventName = artistEvents.eventArray[selectedIndex.row].eventName
            
            destination._artist.datetime = artistEvents.eventArray[selectedIndex.row].datetime
                
            
        }
    }

}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        artistEvents.artistName = artistEvents.eventArray[indexPath.row].artist
        artistEvents.venueLng = artistEvents.eventArray[indexPath.row].venueLng
        artistEvents.venueLat = artistEvents.eventArray[indexPath.row].venueLat
        performSegue(withIdentifier: "ShowEvent", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistEvents.eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCellTableViewCell
        cell.artistNameLabel.text = artistEvents.eventArray[indexPath.row].artist
        cell.eventNameLabel.text = artistEvents.eventArray[indexPath.row].eventName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
