//
//  commnunauteRecettes.swift
//  EatSafeFirstTry
//
//  Created by vincent schmitt on 09/11/2020.
//

import SwiftUI

struct commnunauteRecettes: View {
    @State var actualListRecette: [Recette] = listRecettes
    var body: some View {
        NavigationView{

            /* test w/t extracted subview
            List(listRecettes) {
                eachChallenger in
                
                VStack {
                    challengersSimpleProf(simpleProfOfChallenger:  eachChallenger)
                    //Text(unChallenger.nomChallenger).frame(height: 50, alignment: .leading)
                    NavigationLink(
                        destination: DetailChaqueRecette(eachChallenger: eachChallenger),
                        label: {
                            VStack {
                                Text(eachChallenger.nomRecette)
                            //.frame(height: 50, alignment: .leading)
                
                            }
                        })
                    Image(eachChallenger.photoChallenge)
                        .resizable()
                        .scaledToFill()
                        //.frame(width: 300, height: 100, alignment: .leading)
                    HStack {
                        //LikeNumberView(challengerLikeNumber: $eachChallenger.like)
                        //(challengerLikeNumber: $eachChallenger.like)
                        CommentNumberView(challengerCommentNumber: eachChallenger.commentaires.count)
                    }
                }
            }
            */
            /* version roop in List */
            List(listRecettes) { eachChallenger in
                    showUnRecette(unChallenger: eachChallenger)
            }
            
            /* old version ForEach in List
            List(){
                ForEach(listChallengers) {eachChallenger in
                showUnChallenger(unChallenger: eachChallenger)
                    }
            }
            */
            .navigationTitle("Communauté recettes")
            .navigationBarItems(trailing:
                
            NavigationLink(
                destination: ViewCreateNewRecette(),
                label: {
                    Image(systemName: "contextualmenu.and.cursorarrow")
                })
            )
        }
    }
}


struct commnunauteRecettes_Previews: PreviewProvider {
    static var previews: some View {
        commnunauteRecettes()
    }
}
