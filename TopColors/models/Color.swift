//
//  Color.swift
//  TopColors
//
//  Created by Roman Muzikantov on 10/08/2021.
//

import Foundation

struct Color: Codable {
    var title: String
    var userName: String
    var dateCreated: String
    var imageUrl: String
    var hex: String
    var rgb: ColorValue
}
