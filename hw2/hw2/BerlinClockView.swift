//
//  BerlinClockView.swift
//  hw2
//
//  Created by Beket Barlykov  on 28.09.2023.
//

import Foundation
import UIKit
import SnapKit


class BerlinClockView: UIView{
    private let clockBackground: UIImage? = UIImage(named: "berlinClock")
    private var secondsCircle = SecondsCircleView()
    lazy var timeLabel: UILabel = {
        var timeLabel = UILabel()
        timeLabel.text = "18:00"
        timeLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        timeLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
        
    }()
    lazy var bgImg: UIImageView = {
        let contentView = UIImageView()
        contentView.image = clockBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView(){
        addSubview(bgImg)
        addSubview(timeLabel)
        setupLayout()
    }
    
    private func setupLayout(){
//        self.snp.makeConstraints{make in
//            make.top.equalTo(16)
//            make.horizontalEdges.equalTo(16)
//            make.bottom.equalTo(150)
//        }
        bgImg.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        timeLabel.snp.makeConstraints{make in
            make.height.equalTo(30)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    override class var requiresConstraintBasedLayout: Bool{
        return true
    }
    
    func setupTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.isBlack.toggle()
            self?.setNeedsDisplay()
        }
        
    }
    
}
