//
//  AddEventViewController.swift
//  App-1
//
//  Created by J. Lozano on 11/28/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit
import GooglePlaces
import MapKit

class AddEventViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var imageURLTextField: UITextField!
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!

    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        
        datePicker?.addTarget(self, action: #selector(AddEventViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddEventViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        dateTextField.inputView = datePicker
      
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
  }
    
 
    
    @IBAction func addLocationButtonPressed(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
 
    
   
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if eventNameTextField.text != ""{
            performSegue(withIdentifier: "SaveEvent", sender: self)
        }
        
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        leaveViewController()
    }
    
    func leaveViewController() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveEvent" {
        let destination = segue.destination as! EventDetailViewController
        destination.eventLabelText = eventNameTextField.text!
        destination.artistLabelText = artistNameTextField.text!
        destination.dateTimeLabelText = dateTextField.text!
        destination.imageURL = imageURLTextField.text!
        }
        if segue.identifier == "AddArtist"{
        }
        
    }
    
    
    

    
}

extension AddEventViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//        artist.coordinate = place.coordinate
        dismiss(animated: true, completion: nil)
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
