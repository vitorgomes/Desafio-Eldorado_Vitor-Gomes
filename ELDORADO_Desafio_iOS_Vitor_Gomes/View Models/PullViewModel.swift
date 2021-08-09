//
//  PullViewModel.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 08/08/21.
//

import Foundation

struct PullListViewModel {
    let pulls: [Pull]
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
