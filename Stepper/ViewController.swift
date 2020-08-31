//
//  ViewController.swift
//  Stepper
//
//  Created by Nathan Hancock on 8/31/20.
//  Copyright © 2020 HancockLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let value = UserDefaults.standard.value(forKey: "Stepper") as? Double {
            label.text = String(describing: value)
        }
        //subscribe to changes
        NotificationCenter.default.addObserver(self, selector: #selector(stepperDidChange), name: Notification.Name("stepperDidChangeValue"), object: nil)
        
    }
    
    // Handle Notification
    @objc func stepperDidChange() {
        if let value = UserDefaults.standard.value(forKey: "Stepper") as? Double {
            label.text = String(describing: value)
        }
    }
}

