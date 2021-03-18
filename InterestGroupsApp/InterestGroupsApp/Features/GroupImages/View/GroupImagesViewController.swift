//
//  GroupImagesViewController.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit

class GroupImagesViewController: UIViewController {

    @IBOutlet weak var imagesView: UIImageView!
    
    var presenter: GroupImagesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
}

extension GroupImagesViewController {
    
    func setupUI() {
        
        overrideUserInterfaceStyle = .light
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backToPreviousViewWhenTouchAnyWere)))
    }
    
    @objc func backToPreviousViewWhenTouchAnyWere() {
        
        navigationController?.popViewController(animated: true)
    }
}
