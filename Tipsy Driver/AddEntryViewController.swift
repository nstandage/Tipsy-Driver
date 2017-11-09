//
//  AddEntryViewController.swift
//  Tipsy Driver
//
//  Created by Nathan Standage on 10/15/17.
//  Copyright © 2017 Nathan Standage. All rights reserved.
//

import UIKit

protocol newEntryDelegate: class {
    func addNewEntry(_ entry: Entry)
    func updateDisplay()
}

class AddEntryViewController: UIViewController {
    
    @IBOutlet weak var hoursTextField: UITextField!
    @IBOutlet weak var tipsTextField: UITextField!
    
    
    weak var delegate: newEntryDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hoursTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        
        
        hoursTextField.text = ""
        tipsTextField.text = ""
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addItemButton() {
        

        if let hourString = hoursTextField.text, let tipString = tipsTextField.text {
            
            if hourString != "" && tipString != "" {
                let date = Date()
                let hours = NSString(string: hourString).doubleValue
                let tips = NSString(string: tipString).doubleValue
                
                let entry = Entry(hoursWorked: hours, tips: tips, date: date)
                
                delegate?.addNewEntry(entry)
                
                self.dismiss(animated: true)
            } else {
                
                let incorrectInputAlertController = UIAlertController(title: "Incorrect Info", message: "Please enter valid input", preferredStyle: .alert)
                let incorrectInputAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                incorrectInputAlertController.addAction(incorrectInputAction)
                self.present(incorrectInputAlertController, animated: true, completion: nil)
            }

        }

        
    }

    func updateDisplayInViewcontroller() {
        
        delegate?.updateDisplay()
    }

}
