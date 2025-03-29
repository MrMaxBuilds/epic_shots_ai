//
//  HomeView.swift
//  Epic Shots
//
//  Created by Max U on 3/25/25.
//


import SwiftUI
import AVFoundation

struct HomeView: View {
    @EnvironmentObject var userManager: UserManager
    @StateObject private var cameraManager = CameraManager.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                if cameraManager.permissionGranted {
                    ZStack {
                        if cameraManager.isPhotoCaptured, let capturedImage = cameraManager.recentImage {
                            CapturedImageView(image: capturedImage)
                        } else {
                            CameraPreviewView(session: cameraManager.session)
                                .ignoresSafeArea()
                                .overlay(
                                    VStack {
                                        Spacer()
                                        Button(action: {
                                            withAnimation(.none) {
                                                cameraManager.capturePhoto()
                                            }
                                        }) {
                                            ZStack {
                                                Circle()
                                                    .fill(.white)
                                                    .frame(width: 65, height: 65)
                                                Circle()
                                                    .stroke(.white, lineWidth: 2)
                                                    .frame(width: 75, height: 75)
                                            }
                                        }
                                        .padding(.bottom, 30)
                                    }
                                )
                        }
                    }
                } else {
                    NoAccessView()
                }
                
                // Only show settings button when camera is active, not in captured image view
                if !cameraManager.isPhotoCaptured {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink(destination: SettingsView()) {
                                Image(systemName: "gear")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                                    .padding()
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct NoAccessView: View {
    var body: some View {
        VStack {
            Image(systemName: "camera.circle.fill")
                .font(.system(size: 50))
                .padding()
            Text("Camera access is required")
                .font(.title2)
            Text("Please enable camera access in Settings")
                .foregroundColor(.gray)
            Button("Open Settings") {
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsUrl)
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.top)
        }
    }
}