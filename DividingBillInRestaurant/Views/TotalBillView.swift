//
//  TotalBillView.swift
//  DividingBillInRestaurant
//
//  Created by Mac on 24.08.2022.
//

import UIKit

class TotalBillView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Общий счет: "
        label.textColor = .black
        label.font = UIFont(name: "Avenit Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sumTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9529411765, blue: 0.9647058824, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textAlignment = .center
        textField.tintColor = #colorLiteral(red: 1, green: 0.54495579, blue: 0.8361265063, alpha: 1)
        textField.font = UIFont(name: "Avenir Next Bold", size: 46)
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(sumTextField)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            sumTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            sumTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            sumTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            sumTextField.heightAnchor.constraint(equalToConstant: 100)
        
        ])
    }
    
}
