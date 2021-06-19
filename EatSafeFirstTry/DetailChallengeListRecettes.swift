//
//  DetailChallengeListRecettes.swift
//  EatSafeFirstTry
//
//  Created by vincent schmitt on 12/11/2020.
//

import SwiftUI

// part of DetailChallengeYoko.swift

struct DetailChallengeListRecettes: View {
    var challenge = legumeVert
    var body: some View {
//        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
                      //threeColumnGrid
                      , spacing: 0) {
                
/* yoko created 12/11/2020 to select depending challenges */
            ForEach(listRecettes) { item in
                ForEach(item.ingredientsChallenger){ ing in
                    ForEach(challenge.listIngredients){ nomIng in
                        if
                            ing.nomIngredient == nomIng.nomIngredient
                            //challenge.listIngredients.contains(ing .nomIngredient)
                        {
                            VStack {
                                NavigationLink(
                                    destination: DetailChaqueRecette(unRecette: item),
                                    label: {
                                        VStack {
                                            Image(item.photoChallenge)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 110, height: 110)
                                                .cornerRadius(20)
                                                .padding()
                                            //.navigationBarTitle(displayMode: .automatic)
                                        }
                                    })
                                
                                HStack {
                                    Text("\(item.like)")
                                        .font(.footnote)
                                    
                                    Image(systemName: "suit.heart.fill")
                                        .font(.footnote)
                                        .foregroundColor(Color.red)
                                    
                                    Text("\(item.commentaires.count)")
                                        .font(.footnote)
                                    
                                    Image(systemName: "text.bubble")
                                        .font(.footnote)
                                        .foregroundColor(Color.green)
                                } //HStack end
                            } //VStack end
                        }//if end
                    }//ForEach end
                }//ForEach end
            } //ForEach end
/* yoko 12/11/20 end*/
/*
 ForEach(listRecettes) { item in
             VStack {
                 NavigationLink(
                     destination: DetailChaqueRecette(unRecette: item),
                     label: {
                         VStack {
                             Image(item.photoChallenge)
                                 .resizable()
                                 .scaledToFill()
                                 .frame(width: 120, height: 120)
                                 .cornerRadius(20)
                                 .padding()
                             //.navigationBarTitle(displayMode: .automatic)
                         }
                     })
                 
                 HStack {
                     Text("\(item.like)")
                         .font(.footnote)
                     
                     Image(systemName: "suit.heart.fill")
                         .font(.footnote)
                         .foregroundColor(Color.red)
                     
                     Text("\(item.commentaires.count)")
                         .font(.footnote)
                     
                     Image(systemName: "text.bubble")
                         .font(.footnote)
                         .foregroundColor(Color.green)
                 } //HStack end
             } //VStack end
     } */ //ForEach end
                //.navigationBarTitleDisplayMode(.automatic)
            } //LazyVGrid end
        //} //Scrollview end
    }
}


struct DetailChallengeListRecettes_Previews: PreviewProvider {
    static var previews: some View {
        DetailChallengeListRecettes()
    }
}
