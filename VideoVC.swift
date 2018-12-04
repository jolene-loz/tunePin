//
//  VideoVCViewController.swift
//  App-1
//
//  Created by J. Lozano on 11/29/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit
import WebKit

class VideoVC: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    private var artistVids : ArtistVids!
    
    var _artistVids: ArtistVids {
        get {
            return artistVids
        } set {
            artistVids = newValue
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = _artistVids.videoTitle
        webView.loadHTMLString(_artistVids.videoURL, baseURL: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
