//
//  EventDetailViewController.swift
//  App-1
//
//  Created by J. Lozano on 11/28/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit
import GooglePlaces
import MapKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var randomImage: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    var eventLabelText : String!
    var artistLabelText : String!
    var dateTimeLabelText : String!
    var imageURL : String!
    var _artist = Artist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _artist.getConcerts { self.updateUserInterface()
        }
        
        randomImage.image = UIImage(contentsOfFile: "\(Int.random(in: 2..<8))")
        eventNameLabel.text = eventLabelText
        artistNameLabel.text = artistLabelText
        dateTimeLabel.text = dateTimeLabelText
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: _artist.venueLat, longitude: _artist.venueLng)
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 750, longitudinalMeters: 750)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
        
    }
    
    
    func updateUserInterface() {
        self.eventNameLabel.text = "\(self._artist.eventName)"
        self.artistNameLabel.text = "\(self._artist.artistName)"
        self.dateTimeLabel.text = "\(self._artist.datetime)"
        
        // code for reading in a url and displaying in an image
//        guard let imageURL = URL(string: pokeData.imageURL) else { return }
//        do {
//            let data = try Data(contentsOf: imageURL)
//            pokemonImage.image = UIImage(data: data)
//        } catch {
//            print("**** ERROR: error thrown trying to get data from URL \(imageURL)")
//        }
    }
   
    
}



