//
//  RepositoryViewModel.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 07/08/21.
//

import Foundation
import CoreData

struct RepositoryListViewModel {
    
    let repositories: [Item]
    var repo: [RepoViewModel] = [] // Check if it is righ
    
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
    
    mutating func getAllRepo() {
         repo = CoreDataManager.shared.getAllRepo().map(RepoViewModel.init) //Check if it is right
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

// Check if it is right (all code bellow)
struct RepoViewModel {
    
    let repo: Repo

    var id: Int32 {
        return repo.id
    }

    var name: String {
        return repo.name ?? ""
    }
    
    var owner: String {
        return repo.owner ?? ""
    }
    
    var forks: Int32 {
        return repo.forks
    }
    
    var watchers: Int32 {
        return repo.watchers
    }
    
}
