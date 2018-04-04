

import UIKit

extension UIStackView {
    
    private struct AssociatedKeys {
        static var thickness = "separator_thickness"
        static var color = "separator_color"
        static var percent = "separator_percent"
    }
    
    /// Thickness of the separator lines
    @IBInspectable var separatorThickness: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.thickness) as? CGFloat ?? 0 }
        set { objc_setAssociatedObject(self, &AssociatedKeys.thickness, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    /// Color of the separator lines
    @IBInspectable var separatorColor: UIColor {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.color) as? UIColor ?? .black }
        set { objc_setAssociatedObject(self, &AssociatedKeys.color, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    /// Percent for the separator length
    @IBInspectable var separatorPercent: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.percent) as? CGFloat ?? 1.0 }
        set { objc_setAssociatedObject(self, &AssociatedKeys.percent, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    open func addSeparators() {
        
        for (index, element) in arrangedSubviews.enumerated() {
            
            if (index == 0) {
                continue
            }
            
            let previousView = self.arrangedSubviews[index - 1]
            
            let separatorView = UIView()
            separatorView.backgroundColor = separatorColor
            
            var center: CGFloat
            if axis == UILayoutConstraintAxis.horizontal {
                let length = frame.height * separatorPercent
                center = (previousView.frame.maxX + element.frame.minX) * 0.5
                separatorView.frame = CGRect(x: center, y: (self.frame.height - length) * 0.5, width: separatorThickness, height: length)
            } else {
                center = (previousView.frame.maxY + element.frame.minY) * 0.5
                let length = frame.width * separatorPercent
                separatorView.frame = CGRect(x: (frame.width - length) * 0.5, y: center, width: length, height: separatorThickness)
            }
            
            addSubview(separatorView)
        }
    }
    
    open func relayout() {
        // TODO: Layout separators
    }
}
