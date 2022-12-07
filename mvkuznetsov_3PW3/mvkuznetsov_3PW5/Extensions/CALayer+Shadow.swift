//
//  CALayer+Shadow.swift
//  mvkuznetsov_3PW2
//
//  Created by Максим Кузнецов on 10.10.2022.
//

import QuartzCore
import UIKit

extension CALayer {
    func applyShadow() {
        self.shadowColor = UIColor.black.cgColor
        self.shadowOpacity = 0.1
        self.shadowOffset = .init(width: 1, height: 1)
        self.shadowRadius = 5
    }
    
    func changeShadow() {
        self.shadowOffset = .zero
        shadowRadius = 1
    }
}
