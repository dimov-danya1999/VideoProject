//
//  TableViewCell.swift
//  Kino Project
//
//  Created by mac on 24.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private var title : [TV] = [TV]()

    static let indetificator = "TableViewCell"
    //MARK: - создаем и разбиваем на ячейки
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCollectionViewCell.indegicaer)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    // чтобы эти ячейки вывелись на экран
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with titles: [TV]) {
        self.title = titles
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}
//MARK: - Внутри таблицы разбили ячейки на 10 штук
extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCollectionViewCell.indegicaer, for: indexPath) as? CollectionViewCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let model = title[indexPath.row].poster_path else {
         return UICollectionViewCell()
        }
        cell.configure(module: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return title.count
    }
    
    
}
