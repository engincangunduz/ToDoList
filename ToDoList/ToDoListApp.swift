//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Engin Gündüz on 30.03.2024.
//

import SwiftUI
/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages model for view
 
 */
@main
struct ToDoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
