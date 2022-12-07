//
//  AddNoteCell.swift
//  mvkuznetsov_3PW5
//
//  Created by Максим Кузнецов on 19.11.2022.
//

import UIKit

class AddNoteCell: UITableViewCell {
    static let reuseIdentifier = "AddNoteCell"
    private let textView = UITextView()
    private let addButton = UIButton()
    private let placeholderLabel = UILabel()
    public var delegate: AddNoteDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.textColor = .tertiaryLabel
        textView.backgroundColor = .clear
        textView.setHeight(140)
        
        textView.delegate = self
        placeholderLabel.text = "Enter some text..."
        placeholderLabel.font = .systemFont(ofSize: 14, weight: .regular)
        placeholderLabel.sizeToFit()
        textView.addSubview(placeholderLabel)
        placeholderLabel.textColor = .tertiaryLabel
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize ?? 0) / 2)
        placeholderLabel.isHidden = !textView.text.isEmpty
        
        addButton.setTitle("Add new note", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        addButton.setTitleColor(.systemBackground, for: .normal)
        addButton.backgroundColor = .label
        addButton.layer.cornerRadius = 8
        addButton.setHeight(44)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.isEnabled = true
        addButton.alpha = 0.5
        
        let stackView = UIStackView(arrangedSubviews: [textView, addButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        
        contentView.addSubview(stackView)
        stackView.pin(to: contentView, [.left: 16, .top: 16, .right: 16, .bottom: 16])
        contentView.backgroundColor = .systemGray5
    }
    
    @objc
    private func addButtonTapped() {
        if (!textView.text.isEmpty) {
            delegate?.newNoteAdded(note: ShortNote(text: textView.text))
        }
    }
    
    public func ResetText() {
        textView.text = ""
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}

extension AddNoteCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
            placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
