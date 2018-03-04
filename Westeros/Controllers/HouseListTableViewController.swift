//
//  HouseListTableViewController.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved
//

import UIKit

let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"
let HOUSE_KEY = "HouseKey"
let LAST_HOUSE = "LastHouse"

var houseDetailVC: HouseDetailViewController!
protocol HouseListTableViewControllerDelegate: class {
    //Should, will, did
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
        //Para q se marque la row seleccionada
        let lastRow = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        let indexPath = IndexPath(row:lastRow,section:0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cellId = "HouseCell"
        
        //Descubrir la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        //crear celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        //sincroniza house (model) con cell (vista)
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
        
    }
    
    //MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //averiguar que casa es
        let house = model[indexPath.row]
        
        //avisamos al delegado
        delegate?.HouseListTableViewController(self, didSelectHouse: house)
        
        //mando la mismo info a traves de notificaciones
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY:house])
        
        notificationCenter.post(notification)
        
        //Guardar las corrdenadas (section, row) de la ultima casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }

   
}

extension HouseListTableViewController{
    
    func saveLastSelectedHouse(at row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: LAST_HOUSE)
        // Por si las moscas
        defaults.synchronize()
    }
    
    func lastSelectedHouse() -> House {
        // Extraer la row del User Defaults
        let row = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        
        // Averiguar la casa de ese row
        let house = model[row]
        
        // Devolverla
        return house
    }
}


extension HouseListTableViewController: HouseListTableViewControllerDelegate{
    func HouseListTableViewController(_ vc: HouseListTableViewController, didSelectHouse house: House) {

        houseDetailVC = HouseDetailViewController(model: house)
        navigationController?.pushViewController(houseDetailVC, animated: true)
    }
    
    
}
