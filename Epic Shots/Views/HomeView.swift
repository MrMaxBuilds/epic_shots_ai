//
//  HomeView.swift
//  Epic Shots
//
//  Created by Max U on 3/25/25.
//


import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello \(userManager.userName ?? "User")")
                    .font(.largeTitle)
                Spacer()
                NavigationLink(destination: SettingsView()) {
                    Text("Go to Settings")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Spacer()
            }
            .navigationTitle("Home")
        }
    }
}