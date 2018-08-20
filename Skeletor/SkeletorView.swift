//
//  SkeletorView.swift
//  Skeletor
//
//  Created by Alexander Deutsch on 17.08.18.
//  Copyright © 2018 Alexander Deutsch. All rights reserved.
//

public extension UIView {
    public func addSkeletorGradientAnimation() {
        let skeletorLayer = SkeletonGradientLayer()
        skeletorLayer.frame = bounds
        layer.addSublayer(skeletorLayer)
        skeletorLayer.startGradientAnimation()
    }
    
    public func removeSkeletorGradientAnimation() {
        layer.sublayers?.first(where: { $0 is SkeletonGradientLayer })?.removeFromSuperlayer()
    }
        
}
