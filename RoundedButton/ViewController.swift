//
//  ViewController.swift
//  RoundedButton
//
//  Created by Shantaram Kokate on 12/27/18.
//  Copyright © 2018 Shantaram Kokate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roundButton: RoundedShadowButton!
    var load: Bool =  false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        roundButton.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        if load {
            load = false
        } else {
            load = true
        }
         roundButton.animateButton(shouldLoad: load, withMessage: "done")
    }
    
}

