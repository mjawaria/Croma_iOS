//
//  SecondViewController.swift
//  FiveSep_Class
//
//  Created by Mukul on 05/09/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String = ""
    
    var newName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Second View Controller"
        
        // Set UI component
        
        nameLabel.textAlignment = .center

        nameLabel.font = UIFont(name: "Rockwell", size: 50)
        
        nameLabel.adjustsFontSizeToFitWidth = true
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = name
    }


}
