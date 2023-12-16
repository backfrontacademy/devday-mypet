//
//  HeaderView.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

protocol HeaderViewProtocol: AnyObject {
    func tappedBackButton()
    func tappedUserButton()
    func tappedBellButton()
}

extension HeaderViewProtocol {
    func tappedBackButton() { /*opcional*/ }
    func tappedUserButton() { /*opcional*/ }
}

class HeaderView: UIView {
    
    private weak var delegate: HeaderViewProtocol?
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "MyPet")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var userButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "solidUser"), for: .normal)
        button.addTarget(self, action: #selector(tappedUserButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    @objc func tappedUserButton() {
        delegate?.tappedUserButton()
    }
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [backButton, userButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var bellButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "solidBell"), for: .normal)
        button.addTarget(self, action: #selector(tappedBellButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBellButton() {
        delegate?.tappedBellButton()
    }
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .peach
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .whiteBackground
        addElements()
        configElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoImageView)
        addSubview(stackView)
        addSubview(bellButton)
        addSubview(lineView)
    }
    
    private func configElements() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 24),
            stackView.widthAnchor.constraint(equalToConstant: 24),
            
            bellButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            bellButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bellButton.heightAnchor.constraint(equalToConstant: 24),
            bellButton.widthAnchor.constraint(equalToConstant: 24),
    
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    public func configHeader(delegate: HeaderViewProtocol?, isBack: Bool) {
        self.delegate = delegate
        userButton.isHidden = isBack
        backButton.isHidden = !isBack
    }
    
}
