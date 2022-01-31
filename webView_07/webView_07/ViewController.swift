//
//  ViewController.swift
//  webView_07
//
//  Created by 김태성 on 2022/01/31.
//

import UIKit
import WebKit


class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        myWebView.navigationDelegate = self
        loadWebPage("https://everytime.kr")
    
    
    
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
        
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation! , withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
        
    }
    
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
  
    @IBAction func btnGotoSite1(_ sender: UIButton) {
        loadWebPage("https://naver.com")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://github.com/doroomook")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"https://www.smu.ac.kr/lounge/index.do\">상명대학교 공지사이트</a>로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
        
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filepath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filepath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
        
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}

