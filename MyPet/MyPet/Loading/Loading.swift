//
//  Loading.swift
//  CHATGPT
//
//  Created by Caio Fabrini on 06/05/23.
//

import UIKit

final class Loading {
    
    private var viewController: UIViewController
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        return view
    }()
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.color = .white
        activityIndicatorView.style = .large
        activityIndicatorView.backgroundColor = .black
        activityIndicatorView.layer.cornerRadius = 10
        activityIndicatorView.clipsToBounds = true
        return activityIndicatorView
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    private func addElements() {
        containerView.addSubview(activityIndicatorView)
        containerView.addSubview(messageLabel)
        viewController.view.addSubview(containerView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 70),
            activityIndicatorView.widthAnchor.constraint(equalToConstant: 70),
            
            messageLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
        ])
    }
    
    public func start(message: String? = nil) {
        addElements()
        configConstraints()
        messageLabel.text = message
        messageLabel.isHidden = message == nil
        activityIndicatorView.startAnimating()
    }
    
    public func stop() {
        activityIndicatorView.stopAnimating()
        containerView.removeFromSuperview()
    }


}
