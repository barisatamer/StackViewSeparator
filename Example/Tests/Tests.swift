import XCTest

import StackViewSeparator
import FBSnapshotTestCase

class Tests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Uncomment to enable saving reference images:
        // recordMode = true
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHorizontalAxis() {
        // Create a horizontal stack view with buttons
        let stackView = createStackView(
            axis: .horizontal,
            separatorPercent: 0.2,
            separatorColor: .green,
            separatorThickness: 5,
            separatorCornerRadius: 2
        )
        
        // Verify
        FBSnapshotVerifyView(stackView)
    }

    func testVerticalAxis() {
        // Create a vertical stack view with buttons
        let stackView = createStackView(
            axis: .vertical,
            separatorPercent: 0.5,
            separatorColor: .cyan,
            separatorThickness: 10,
            separatorCornerRadius: 4
        )
        
        // Verify
        FBSnapshotVerifyView(stackView)
    }

    
    private func createStackView(
        axis: UILayoutConstraintAxis,
        separatorPercent: CGFloat = 1,
        separatorColor: UIColor = .red,
        separatorThickness: CGFloat = 4,
        separatorCornerRadius: CGFloat = 0
    ) -> UIStackView {
        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        
        for i in 0...2 {
            let button = UIButton()
            button.setTitle("\(i)", for: .normal)
            button.backgroundColor = .blue
            stackView.addArrangedSubview(button)
        }
        
        stackView.separatorColor = separatorColor
        stackView.separatorThickness = separatorThickness
        stackView.separatorCornerRadius = separatorCornerRadius
        stackView.separatorPercent = separatorPercent
        
        stackView.addSeparators()
        stackView.relayout()
        
        return stackView
    }
}
