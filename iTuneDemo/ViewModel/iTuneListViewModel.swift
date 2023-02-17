//
//  iTuneListViewModel.swift
//  iTuneDemo
//
//  Created by Arnav Singhal on 17/02/23.
//

import Foundation

class iTuneListViewModel {
    
    private(set) var artists: [AdeleResult] = []
        
    func fetchAdele() {
        WebServices().fetchAdeleResults { results, error in
            if let error = error {
                print("Error fetching Adele results: \(error)")
                return
            }
            
            guard let results = results else {
                print("No results found")
                return
            }
            self.artists = results
        }
    }
}
