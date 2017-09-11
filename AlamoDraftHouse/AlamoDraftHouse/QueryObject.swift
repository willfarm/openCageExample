//
//  QueryObject.swift
//  AlamoDraftHouse
//
//  Created by William Farmerie on 9/9/17.
//  Copyright © 2017 William Farmerie. All rights reserved.
//

import Foundation
import SwiftyJSON

class QueryObject {
  var formattedName = ""
  var lat: Double = 0
  var long: Double = 0
  var url: URL = URL(fileURLWithPath: "")
		
  
  init(with json:JSON) {
    
    if let name = json["formatted"].string {
      self.formattedName = name
    }
    if let lat = json["geometry"].dictionary?["lat"]?.double {
      self.lat = lat
    }
    if let long = json["geometry"].dictionary?["long"]?.double {
      self.long = long
    }
    if let url = json["annotations"].dictionary?["OSM"]?.dictionary?["url"]?.string {
      if let url = NSURL(string: url)?.absoluteURL {
        self.url = url
      }
    }
  }
}
