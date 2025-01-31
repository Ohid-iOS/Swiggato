////
////  HomeView.swift
////  FigmaToSwiftUI
////
////  Created by Tech Exactly iPhone 6 on 30/01/25.


//import SwiftUI
//
//// MARK: - Home View
//struct HomeView: View {
//    @State private var isMenuOpen: Bool = false
//    @State private var searchText: String = ""
//    @State private var selectedItems: Set<UUID> = [] // Track selected items
//    @State private var navigateToLogin: Bool = false // Control navigation
//
//    let foodItems = FoodData.foodItems
//
//    var filteredItems: [FoodModel] {
//        if searchText.isEmpty {
//            return foodItems
//        } else {
//            return foodItems.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
//        }
//    }
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                VStack {
//                    HStack {
//                        Button(action: {
//                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.2)) {
//                                isMenuOpen.toggle()
//                            }
//                        }) {
//                            Image(systemName: "line.horizontal.3")
//                                .font(.title)
//                                .foregroundColor(.black)
//                        }
//                        .padding(.top, 50)
//                        .padding(.bottom, 30)
//                        .padding(.leading, 20)
//
//
//                        Spacer()
//                    }
//
//                    // Search Bar
//
//                    ZStack(alignment: .trailing) {
//                        TextField("Search food...", text: $searchText)
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 1)
//
//                        Button(action: {
//                            searchText = ""
//                        }) {
//                            Image(systemName: "xmark.circle.fill")
//                                .foregroundColor(.gray)
//                        }
//                        .opacity(searchText.isEmpty ? 0 : 1)
//                        .padding()
//                    }
//                    .padding(.horizontal)
//
//
//                    // Food Grid View
//                    ScrollView {
//                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                            ForEach(filteredItems) { item in
//                                FoodItemView(food: item, isSelected: selectedItems.contains(item.id)) {
//                                    if selectedItems.contains(item.id) {
//                                        selectedItems.remove(item.id)
//                                    } else {
//                                        selectedItems.insert(item.id)
//                                    }
//                                }
//                            }
//                        }
//                        .padding()
//                    }
//                    Spacer()
//                }
//                .background(Color.gray.opacity(0.1))
//                .ignoresSafeArea()
//                .cornerRadius(isMenuOpen ? 20 : 0)
//                .offset(x: isMenuOpen ? 150 : 0, y: isMenuOpen ? 70 : 0)
//                .scaleEffect(isMenuOpen ? 0.9 : 1)
//                .rotationEffect(.degrees(isMenuOpen ? -10 : 0))
//                .shadow(color: isMenuOpen ? Color.black.opacity(0.3) : Color.clear, radius: 10, x: 5, y: 5)
//                .gesture(
//                    DragGesture()
//                        .onEnded { value in
//                            if value.translation.width < -100 {
//                                withAnimation {
//                                    isMenuOpen = false
//                                }
//                            }
//                        }
//                )
//
//                // Side Menu
//                if isMenuOpen {
//                    SideMenuView(isMenuOpen: $isMenuOpen, navigateToLogin: $navigateToLogin)
//                        .transition(.move(edge: .leading))
//                }
//
//                // Navigation to LoginView
//                NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
//                    EmptyView()
//                }
//            }
//            .ignoresSafeArea()
//        }
//        .navigationBarBackButtonHidden(true)
//        .edgesIgnoringSafeArea(.all)
//    }
//}





import SwiftUI

// MARK: - Home View
struct HomeView: View {
    @State private var isMenuOpen: Bool = false
    @State private var searchText: String = ""
    @State private var selectedItems: Set<UUID> = [] // Track selected items
    @State private var navigateToLogin: Bool = false // Control navigation
    @State private var showCart: Bool = false // Control navigation to AddItemView
    @State private var selectedFood: FoodModel? // Track selected food item for sheet
    
    let foodItems = FoodData.foodItems
    
    var filteredItems: [FoodModel] {
        if searchText.isEmpty {
            return foodItems
        } else {
            return foodItems.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var selectedFoodItems: [FoodModel] {
        foodItems.filter { selectedItems.contains($0.id) }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        // Menu Button
                        Button(action: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.2)) {
                                isMenuOpen.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 30)
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        // Cart Icon
                        Button(action: {
                            showCart = true
                        }) {
                            ZStack {
                                Image(systemName: "cart.fill")
                                    .font(.title)
                                    .foregroundColor(.black)
                                
                                if !selectedItems.isEmpty {
                                    Text("\(selectedItems.count)")
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.white)
                                        .frame(width: 20, height: 20)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 10, y: -10)
                                }
                            }
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 30)
                        .padding(.trailing, 20)
                    }
                    
                    // Search Bar
                    ZStack(alignment: .trailing) {
                        TextField("Search food...", text: $searchText)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                        
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .padding()
                    }
                    .padding(.horizontal)
                    
                    // Food Grid View
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(filteredItems) { item in
                                FoodItemView(food: item, isSelected: selectedItems.contains(item.id)) {
                                    if selectedItems.contains(item.id) {
                                        selectedItems.remove(item.id)
                                    } else {
                                        selectedItems.insert(item.id)
                                    }
                                }.onTapGesture {
                                    selectedFood = item
                                }
                            }
                        }
                        .padding()
                    }
                    Spacer()
                }
                .background(Color.gray.opacity(0.1))
                .ignoresSafeArea()
                .cornerRadius(isMenuOpen ? 20 : 0)
                .offset(x: isMenuOpen ? 150 : 0, y: isMenuOpen ? 70 : 0)
                .scaleEffect(isMenuOpen ? 0.9 : 1)
                .rotationEffect(.degrees(isMenuOpen ? -10 : 0))
                .shadow(color: isMenuOpen ? Color.black.opacity(0.3) : Color.clear, radius: 10, x: 5, y: 5)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < -100 {
                                withAnimation {
                                    isMenuOpen = false
                                }
                            }
                        }
                )
                
                // Side Menu
                if isMenuOpen {
                    SideMenuView(isMenuOpen: $isMenuOpen, navigateToLogin: $navigateToLogin)
                        .transition(.move(edge: .leading))
                }
                
                // Navigation to LoginView
                NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                    EmptyView()
                }
                
                // Navigation to AddItemView
                NavigationLink(destination: AddItemView(selectedItems: selectedFoodItems), isActive: $showCart) {
                    EmptyView()
                }
            }
            .ignoresSafeArea()
            .sheet(item: $selectedFood) { food in
                FoodDetailView(food: food)
                    .presentationDetents([.medium, .large])
            }
            
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
                            Text("Ohid iOS Dev")
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
                                    .bold()
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
