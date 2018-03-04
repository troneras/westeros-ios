//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved
//

import UIKit

class MemberDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Properties
    var model: Person
    
    //MARK: - Initialization
    init(model:Person){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: - Sync
    func syncModelWithView(){
        nameLabel.text = model.name
        houseLabel.text = model.house.name
    }

   

}


extension MemberDetailViewController: MemberListViewControllerDelegate{
    func MemberListViewController(_ vc: MemberListViewController) {
        navigationController?.pushViewController(self, animated: true)
        
    }
}
