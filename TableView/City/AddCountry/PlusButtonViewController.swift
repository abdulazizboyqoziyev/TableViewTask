//
//  PlusButtonViewController.swift
//  TableView
//
//  Created by Abdulaziz Boyqoziyev on 15/03/23.
//

import UIKit

class PlusButtonViewController: UIViewController {
    
    private var viewModel: PlusButtonViewModel
    private let countryName = AppTextField(placeholder: "countryName")
    private let countyInformation = AppTextField(placeholder: "")
    private let saveButton = UIButton()
    private let counrtyImageButton = UIButton()
    
    init(with viewModel: PlusButtonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        addSubview()
        makeCounstrains()
        func addations() {
            counrtyImageButton.setImage(UIImage(named: ""), for: .normal)
            saveButton.setTitle("Save", for: .normal)
            saveButton.backgroundColor = .black
            saveButton.setTitleColor(UIColor.white, for: .normal)
        }
        func addSubview() {
            view.addSubview(countryName)
            view.addSubview(countyInformation)
            view.addSubview(counrtyImageButton)
            view.addSubview(saveButton)
        }
        func makeCounstrains() {
            countryName.snp.makeConstraints { make in
                make.leading.equalTo(20)
                make.trailing.equalTo(-20)
                make.top.equalTo(300)
            }
            counrtyImageButton.snp.makeConstraints { make in
                make.leading.equalTo(100)
                make.trailing.equalTo(-100)
                make.top.equalTo(50)
                make.height.equalTo(150)
            }
            countyInformation.snp.makeConstraints { make in
                make.leading.equalTo(-20)
                make.trailing.equalTo(20)
                make.top.equalTo(400)
                make.height.equalTo(200)
            }
            saveButton.snp.makeConstraints { make in
                make.leading.equalTo(20)
                make.trailing.equalTo(-20)
                make.top.equalTo(countyInformation.snp.bottom).offset(50)
            }
            
        }
    }
}

