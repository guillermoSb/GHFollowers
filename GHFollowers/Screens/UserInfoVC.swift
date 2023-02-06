//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/5/23.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var follower: Follower!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        print(follower)
        
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    
}
