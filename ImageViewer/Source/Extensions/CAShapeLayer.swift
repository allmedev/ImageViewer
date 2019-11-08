//
//  UIImage.swift
//  ImageViewer
//
//  Created by Kristian Angyal on 28/07/2016.
//  Copyright © 2016 MailOnline. All rights reserved.
//

import UIKit

extension CAShapeLayer {

    static func replayShape(_ fillColor: UIColor, triangleEdgeLength: CGFloat) -> CAShapeLayer {

        let triangle = CAShapeLayer()
        let altitude = (sqrt(3) / 2) * triangleEdgeLength
        triangle.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: altitude, height: triangleEdgeLength))
        triangle.path = UIBezierPath.equilateralTriangle(triangleEdgeLength).cgPath
        triangle.fillColor = fillColor.cgColor

        return triangle
    }

    static func playShape(_ fillColor: UIColor, triangleEdgeLength: CGFloat) -> CAShapeLayer {

        let triangle = CAShapeLayer()
        let altitude = (sqrt(3) / 2) * triangleEdgeLength
        triangle.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: altitude, height: triangleEdgeLength))
        triangle.path = UIBezierPath.equilateralTriangle(triangleEdgeLength).cgPath
        triangle.fillColor = fillColor.cgColor

        return triangle
    }

    static func pauseShape(_ fillColor: UIColor, elementSize: CGSize, elementDistance: CGFloat) -> CAShapeLayer {

        let element = CALayer()
        element.bounds.size = elementSize
        element.frame.origin = CGPoint.zero

        let secondElement = CALayer()
        secondElement.bounds.size = elementSize
        secondElement.frame.origin = CGPoint(x: elementSize.width + elementDistance, y: 0)

        [element, secondElement].forEach { $0.backgroundColor = fillColor.cgColor }

        let container = CAShapeLayer()
        container.bounds.size = CGSize(width: 2 * elementSize.width + elementDistance, height: elementSize.height)
        container.frame.origin = CGPoint.zero

        container.addSublayer(element)
        container.addSublayer(secondElement)

        return container
    }

    static func circle(_ fillColor: UIColor, diameter: CGFloat) -> CAShapeLayer {

        let circle = CAShapeLayer()
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: diameter * 2, height: diameter * 2))
        circle.frame = frame
        circle.path = UIBezierPath(ovalIn: frame).cgPath
        circle.fillColor = fillColor.cgColor

        return circle
    }

    static func circlePlayShape(_ fillColor: UIColor, diameter: CGFloat) -> CAShapeLayer {

        let circle = CAShapeLayer()
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: diameter, height: diameter))
        circle.frame = frame
        let circlePath   = UIBezierPath(ovalIn: frame)
        let trianglePath = UIBezierPath.equilateralTriangle(diameter / 2, shiftBy: CGPoint(x: diameter / 3, y: diameter / 4))

        circlePath.append(trianglePath)
        circle.path = circlePath.cgPath
        circle.fillColor = fillColor.cgColor

        return circle
    }

    static func closeShape(edgeLength: CGFloat) -> CAShapeLayer {

        let container = CAShapeLayer()
        container.bounds.size = CGSize(width: edgeLength + 4, height: edgeLength + 4)
        container.frame.origin = CGPoint.zero

        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: 0))
        linePath.addLine(to: CGPoint(x: edgeLength, y: edgeLength))
        linePath.move(to: CGPoint(x: 0, y: edgeLength))
        linePath.addLine(to: CGPoint(x: edgeLength, y: 0))

        let elementBorder = CAShapeLayer()
        elementBorder.bounds.size = CGSize(width: edgeLength, height: edgeLength)
        elementBorder.position = CGPoint(x: container.bounds.midX, y: container.bounds.midY)
        elementBorder.lineCap = CAShapeLayerLineCap.round
        elementBorder.path = linePath.cgPath
        elementBorder.strokeColor = UIColor.darkGray.cgColor
        elementBorder.lineWidth = 2.5

        let elementFill = CAShapeLayer()
        elementFill.bounds.size = CGSize(width: edgeLength, height: edgeLength)
        elementFill.position = CGPoint(x: container.bounds.midX, y: container.bounds.midY)
        elementFill.lineCap = CAShapeLayerLineCap.round
        elementFill.path = linePath.cgPath
        elementFill.strokeColor = UIColor.white.cgColor
        elementFill.lineWidth = 2

        container.addSublayer(elementBorder)
        container.addSublayer(elementFill)

        return container
    }
    
    static func moreShape() -> CAShapeLayer {
        let edgeLength: CGFloat = 6
        let borderWidth: CGFloat = 0.5
        
        let rect = CGRect(x: 0.0, y: 0.0, width: edgeLength - (borderWidth * 2), height: edgeLength - (borderWidth * 2))
        let circle = UIBezierPath(ovalIn: rect)
        
        let container = CAShapeLayer()
        container.bounds.size = CGSize(width: edgeLength * 2 + 3, height: edgeLength)
        container.frame.origin = CGPoint.zero

        let elementFirst = CAShapeLayer()
        elementFirst.bounds.size = CGSize(width: edgeLength, height: edgeLength)
        elementFirst.position = CGPoint(x: container.bounds.minX + (edgeLength / 2) + borderWidth, y: container.bounds.midY + borderWidth)
        elementFirst.lineCap = CAShapeLayerLineCap.round
        elementFirst.path = circle.cgPath
        elementFirst.strokeColor = UIColor.darkGray.cgColor
        elementFirst.lineWidth = borderWidth
        elementFirst.fillColor = UIColor.white.cgColor
        
        let elementSecond = CAShapeLayer()
        elementSecond.bounds.size = CGSize(width: edgeLength, height: edgeLength)
        elementSecond.position = CGPoint(x: container.bounds.maxX - (CGFloat(edgeLength) / 2), y: container.bounds.midY + borderWidth)
        elementSecond.lineCap = CAShapeLayerLineCap.round
        elementSecond.path = circle.cgPath
        elementSecond.strokeColor = UIColor.darkGray.cgColor
        elementSecond.lineWidth = borderWidth
        elementSecond.fillColor = UIColor.white.cgColor
        
        container.addSublayer(elementFirst)
        container.addSublayer(elementSecond)

        return container
    }
}
