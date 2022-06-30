//
//  TitleTableViewCell.swift
//  Kino Project
//
//  Created by mac on 28.06.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlePoster: UIImageView = {
        let poseter = UIImageView()
        poseter.contentMode = .scaleAspectFill
        poseter.clipsToBounds = true
        poseter.translatesAutoresizingMaskIntoConstraints = false
        return poseter
    }()

 static let indetificator = "TitleTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePoster)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        applayConstraint()
    }
    
  public func applayConstraint() {
        let titlePosterConstraint = [
            titlePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlePoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlePoster.widthAnchor.constraint(equalToConstant: 100)
        ]
      let titleLabelConstraints = [
        titleLabel.leadingAnchor.constraint(equalTo: titlePoster.trailingAnchor, constant: 20),
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
      ]
      
      let playTitleButtonConstrain = [
        playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
      
      ]
      NSLayoutConstraint.activate(playTitleButtonConstrain)
      NSLayoutConstraint.activate(titlePosterConstraint)
      NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    public func configureViewModel(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterUrl)") else {
            return
        }
        
        titlePoster.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
