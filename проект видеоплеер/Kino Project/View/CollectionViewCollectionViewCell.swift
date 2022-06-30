//
//  CollectionViewCollectionViewCell.swift
//  Kino Project
//
//  Created by mac on 28.06.2022.
//

import UIKit

class CollectionViewCollectionViewCell: UICollectionViewCell {
    
    static let indegicaer = "TitleCollectionView"
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(posterImageView)
        }
        required init?(coder: NSCoder) {
            fatalError()
        }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(module: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(module)") else {
            return
        }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
}
