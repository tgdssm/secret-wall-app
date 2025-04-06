//
//  AuthView.swift
//  SecretWall
//
//  Created by Thalisson Melo on 27/03/25.
//

import UIKit
import AuthenticationServices

class AuthView: UIView {
    
    public var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = UIColor.backgroundDark
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    public var signInButton: ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton(type: .continue, style: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.cornerRadius = 20
        return button
    }()
    
    
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
        label.text = "Encontre e deixe mensagens em locais reais, De forma anônima, com respeito e um toque de mistério."
        return label
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
        addSubview(signInButton)
        addSubview(loadingIndicator)
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
            
            signInButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            signInButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signInButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            
            loadingIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ])
    }
}
