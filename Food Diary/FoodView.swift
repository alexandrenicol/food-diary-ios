//
//  FoodView.swift
//  Food Diary
//
//  Created by Raoul on 04/01/2022.
//

import SwiftUI
import Alamofire
import Foundation



@available(iOS 15.0, *)
struct FoodView: View {
    @State private var meal = " "
    @State private var type = "breakfast"
    @State private var date  = Date()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Inès Food diary!")
                    .font(.headline)
                    .padding()
                
                Text("Pick a date and time:")
                    .padding()
                
                DatePicker(selection: $date, label: { Text("Date") })
                
                Text("Select meal type:")
                    .padding()
                
                Spacer()
                
                Picker(selection: $type, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    Text("Breakfast").tag("breakfast")
                    Text("Snack").tag("snack")
                    Text("Lunch").tag("lunch")
                    Text("Dinner").tag("dinner")
                }
                .padding(.vertical, 10.0)
                
                Spacer()
                
                Text("Enter meal description:")
                    .padding()
                
                TextEditor(text: $meal)
                    .frame(minHeight: 100)
                    .border(Color.blue)
                    .focused($isFocused)
                    .onChange(of: isFocused) { isFocused in
                        debugPrint(isFocused)
                    }
                
                Button(action: {
                    Sheety.send(date: date, category: "food", type: type, note: meal, callback: {
                        self.mode.wrappedValue.dismiss()
                    })
                    
                }) {
                    Text("Save")
                }
                .padding(.vertical, 10.0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            FoodView()
        } else {
            // Fallback on earlier versions
        }
    }
}
