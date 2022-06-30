//
//  HeroHaderUIView.swift
//  Kino Project
//
//  Created by mac on 24.06.2022.
//

import UIKit

class HeroHaderUIView: UIView {
    
    private let downoloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Скачать", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Проиграть", for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "veshenskaya")
        return imageView
    }()
        //MARK: - функция для затемнения главной картинки которая сверзу
    private func addGradient() {
        let gradietn = CAGradientLayer()
        gradietn.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradietn.frame = bounds
        layer.addSublayer(gradietn)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downoloadButton)
        applayConstraint()
    }
    //MARK: - Верстка кнопки
    private func applayConstraint() {
        NSLayoutConstraint.activate([
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            downoloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downoloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downoloadButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
