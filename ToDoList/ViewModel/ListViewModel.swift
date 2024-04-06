//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Engin Gündüz on 30.03.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            //tüm fonksiyonlara ekleyip kod fazlasına gerek yok sadece items üzerinde değişiklik olduğu için direkt onu
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        // UserDefaults aracılığıyla kaydedilmiş olan verilerin geri yüklenmesini sağlar.
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            //koleksiyonu JSON formatından çözerek ItemModel dizisine dönüştürür
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
    }
    
    //indexSet, dizindeki konumdaki nesneyi belirtir
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    //dizindeki itemleri hareket ettirir
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    // item ekleme için
    func addItem(title: String){
        let newItem = ItemModel(title: title, isComplement: false)
        items.append(newItem)
    }
    // item complete güncelleme için
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            // Koleksiyondaki öğeyi parametre ile gelen öğe ile değiştir.
            items[index] = item.updateCompletion()
        }
    }
    //items'ları kaydetmek için
    func saveItems() {
        //items koleksiyonunu  json formatına çevirmek için
        if let encodedData = try? JSONEncoder().encode(items) {
            //önceden kodlanmış veriyi UserDefaults'a kaydeder
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
}
