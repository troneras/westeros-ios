//
//  WikiViewController.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import UIKit
import WebKit


class WikiViewController: UIViewController {

 //MARK: - Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
  
    //MARK: - properties
    var model: House
  
    
    //MARK: - Initialization
    init(model: House){
        self.model  = model
        super.init(nibName:nil,bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        webView.navigationDelegate = self
        syncModelWithView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Nos damos de alta en las notificaciones
        let noticationCenter = NotificationCenter.default
        noticationCenter.addObserver(self,selector:#selector(houseDidChange),name:Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME),object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Nos damos de baja en las notificationes
        let noticationCenter = NotificationCenter.default
        noticationCenter.removeObserver(self)
    }
    
    //MARK: - sync
    func syncModelWithView(){
        title = model.name
        webView.load(URLRequest(url: model.wikiURL))
    }
    
    //MARK: - Notification
    @objc func houseDidChange(notication: Notification){
        //extraer el userinfo de la notificacion
        //let info = notication.userInfo!
        guard let info = notication.userInfo else{ return }
        
        //sacar la casa del userinfo
        let house = info[HOUSE_KEY] as? House!
        //actualizar modelo
        model = house!
        //sincronizar vista
        syncModelWithView()
        
    }
}

extension WikiViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    
        let type = navigationAction.navigationType
        switch type {
        case .linkActivated, .formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    
    }
}
