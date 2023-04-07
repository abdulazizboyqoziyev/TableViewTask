//
//  City.swift
//  TableViewTasks
//
//  Created by Abdulaziz Boyqoziyev on 01/03/23.
//

import Foundation

struct City {
    var name: String
    let info: String
    let image: String?
    
    init(name: String, info: String, image: String?) {
        self.name = name
        self.info = info
        self.image = image
    }
}
