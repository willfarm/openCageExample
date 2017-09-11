//
//  QueryViewController.swift
//  AlamoDraftHouse
//
//  Created by William Farmerie on 9/8/17.
//  Copyright © 2017 William Farmerie. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SVProgressHUD

class QueryViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  var viewModel: QueryViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.estimatedRowHeight = 44
    tableView.rowHeight = UITableViewAutomaticDimension
    // Do any additional setup after loading the view.
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension QueryViewController: UISearchBarDelegate {

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    let apiKey = "029f378aa1dd40fabccae42f692308a9"
    if let searchString = searchBar.text {
      SVProgressHUD.show(withStatus: "Searching...")
      let requestUrl = "http://api.opencagedata.com/geocode/v1/json?q=" + searchString + "&key=" + apiKey
      
      Alamofire.request(requestUrl).responseJSON { response in
        
        switch response.result {
        case .success:
          
          if let json = response.result.value as? [String: Any] {
            
            self.viewModel = QueryViewModel(with: json)
          }
          SVProgressHUD.dismiss()
          self.tableView.reloadData()
        case .failure:
          
          SVProgressHUD.dismiss()
          self.showError(errorString: "No Results Found")
          break
        }
      }
    }
  }
}

extension QueryViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let model = viewModel {
      return model.resultsObjects.count
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    if let model = viewModel {
      cell.textLabel?.text = model.resultsObjects[indexPath.row].formattedName
      cell.textLabel?.numberOfLines = 0
    } else {
      
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
    if let model = viewModel {
      vc.objectModel = model.resultsObjects[indexPath.row]
    }
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
