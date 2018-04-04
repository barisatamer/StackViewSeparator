//
//  UIStackView+Swizzler.swift
//  Pods-StackViewSeparator_Example
//
//  Created by Baris Atamer on 05/04/2018.
//


import UIKit

public protocol SwizzlingInjection: class {
    static func inject()
}

class SwizzlingHelper {
    private static let doOnce: Any? = {
        UIStackView.inject()
        return nil
    }()
    
    static func enableInjection() {
        _ = SwizzlingHelper.doOnce
    }
}

extension UIApplication {
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        SwizzlingHelper.enableInjection()
        return super.next
    }
}

extension UIStackView: SwizzlingInjection {
    public static func inject() {
        // Make sure this isn't a subclass
        guard self === UIStackView.self else { return }
        
        let originalSelector = #selector(layoutSubviews)
        let swizzledSelector = #selector(swz_layoutSubviews)
        
        guard let originalMethod = class_getInstanceMethod(self, originalSelector),
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            else { return }
        
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
        
    }
    
    @objc func swz_layoutSubviews() {
        self.swz_layoutSubviews()
        relayout()
    }
}
