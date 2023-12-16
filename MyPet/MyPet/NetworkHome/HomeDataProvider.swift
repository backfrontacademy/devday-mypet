//
//  HomeDataProvider.swift
//  MyPet
//
//  Created by Felipe Miranda on 16/12/23.
//

import Foundation

enum TypeSections: Int, CaseIterable {
    case petSection = 0
    case upcomingEvents = 1
    case suggestions = 2
}


protocol HomeDataProviderProtocol: GenericDataProvider {
    
    
    
}


class HomeDataProvider: DataProviderManager <HomeDataProviderProtocol, HomeResponse> {
    
    private var apiStore: HomeAPIStore = HomeAPIStore()
    
    
    var numberOfRowsInSection: Int {
        return TypeSections.allCases.count
    }

    var petSection: PetSection? {
        return self.model?.petSection
    }
    
    var upcomingEvents: UpcomingEvents? {
        return self.model?.upcomingEvents
    }
    
    var suggestions: Suggestions? {
        return self.model?.suggestions
    }
    
    func setDelegate(delegate: HomeDataProviderProtocol) {
        self.delegate = delegate
    }
//    func loadCurrentPet(indexPath: IndexPath) -> Pet? {
//        
//        return self.model?.petSection.pets[indexPath.row]
//    }
//    
//    func loadCurrentUpcomingEvents(indexPath: IndexPath) -> Event? {
//        
//        return self.model?.upcomingEvents.events[indexPath.row]
//    }
//    
//    func loadCurrentSuggestions(indexPath: IndexPath) -> Item? {
//        
//        return self.model?.suggestions.items[indexPath.row]
//    }
    
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
