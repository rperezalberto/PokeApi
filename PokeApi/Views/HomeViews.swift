//
//  HomeViews.swift
//  PokeApi
//
//  Created by Robin Perez on 14/12/24.
//

import SwiftUI

struct HomeViews: View {
    @State var searchFind: String
    var body: some View {
        NavigationStack{
            ZStack{
                Color.backgroundRed
                    .ignoresSafeArea()
                VStack{
                    Input(textfind: $searchFind)
                    Spacer().frame(height: 10)
                    HomeData()
                    Spacer()
                }
            }
            .toolbar{
                Header()
            }
        }
    }
}

struct Header: ToolbarContent {
    var body: some ToolbarContent  {
        ToolbarItem(placement: .navigationBarLeading){
            HStack{
                Image("pokeballWhite")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                
                Text("Pokédex")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .black))
            }
        }
    }
}

struct Input: View {
    @Binding var textfind: String
    var body: some View {
        HStack{
            TextField(text: $textfind){
                Text("Buscar")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 14)
            .padding(.leading, 40)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    Spacer()
                }
                    .padding(.leading, 10)
            )
            
            Button{
                
            }label: {
                Circle()
                    .frame(width: 52, height: 52)
                    .foregroundColor(.white)
                    .overlay(
                        Image(systemName: "a.circle")
                            .font(.system(size: 20))
                            .foregroundColor(.backgroundRed)
                    )
            }
            
        }
        .padding(.horizontal, 10)
    }
}


struct HomeData: View {
    
    let itemPokemon : [PokemonModel] = [
        PokemonModel(name: "Aron", number: 304, image: "Aron"),
        PokemonModel(name: "Bulbasaur", number: 001, image: "Bulbasaur"),
        PokemonModel(name: "Charmander", number: 004, image: "Charmander"),
        PokemonModel(name: "Butterfree", number: 012, image: "Butterfree"),
    ]
    
    let colmn = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: colmn){
                ForEach(itemPokemon, id:\.number){ pokemon in
                    Button{
                        
                    }label: {
                            ZStack {
                                VStack{
                                    Spacer()
                                        Rectangle()
                                            .frame(height: 40)
                                            .cornerRadius(10)
                                            .foregroundColor(.gray.opacity(0.1))
                                }
                                VStack{
                                    HStack{
                                        Spacer()
                                        Text("#"+String(format: "%03d", pokemon.number))
                                            .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .light))
                                    }
                                    .padding([.vertical,.horizontal], 5)
                                    Spacer()
                                }
                                
                                Image(pokemon.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 72, height: 72)
                                VStack{
                                    Spacer()
                                    Text(pokemon.name)
                                    .foregroundColor(.black)
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 5)
                                }
                            }
                            .frame(maxWidth: .infinity, minHeight: 108)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .shadow(color: .black.opacity(0.5), radius: 5, x: 2, y: 2)
                    }
                    
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 10)
    }
}


struct HomeViews_Previews: PreviewProvider {
    static var previews: some View {
        HomeViews(searchFind: "")
    }
}
