//
//  ItemModel.swift
//  ToDoList
//
//  Created by Engin Gündüz on 30.03.2024.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isComplement: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplement: Bool) {
        self.id = id
        self.title = title
        self.isComplement = isComplement
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isComplement: !isComplement)
    }
}
