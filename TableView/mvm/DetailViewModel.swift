//
//  DetailViewModel.swift
//  TableViewTasks
//
//  Created by Abdulaziz Boyqoziyev on 01/03/23.
//

import Foundation

class DetailViewModel {
    
    private let city: City
    
    init(city: City) {
        self.city = city
    }
    
    func fetchCityName() -> String {
        return city.name
    }
    
    func fetchCityDescription() -> String {
        return city.info
    }
    
    func fetchCityImageName() -> String? {
        return city.image
    }
}

