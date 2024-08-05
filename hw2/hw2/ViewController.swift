//
//  ViewController.swift
//  hw2
//
//  Created by Beket Barlykov  on 27.09.2023.
//

import UIKit

class ViewController: UIViewController {
    private let berlinClock = BerlinClockView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the
        view.backgroundColor = .systemCyan
        view.addSubview(berlinClock)
    }


}


