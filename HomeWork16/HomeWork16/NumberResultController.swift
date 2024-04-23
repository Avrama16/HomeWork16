//
//  NumberResultController.swift
//  HomeWork16
//
//  Created by A-Avramenko on 23.04.2024.
//

import UIKit

class NumberResultController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "\(index + 1)"
    }
}
