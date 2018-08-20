//
//  GradientDirection.swift
//  Skeletor
//
//  Created by Alexander Deutsch on 17.08.18.
//  Copyright © 2018 Alexander Deutsch. All rights reserved.
//

public enum GradientDirection {
    case leftToRight(CGFloat)
    case rightToLeft(CGFloat)
    
    var startPointFrom: CGPoint {
        switch self {
        case .leftToRight(let spread):
            return CGPoint(x: -1 * spread, y: 0.5)
        case .rightToLeft(let spread):
            return CGPoint(x: 1 * spread, y: 0.5)
        }
    }
    
    var startPointTo: CGPoint {
        switch self {
        case .leftToRight(let spread):
            return CGPoint(x: 1 * spread, y: 0.5)
        case .rightToLeft(let spread):
            return CGPoint(x: -1 * spread, y: 0.5)
        }
    }
    
    var endPointFrom: CGPoint {
        var endPointFrom = startPointFrom
        endPointFrom.x += 2
        return endPointFrom
    }
    
    var endPointTo: CGPoint {
        var endPointTo = startPointTo
        endPointTo.x += 2
        return endPointTo
    }
    
}
