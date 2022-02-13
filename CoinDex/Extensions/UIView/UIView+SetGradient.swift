// Copyright © 2022 Medipremium Servicios Médicos S.L. All rights reserved.

import Foundation
import UIKit

extension UIView {
    enum Point {
        case topLeft
        case centerLeft
        case bottomLeft
        case topCenter
        case center
        case bottomCenter
        case topRight
        case centerRight
        case bottomRight

        var point: CGPoint {
            switch self {
            case .topLeft:
                return CGPoint(x: 0, y: 0)
            case .centerLeft:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeft:
                return CGPoint(x: 0, y: 1.0)
            case .topCenter:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottomCenter:
                return CGPoint(x: 0.5, y: 1.0)
            case .topRight:
                return CGPoint(x: 1.0, y: 0.0)
            case .centerRight:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomRight:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }

    func setGradient(start: Point,
                     end: Point,
                     colors: [UIColor],
                     type: CAGradientLayerType = .axial) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.startPoint = start.point
        gradient.endPoint = end.point
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = [0.0, 1.0]
        gradient.frame = self.bounds
        gradient.type = type

        self.layer.masksToBounds = true
        self.layer.insertSublayer(gradient, at: 0)
    }
}
