//
//  Epic_ShotsApp.swift
//  Epic Shots
//
//  Created by Max U on 3/22/25.
//

import SwiftUI

@main
struct EpicShots: App {
  var body: some Scene {
    WindowGroup {
        LoginView()
          .environmentObject(UserManager.shared)
    }
  }
}
