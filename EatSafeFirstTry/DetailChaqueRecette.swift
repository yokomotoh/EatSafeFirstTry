//
//  DetailChaqueRecette.swift
//  EatSafeFirstTry
//
//  Created by yoko on 04/11/2020.
//

import SwiftUI

struct DetailChaqueRecette: View {
    @State var unRecette: Recette = tarteTatin
    @State private var showModal = false
    //@State private var testLike : Int = 0
    //@State private var stackChallengeDeJour: [String] = []
    
    var body: some View {
        //NavigationView{
            List() {
                Section(){
                    //Text(eachChallenger.nomChallenger)
                    showUnChallengerOnlyPhoto(eachChallenger: unRecette)
                    //showUnChallenger(unChallenger: eachChallenger)
                    //LikeCommentView(unChallenger: eachChallenger)
                    HStack {
                        /*
                        Button(action: {
                            testLike += 1}, label: {
                            Text("\(testLike)")
                            Text("\(unRecette.like)")
                        })
                        */
                        LikeNumberView(challengerLikeNumber: $unRecette.like)
                        
                        CommentNumberView(challengerCommentNumber: unRecette.commentaires.count)
                    }
                    /*
                    HStack {
                        Button(action: {
                                unRecette.like += 1}, label: {
                                Image(systemName: "suit.heart.fill")
                            .font(.footnote)
                            .foregroundColor(Color.red)
                        })
                        
                        Text("\(unRecette.like)")
                        //Image(systemName: "text.bubble")
                        //Text(" \(unRecette.commentaires.count)")
                    }
                    */
                }
                Section(header: Text("Profile de Challenger")){
                    //Text(tarteTatin.nomChallenger)
                    challengersSimpleProf(simpleProfOfChallenger: unRecette)
                }
                Section(header: Text("Ingredients")){
                    ForEach(unRecette.ingredientsChallenger){eachIngredient in
                        HStack {
                            Text(eachIngredient.nomIngredient)
                            Text("\(eachIngredient.quantiteIngredient)")
                            Text(eachIngredient.unitIngredient)
                        }
                    }
                }
                
                Section(header: Text("Recette")){
                    Text(unRecette.recette)
                }
                
                Section(header: Text("Challenge")){
                    
                ForEach(tableauChallengeDeJour) { unChallengeDeJour in
                    ForEach(unChallengeDeJour.listIngredients){ unIngredientChallengeDeJour in
                        if (unRecette.ingredientsChallenger.first(where: {($0.nomIngredient == unIngredientChallengeDeJour.nomIngredient) == true}) != nil)
                            {Text(unChallengeDeJour.nomDuChallenge)}
                    
 /*
                        ForEach(unRecette.ingredientsChallenger){ unIngredientRecette in
                            if (
                        unIngredientRecette.nomIngredient == unIngredientChallengeDeJour.nomIngredient)&&(stackChallengeDeJour.contains(unChallengeDeJour.nomDuChallenge) == false)
                {
                    //Text(unChallengeDeJour.nomDuChallenge)
                     /*
                                if stackChallengeDeJour.contains(unChallengeDeJour.nomDuChallenge) == false
                                {stackChallengeDeJour.append(unChallengeDeJour.nomDuChallenge)
 */
                                stackChallengeDeJour.append(unChallengeDeJour.nomDuChallenge)
                                Text(unChallengeDeJour.nomDuChallenge)
/*
                            }
*/
 }
*/
 //ForEach(stackChallengeDeJour){ item in
                            //    Text(item)}
                //}
                    }}}
                
                
                Section(header: Text("Comment")){
                    ForEach(unRecette.commentaires) {eachCommentaire in
                        HStack{
                            //challengersSimpleProf(simpleProfOfChallenger: eachCommentaire.profilCommentaire )
                            Text("\(eachCommentaire.commentaire)")
                            Text("(\(eachCommentaire.dateCommentaire.jour)/\(eachCommentaire.dateCommentaire.mois)/ \(String(eachCommentaire.dateCommentaire.anne)))")
                            simpleProfPhotoName(simpleProf: eachCommentaire.profileCommentaire)
                        }
                        //Text("\(eachCommentaire.commentaire) de \(eachCommentaire.profileCommentaire.prenom) le \(eachCommentaire.dateCommentaire.jour)/\(eachCommentaire.dateCommentaire.mois)/ \(String(eachCommentaire.dateCommentaire.anne))")
                    }
                    
                    Button(action: {
                        self.showModal = true
                    }, label: {
                        Image(systemName: "plus.bubble")
                            .foregroundColor(Color.green)
                        
                        //Text("Add your comment!").frame(width: 170.0, height: 24.0).background(Color.blue).cornerRadius(10).foregroundColor(Color.white)
                    }).sheet(isPresented: self.$showModal) {
                        ModalViewAddComment(unRecette: unRecette)
                    }
                }
                Section(header: Text("Tous les challenges fait par \(unRecette.utilisateur.prenom)")){
                    ForEach(listRecettes) {undelistChallenge in
                        if (unRecette.utilisateur.userName == undelistChallenge.utilisateur.userName) {
                            NavigationLink(
                                destination: DetailChaqueRecette(unRecette: undelistChallenge),
                                label: {
                                    showUnChallengerOnlyPhoto(eachChallenger: undelistChallenge)
                            })
                            
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            //.navigationTitle(unRecette.nomRecette)
            .navigationBarTitle(unRecette.nomRecette)
        //} //NavigationView End
    }
}

struct EachPosteChallenge_Previews: PreviewProvider {
    static var previews: some View {
        DetailChaqueRecette()
    }
}

struct showUnChallengerOnlyPhoto: View {
    var eachChallenger: Recette
    var body: some View {
        Image(eachChallenger.photoChallenge)
            .resizable()
            .scaledToFill()
            //.frame(width: 300, height: 100, alignment: .leading)

        //showUnChallenger(unChallenger: eachChallenger)
    }
}

struct ModalViewAddComment: View {
    @State var unRecette: Recette = tarteTatin
    @Environment(\.presentationMode) private var presentationMode
    @State private var newComment: String = ""
    var body: some View {
        ZStack {
            VStack {
                
                ScrollView{
                VStack{
                    /* newRecette.utilisateur = actualUserLoggedIn*/
                        
                    VStack(alignment: .leading){
                            //Text("Your userName: \(newRecette.utilisateur.userName)")
                            simpleProfPhotoName(simpleProf: actualUserLoggedIn)
                            .padding(.all)
                    }.padding(.horizontal, 15)
                            
                    
                    VStack(alignment: .leading){
                        Text("Date of comment: \(dateToday.jour)/\(dateToday.mois)/ \(String(dateToday.anne))")
                            .padding(.all)
                    }.padding(.horizontal, 15)
                            
                    /* Enter the date of the recipe */
                    //LabelTextField(parametre: $dayMonthYear, label: "Date of recette: day", placeHolder: "Enter the day of your recipe realised").keyboardType(.numberPad)
                    /* Enter the comment */
                    LabelTextField(parametre: $newComment, label: "Your comment", placeHolder: "Write your comment here")
                    
                } //vstack end
                } // scrollview end
                
                //Text("Comment here").foregroundColor(Color.black)
                Button(action: {
                    unRecette.commentaires.append(Commentaire(profileCommentaire: actualUserLoggedIn, dateCommentaire: dateToday, commentaire: newComment) )
                    
                    listRecettes.append(unRecette)
                    
                }, label: {
                    Text("Save the commentaire")
                })
                
                Button(action: {
                    
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Exit")
                        //.foregroundColor(Color.black)
                }
                /* navigationLink starts
                NavigationLink(
                    destination:
                        //Text(unRecette.nomRecette),
                        DetailChaqueRecette(unRecette: unRecette),
                    label: {Text("See the recipe you created")
                }) */ //NavigationLinkEnd
            }
        }
    }
}
