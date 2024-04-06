//
//  ListRowView.swift
//  ToDoList
//
//  Created by Engin Gündüz on 30.03.2024.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isComplement ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplement ? Color(red: 0, green: 0.5, blue: 0.5) : .black)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 10)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Item!", isComplement: false)
    static var item2 = ItemModel(title: "Second Item!", isComplement: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
