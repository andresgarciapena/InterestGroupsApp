//
//  GroupsListViewController.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

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
}

extension GroupsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell
        cell.groupNameLabel.text = "Musica"
        cell.groupDateLabel.text = "10/10/2020"
        cell.groupDescriptionLabel.text = "Grupo de musica"
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
        
    }
}
