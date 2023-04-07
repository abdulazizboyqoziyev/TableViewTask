//
//  DetailViewController.swift
//  TableViewTasks
//
//  Created by Abdulaziz Boyqoziyev on 17/02/23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private let viewModel: DetailViewModel
    private let information = UILabel()
    private let imageView = UIImageView()
    
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        makeConstrans()
        bind()
    }
    
    func addSubViews() {
        view.addSubview(information)
        view.addSubview(imageView)
    }
    
    func bind() {
        imageView.image = UIImage(named: viewModel.fetchCityImageName() ?? "")
        information.text = viewModel.fetchCityDescription()
        information.textAlignment = .center
        information.numberOfLines = 0
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
    }
    
    func makeConstrans() {
        information.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(imageView.snp.bottom).offset(30)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.height.equalTo(200)
            make.trailing.equalTo(-10)
            make.top.equalTo(100)
        }
    }
}
