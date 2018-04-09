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

    // MARK: - IB Outlet
    
    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet weak var verticalStackView: UIStackView!

    @IBOutlet weak var labelLengthRatio: UILabel!
    @IBOutlet weak var labelThickness: UILabel!
    @IBOutlet weak var labelCornerRadius: UILabel!
    
    
    // MARK: - Private Properties
    
    private var separatorLengthRatio: CGFloat = 1 {
        didSet {
            horizontalStackView.separatorPercent = separatorLengthRatio * 0.01
            verticalStackView.separatorPercent = separatorLengthRatio * 0.01
            labelLengthRatio.text = "Length Ratio: \(separatorLengthRatio * 0.01)"
        }
    }

    private var separatorThickness: CGFloat = 1.0 {
        didSet {
            horizontalStackView.separatorThickness = separatorThickness
            verticalStackView.separatorThickness = separatorThickness
            labelThickness.text = "Thickness: \(Int(separatorThickness))"
        }
    }
    
    private var separatorCornerRadius: CGFloat = 3.0 {
        didSet {
            horizontalStackView.separatorCornerRadius = separatorCornerRadius
            verticalStackView.separatorCornerRadius = separatorCornerRadius
            labelCornerRadius.text = "Corner Radius: \(separatorCornerRadius)"
        }
    }
    
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horizontalStackView.addSeparators()
        verticalStackView.addSeparators()
    }
    
    
    // MARK: - Actions
    
    @IBAction func lengthRatioValueChanged(_ stepper: UIStepper) {
        separatorLengthRatio = CGFloat(stepper.value)
    }
    
    @IBAction func thicknessValueChanged(_ stepper: UIStepper) {
        separatorThickness = CGFloat(stepper.value)
    }
    
    @IBAction func cornerRadiusValueChanged(_ stepper: UIStepper) {
        separatorCornerRadius = CGFloat(stepper.value)
    }
    
}

