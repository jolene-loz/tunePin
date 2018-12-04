//
//  Artist.swift
//  App-1
//
//  Created by J. Lozano on 11/29/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import Foundation

class ArtistVids {
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    var imageURL: String {
        return _imageURL
    }
    var videoURL: String {
        return _videoURL
    }
    var videoTitle: String {
        return _videoTitle
    }
    
    init(imageURL: String, videoURL: String, videoTitle: String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
}
