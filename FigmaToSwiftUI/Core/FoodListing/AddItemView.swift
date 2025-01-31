////
////  AddItemView.swift
////  FigmaToSwiftUI
////
////  Created by Tech Exactly iPhone 6 on 31/01/25.
///
///
///

import SwiftUI

struct AddItemView: View {
    var selectedItems: [FoodModel]
    
    @Environment(\.dismiss) var GoBack
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    Button {
                        GoBack()
                        
                    } label: {
                        Image(systemName: "arrow.backward")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    }
                    Spacer()
                    
                }.padding(.leading, 20)
                 
                
                
                List {
                    ForEach(selectedItems) { item in
                        HStack {
                            Image(item.image) // Ensure image exists in assets
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                
                                Text(item.price)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                        }
                        .padding(.vertical, 5)
                    }
                }
                
            }
        }.navigationBarBackButtonHidden(true)
            .navigationTitle("Carts")
    }
}
// MARK: - Preview with Mock Data
struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        let mockItems: [FoodModel] = [
            FoodModel( title: "Pizza", image: "pizza", price: "9.99"),
            FoodModel( title: "Burger", image: "burger", price: "5.99")
        ]
        
        return AddItemView(selectedItems: mockItems)
    }
}








       // NavigationStack {
       //            HStack(){
       //                Button {
       //                    GoBack()
       //                } label: {
       //                    Image(systemName: "arrow.backward")
       //                        .font(.title2)
       //                        .foregroundColor(.black)
       //                        .padding()
       //                        .background(Color.white)
       //                        .clipShape(Circle())
       //                        .shadow(radius: 3)
       //                }
       //                Spacer()
       //            }.padding(.leading, 20)
       //                .padding(.top, 50)
       //
       //
       //        }
       //        .navigationTitle("Cart")
       //    }
       //}
