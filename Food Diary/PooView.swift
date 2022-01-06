//
//  PooView.swift
//  Food Diary
//
//  Created by Raoul on 04/01/2022.
//

import SwiftUI

struct PooView: View {
    @State private var meal = " "
    @State private var date  = Date()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Inès 🚽 diary!")
                    .font(.headline)
                    .padding()
                
                Text("Pick a date and time:")
                    .padding()
                
                DatePicker(selection: $date, label: { Text("Date") })
                
                Text("Notes:")
                    .padding()
                
                TextEditor(text: $meal)
                    .frame(minHeight: 150)
                    .border(Color.blue)
                
                Button(action: {
                    Sheety.send(date: date, category: "poo", type: "", note: meal, callback: {
                        self.mode.wrappedValue.dismiss()
                    })
                }) {
                    Text("Save")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        
        
        
    }
}

struct PooView_Previews: PreviewProvider {
    static var previews: some View {
        PooView()
    }
}
