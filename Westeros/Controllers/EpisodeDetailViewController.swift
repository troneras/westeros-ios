//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Properties
    var model: Episode
    
    //MARK: - Initialization
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      syncModelEpisodeDVC()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    //MARK: - Sync
    func syncModelEpisodeDVC(){
        titleLabel.text = model.title
        airDateLabel.text = "Pending publication"
    }

}

extension EpisodeDetailViewController: EpisodeListViewControllerDelegate{
    func EpisodeListViewController(_ vc: EpisodeListViewController, didSelectEpisode episode: Episode) {
        self.model = episode
        print(episode)
        syncModelEpisodeDVC()
        navigationController?.pushViewController(self, animated: true)
    }
    
  
}
