//
//  RepositoryViewModel.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 07/08/21.
//

import Foundation

struct RepositoryListViewModel {
    let repositories: [Item]
}

extension RepositoryListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.repositories.count
    }
    
    func repositoryAtIndex(_ index: Int) -> RepositoryViewModel {
        let repository = self.repositories[index]
        return RepositoryViewModel(repository)
    }
}

struct RepositoryViewModel {
    private let repository: Item
}

extension RepositoryViewModel {
    init(_ repository: Item) {
        self.repository = repository
    }
    
    var id: Int {
        return self.repository.id
    }
    
    var name: String {
        return self.repository.name
    }
    
    var owner: String {
        return self.repository.owner.login
    }
    
    var forks: Int {
        return self.repository.forks
    }
    
    var watchers: Int {
        return self.repository.watchers
    }
}
