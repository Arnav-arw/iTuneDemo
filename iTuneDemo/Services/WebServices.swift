//
//  WebServices.swift
//  iTuneDemo
//
//  Created by Arnav Singhal on 17/02/23.
//

import Foundation

class WebServices {
    
    func fetchAdeleResults(completion: @escaping ([AdeleResult]?, Error?) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=adele") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(nil, NSError(domain: "Server error", code: 0, userInfo: nil))
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data", code: 0, userInfo: nil))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(AdeleResults.self, from: data)
                completion(results.results, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }

}
