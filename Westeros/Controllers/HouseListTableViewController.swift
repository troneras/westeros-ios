//
//  HouseListTableViewController.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import UIKit

let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"
let HOUSE_KEY = "HouseKey"
let LAST_HOUSE = "LastHouse"

protocol HouseListTableViewControllerDelegate: class {
    func HouseListTableViewController(_ vc: HouseListTableViewController,didSelectHouse house: House)
}

class HouseListTableViewController: UITableViewController {

    //MARK: - Propeties
    let model: [House]
    weak var delegate: HouseListTableViewControllerDelegate?
    
    //MARK: - Initialization
    init(model: [House]){
        self.model = model
        super.init(style: .plain)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        // Marca la última row seleccionada
        let lastRow = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        let indexPath = IndexPath(row:lastRow,section:0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning NO IMPLEMENTADO
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseCell"

        let house = model[indexPath.row]
        
        //create cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        //sinc house with cell
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
        
    }
    
    //MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = model[indexPath.row]
        
        //call delegate
        delegate?.HouseListTableViewController(self, didSelectHouse: house)
        
        //send info
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY:house])
        
        notificationCenter.post(notification)

        //get coordinates
        saveLastSelectedHouse(at: indexPath.row)
    }

   
}

extension HouseListTableViewController{
    
    func saveLastSelectedHouse(at row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: LAST_HOUSE)
        defaults.synchronize()
    }
    
    func lastSelectedHouse() -> House {
        let row = UserDefaults.standard.integer(forKey: LAST_HOUSE)

        // Ahouse?
        let house = model[row]
        
        return house
    }
}
