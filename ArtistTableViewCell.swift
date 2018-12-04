//
//  ArtistTableViewCell.swift
//  App-1
//
//  Created by J. Lozano on 11/29/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    @IBOutlet weak var videoTitle: UILabel!
    
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func updateUI(artist: ArtistVids) {
        videoTitle.text = artist.videoTitle
        
        let url = URL(string: artist.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //handle the error
            }
        }
        
        //TODO: SET IMAGE FROM URL
    }
    
    
    
}

