//
//  FavGroupsViewController.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit

class FavGroupsViewController: UIViewController {

    @IBOutlet weak var noGroupsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FavGroupsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    func showLabel() {
        noGroupsLabel.isHidden = false
        tableView.isHidden = true
    }
    
    func showGroupTable() {
        noGroupsLabel.isHidden = true
        tableView.isHidden = false
    }
}

extension FavGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.groupCellId, for: indexPath) as! GroupTableViewCell
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

extension FavGroupsViewController {
    
    func setupUI() {
        
        overrideUserInterfaceStyle = .light
        
        self.tableView.register(UINib(nibName: Constants.CellIds.groupCellId, bundle: nil), forCellReuseIdentifier: Constants.CellIds.groupCellId)
        
        self.noGroupsLabel.isHidden = true
    }
}
