//
//  AddView.swift
//  ToDoList
//
//  Created by Engin Gündüz on 30.03.2024.
//

import SwiftUI

struct AddView: View {
    //görünümü kontrol edebilmek için
    @Environment(\.presentationMode) var presentationMode
    // uygulamanın başka yerinde oluşturulduğu için
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alerTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
//                Color(UIColor.secondarySystemBackground)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(14)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0, green: 0.5, blue: 0.5))
                        .clipShape(Capsule())
                        .cornerRadius(14)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add New Item ✎")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            //butona tıklandığında o sayfayı kapatmak için
            presentationMode.wrappedValue.dismiss()
        }
    }
    //girilen text'in uzunluğuna göre
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3 {
            alerTitle = "Your new todo item must be at least 3 characters long!!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alerTitle))
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
        }
    }
}
