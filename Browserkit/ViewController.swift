//
//  ViewController.swift
//  Browserkit
//
//  Created by user on 15/10/2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
    }

    @IBAction func btnVisitTapped(_ sender: Any) {
        let url = URL(string: "http://google.com")
        let request = URLRequest(url: url!)
        myWebView.load(request)
    }
    
}

extension ViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Commit finished")
        loadingView.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadingView.stopAnimating()
    }
}

