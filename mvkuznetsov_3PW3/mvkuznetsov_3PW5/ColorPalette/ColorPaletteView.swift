//
//  ColorPaletteView.swift
//  mvkuznetsov_3PW5
//
//  Created by Максим Кузнецов on 29.10.2022.
//

import UIKit

final class ColorPaletteView: UIControl {
    
    private let stackView = UIStackView()
    private(set) var chosenColor: UIColor = .systemGray6
    private var redControl = ColorSliderView(colorName: "R", value: 0)
    private var greenControl = ColorSliderView(colorName: "G", value:0)
    private var blueControl  = ColorSliderView(colorName: "B", value: 0)
    public var receiver: ChangeColorProtocol?
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        redControl = ColorSliderView(colorName: "R", value: Float(chosenColor.rgba.red))
        greenControl = ColorSliderView(colorName: "G", value: Float(chosenColor.rgba.green))
        blueControl = ColorSliderView(colorName: "B", value: Float(chosenColor.rgba.blue))
        
        redControl.tag = 0
        greenControl.tag = 1
        blueControl.tag = 2
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(redControl)
        stackView.addArrangedSubview(greenControl)
        stackView.addArrangedSubview(blueControl)
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 12
        
        [redControl, greenControl, blueControl].forEach {
            ($0 as AnyObject).addTarget(self, action: #selector(sliderMoved(slider:)), for: .touchDragInside)
        }
        
        addSubview(stackView)
        stackView.pin(to: self, [.bottom: 0, .top: 0, .left: 0, .right: 0])
    }
    
    public func updateView(color: UIColor) {
        redControl = ColorSliderView(colorName: "R", value: Float(color.rgba.red))
        greenControl = ColorSliderView(colorName: "G", value: Float(color.rgba.green))
        blueControl = ColorSliderView(colorName: "B", value: Float(color.rgba.blue))
    }
    
    @objc
    private func sliderMoved(slider: ColorSliderView) {
        switch slider.tag {
        case 0:
            self.chosenColor = UIColor(
                red: CGFloat(slider.value),
                green: chosenColor.rgba.green,
                blue: chosenColor.rgba.blue,
                alpha: chosenColor.rgba.alpha
            )
        case 1:
            self.chosenColor = UIColor(
                red: chosenColor.rgba.red,
                green: CGFloat(slider.value),
                blue: chosenColor.rgba.blue,
                alpha: chosenColor.rgba.alpha
            )
        default:
            self.chosenColor = UIColor(
                red: chosenColor.rgba.red,
                green: chosenColor.rgba.green,
                blue: CGFloat(slider.value),
                alpha: chosenColor.rgba.alpha
            )
        }
        sendActions(for: .touchDragInside)
        receiver?.changeColor()
    }
}
