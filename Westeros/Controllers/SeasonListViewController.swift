//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import UIKit

let LAST_SEASON = "LastSeason"
let SEASON_KEY = "SeasonKey"
let SEASON_DID_CHANGE_NOTIFICATION_NAME = "SeasonDidChange"



protocol SeasonListViewControllerDelegate: class {
    
    func SeasonListViewController(_ vc:SeasonListViewController,didSelectSeason season:Season)
}
class SeasonListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //MARK: - Properties
    let model: [Season]
    weak var delegate: SeasonListViewControllerDelegate?
    
    //MARK: - Initialization
    init(model:[Season]){
        self.model = model;
        super.init(nibName: nil, bundle: nil)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let lastRow = UserDefaults.standard.integer(forKey: LAST_SEASON)
        let indexPath = IndexPath(row:lastRow,section:0)
        
       tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


//MARK: - extension UITableViewDataSource
extension SeasonListViewController: UITableViewDataSource{
    
    
    //MARK: - Tableview datasource
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning NO IMPLEMENTED
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return model.count
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)->UITableViewCell{
        
        let cellId = "SeasonCell"
        let season = model[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if(cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        cell?.textLabel?.text = season.name
        
        return cell!
    }
}   


extension SeasonListViewController: UITableViewDelegate{
    //MARK: - TableviewDelegate
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
     
        let season = model[indexPath.row]
        delegate?.SeasonListViewController(self,didSelectSeason:season)
        
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [SEASON_KEY:season])
        
        notificationCenter.post(notification)
        
    }
}

