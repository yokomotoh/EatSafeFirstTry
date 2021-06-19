//
//  MainView.swift
//  EatSafeFirstTry
//
//  Created by yoko on 05/11/2020.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            
            ListChallengesJours()
                .tabItem { Image(systemName: "book")
                    Text("Challenges")
                }
            //commnunauteRecettes(actualListRecette: listRecettes)
            ViewCommunPostes()
                .tabItem { Image(systemName: "house")
                    Text("Comunauté")
                }
            
            NavigationView{
                ViewProfileYoko(profileToView: actualUserLoggedIn)
                    .navigationTitle("Your profile")
            }
                .tabItem { Image(systemName: "person")
                    Text("Profil")
                }
        
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
