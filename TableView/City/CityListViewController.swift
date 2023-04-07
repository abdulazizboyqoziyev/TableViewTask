//
//  CityListViewController.swift
//  TableViewTasks
//
//  Created by Abdulaziz Boyqoziyev on 01/03/23.
//

import Foundation
import UIKit

final class CityListViewController: UIViewController {
    
    private var viewModel: CityListViewModel
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds, style: .insetGrouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    
    init(with viewModel: CityListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        makeConstraints()
        
    }
    
    private func addSubView() {
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension CityListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = viewModel.getCity(at: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: "kjnkjnkjnj")
        cell.textLabel?.text = city.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewModel = DetailViewModel(city: viewModel.getCity(at: indexPath))
        let vc = DetailViewController(viewModel: detailViewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
