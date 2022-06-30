//
//  UpCoomingViewController.swift
//  Kino Project
//
//  Created by mac on 24.06.2022.
//

import UIKit
import SDWebImage

class UpCoomingViewController: UIViewController {
    
    private var titles: [TV] = [TV]()
    
    private let upcoimingTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TableViewCell.indetificator)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Cмотреть"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(upcoimingTable)
        upcoimingTable.delegate = self
        upcoimingTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcoimingTable.frame = view.bounds
        fetchUpComing()
    }
        //MARK: - Кастим данные в ячейки таблица название фильмов
    private func fetchUpComing() {
        ApiAnime.shared.getTrallingTv { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcoimingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
   
}

extension UpCoomingViewController: UITableViewDelegate, UITableViewDataSource {
    // добавление в ячейки навазние фильмов
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.indetificator, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        let titles = titles[indexPath.row]
        cell.configureViewModel(with: TitleViewModel(titleName: (titles.original_title ?? titles.original_name) ?? "Unknow title name", posterUrl: titles.poster_path ?? "default"))
        return cell
    }
    //MARK: - указываем размер ячеек с картинками фильмов
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
