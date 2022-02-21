//
//  ViewController.swift
//  ButtonAssignment
//
//  Created by student on 2/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
 
    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        label.text = textfield.text;
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        label.text = "";
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

