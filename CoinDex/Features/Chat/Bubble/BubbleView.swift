//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

public enum SpeechBubbleTriangleType: String, CaseIterable {
    case left
    case center
    case right
}

// Vertical
public enum positionYEnum: String, CaseIterable {
    case top
    case center
    case bottom
}

// Horizontal
public enum positionXEnum: String, CaseIterable {
    case left
    case right
}

@IBDesignable
public class BubbleView: UIView {

    @IBInspectable public var speechBubbleColor: UIColor = .white
    @IBInspectable public var cornerRadius: CGFloat = 4

    @IBInspectable public var lineWidth: CGFloat = 10
    @IBInspectable public var lineColor: UIColor = .lightGray

    @IBInspectable public var triangleWidth: CGFloat = 7
    @IBInspectable public var triangleHeight: CGFloat = 6
    @IBInspectable public var triangleSpacing: CGFloat = 10

    public var triangleXType: positionXEnum = .right
    @IBInspectable var triangleXTypeName: String = positionXEnum.left.rawValue {
        didSet {
            if let type = positionXEnum.allCases.first(where: { $0.rawValue == triangleXTypeName }) {
                triangleXType = type
            } else {
                triangleXType = .left
            }
        }
    }

    public var triangleYType: positionYEnum = .top
    @IBInspectable var triangleYTypeName: String = positionYEnum.top.rawValue {
        didSet {
            if let type = positionYEnum.allCases.first(where: { $0.rawValue == triangleYTypeName }) {
                triangleYType = type
            } else {
                triangleYType = .top
            }
        }
    }


    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = .white
        makePath()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }

    private func makePath() {
        let roundingCorners: UIRectCorner = {
            switch triangleXType {
            case .left:
                return [ .topRight, .bottomRight]
            case .right:
                return [ .topLeft, .bottomLeft]
            }
        }()
        let cornerRadii: CGSize = CGSize(width: cornerRadius,
                                         height: cornerRadius)
        let roundRectPath = UIBezierPath(roundedRect: CGRect(x: lineWidth + triangleHeight,
                                                             y: lineWidth + triangleHeight,
                                                             width: self.bounds.width - lineWidth * 2 - triangleHeight * 2,
                                                             height: self.bounds.height - lineWidth * 2 - triangleHeight * 2),
                                         byRoundingCorners: roundingCorners,
                                         cornerRadii: cornerRadii)
        roundRectPath.close()
        //addBottomTriangle(to: roundRectPath, type: triangleXType)
        switch triangleXType {
        case .right:
            addRightTriangle(to: roundRectPath, type: triangleYType)
        case .left:
            addLeftTriangle(to: roundRectPath, type: triangleYType)
        }

        setColor(to: roundRectPath)
    }

    private func addRightTriangle(to rect: UIBezierPath, type: positionYEnum) {
        let y: CGFloat = {
            switch type {
            case .top:
                return rect.bounds.minY
            case .bottom:
                return rect.bounds.maxY
            case .center:
                return rect.bounds.midY - (triangleWidth / 2)
            }
        }()

        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: rect.bounds.maxX,
                                      y: y))
        let center = type == .center ? triangleWidth / 2 : 0
        trianglePath.addLine(to: CGPoint(x: rect.bounds.maxX + triangleHeight,
                                         y: y + center))
        let width = type == .bottom ? -triangleWidth : triangleWidth
        trianglePath.addLine(to: CGPoint(x: rect.bounds.maxX,
                                         y: y + width))
        trianglePath.close()

        rect.append(trianglePath)
    }

    private func addLeftTriangle(to rect: UIBezierPath, type: positionYEnum) {
        let y: CGFloat = {
            switch type {
            case .top:
                return rect.bounds.minY
            case .bottom:
                return rect.bounds.maxY
            case .center:
                return rect.bounds.midY - (triangleWidth / 2)
            }
        }()

        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: rect.bounds.minX,
                                      y: y))
        let center = type == .center ? triangleWidth / 2 : 0
        trianglePath.addLine(to: CGPoint(x: rect.bounds.minX - triangleHeight,
                                         y: y + center))
        let width = type == .bottom ? -triangleWidth : triangleWidth
        trianglePath.addLine(to: CGPoint(x: rect.bounds.minX,
                                         y: y + width))
        trianglePath.close()

        rect.append(trianglePath)
    }


    private func setColor(to rect: UIBezierPath) {
        lineColor.setStroke()
        rect.lineWidth = lineWidth
        rect.stroke()

        speechBubbleColor.setFill()
        rect.fill()
    }
}
