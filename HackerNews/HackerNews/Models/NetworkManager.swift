//
//  NetworkManager.swift
//  HackerNews
//
//  Created by LIN SHI ZHENG on 16/12/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let result = try decoder.decode(Results.self, from: data)
                        DispatchQueue.main.async {
                            self.posts = result.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
