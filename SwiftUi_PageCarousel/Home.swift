//
//  Home.swift
//  SwiftUi_PageCarousel
//
//  Created by Jimmy Leu on 2020/6/13.
//  Copyright © 2020 Jimmy Leu. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var menu : Int = 0
    @State var page : Int = 0
    var body: some View {
        ZStack{
            Color("Color").edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    HStack {
                        
                        Button(action: {
                            
                        }) {
                            Image("Menu")
                            .renderingMode(.original)
                            .padding()
                            
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        Spacer()
                        
                        Image("pic")
                        .resizable()
                        .frame(width:40, height: 40)
                        .cornerRadius(12)
                        
                    }
                    .padding(.horizontal)
                    Text("Food Items")
                    .font(.system(size:22))
                    
                }
                HStack(spacing: 15){
                    Button(action: {
                        self.menu = 0
                    }) {
                        
                        Text("Chinese")
                            .foregroundColor(self.menu == 0 ? .white : .black )
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                    }
                    .background(self.menu == 0 ? Color.black : Color.white)
                    .clipShape(Capsule())
                    
                    Button(action: {
                        self.menu = 1
                    }) {
                        
                        Text("Italian")
                            .foregroundColor(self.menu == 1 ? .white : .black )
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                    }
                    .background(self.menu == 1 ? Color.black : Color.white)
                    .clipShape(Capsule())
                    
                    Button(action: {
                        self.menu = 2
                    }) {
                        
                        Text("Mexican")
                            .foregroundColor(self.menu == 2 ? .white : .black )
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                    }
                    .background(self.menu == 2 ? Color.black : Color.white)
                    .clipShape(Capsule())
                }
                .padding(.top, 30)
                
                GeometryReader { g in
                    
                    Carsousel(width: UIScreen.main.bounds.width, page: self.$page, height: g.frame(in: .global).height)
                }
                PageControl(page: self.$page)
                    .padding(.top, 20)
                
                Spacer()
            }.padding(.vertical)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct List: View {
    
    @Binding var page: Int
    
    var body: some View {
        HStack(spacing: 0 ){
            ForEach(data) {  i in
                
                Card(page: self.$page, width: UIScreen.main.bounds.size.width, data: i)
                
            }
        }
    }
}


struct Card: View {
    
    @Binding var page: Int
    var width: CGFloat
    var data : Type
    
    var body: some View{
        
        VStack{
            VStack {
                Text(self.data.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text(self.data.cName)
                    .foregroundColor(.gray)
                    .padding(.vertical)
                
                Image(self.data.image)
                .resizable()
                    .frame(width: self.width - (self.page == self.data.id ? 100: 100)
                        , height: (self.page == self.data.id ? 250: 200))
                .cornerRadius(20)
                
                Text(self.data.price)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top,20)
                
                Button(action: {
                    
                }) {
                    Text("Buy")
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                }
                .background(Color("Color"))
                .clipShape(Capsule())
                .padding(.top, 20)
                
                Spacer(minLength: 0)
                // For filling empty space
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 25)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.top, 25)
            .padding(.top, self.page == data.id ? 0 : 25)
            .padding(.horizontal, self.page == data.id ? 0 : 25)
        }
        .frame(width: self.width)
        .animation(.default)
    }
}

struct Type: Identifiable  {
    var id: Int
    var name: String
    var cName: String
    var price : String
    var image: String
}

let data = [

    Type(id: 0, name: "Soba Noodles", cName: "Chinese", price: "$25",image: "soba"),
    
    Type(id: 1, name: "Rice Stick Noodles", cName: "Italian", price: "$18",image: "rice"),
    
    Type(id: 2, name: "Hokkien Noodles", cName: "Chinese", price: "$55",image: "hokkien"),
    
    Type(id: 3, name: "Mung Bean Noodles", cName: "Chinese", price: "$29",image: "bean"),
    
    Type(id: 4, name: "Udon Noodles", cName: "Chinese", price: "$15",image: "udon")
]
