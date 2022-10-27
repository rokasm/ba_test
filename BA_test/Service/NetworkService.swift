//
//  Network.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-24.
//

import Foundation
import Alamofire

class NetworkService {

  
    func fetch(from endpoint: String, completion: @escaping (Data?, NetworkError?) -> Void) {
          AF.request(endpoint, method: .get).response {  response in
              guard let data = response.data else {
                  return completion(nil, .generic(description: "Could not fetch data"))
              }
              completion(data, nil)
             }
      }
}

enum NetworkError {
    case generic(description: String)
}
