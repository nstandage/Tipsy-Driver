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
    

    @IBAction func addNewItemButton(_ sender: UIBarButtonItem) {
     

       
        if let hourString = hoursTextField.text, let tipString = tipsTextField.text {
           
            let date = Date()
            let hours = NSString(string: hourString).doubleValue
            let tips = NSString(string: tipString).doubleValue
            
            let entry = Entry(hoursWorked: hours, tips: tips, date: date)
            
            delegate?.addNewEntry(entry)
            
            self.dismiss(animated: true)
        }
        
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        
        hoursTextField.text = ""
        tipsTextField.text = ""
    
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func updateDisplayInViewController() {
        
        delegate?.updateDisplay()
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
