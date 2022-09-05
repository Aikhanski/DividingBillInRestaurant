//
//  PersonsCountView.swift
//  DividingBillInRestaurant
//
//  Created by Mac on 24.08.2022.
//

import UIKit

class PersonsCountView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество людей: "
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backgroundGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9529411765, blue: 0.9647058824, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus.square"), for: .normal)
        button.tintColor = .black
        button.isEnabled = false
        button.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.square"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 44)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var counter = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods for plus and minus buttons
    @objc func minusButtonPressed() {
        if counter == 1  {
            minusButton.isEnabled = false
        } else {
            counter -= 1
            counterLabel.text = "\(counter)"
        }
    }
    
    @objc func plusButtonPressed() {
        minusButton.isEnabled = true
        counter += 1
        counterLabel.text = "\(counter)"
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            
            backgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundGrayView.heightAnchor.constraint(equalToConstant: 100),
            
            minusButton.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor, constant: 20),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            
            plusButton.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor, constant: -20),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            
            counterLabel.centerXAnchor.constraint(equalTo: backgroundGrayView.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            counterLabel.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor)
        
        ])
    }
}
