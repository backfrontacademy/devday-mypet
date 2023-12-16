//
//  HomeViewController.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var screen: HomeScreen?
    var dataProvider: HomeDataProvider = HomeDataProvider()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.headerProtocol(delegate: self)
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
        dataProvider.setDelegate(delegate: self)
        dataProvider.getHome()
    }
}

extension HomeViewController: HeaderViewProtocol {
    func tappedBellButton() {
        print(#function)
    }
    
    func tappedUserButton() {
        print(#function)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataProvider.numberOfRowsInSection(indexPath: <#T##IndexPath#>)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TypeSections(rawValue: indexPath.row) {
        case .petSection:
            let cell = tableView.dequeueReusableCell(withIdentifier: AnimalsTableViewCell.identifier, for: indexPath) as? AnimalsTableViewCell
            return cell ?? UITableViewCell()
        case .suggestions:
            let cell = tableView.dequeueReusableCell(withIdentifier: NextEventsTableViewCell.identifier, for: indexPath) as? NextEventsTableViewCell
            return cell ?? UITableViewCell()
        case .upcomingEvents:
            let cell = tableView.dequeueReusableCell(withIdentifier: SugestionsTableViewCell.identifier, for: indexPath) as? SugestionsTableViewCell
            cell?.setupCell()
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController: HomeDataProviderProtocol {
    func success(model: Any?) {
        print(#function)
    }
    
    func errorData(error: NSError?) {
        print(#function)
    }
    
    func startLoading() {
        loading?.start()
    }
    
    func stopLoading() {
        loading?.stop()
    }
}
