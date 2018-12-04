//
//  Artist.swift
//  App-1
//
//  Created by J. Lozano on 12/3/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MapKit

class Artist{
    
    var eventName = ""
    var artistName = ""
    var datetime = ""
    var venueLat = 0.0
    var venueLng = 0.0
    var venue = ""
    var eventArray: [EventData] = []
    
    
    let apiKey = "hCpeW3NOAXCtq54L"
    var urlArrays = [String]()
    
    func getMetroAreas(completed: @escaping () -> ()){
        for urls in urlArrays{
            Alamofire.request(urls).responseJSON { response in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    let numOfEvents = json["resultsPage"]["results"]["event"].count
                    for index in 0..<numOfEvents {
                        let eventDisplayName = json["resultsPage"]["results"]["event"][index]["displayName"].stringValue
                        let time = json["resultsPage"]["results"]["event"][index]["start"]["time"].stringValue
                        let datetime = json["resultsPage"]["results"]["event"][index]["start"]["datetime"].stringValue
                        print("👍👍👍 Date and Time = \(datetime)")
                        print("🌸\(eventDisplayName)")
                        let performances = json["resultsPage"]["results"]["event"][index]["performance"].count
                        for i in 0..<performances{
                            let _artistName = json["resultsPage"]["results"]["event"][index]["performance"][i]["artist"]["displayName"].stringValue
                            print("🐭 Artist name = \(_artistName)")
                            self.artistName = _artistName
                            
                        }
                        let venueName = json["resultsPage"]["results"]["event"][index]["venue"]["displayName"].stringValue
                        let venueLat = json["resultsPage"]["results"]["event"][index]["venue"]["lat"].doubleValue
                        let venueLng = json["resultsPage"]["results"]["event"][index]["venue"]["lng"].doubleValue
                        print("👾Venue name: \(venueName), venue coordinates = \(venueLat),\(venueLng)")
                        self.eventArray.append(EventData(eventName: eventDisplayName, artist: self.artistName, datetime : datetime, venue: venueName, venueLat: venueLat, venueLng: venueLng))
                    }
                    
                    completed()
                    
                case .failure(let error):
                    print("ERROR: \(error) failed to get data from url \(urls)")
                }
            }
        }
    }
    
    
    func getConcerts(completed: @escaping () -> ()){
        //var metro_area_id = ""
        var event_ID = ""
        
        let searchURL = "https://api.songkick.com/api/3.0/search/locations.json?query=Boston&apikey=\(apiKey)&per_page=1"
        
        
        Alamofire.request(searchURL).responseJSON { response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let numOfLocations = json["resultsPage"]["results"]["location"].count
                for index in 0..<numOfLocations {
                    let metroAreaID = json["resultsPage"]["results"]["location"][index]["metroArea"]["id"].stringValue
                    self.urlArrays.append("https://api.songkick.com/api/3.0/metro_areas/\(metroAreaID)/calendar.json?apikey=\(self.apiKey)&per_page=10")
                }
                
                self.getMetroAreas {
                    completed()
                }
                
            case .failure(let error):
                print("ERROR: \(error) failed to get data from url \(self.urlArrays[0])")
            }
        }
    }
}



