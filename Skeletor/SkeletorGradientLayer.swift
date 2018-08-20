//
//  SkeletorGradientLayer.swift
//  Skeletor
//
//  Created by Alexander Deutsch on 17.08.18.
//  Copyright © 2018 Alexander Deutsch. All rights reserved.
//


public class SkeletonGradientLayer: CAGradientLayer {
    
    private struct Constants {
        static let darkGray             = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
        static let lightGray            = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1).cgColor
        static let gradient             = [Constants.lightGray, Constants.darkGray, Constants.lightGray]
        static let gradientAnimationKey = "skeletonGradientAnimation"
    }
    
    private lazy var gradientAnimation: CAAnimationGroup = {
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnim.fromValue = gradientDirection.startPointFrom
        startPointAnim.toValue = gradientDirection.startPointTo
        
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnim.fromValue = gradientDirection.endPointFrom
        endPointAnim.toValue = gradientDirection.endPointTo
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = 1.0
        animGroup.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animGroup.repeatCount = .infinity
        return animGroup
    }()
    
    private var gradientDirection: GradientDirection = .leftToRight(2)
    private var animationTime: CFTimeInterval = 1.0
    
    override init() {
        super.init()
        configure()
    }
    
    convenience init(gradientColors: [UIColor], cornerRadius: CGFloat = 3.0, gradientDirection: GradientDirection? = nil, animationTime: CFTimeInterval? = nil) {
        self.init()
        configure(colors: gradientColors.map { $0.cgColor }, cornerRadius: cornerRadius, gradientDirection: gradientDirection)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure(colors: [CGColor] = Constants.gradient, cornerRadius: CGFloat = 3.0, gradientDirection: GradientDirection? = nil, animationTime: CFTimeInterval? = nil) {
        self.colors = colors
        self.masksToBounds = true
        self.cornerRadius = 3.0
        
        if let gradientDirection = gradientDirection {
            self.gradientDirection = gradientDirection
        }
        
        if let animationTime = animationTime {
            self.animationTime = animationTime
        }
    }
    
    
    public func startGradientAnimation() {
        stopGradientAnimation()
        add(gradientAnimation, forKey: Constants.gradientAnimationKey)
    }
    
    public func stopGradientAnimation() {
        removeAnimation(forKey: Constants.gradientAnimationKey)
    }
}
