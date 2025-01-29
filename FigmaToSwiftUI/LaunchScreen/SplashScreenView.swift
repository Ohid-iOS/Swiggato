//
//  LaunchScreenView.swift
//  FigmaToSwiftUI
//
//  Created by Tech Exactly iPhone 6 on 29/01/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive: Bool = false
    @State private var progress: CGFloat = 0.0 // Tracks progress from 0 to 100
    @State private var countdown: Int = 100 // Countdown from 100 to 0

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                // Background Image
                Image("splash")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                // Progress Bar and Countdown Text
                VStack {
                    
                    Spacer()
                    Text("\(countdown)%") // Display countdown percentage
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                 
                    ProgressView(value: progress, total: 100.0) // Progress bar from 0 to 100
                        .progressViewStyle(LinearProgressViewStyle(tint: .white)) // White progress bar
                        .frame(width: 300) // Set width of the progress bar
                }
            }
            .onAppear {
                // Start a timer to update the progress and countdown
                Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                    withAnimation {
                        progress += 1.0 // Increment progress by 1% every 0.02 seconds
                        countdown -= 1 // Decrement countdown by 1
                    }
                    if progress >= 100.0 {
                        timer.invalidate() // Stop the timer when progress reaches 100%
                        isActive = true // Switch to ContentView
                    }
                }
            }
        }
    }
}
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
