//
//  ArtistInfoViewController.swift
//  App-1
//
//  Created by J. Lozano on 11/28/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit
import Alamofire

class ArtistInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var artistVids = [ArtistVids]()
    var artistName : String!
    var youtubeName : String!
    var artistImageURL : String!
    var embedVideoURL: String!
    var videoImageURL : String!
    var youtubeTitle : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let p1 = ArtistVids(imageURL: "https://odesza.com/wp-content/uploads/2015/04/2880-1800.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wuC1fHTnuJs\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Bloom")
//
    let p1 = ArtistVids(imageURL: "\(videoImageURL)", videoURL: "\(embedVideoURL)", videoTitle: "\(youtubeTitle)")
  
        artistVids.append(p1)
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistMusicCell", for: indexPath) as? ArtistTableViewCell {
            
            let artistVid = artistVids[indexPath.row]
            
            cell.updateUI(artist: artistVid)
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistVids.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = artistVids[indexPath.row]
        performSegue(withIdentifier: "ShowVideo", sender: partyRock)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destination = segue.destination as? VideoVC {
            if let party = sender as? ArtistVids {
                destination._artistVids = party
            }
        }
    }
        
}
    



//if let destination = segue.destination as? VideoVC {
//    if let party = sender as? Artist {
//        destination.partyRock = party
//    }
//}
