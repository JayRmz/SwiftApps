//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Juan Ramírez Blancas on 05/05/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var people: String?
    var tipPercentage: String?
    var total: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = "$ \(total!)"
        settingLabel.text = "Split between \(people!) people, with \(tipPercentage!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
