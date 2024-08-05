//
//  CircleView.swift
//  hw2
//
//  Created by Beket Barlykov  on 27.09.2023.
//

import Foundation
import UIKit


class SecondsCircleView: UIView{
    var isBlack = true

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupTimer()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupTimer()
        }

        func setupTimer() {

            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.isBlack.toggle()
                self?.setNeedsDisplay()
            }
            
        }

        override func draw(_ rect: CGRect) {
            let centerX = rect.midX
            let centerY = rect.midY
            let radius = min(rect.width, rect.height) / 2

            // Create a path for the circle
            let circlePath = UIBezierPath(
                arcCenter: CGPoint(x: centerX, y: centerY),
                radius: radius - 5, // Subtract 5 for the border
                startAngle: 0,
                endAngle: 2 * CGFloat.pi,
                clockwise: true
            )

            // Set the border color and width
            UIColor.gray.setStroke()
            circlePath.lineWidth = 5.0

            // Set the fill color based on the state (black or orange)
            if isBlack {
                UIColor.black.setFill()
            } else {
                UIColor.orange.setFill()
            }

            // Draw the circle border
            circlePath.stroke()
            

            // Fill the circle
            circlePath.fill()
        }
}
