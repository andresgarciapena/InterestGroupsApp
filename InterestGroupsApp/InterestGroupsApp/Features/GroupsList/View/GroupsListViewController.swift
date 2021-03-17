//
//  GroupsListViewController.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit
import PKHUD

class GroupsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: GroupsListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func onFetchGroupsListSuccess() {
        
        self.tableView.reloadData()
    }
    
    func urlToImage(urlString: String) -> UIImage {
        var imageToShow = UIImage()
        if let imageUrl = URL(string: urlString) {
            let imageData = try! Data(contentsOf: imageUrl)
            if let image = UIImage(data: imageData) {
                imageToShow = image
            }
        }
        return imageToShow
    }
    
    func showHUD() {
        HUD.show(.labeledProgress(title: "", subtitle: "Downloading groups..."), onView: self.view)
    }
    
    func hideHUD() {
        HUD.hide()
    }
}

extension GroupsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell
        cell.groupNameLabel.text = presenter?.setNameLabelText(indexPath: indexPath)
        cell.groupDescriptionLabel.text = presenter?.setDescriptionLabelText(indexPath: indexPath)
        cell.groupDateLabel.text = presenter?.setDateLabelText(indexPath: indexPath)
        cell.groupImageView.image = presenter?.setImageView(indexPath: indexPath)
        return cell
    }
}

extension GroupsListViewController {
    
    func setupUI() {
        
        overrideUserInterfaceStyle = .light
        
        let add = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(addTapped))
        let play = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(playTapped))

        self.navigationItem.rightBarButtonItems = [add, play]
        self.navigationItem.title = "Practica"
        
        self.tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupTableViewCell")
    }
    
    @objc func addTapped() {
        
    }
    
    @objc func playTapped() {
        
        presenter?.refreshGroups()
    }
}
