//
//  MapViewController.swift
//  AlamoDraftHouse
//
//  Created by William Farmerie on 9/9/17.
//  Copyright © 2017 William Farmerie. All rights reserved.
//

import UIKit
import SVProgressHUD

class MapViewController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
  
  var objectModel: QueryObject?
    override func viewDidLoad() {
        super.viewDidLoad()
      SVProgressHUD.show(withStatus: "Loading...")
      if let object = objectModel {
        
        webView.loadRequest(URLRequest(url: object.url))
      }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MapViewController: UIWebViewDelegate {
  func webViewDidFinishLoad(_ webView: UIWebView) {
    SVProgressHUD.dismiss()
  }
}
