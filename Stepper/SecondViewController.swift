//
//  SecondViewController.swift
//  Stepper
//
//  Created by Nathan Hancock on 8/31/20.
//  Copyright © 2020 HancockLabs. All rights reserved.
//

import Foundation
import UIKit


class SecondViewController: UIViewController {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let value = UserDefaults.standard.value(forKey: "Stepper") as? Double {
            stepper.value = value
            label.text = String(describing: value)
        }
    }
    
    @IBAction func didChangeStepper(_ sender: UIStepper) {
        label.text = String(describing: sender.value)
        
        // save the changed value to UserDefaults
        UserDefaults.standard.setValue(sender.value, forKey: "Stepper")
        
        //Post to Notification Center that the value has changed
        NotificationCenter.default.post(Notification.init(name: Notification.Name("stepperDidChangeValue")))
    }
    
}
