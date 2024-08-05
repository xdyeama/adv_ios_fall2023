import UIKit
import Foundation

class BerlinClockElement: UIView{
    private var timer: Timer?
    private var currentColorIndex = 0
    private var colors: [UIColor] = [.black, .orange]
    public var elements: [Bool]
    public let timeInterval: TimeInterval
    var date = NSDate()
    
    
    init(frame: CGRect, timeInterval: TimeInterval, numElements: Int){
        self.timeInterval = timeInterval
        self.elements = Array(repeating: false, count: numElements)
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
        //        super.init(coder: aDecoder)
        //        setupTimer()
    }
    
    @objc private func updateColors() {
        currentColorIndex = (currentColorIndex + 1) % colors.count
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Calculate the total width and height for padding
        let totalWidth = rect.width
        let totalHeight = rect.height
        
        // Define the number of rectangles and their dimensions
        let numberOfRectangles = elements.count
        let rectangleWidth: CGFloat = 90
        let rectangleHeight: CGFloat = 70
        
        // Calculate horizontal padding
        let horizontalPadding = (totalWidth - CGFloat(numberOfRectangles) * rectangleWidth) / CGFloat(numberOfRectangles + 1)
        
        // Calculate vertical padding
        let verticalPadding = (totalHeight - rectangleHeight) / 2
        
        // Draw the outer rounded rectangle
        let outerRect = CGRect(x: 0, y: 0, width: totalWidth, height: totalHeight)
        let outerPath = UIBezierPath(roundedRect: outerRect, cornerRadius: 10)
        UIColor.lightGray.setFill()
        outerPath.fill()
        
        // Draw the inner rectangles
        for i in 0..<numberOfRectangles {
            let startX = horizontalPadding * CGFloat(i + 1) + CGFloat(i) * rectangleWidth
            let innerRect = CGRect(x: startX, y: verticalPadding, width: rectangleWidth, height: rectangleHeight)
            let innerPath = UIBezierPath(rect: innerRect)
            
            // Set the fill color based on the timer
            let fillColor = colors[currentColorIndex]
            fillColor.setFill()
            
            innerPath.fill()
        }
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateColors), userInfo: nil, repeats: true)
    }
    
    private func updateTimer(){
        
    }
    
    private func getCurrentTime(){
        
    }
}


class FourRectanglesView: BerlinClockElement {
    
    init(frame: CGRect, timeInterval: TimeInterval) {
        super.init(frame: frame, timeInterval: timeInterval, numElements: 4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
