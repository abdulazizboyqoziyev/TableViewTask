//
//  PlusButton.swift
//  TableView
//
//  Created by Abdulaziz Boyqoziyev on 15/03/23.
//

import UIKit

protocol CountryType {
    var Countryname: String { get set }
    var CountryInformation: String { get set }
    var Country: String { get set }
}

protocol CountrySaveDelegate: AnyObject {
    func save(country: CountryType)
}

struct Country: CountryType {
    var Countryname: String
    var CountryInformation: String
    var Country: String
}

final class PlusButton: UIView {
    
//    lazy var 
}
