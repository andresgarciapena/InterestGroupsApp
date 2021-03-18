//
//  GroupDetailViewController.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

class GroupDetailViewController: UIViewController {

    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupDateLabel: UILabel!
    @IBOutlet weak var groupShortDescLabel: UILabel!
    @IBOutlet weak var groupDescriptionLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    var presenter: GroupDetailPresenter?
    var favButtonPressed = false
    
    var groupDetail: GroupInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    @IBAction func favButtonTapped(_ sender: Any) {
        
        presenter?.addRemoveGroupToFavList(state: !favButtonPressed)
    }
}

extension GroupDetailViewController {
    
    func setupUI() {
        
        overrideUserInterfaceStyle = .light
    }
    
    func configureView() {
        navigationItem.title = groupDetail?.name
        
        groupNameLabel.text = groupDetail?.name
        groupDescriptionLabel.text = groupDetail?.description
        groupDateLabel.text = groupDetail?.name
        groupShortDescLabel.text = groupDetail?.descriptionShort
    }
    
    func setGroupImage(image: UIImage) {
        groupImageView.image = image
    }
    
    func setDate(date: String) {
        groupDateLabel.text = date
    }
    
    func addGroupToFavList() {
        
        favButtonPressed = true
        favButton.setImage(UIImage(named: "favorite_black"), for: .normal)
    }
    
    func removeGroupFromFavList() {
        
        favButtonPressed = false
        favButton.setImage(UIImage(named: "favorite_border_black"), for: .normal)
    }
}
