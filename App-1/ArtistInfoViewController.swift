//
//  ArtistInfoViewController.swift
//  App-1
//
//  Created by J. Lozano on 11/28/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

//import UIKit
//
//class ArtistInfoViewController: UIViewController {
//
//    var searchURL = "https://api.spotify.com/v1/search?q=Shawn%20Mendes&type=track"
//
//    typealias JSONStandard = [String: AnyObject]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    func callAlamo(url: String){
//        Alamofire.request(url).responseJSON(completionHandler: { response in
//
//            self.parseData(JSONData: response.data!)
//        })
//    }
//
//    func parseData(JSONData: Data){
//        do {
//            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers as [String: AnyObject]) as? JSONStandard
//            print(readableJSON)
//
//        } catch {
//            print("**ERROR: \(error) cannot parse data")
//        }
//    }
//
//}
//
