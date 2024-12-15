//
//  PokemonModel.swift
//  PokeApi
//
//  Created by Robin Perez on 14/12/24.
//

import Foundation

struct PokemonModel: Identifiable{
    var id = UUID()
    var name: String
    var number: Int
    var image: String
}
