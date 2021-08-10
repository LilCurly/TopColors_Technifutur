//
//  ColorsPresenter.swift
//  TopColors
//
//  Created by Roman Muzikantov on 10/08/2021.
//

import Foundation

class ColorsManager {
    
    typealias ColorsCompletionHandler = (_ success: Bool, _ colors: [Color]?) -> Void
    
    private let api: ColorsApi
    
    init(api: ColorsApi) {
        self.api = api
    }
    
    func getColors(_ completionHandler: @escaping ColorsCompletionHandler) {
        api.getColors { (success, colorsData) in
            if success && colorsData != nil {
                do {
                    let decoder = JSONDecoder()
                    let colors = try decoder.decode([Color].self, from: colorsData!)
                    completionHandler(true, colors)
                } catch {
                    completionHandler(false, nil)
                }
            } else {
                completionHandler(false, nil)
            }
        }
    }
}
