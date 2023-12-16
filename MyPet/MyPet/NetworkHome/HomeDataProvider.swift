//
//  HomeDataProvider.swift
//  MyPet
//
//  Created by Felipe Miranda on 16/12/23.
//

import Foundation

enum TypeSections: Int {
    case petSection = 0
    case upcomingEvents = 1
    case suggestions = 2
}


protocol HomeDataProviderProtocol: GenericDataProvider {
    
    
    
}


class HomeDataProvider: DataProviderManager <HomeDataProviderProtocol, HomeResponse> {
    
    private var apiStore: HomeAPIStore = HomeAPIStore()
    
    func setDelegate(delegate: HomeDataProviderProtocol) {
        self.delegate = delegate
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        
        switch section {
        case TypeSections.petSection.rawValue:
            return self.model?.petSection.pets.count ?? 0

        case TypeSections.upcomingEvents.rawValue:
            return self.model?.upcomingEvents.events.count ?? 0
        case TypeSections.suggestions.rawValue:
            return self.model?.suggestions.items.count ?? 0

        default:
            print("nao entrou em nenhum case")
        }
        
        return 0
    }
    
    func loadCurrentPet(indexPath: IndexPath) -> Pet? {
        
        return self.model?.petSection.pets[indexPath.row]
    }
    
    func loadCurrentUpcomingEvents(indexPath: IndexPath) -> Event? {
        
        return self.model?.upcomingEvents.events[indexPath.row]
    }
    
    func loadCurrentSuggestions(indexPath: IndexPath) -> Item? {
        
        return self.model?.suggestions.items[indexPath.row]
    }
    
    func numberOfSections() -> Int {
        
        return 3
    }
    
    func getHome() {
        
        self.delegate?.startLoading()
        
        self.apiStore.getHome(url: "https://run.mocky.io/v3/c2ee6e46-4ed6-4008-a204-770e2fb69fba") { result, failure in
            
            if result != nil {
                
                self.model = result
                self.delegate?.stopLoading()
                self.delegate?.success(model: nil)
                
            }else {
             
                self.delegate?.stopLoading()
                self.delegate?.errorData(error: failure)
            }
            
        }
        
    }
}
