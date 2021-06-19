//
//  addCreatedRecette.swift
//  EatSafeFirstTry
//
//  Created by vincent schmitt on 09/11/2020.
//

import SwiftUI

struct addCreatedRecette: View {
    @State var addlistRecettes: [Recette] = []
    var body: some View {
        NavigationView{
            NavigationLink(
                destination: ViewCommunPostes(),
                label: {Button(action: {addlistRecettes.insert(contentsOf:addlistRecettes, at: 0)}, label: {Text("Add new rescipe")})
                Text("See the listRecette")
            })
        }
        
    }
}

struct addCreatedRecette_Previews: PreviewProvider {
    static var previews: some View {
        addCreatedRecette()
    }
}
