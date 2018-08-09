//
//  ViewController.swift
//  UIAppearanceApp
//
//  Created by Sanad Barjawi on 8/8/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbl3: UITextField!
    @IBOutlet weak var lbl4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbl3.backgroundColor = UIColor.red
        lbl4.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

