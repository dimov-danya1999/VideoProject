//
//  HomeViewController.swift
//  Kino Project
//
//  Created by mac on 24.06.2022.
//

import UIKit
import SDWebImage

enum Section: Int {
    case Threading = 0
    case ThreadinTV = 1
    case Popular = 2
    case Uncoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    
    //MARK: - делаем название перед таблиц
    let headerTitle: [String] = ["Моменты", "еще что-то", "Фильмы", "Топ Рейтинг", "Популярное"]
    
    private let homeViewTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.indetificator)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeViewTable)
        homeViewTable.delegate = self
        homeViewTable.dataSource = self
        configureNavBar()
        
        //MARK: - сделали отсуп блоков от верха
        let headerView = HeroHaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeViewTable.tableHeaderView  = headerView

    }
    
    //MARK: - создание NavBar
    private func configureNavBar() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeViewTable.frame = view.bounds
    }
    

}

//MARK: - создаем таблицу
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.indetificator, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case Section.ThreadinTV.rawValue:
            ApiAnime.shared.getTrallingTv { result in
                switch result {
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }

        case Section.TopRated.rawValue:
            ApiAnime.shared.getTrallingTv { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Section.Uncoming.rawValue:
            ApiAnime.shared.go { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Section.Popular.rawValue:
            ApiAnime.shared.go2 { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Section.Threading.rawValue:
            ApiAnime.shared.go3 { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }

            }
        default:
            return TableViewCell()
        }
        return cell
    }
    //MARK: - Создаем отступы между таблицами и количество
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //MARK: - подгон размеров побольше для лейблов перед таблицами
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.text = header.textLabel?.text?.go()
    }
    
    //MARK: - добавляем название перед таблицами
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle[section]
    }
    
    //MARK: - скроллится вверх
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOfSet = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOfSet
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset) )
    }
}
