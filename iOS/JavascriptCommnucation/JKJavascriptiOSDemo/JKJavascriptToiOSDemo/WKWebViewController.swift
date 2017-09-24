

// WKWebView

import UIKit
import WebKit

class WKWebViewController: UIViewController, WKScriptMessageHandler {
  var webView: WKWebView?
  lazy var firstNameField: UITextField = { () -> UITextField in
    var textField = UITextField(frame: CGRect(x: 0, y: (self.webView?.frame.size.height)! + 50, width: 100, height: 50))
    textField.layer.borderColor = UIColor.blue.cgColor
    textField.layer.borderWidth = 5
    return textField
  }()
  
  lazy var lastNameField: UITextField = { () -> UITextField in
    var textField = UITextField(frame: CGRect(x: 0,
                                              y:self.firstNameField.frame.origin.y + self.firstNameField.frame.size.height + 10,
                                              width: 100, height: 50))
    textField.layer.borderColor = UIColor.red.cgColor
    textField.layer.borderWidth = 5
    return textField
  }()
  
  lazy var sendToJavascriptButton: UIButton = { () -> UIButton in
    var button = UIButton(type: .system)
    button.setTitle("toJavascript", for: .normal)
    
    button.frame = CGRect(x: 0,
                          y:self.lastNameField.frame.origin.y + self.lastNameField.frame.size.height + 10,
                          width: 100, height: 50)
    button.addTarget(self, action:#selector(toJavascript), for:.touchUpInside)
    return button
  }()
  
  func toJavascript() {
    print("toJavascript!")
    let firstName = self.firstNameField.text
    let lastName = self.lastNameField.text
    
    let inputPayload = ["firstName": firstName, "lastName": lastName]
    let serializedData = try! JSONSerialization.data(withJSONObject: inputPayload, options: [])
    let encodedData = String(data: serializedData, encoding: String.Encoding.utf8)
    
    
    let javascriptString = "customMessageWithDictionary('\(encodedData!)')"
    
    self.webView?.evaluateJavaScript(javascriptString) { (result, error) in
      if error == nil {
        print(result
        )
      }
    }
    
    // at UIWebView
    // let _ = self.webView?.stringByEvaluatingJavaScript(from: "customMessageWithDictionary('\(encodedData!)')")
  }
  
  override func loadView() {
    super.loadView()
    
    let contentController = WKUserContentController()
    
    let userScript = WKUserScript(
      source: "setText(\"Hi JavaScript\")",
      injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
      forMainFrameOnly: true
    )
 
    let alertScript = WKUserScript(source: "myFunction()",
                                   injectionTime: .atDocumentEnd,
                                   forMainFrameOnly: true)
    
    contentController.addUserScript(userScript)
    contentController.addUserScript(alertScript)
    
    contentController.add(self, name: "callback")
    contentController.add(self, name: "swift")
    
    let config = WKWebViewConfiguration()
    config.userContentController = contentController
    
    self.webView = WKWebView(
      frame: self.view.bounds,
      configuration: config
    )
    
    self.webView?.navigationDelegate = self

    self.webView?.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.view.frame.size.width,
                                 height: self.view.frame.size.height / 2)
    self.view.addSubview(self.webView!)
    
    self.view.addSubview(firstNameField)
    self.view.addSubview(lastNameField)
    self.view.addSubview(sendToJavascriptButton)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    // self.webView?.loadHTMLString(self.htmlStringFromFile(with: "WKWebViewExample"), baseURL: nil)
    
    /*
    let url = NSURL(string:"https://rawgit.com/O-mkar/WKWebView-and-JavaScript-in-iOS-9-Example-/master/WEBPART/index.html")
    let req = URLRequest(url:url! as URL)
    self.webView!.load(req)
     */
    
    let url = URL(string:"http://www.boraseoksoon.com/testCode")
    let request = URLRequest(url: url!)
    self.webView?.load(request)

  }
  
  private func htmlStringFromFile(with name: String) -> String {
    let path = Bundle.main.path(forResource: name, ofType: "html")
    if let result = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8) {
      return result
    }
    return ""
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  func userContentController(_ userContentController: WKUserContentController,
                             didReceive message: WKScriptMessage) {
    
    if(message.name == "callback") {
      let alert = UIAlertController(title: "Message", message: "Message from JavaScript: \(message.body)", preferredStyle: UIAlertControllerStyle.alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      
      self.present(alert, animated: true, completion: {})
    } else if(message.name == "swift") {
      let alert = UIAlertController(title: "Message", message: "Message from JavaScript: \(message.body)", preferredStyle: UIAlertControllerStyle.alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      
      self.present(alert, animated: true, completion: {})
    }
  }
  
  func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
    print("webView:\(webView) decidePolicyForNavigationAction:\(navigationAction) decisionHandler:\(decisionHandler)")
  }
}


extension WKWebViewController: WKNavigationDelegate{
  func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
    print(#function)
  }
  
  func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    print(#function)
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print(#function)
  }
  
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    print(#function)
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    print(#function)
  }
  
  func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
    print(#function)
  }
  
  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    print(#function)
  }
  
  func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    print(#function)
    completionHandler(.performDefaultHandling,nil)
  }
  
  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    print(#function)
    
    if let url = navigationAction.request.url {
      let scheme = url.scheme
      let host = url.host
      
      if let scheme = scheme {
        print("scheme : ", scheme)
        if let host = host {
          print("host : ", host)
          
          if scheme == "sampleswiftcodehahaha", host == "PrintDatahahaha" {
            let jsonString = url.fragment?.removingPercentEncoding
            print("jsonStringr : ", jsonString)
            let jsonDictionary = convertToDictionary(text: jsonString)
            
            if let jsonDictionary = jsonDictionary, let firstName = jsonDictionary["firstName"] as? String, let lastName = jsonDictionary["lastName"] as? String {
              firstNameField.text = firstName
              lastNameField.text = lastName
            }
          } else {
            let jsonString = url.fragment?.removingPercentEncoding
            let jsonDictionary = convertToDictionary(text: jsonString)
            
            if let jsonDictionary = jsonDictionary, let alertMessage = jsonDictionary["alert"] as? String {
              
              
              let alertController = UIAlertController(title: "TEST",
                                                      message: alertMessage,
                                                      preferredStyle: UIAlertControllerStyle.alert)
              
              let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                print("Cancel")
              }
              let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("OK")
              }
              
              alertController.addAction(okAction)
              alertController.addAction(cancelAction)
              
              self.present(alertController, animated: true, completion: nil)
            }
          }
        }
      }
    }
    decisionHandler(.allow)
  }
  
  func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
    print(#function)
    decisionHandler(.allow)
  }
}


