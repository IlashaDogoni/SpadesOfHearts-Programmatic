//
//  CardSelectionVC.swift
//  SpadesOfHearts-Programmatic
//
//  Created by Ilya Kokorin on 08.08.2024.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView     = UIImageView()
    let stopButton        = SoHButton(backgroundColor: .systemRed, title: "Stop!")
    let restartButton     = SoHButton(backgroundColor: .systemGreen, title: "Restart")
    let rulesButton       = SoHButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards : [UIImage] = Deck.allValues
    var timer : Timer!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    @objc func restartTimer(){
        timer.invalidate()
        startTimer()
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80)
        ])
    }
    
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 55),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 70)
        ])
    }
    
    func configureRestartButton(){
        view.addSubview(restartButton)
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 120),
            restartButton.heightAnchor.constraint(equalToConstant: 55),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 120),
            rulesButton.heightAnchor.constraint(equalToConstant: 55),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesVC(){
        present(RulesVC(), animated: true)
    }
}
