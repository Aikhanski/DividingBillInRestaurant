//
//  ViewController.swift
//  DividingBillInRestaurant
//
//  Created by Mac on 24.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Разделить счет"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите сумму чека, укажите количетсво людей и нажмите на кнопку \"Рассчитать\""
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.minimumScaleFactor = 0.7
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Рассчитать", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.54495579, blue: 0.8361265063, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let totalBillView = TotalBillView()
    let personsCountView = PersonsCountView()
    let tipsView = TipsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
    }

    // Функция для размещения всех элементов на экране
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9801895022, blue: 0.908803165, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsCountView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
    }
    
    @objc func calculateButtonPressed() {
        guard let totalBill = totalBillView.sumTextField.text,
               let totalBillInt = Int(totalBill) else { return }
        let summa = totalBillInt + (totalBillInt * (tipsView.tipsCount / 100))
        let result = summa / personsCountView.counter
        print(result)
        UIView.animate(withDuration: 2.0) {
            self.descriptionLabel.text = "\(result) ТГ на каждого человека"
            self.descriptionLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        } completion: { _ in
            self.descriptionLabel.transform = CGAffineTransform.identity
        }
        //descriptionLabel.text = "\(result) ТГ на каждого человека"
    }
    

}

extension ViewController {
    //Устанавливаем констрейнты для всех  сабвью
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //Это вью для ввода общего счета
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalToConstant: 123),
            
            personsCountView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 7),
            personsCountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsCountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsCountView.heightAnchor.constraint(equalToConstant: 123),
            
            tipsView.topAnchor.constraint(equalTo: personsCountView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalToConstant: 123),
            
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
}
