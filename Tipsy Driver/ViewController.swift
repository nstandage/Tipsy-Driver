//
//  ViewController.swift
//  Tipsy Driver
//
//  Created by Nathan Standage on 10/15/17.
//  Copyright © 2017 Nathan Standage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var todayHourlyLabel: UILabel!
    @IBOutlet weak var weekHourlyLabel: UILabel!
    @IBOutlet weak var totalHourlyLabel: UILabel!
    
    var entryArray: [Entry] = []
    
    
    let test = Entry()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

