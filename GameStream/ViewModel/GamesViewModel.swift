//
//  GamesViewModel.swift
//  GameStream
//
//  Created by Fernando Florez on 22/08/21.
//

import Foundation

class GamesViewModel: ObservableObject {
    @Published var gamesInfo: [Game] = []
    
    let baseApiURL = "https://gamestream-api.herokuapp.com/api"
    
    init() {
        let url = URL(string: "\(baseApiURL)/games")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    let decodedData = try JSONDecoder().decode([Game].self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodedData)
                    }
                }
            } catch {
                print("Error: \(error)")
            }
            
        }.resume()
    }
}
