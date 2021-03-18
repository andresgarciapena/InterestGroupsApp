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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter?.viewWillDisappear()
    }
}

extension GroupImagesViewController {
    
    func setupUI() {
        
        overrideUserInterfaceStyle = .light
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        addViewGestures()
    }
    
    func restartNavigationBar() {
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func addViewGestures() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backToPreviousViewWhenTouchAnyWere)))
        
        let swipeGestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeGestureRecognizerLeft.direction = .left
        view.addGestureRecognizer(swipeGestureRecognizerLeft)
        let swipeGestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipeGestureRecognizerRight.direction = .right
        view.addGestureRecognizer(swipeGestureRecognizerRight)
    }
    
    @objc func backToPreviousViewWhenTouchAnyWere() {
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didSwipeLeft() {
        presenter?.showNextImage()
    }
    
    @objc func didSwipeRight() {
        presenter?.showPreviousImage()
    }
}
