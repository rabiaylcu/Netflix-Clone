//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Rabia Yolcu on 20.08.2024.
//

import Foundation

struct Constants{
    static let API_KEY = "e656b1a61f535502bb073cb1f0556397"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error{
    case failedTogetData
}

class APICaller{
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        
        task.resume()
        
    }
}
