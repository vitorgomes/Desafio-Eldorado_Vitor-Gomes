//
//  PullViewModel.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 08/08/21.
//

import Foundation

struct PullListViewModel {
    
    let pulls: [Pull]
    
    var name: String = ""
    var id: Int = 0
    var owner: String = ""
    var forks: Int = 0
    var watchers: Int = 0
    
}

extension PullListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.pulls.count
    }
    
    func pullAtIndex(_ index: Int) -> PullViewModel {
        let pull = self.pulls[index]
        return PullViewModel(pull)
    }
    
    func save() {
        
        let repo = Repo(context: CoreDataManager.shared.viewContext)
        repo.name = name
        repo.id = Int32(id)
        repo.owner = owner
        repo.forks = Int32(forks)
        repo.watchers = Int32(watchers)
        
        CoreDataManager.shared.save()
        
    }
    
}

struct PullViewModel {
    private let pull: Pull
}

extension PullViewModel {
    
    init(_ pull: Pull) {
        self.pull = pull
    }
    
    var title: String {
        return self.pull.title
    }
    
}
