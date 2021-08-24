//
//  HomeViewModel.swift
//  GameStream
//
//  Created by Fernando Florez on 24/08/21.
//

import Foundation

struct SearchResults: Codable, Hashable {
    var results: [Game]
}

class HomeViewModel: ObservableObject {
    @Published var gamesInfo: [Game] = []
    
    let baseApiURL = "https://gamestream-api.herokuapp.com/api"
    
    func search(query: String)  {
        gamesInfo.removeAll()
        
        let encodedParam = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "\(baseApiURL)/games/search?contains=\(encodedParam ?? "")")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    let decodedData = try JSONDecoder().decode(SearchResults.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodedData.results)
                    }
                }
                
            } catch {
                print("Error:", error)
            }
        }.resume()
    }
}
