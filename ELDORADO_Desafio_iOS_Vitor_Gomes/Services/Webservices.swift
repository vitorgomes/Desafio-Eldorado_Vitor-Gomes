//
//  Webservices.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 07/08/21.
//

import Foundation

class Webservices {
    
    func getRepositories(url: URL, completion: @escaping ([Item]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let repositoryList = try? JSONDecoder().decode(RepositoryList.self, from: data)

                if let repositoryList = repositoryList {
                    completion(repositoryList.items)
                }
                
                print(repositoryList?.items) // Remove later
            }
            
        }.resume()
        
    }
    
}
