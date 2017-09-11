//
//  QueryViewModel.swift
//  AlamoDraftHouse
//
//  Created by William Farmerie on 9/9/17.
//  Copyright © 2017 William Farmerie. All rights reserved.
//

import Foundation
import SwiftyJSON


class QueryViewModel {
  
  var numberOfResults: Int = 0
  var resultsObjects: [QueryObject] = []
  
  init(with query: [String:Any]) {
    let json = JSON(query)
    let results = json["results"]
    numberOfResults = results.count
    
    for (index,subJson):(String, JSON) in results {
      debugPrint(index)
     resultsObjects.append(QueryObject(with: subJson))
    }
  }
}
