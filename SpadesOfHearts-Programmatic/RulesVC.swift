//
//  RulesVC.swift
//  SpadesOfHearts-Programmatic
//
//  Created by Ilya Kokorin on 09.08.2024.
//

import UIKit

class RulesVC: UIViewController {

    let titleLabel    = UILabel()
    let rulesLabel    = UILabel()
    let exerciseLabel = UILabel()
    
    let cancelButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
        configureCancelButton()
    }
    
    @objc func cancelRulesVC(){
        self.dismiss(animated: true, completion: nil)
    }
 
    func configureCancelButton(){
        view.addSubview(cancelButton)
        cancelButton.addTarget(self, action: #selector(cancelRulesVC), for: .touchUpInside)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.backgroundColor = .gray
        cancelButton.layer.opacity = 0.5
        cancelButton.setTitle("X", for: .normal)
        cancelButton.layer.cornerRadius = 20
        cancelButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        cancelButton.setTitleColor(.black, for: .normal)
       
        NSLayoutConstraint.activate([
            cancelButton.widthAnchor.constraint(equalToConstant: 40),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            cancelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "RULES"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
        ])
    }
    
    func configureRulesLabel(){
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = "The value of each card represents the number of exercise you do.\n\nJ = 11, Q =12, K = 13, A =14"
        rulesLabel.textAlignment = .center
        rulesLabel.font = .systemFont(ofSize: 23, weight: .semibold)
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
        rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
        rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
        rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
        ])
    }
    
    func configureExerciseLabel(){
        view.addSubview(exerciseLabel)
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseLabel.text = "♠️ = Push-up\n\n❤️ = Sit-up\n\n♣️ = Burpee\n\n♦️ = Jumping Jacks"
        exerciseLabel.font = .systemFont(ofSize: 21, weight: .semibold)
        exerciseLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
        exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 75),
        exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
        exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
