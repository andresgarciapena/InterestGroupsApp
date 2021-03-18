//
//  FavGroupsViewController.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit

class FavGroupsViewController: UIViewController {

    @IBOutlet weak var noGroupsLabel: UILabel!
    
    var presenter: FavGroupsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
}

extension FavGroupsViewController {
    
    func setupUI() {
        
        overrideUserInterfaceStyle = .light
    }
}
