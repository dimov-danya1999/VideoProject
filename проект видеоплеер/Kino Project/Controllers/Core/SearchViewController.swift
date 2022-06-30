//
//  SearchViewController.swift
//  Kino Project
//
//  Created by mac on 24.06.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var titles: [TV] = [TV]()
    
    private let searchTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TableViewCell.indetificator)
        return table
    }()

    
    private let searchController: UISearchController = {
        let search = UISearchController(searchResultsController: SearchResultViewContollerViewController())
        search.searchBar.placeholder = "найди любой фильм"
        search.searchBar.searchBarStyle = .minimal
        return search
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.backgroundColor = .systemBackground
        
        view.addSubview(searchTable)
        searchTable.delegate = self
        searchTable.dataSource = self
        navigationItem.searchController = searchController
        
        fetchDiscoveryMovies()
    }
    
    //MARK: функция которая транслирует метод getDiscovereMovie (в нем мы вызываем показ контента)
    private func fetchDiscoveryMovies() {
        ApiAnime.shared.getDiscovereMovie { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.searchTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTable.frame = view.bounds
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.indetificator, for: indexPath) as? TitleTableViewCell else { return UITableViewCell()
            
        }
        let title = titles[indexPath.row]
        let model = TitleViewModel(titleName: title.original_name ?? title.original_title ?? "нет названия", posterUrl: title.poster_path ?? "")
        cell.configureViewModel(with: model)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}
