//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Neill Chua on 2/15/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import Foundation
//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Neill Chua on 2/14/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

        var WebView: WKWebView!
        
        override func loadView() {
            WebView = WKWebView()
            view = WebView
            WebView.loadHTMLString("123", baseURL: NSURL(string: "http://www.bignerdranch.com"))
        }
        override func  viewDidLoad(){
            super.viewDidLoad()
            WebView.loadHTMLString("123", baseURL: NSURL(string: "http://www.bignerdranch.com"))
            
            print("webViewController loaded its view")
        }
        
}
