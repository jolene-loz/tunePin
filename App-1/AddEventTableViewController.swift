//
//  AddEventViewController.swift
//  App-1
//
//  Created by J. Lozano on 11/28/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit

class AddEventTableViewController: UITableViewController {

    
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var eventDescriptionTextView: UITextView!
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
 
    
    @IBAction func addLocationButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func importImageButtonPressed(_ sender: UIButton) {
    }
    
   
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if eventNameTextField.text != ""{
            performSegue(withIdentifier: "SaveEvent", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! EventDetailViewController
        destination.eventLabelText = eventNameTextField.text!
        destination.artistLabelText = artistNameTextField.text!
        destination.descriptionLabelText = eventDescriptionTextView.text!
    }
    
}
