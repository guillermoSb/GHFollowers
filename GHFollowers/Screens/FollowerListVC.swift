//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/28/23.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var followers: [Follower] = []
    var hasMoreFollowers = true
    
    var userName: String!
    var page = 1
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers(for: userName, page: page)
        configureDataSource()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseID) // Register the cell
        collectionView.delegate = self
    }
    
    
    
    
    func getFollowers(for userName: String, page: Int) {
        showLoadingView()
        // weak self because we dont want to keep reference to self so we can deallocate self
        NetworkManager.shared.getFollowers(for: userName, page: page) { [weak self] result in
            guard let self = self else {return}
            self.dismissLoadingView()
            switch result {
                case .success(let followers):
                if followers.count < 100 {self.hasMoreFollowers = false}
                self.followers.append(contentsOf: followers)
                if self.followers.isEmpty {
                    DispatchQueue.main.async { self.showEmptyStateView(view: self.view) }
                    return
                }
                self.updateData()
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.reuseID, for: indexPath) as! GFFollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
        
    }
    
}

extension FollowerListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            page += 1
            getFollowers(for: userName, page: page)
        }
      
        
    }
}
