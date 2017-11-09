//
//  ViewController.swift
//  Tipsy Driver
//
//  Created by Nathan Standage on 10/15/17.
//  Copyright © 2017 Nathan Standage. All rights reserved.
//

import UIKit

class ViewController: UIViewController, newEntryDelegate {
    
    @IBOutlet weak var todayHourlyLabel: UILabel!
    @IBOutlet weak var weekHourlyLabel: UILabel!
    @IBOutlet weak var totalHourlyLabel: UILabel!
    
    var entryArray: [Entry] = []
    var todayEntry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todayHourlyLabel.text = ""
        weekHourlyLabel.text = ""
        totalHourlyLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addNewEntry(_ entry: Entry) {
        entryArray.append(entry)
        todayEntry = entry
        print(entryArray)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newEntrySeque" {
            
            if let vc = segue.destination as? AddEntryViewController {
                vc.delegate = self
            } else {
                print("Couldn't assign delegate to VC")
            }
            
        }
    }
    
    func updateDisplay() {
        if let entry = todayEntry {
            todayHourlyLabel.text = Calculate.dailyHourly(entry: entry)
        }
        
        if entryArray.count != 0 {
         totalHourlyLabel.text = Calculate.totalHourly(entries: entryArray)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        updateDisplay()
    }

}

