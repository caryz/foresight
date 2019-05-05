//
//  SettingsViewController.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import UIKit
import GooglePlaces

class SettingsViewController: UIViewController {

    var currentLocation = ""

    @IBOutlet weak var header: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings 🚧"

    }

    @IBAction func changeLocationTapped(_ sender: Any) {
        var inputTextField: UITextField?;

        let passwordPrompt = UIAlertController(title: "Change Location 🌍", message: "Please enter 2-letter state abbreviation", preferredStyle: .alert);

        passwordPrompt.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            // Now do whatever you want with inputTextField (remember to unwrap the optional)

            let entryStr : String = (inputTextField?.text)! ;

            APIManager.shared.stateAbbrev = entryStr
            self.header.text = "You are now in \(entryStr)"
            
        }));


        passwordPrompt.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) -> Void in
            print("done");
        }));


        passwordPrompt.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "State Abbreviation"
            textField.isSecureTextEntry = false     /* true here for pswd entry */
            inputTextField = textField
        });


        present(passwordPrompt, animated: true)

        /// GOOGLE PLACES SUCKS
//        let autocompleteController = GMSAutocompleteViewController()
//        autocompleteController.delegate = self
//
//        // Specify the place data types to return.
//        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
//            UInt(GMSPlaceField.placeID.rawValue))!
//        autocompleteController.placeFields = fields
//
//        // Specify a filter.
//        let filter = GMSAutocompleteFilter()
//        filter.type = .establishment
//        filter.country = "United States"
//        autocompleteController.autocompleteFilter = filter
//
//        // Display the autocomplete view controller.
//        present(autocompleteController, animated: true, completion: nil)
//    }
//
//    func findPlaceId(_ placeId: String?) {
//        // A hotel in Saigon with an attribution.
////        let placeID = "ChIJV4k8_9UodTERU5KXbkYpSYs"
//        guard let placeId = placeId else {
//            header.text = "Looks like that is not a valid place, or something went wrong... Please try again"
//            return
//        }
//
//        GMSPlacesClient.shared().lookUpPlaceID(placeId) { (place, err) in
//            print(place)
//        }
    }
}

//extension SettingsViewController: GMSAutocompleteViewControllerDelegate {
//
//    // Handle the user's selection.
//    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//        print("Place name: \(place.name)")
//        print("Place ID: \(place.placeID)")
//        print("Place attributions: \(place.attributions)")
//        dismiss(animated: true, completion: nil)
//        findPlaceId(place.placeID)
//    }
//
//    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
//        // TODO: handle the error.
//        print("Error: ", error.localizedDescription)
//    }
//
//    // User canceled the operation.
//    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
//        dismiss(animated: true, completion: nil)
//    }
//
//    // Turn the network activity indicator on and off again.
//    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//    }
//
//    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//    }
//
//}
