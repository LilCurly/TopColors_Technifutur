//
//  ColorsApi.swift
//  TopColors
//
//  Created by Roman Muzikantov on 10/08/2021.
//

import Foundation

protocol ColorsApi {
    
    typealias ColorsCompletionHandler = (_ success: Bool, _ colors: Data?) -> Void
    
    func getColors(_ completionHandler: @escaping ColorsCompletionHandler)
}
