//
//  ColorsApiImpl.swift
//  TopColors
//
//  Created by Roman Muzikantov on 10/08/2021.
//

import Foundation
import Alamofire

class ColorsApiImpl: ColorsApi {
    
    func getColors(_ completionHandler: @escaping ColorsApi.ColorsCompletionHandler) {
        if let url = URL(string: Constants.colorsUrl) {
            AF.request(url).response { (response) in
                switch response.result {
                case .success(let data):
                    if let data = data {
                        completionHandler(true, data)
                    } else {
                        completionHandler(false, nil)
                    }
                case .failure(let error):
                    print(error)
                    completionHandler(false, nil)
                }
            }
        }
    }
}
