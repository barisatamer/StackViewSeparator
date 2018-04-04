

import UIKit

extension UIStackView {
    
    open func addSeparators() {
        
        for (index, element) in arrangedSubviews.enumerated() {
            
            if (index == 0) {
                continue
            }
            
            let previousView = self.arrangedSubviews[index - 1]
            
            let separatorView = UIView()
            separatorView.backgroundColor = .red
            
            var center: CGFloat
            if axis == UILayoutConstraintAxis.horizontal {
                center = (previousView.frame.maxX + element.frame.minX) * 0.5
                separatorView.frame = CGRect(x: center, y: (self.frame.height - 30) * 0.5, width: 1, height: 30)
            } else {
                center = (previousView.frame.maxY + element.frame.minY) * 0.5
                separatorView.frame = CGRect(x: (frame.width - 120) * 0.5, y: center, width: 120, height: 1)
            }
            
            addSubview(separatorView)
        }
    }
}
