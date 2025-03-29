import SwiftUI

struct CapturedImageView: View {
    let image: UIImage
    @StateObject private var cameraManager = CameraManager.shared
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        cameraManager.isPhotoCaptured = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                    .padding()
                    Spacer()
                }
                Spacer()
                HStack(spacing: 60) {
                    Button(action: {
                        cameraManager.isPhotoCaptured = false
                    }) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .font(.system(size: 64))
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        // Image is already saved, just go back to camera
                        cameraManager.isPhotoCaptured = false
                    }) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 64))
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 30)
            }
        }
    }
} 
