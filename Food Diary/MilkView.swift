//
//  MilkView.swift
//  Food Diary
//
//  Created by Raoul on 04/01/2022.
//

import SwiftUI

struct MilkView: View {
    @State private var note = " "
    @State private var date  = Date()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Inès 🍼 diary!")
                    .font(.headline)
                    .padding()
                
                Text("Pick a date and time:")
                    .padding()
                
                DatePicker(selection: $date, label: { Text("Date") })
                
                Text("Notes:")
                    .padding()
                
                TextEditor(text: $note)
                    .frame(minHeight: 150)
                    .border(Color.blue)
                
                Button(action: {
                    Sheety.send(date: date, category: "boob", type: "", note: note, callback: {
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

struct BoobView_Previews: PreviewProvider {
    static var previews: some View {
        MilkView()
    }
}
