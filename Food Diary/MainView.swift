//
//  MainView.swift
//  Food Diary
//
//  Created by Raoul on 04/01/2022.
//

import SwiftUI
import LocalAuthentication

struct MainView: View {
    
    @State private var isUnlocked = false
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Please unlock to access, InΓ¨s is precious."
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                }
            }
        }
    }
    
    let childName  = getConfigValueForKey("CHILD_NAME") ?? "Child"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(childName) diary")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                Spacer()
                
                if isUnlocked {
                    if #available(iOS 15.0, *) {
                        NavigationLink(destination: FoodView()) {
                            Text("πππ₯π₯¦π")
                                .frame(minWidth: 0, maxWidth: 300)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                                .font(.title)
                        }
                    }
                    NavigationLink(destination: MilkView()) {
                        Text("πΌ")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                    }
                    NavigationLink(destination: PooView()) {
                        Text("π½")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .font(.title)
                    }
                } else {
                    Text("Locked, restart the app to unlock")
                }
            }
        }
        .onAppear(perform: authenticate)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


