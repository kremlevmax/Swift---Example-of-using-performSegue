//
//  ViewController.swift
//  SegueExample
//
//  Created by Сервис on 07/03/2017.
//  Copyright © 2017 Kremlev. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController, UITextFieldDelegate {
    
    //Outlets:
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //Variables:
    var _messageForLabel: String!
    
    var messageForLabel: String {
        get {
            return _messageForLabel
        } set {
            _messageForLabel = newValue
        
        }
    }
    
    //Actions:
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "FromLandingToSecondSegue", sender: textField.text!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondPageViewController {
            if let text = sender as? String {
                destination._messageForLabel = text
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = _messageForLabel
        textField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (LandingPageViewController.dissmissKeyboard)))

    }

    
    func dissmissKeyboard() {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

