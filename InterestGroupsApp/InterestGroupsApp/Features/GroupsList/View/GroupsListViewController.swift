//
//  GroupsListViewController.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit
import PKHUD
import PopupDialog

class GroupsListViewController: UIViewController {

    @IBOutlet weak var noGroupsFindedLabel: UILabel!
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
        
        self.noGroupsFindedLabel.isHidden = true
        self.tableView.isHidden = false
        self.tableView.reloadData()
    }
    
    func onFetchGoupsListFailure(popup: PopupDialog) {
        
        self.present(popup, animated: false, completion: nil)
        self.noGroupsFindedLabel.isHidden = false
        self.tableView.isHidden = true
    }
    
    func showHUD() {
        HUD.show(.labeledProgress(title: "", subtitle: "Descargando grupos..."), onView: self.view)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
    }
}

extension GroupsListViewController {
    
    func setupUI() {
        
        overrideUserInterfaceStyle = .light
        
        let favourites = UIBarButtonItem(image: UIImage(named: "more_vert"), style: .plain, target: self, action: #selector(favouritesTapped))
        let reflesh = UIBarButtonItem(image: UIImage(named: "autorenew"), style: .plain, target: self, action: #selector(refreshTapped))

        self.navigationItem.rightBarButtonItems = [favourites, reflesh]
        self.navigationItem.title = "Practica"
        
        self.tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupTableViewCell")
        
        self.noGroupsFindedLabel.isHidden = true
    }
    
    @objc func favouritesTapped() {
        
    }
    
    @objc func refreshTapped() {
        
        presenter?.refreshGroups()
    }
}
