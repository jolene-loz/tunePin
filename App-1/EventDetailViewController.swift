//
//  EventDetailViewController.swift
//  App-1
//
//  Created by J. Lozano on 11/28/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var eventNameLabel: UILabel!
  
    @IBOutlet weak var artistNameLabel: UILabel!
    
    
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    
    
    var eventLabelText : String!
    var artistLabelText : String!
    var descriptionLabelText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventNameLabel.text = eventLabelText
        artistNameLabel.text = artistLabelText
        eventDescriptionLabel.text = descriptionLabelText

    }
    

}
