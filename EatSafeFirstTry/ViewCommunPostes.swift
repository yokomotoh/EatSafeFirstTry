//
//  ViewCommunPostes.swift
//  EatSafeFirstTry
//
//  Created by vincent schmitt on 02/11/2020.
//

import SwiftUI

struct ViewCommunPostes: View {
    @State private var showModal = false
    //@State private var showCreateNewRecetteModal = false
    
    var body: some View {

        NavigationView{

            List(listRecettes) { eachChallenger in
                showUnRecette(unChallenger: eachChallenger)
            }
            //.navigationTitle("Communaute")
            .navigationTitle("Recettes")
            /* comment out by yoko 13/11/20
            .navigationBarItems(trailing:
                /* createNewRecette in Modal
                Button("Show Modal"){
                        self.showCreateNewRecetteModal.toggle()
                    }.sheet(isPresented: $showCreateNewRecetteModal) {
                            createNewRecetteModal(showCreateNewRecetteModal: self.$showCreateNewRecetteModal)
                        }
                    */
                    /* NavigationLink ****/
                    NavigationLink(
                    destination: ViewCreateNewRecette(),
                    label: {
                        Image(systemName: "contextualmenu.and.cursorarrow")
                    })
                    //NavigationLink end
            ) */  //NavigationBarItems
            
            .navigationBarItems(
                leading:
                HStack{
                    NavigationLink(
                        destination: ViewCreateNewRecette(),
                        label: {
                            Image(systemName: "contextualmenu.and.cursorarrow")
                        }).foregroundColor(Color.black)
                },
                trailing:
                Button(action: {
                    self.showModal = true
                    },
                    label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.black)
                    }).sheet(isPresented: self.$showModal)
                    {
                        CommunPostesSearchBarModalView()
                        }
                    
        ) // NavigationBarItems end

        }// NavigationView end
    }
}

struct CommunPostes_Previews: PreviewProvider {
    static var previews: some View {
        ViewCommunPostes()
    }
}

struct challengersSimpleProf: View {
    var simpleProfOfChallenger: Recette
    var body: some View {
        simpleProfPhotoName(simpleProf: simpleProfOfChallenger.utilisateur)
        /* NavigationLink(
            destination: ViewProfile(),
            label: {
                HStack {
                    Image(simpleProfOfChallenger.utilisateur.photoProfile)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text(simpleProfOfChallenger.utilisateur.userName)
                }
                //.frame(width: 300, height: 50, alignment: .leading)
            }) *///NavigationLink end
    }
}

struct simpleProfPhotoName: View {
    var simpleProf: Profile
    var body: some View {
        
        NavigationLink(
            destination: ViewProfileYoko(profileToView: simpleProf),
            label: {
                HStack {
                    Image(simpleProf.photoProfile).resizable().scaledToFill().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text(simpleProf.userName)
                }
                //.frame(width: 300, height: 50, alignment: .leading)
            })


    }
}

struct showUnRecette: View {
    @State var unChallenger : Recette
    var body: some View {
        VStack(alignment: .leading) {
            
            //challengersSimpleProf(simpleProfOfChallenger:  unChallenger)
            HStack {
                Image(unChallenger.utilisateur.photoProfile).resizable().scaledToFill().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text(unChallenger.utilisateur.userName)
            }
            //Text(unChallenger.utilisateur.userName).frame(height: 50, alignment: .leading)
            
            NavigationLink(
                destination: DetailChaqueRecette(unRecette: unChallenger),
                label: {
                    VStack {
                        Text(unChallenger.nomRecette)
                    //.frame(height: 50, alignment: .leading)
                        /* put image outide NavLink
                        Image(unChallenger.photoChallenge)
                            .resizable()
                            .scaledToFill()
                            //.frame(width: 300, height: 100, alignment: .leading)
                         */ //end of Image
                    }
                }) //NavigationLink end
            
            Image(unChallenger.photoChallenge)
                .resizable()
                .scaledToFill()
                //.frame(width: 300, height: 100, alignment: .leading)
            
            HStack {
                HStack {
                    
                    Image(systemName: "suit.heart.fill").foregroundColor(Color.red)
                    
                    Text("\(unChallenger.like)")
                    
                    Image(systemName: "text.bubble").foregroundColor(Color.green)
                    
                    Text(" \(unChallenger.commentaires.count)")
                }
                //LikeNumberView(challengerLikeNumber: $unChallenger.like)
                //CommentNumberView(challengerCommentNumber: unChallenger.commentaires.count)
            }
        }
    }
}

struct LikeNumberView: View {
    @Binding var challengerLikeNumber : Int
    var body: some View {
        HStack {
            Text("\(challengerLikeNumber)")
            
            Button(action: {
                    challengerLikeNumber += 1}, label: {
                    //Image(systemName: "hand.thumbsup")
                        Image(systemName: "suit.heart.fill").foregroundColor(Color.red)
            })
            
            //Image(systemName: "text.bubble").foregroundColor(Color.green)

            //Text(" \(unChallenger.commentaires.count)")
        }
    }
}

struct CommentNumberView: View {
    var challengerCommentNumber : Int
    var body: some View {
        HStack {
            Text(" \(challengerCommentNumber)")
            
            Button(action: {}, label: {
                Image(systemName: "text.bubble")
                    
                    .foregroundColor(Color.green)

            })
            
        }
    }
}
