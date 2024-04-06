//
//  ListView.swift
//  ToDoList
//
//  Created by Engin Gündüz on 30.03.2024.
//
import SwiftUI

struct ListView: View {
    // uygulamanın başka yerinde oluşturulduğu için
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("To Do List 📋")
        .navigationBarItems(
            leading: EditButton()
                .foregroundColor(.white)
                .frame(width: 75)
                .background(Color(red: 0, green: 0.5, blue: 0.5))
                .clipShape(Capsule())
                .cornerRadius(14),
            trailing:
                NavigationLink("Add", destination: AddView())
                .foregroundColor(.white)
                .frame(width: 75)
                .background(Color(red: 0, green: 0.5, blue: 0.5))
                .clipShape(Capsule())
                .cornerRadius(14)
        )
    }
}

#Preview {
    NavigationView {
        ListView()
            .environmentObject(ListViewModel())
    }
}
