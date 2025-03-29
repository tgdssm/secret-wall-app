//
//  OnboardingView.swift
//  SecretWall
//
//  Created by Thalisson Melo on 29/03/25.
//

import UIKit

class OnboardingView: UIView {
    
    private var mapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.map
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Neutral.light
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descubra\nmensagens secretas"
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Neutral.light
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Encontre e deixe mensagens em locais reais, De forma anônima, com respeito\ne um toque de mistério."
        return label
    }()
    
    public var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Começar", for: .normal)
        button.setTitleColor(UIColor.Background.backgroundDark, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.Neutral.light
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.Background.backgroundDark
        addSubview(mapImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(startButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mapImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mapImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),  titleLabel.topAnchor.constraint(equalTo: mapImageView.bottomAnchor),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
