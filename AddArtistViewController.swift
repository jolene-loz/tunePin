//
//  AddArtistViewController.swift
//  App-1
//
//  Created by J. Lozano on 12/2/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit

class AddArtistViewController: UIViewController {

    @IBOutlet weak var artistNameField: UITextField!
    @IBOutlet weak var youtubeLinkField: UITextField!
    @IBOutlet weak var youtubePhotoField: UITextField!
    @IBOutlet weak var artistImageURLField: UITextField!
    
    @IBOutlet weak var youtubeTitleField: UITextField!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    func leaveViewController() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }

    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if artistNameField.text != ""{
            performSegue(withIdentifier: "SaveArtist", sender: self)
        }
        
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        leaveViewController()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ArtistInfoViewController
        destination.artistName = artistNameField.text!
        destination.artistImageURL = artistImageURLField.text!
        
        destination.youtubeName = youtubeTitleField.text!
        destination.embedVideoURL = youtubeLinkField.text!
        destination.videoImageURL = youtubePhotoField.text!
    
//        destination.artistLabelText = artistImage.image
        
    }
    


}
