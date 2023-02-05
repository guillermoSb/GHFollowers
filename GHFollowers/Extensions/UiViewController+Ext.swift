//
//  UiViewController+Ext.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/29/23.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func showLoadingView() {
        // Create the alert container view
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0.0
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
        
    }
    
    func showEmptyStateView(view: UIView) {
        let emptyStateView = GFEmptyStateView()
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
        
    }
}
