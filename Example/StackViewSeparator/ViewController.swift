//
//  ViewController.swift
//  StackViewSeparator
//
//  Created by Baris Atamer on 04/04/2018.
//  Copyright (c) 2018 Baris Atamer. All rights reserved.
//

import UIKit
import StackViewSeparator

class ViewController: UIViewController {

    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet weak var verticalStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        horizontalStackView.addSeparators()
        verticalStackView.addSeparators()
    }
}

