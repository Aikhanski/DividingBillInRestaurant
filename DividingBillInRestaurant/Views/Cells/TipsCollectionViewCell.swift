//
//  TipsCollectionViewCell.swift
//  DividingBillInRestaurant
//
//  Created by Mac on 28.08.2022.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 1, green: 0.54495579, blue: 0.8361265063, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView () {
        backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9529411765, blue: 0.9647058824, alpha: 1)
        layer.cornerRadius = 10
        addSubview(percentLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            percentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }
}
