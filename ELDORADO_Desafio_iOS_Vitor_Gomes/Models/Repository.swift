//
//  Repository.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 07/08/21.
//

import Foundation

struct RepositoryList: Decodable {
    let items: [Item]
}

struct Item: Decodable {
    let id: Int
    let name: String
    let owner: Owner
    let forks: Int
    let watchers: Int
}

struct Owner: Decodable {
    let login: String
}
