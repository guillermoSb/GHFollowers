//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/8/23.
//

import UIKit

protocol RepoItemVCDelegate: AnyObject  {
    func didTapGithubProfile(for user: User)
    
}

class GFRepoItemVC: GFItemInfoVC {
    weak var delegate: RepoItemVCDelegate!
    
    init(user: User, delegate: RepoItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoView1.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoView2.set(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
    

}
