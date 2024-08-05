import UIKit

class manyRectanglesView: BerlinClockElement {
    init(frame: CGRect, timeInterval: TimeInterval) {
        super.init(frame: frame, timeInterval: timeInterval, numElements: 11)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
