//
//  MyViewModel.swift
//  Assignment
//
//  Created by ios developer on 28/05/24.
//

import Foundation
class MyViewModel {
    // MARK: VARIABLES
    var page = 1
    var lastPage = false
    var allPostsArray: AllPostModel = []
    
    func getAllPostsWithPagination(completion: @escaping (Bool) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_page=\(page)&_limit=10")!
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print(error)
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(false)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let newPosts = try decoder.decode(AllPostModel.self, from: data)
                self.page += 1
                if newPosts.isEmpty {
                    self.lastPage = true
                }else{
                    self.lastPage = false
                }
                self.allPostsArray.append(contentsOf: newPosts)
                completion(true)
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion(false)
            }
        }.resume()
    }
}
