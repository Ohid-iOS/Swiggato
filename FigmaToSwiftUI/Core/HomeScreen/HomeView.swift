////
////  HomeView.swift
////  FigmaToSwiftUI
////
////  Created by Tech Exactly iPhone 6 on 30/01/25.
////
//
//


import SwiftUI

struct HomeView: View {
    @State private var isMenuOpen: Bool = false
    @State private var navigateToLogin: Bool = false // Control navigation

    var body: some View {
        NavigationStack {
            ZStack {
                // Main Home Screen with Animation
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.2)) {
                                isMenuOpen.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .padding(40)

                        Spacer()
                    }

                    Spacer()
                    Text("Home Screen")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray.opacity(0.1))// home view screen color
                .cornerRadius(isMenuOpen ? 20 : 0)
                .offset(x: isMenuOpen ? 150 : 0, y: isMenuOpen ? 70 : 0) // Move HomeView when menu opens
                .scaleEffect(isMenuOpen ? 0.9 : 1) // Scale effect for smooth animation
                .rotationEffect(.degrees(isMenuOpen ? -10 : 0)) // Slight rotation
                .shadow(color: isMenuOpen ? Color.black.opacity(0.3) : Color.clear, radius: 10, x: 5, y: 5)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < -100 { // Swipe to close
                                withAnimation {
                                    isMenuOpen = false
                                }
                            }
                        }
                )

                // Side Menu with Animation
                if isMenuOpen {
                    SideMenuView(isMenuOpen: $isMenuOpen, navigateToLogin: $navigateToLogin)
                        .transition(.move(edge: .leading))
                }

                // NavigationLink to LoginView
                NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                    EmptyView()
                }
            }.ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Side Menu View
struct SideMenuView: View {
    @Binding var isMenuOpen: Bool
    @Binding var navigateToLogin: Bool

    var body: some View {
        ZStack {
            // Background dim effect with animation
            if isMenuOpen {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isMenuOpen = false
                        }
                    }
            }

            // Menu Content with Slide-in Effect
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Hey, 👋")
                                .foregroundColor(.white)
                                .font(.headline)
                            Text("Alisson Becker")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                        }
                    }
                    .padding(.top, 50)
                    Divider()
                        .background(.white)

                    ScrollView {
                        VStack(alignment: .leading, spacing: 50) {
                            Button(action: {}) {
                                Label("Profile", systemImage: "person")
                                    .foregroundColor(.white)
                            }

                            Button(action: {}) {
                                Label("Settings", systemImage: "gear")
                                    .foregroundColor(.white)
                            }


                            Divider()
                                .background(.white)
                                .padding(.vertical, 10)


                            Button(action: {
                                withAnimation {
                                    isMenuOpen = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                                        navigateToLogin = true
                                    }
                                }
                            }) {
                                Label("Logout", systemImage: "arrow.backward")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
                .frame(width: 250)
                .background(Color.black.opacity(0.90))
                .edgesIgnoringSafeArea(.top)
                .offset(x: isMenuOpen ? 0 : -300) // Slide-in animation

                Spacer()
            }
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.2), value: isMenuOpen)
    }
}


// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
















//import SwiftUI
//
//struct HomeView: View {
//    @State private var isMenuOpen: Bool = false
//
//    var body: some View {
//        ZStack {
//            // Main Home Screen
//            VStack {
//                HStack {
//                    Button(action: {
//                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.2)) {
//                            isMenuOpen.toggle()
//                        }
//                    }) {
//                        Image(systemName: "line.horizontal.3")
//                            .font(.title)
//                            .foregroundColor(.black)
//                    }
//                    .padding(40)
//
//                    Spacer()
//                }
//
//                Spacer()
//                Text("Home Screen")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.gray.opacity(0.1))
//            .cornerRadius(isMenuOpen ? 30 : 0)
//            .offset(x: isMenuOpen ? 300 : 0, y: isMenuOpen ? 50 : 0) // Move HomeView when menu opens
//            .scaleEffect(isMenuOpen ? 0.9 : 1) // Scale effect for smooth animation
//            .rotationEffect(.degrees(isMenuOpen ? -5 : 0)) // Slight rotation
//            .shadow(color: isMenuOpen ? Color.black.opacity(0.3) : Color.clear, radius: 10, x: 5, y: 5)
//            .gesture(
//                DragGesture()
//                    .onEnded { value in
//                        if value.translation.width < -100 { // Swipe to close
//                            withAnimation {
//                                isMenuOpen = false
//                            }
//                        }
//                    }
//            )
//
//            // Side Menu
//            if isMenuOpen {
//                SideMenuView()
//                    .transition(.move(edge: .leading))
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//// MARK: - Side Menu View
//struct SideMenuView: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            // Profile Section
//            HStack {
//                Image(systemName: "person.crop.circle.fill")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("Hey, 👋")
//                        .foregroundColor(.white)
//                        .font(.headline)
//                    Text("Alisson Becker")
//                        .foregroundColor(.white)
//                        .font(.title2)
//                        .bold()
//                }
//            }
//            .padding(.top, 50)
//
//            Divider()
//                .background(.white)
//                .padding(.vertical, 10)
//
//            // Menu Items
//            VStack(alignment: .leading, spacing: 20) {
//                MenuItem(icon: "person", title: "Profile")
//                MenuItem(icon: "house", title: "Home Page")
//                MenuItem(icon: "bag", title: "My Cart")
//                MenuItem(icon: "heart", title: "Favorite")
//                MenuItem(icon: "cart", title: "Orders")
//                MenuItem(icon: "bell", title: "Notifications")
//            }
//
//            Divider()
//                .background(.white)
//                .padding(.vertical, 10)
//
//            // Sign Out
//            MenuItem(icon: "arrow.backward", title: "Sign Out")
//
//            Spacer()
//        }
//        .padding()
//        .frame(maxWidth: 300, maxHeight: .infinity)
//        .background(Color.black)
//        .cornerRadius(30)
//        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
//        .edgesIgnoringSafeArea(.vertical)
//    }
//}
//
//// MARK: - Menu Item View
//struct MenuItem: View {
//    let icon: String
//    let title: String
//
//    var body: some View {
//        HStack(spacing: 15) {
//            Image(systemName: icon)
//                .foregroundColor(.white)
//                .font(.title3)
//            Text(title)
//                .foregroundColor(.white)
//                .font(.headline)
//        }
//    }
//}
//
//// MARK: - Preview
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


