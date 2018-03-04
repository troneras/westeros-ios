//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nChaptersLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
 
    
    //MARK: - Properties
    var model: Season
    
    //MARK: - Initialization
    init(model: Season){
        self.model = model
        super.init(nibName:nil, bundle:nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelSeasonLVC()
        setUpSeasonLVC()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Sync
    func syncModelSeasonLVC(){
        nameLabel.text = model.name
        nChaptersLabel.text = String(model.count)
        dateLabel.text = "Pending publication"
    }
    
    //MARK: - Setup UI
    func setUpSeasonLVC(){
        
        let episodesButton = UIBarButtonItem(title: "Episodes", style: .done, target: self, action: #selector(displayEpisodes))
        navigationItem.rightBarButtonItem = episodesButton
    }

    
    @objc func displayEpisodes(){
        let episodesListVC = EpisodeListViewController(model:model.sortedEpisodes)
        navigationController?.pushViewController(episodesListVC, animated: true)
    }
  

}


extension SeasonDetailViewController: SeasonListViewControllerDelegate{
    func SeasonListViewController(_ vc: SeasonListViewController,didSelectSeason season:Season){
        self.model = season
        syncModelSeasonLVC()
    }
}
