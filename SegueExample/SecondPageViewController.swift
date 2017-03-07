//
//  SecondPageViewController.swift
//  SegueExample
//
//  Created by Сервис on 07/03/2017.
//  Copyright © 2017 Kremlev. All rights reserved.
//

import UIKit

class SecondPageViewController: UIViewController {

    //Outlets:
    @IBOutlet weak var messageLabel: UILabel!
    
    //Variables:
    
    var answerMessage = "This is answer message!"
    
    var _messageForLabel: String!
    
    var messageForLabel: String {
        get {
            return _messageForLabel
        } set {
            _messageForLabel = newValue
        }
    
    }
    
    
    //Actions:
    @IBAction func backButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "FromSecondToLandingSegue", sender: answerMessage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LandingPageViewController {
            if let text = sender as? String {
                destination._messageForLabel = text
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = messageForLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
