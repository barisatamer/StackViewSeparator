

import UIKit

extension UIStackView {
    
    private struct AssociatedKeys {
        static var thickness = "separator_thickness"
        static var color = "separator_color"
        static var cornerRadius = "separator_cornerRadius"
        static var percent = "separator_percent"
        static var separatorViews = "separator_views"
    }
    
    fileprivate var separatorViews: [UIView] {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.separatorViews) as? [UIView] ?? [UIView]() }
        set { objc_setAssociatedObject(self, &AssociatedKeys.separatorViews, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    /// Thickness of the separator lines
    @IBInspectable open var separatorThickness: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.thickness) as? CGFloat ?? 0 }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.thickness, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layoutSubviews()
        }
    }
    
    /// Corner Radius of the separator lines
    @IBInspectable open var separatorCornerRadius: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.cornerRadius) as? CGFloat ?? 3 }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.cornerRadius, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layoutSubviews()
        }
    }
    
    /// Percent for the separator length
    @IBInspectable open var separatorPercent: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.percent) as? CGFloat ?? 1.0 }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.percent, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layoutSubviews()
        }
    }
    
    /// Color of the separator lines
    @IBInspectable open var separatorColor: UIColor {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.color) as? UIColor ?? .black }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.color, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layoutSubviews()
        }
    }

    /// Adds separator view for each visible arranged subview. Call this function after updating your stack view items.
    open func addSeparators() {
        // Remove all separators.
        separatorViews.forEach({ $0.removeFromSuperview() })
        separatorViews = []

        // Add separtors for each visible item.
        let visibleItems = arrangedSubviews.filter({ $0.isHidden == false })
        guard visibleItems.count > 1 else { return }
        for _ in 1..<visibleItems.count {
            let separatorView = UIView()
            separatorView.backgroundColor = separatorColor
            separatorViews.append(separatorView)
            addSubview(separatorView)
        }
    }
    
    open func relayout() {
        for (index, element) in separatorViews.enumerated() {
            layoutSeparator(view: element, atIndex: index)
        }
    }

    private func layoutSeparator(view separatorView: UIView, atIndex index: Int) {
        let previousSubView = arrangedSubviews[index]
        let currentSubivew = arrangedSubviews[index + 1]
        
        if axis == UILayoutConstraintAxis.horizontal {
            let length = frame.height * separatorPercent
            let center = (previousSubView.frame.maxX + currentSubivew.frame.minX) * 0.5 - separatorThickness * 0.5
            separatorView.frame = CGRect(x: center, y: (self.frame.height - length) * 0.5, width: separatorThickness, height: length)
        } else {
            let length = frame.width * separatorPercent
            let center = (previousSubView.frame.maxY + currentSubivew.frame.minY) * 0.5 - separatorThickness * 0.5
            separatorView.frame = CGRect(x: (frame.width - length) * 0.5, y: center, width: length, height: separatorThickness)
        }
        separatorView.layer.cornerRadius = separatorCornerRadius
        separatorView.backgroundColor = separatorColor
    }

}
