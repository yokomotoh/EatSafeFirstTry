//
//  ChallengeDetailView.swift
//  EatSafeFirstTry
//
//  Created by da silva saqueto heitor on 11/9/20.
//

import SwiftUI

struct ChallengeDetailView: View {
    @State  var challenge = fruitRouge

    var body: some View {
//      NavigationView{
        ScrollView{
        VStack{
            Image(challenge.imageDuChallenge)
                .resizable()
                .scaledToFill()
                .frame(width:380, height:200)
                .cornerRadius(10)

            //Spacer()
            //Spacer()
            Text (challenge.nomDuChallenge)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .frame(width: 380.0, height:50.0)
                
            Text("ingrédients proposés :")
            
            HStack{
            ForEach(challenge.listIngredients){ monIngredient in
                NavigationLink(
                    destination: IngredientDetailView(ingredient: monIngredient),
                    label: {
                        ingredientCellView(ingredient: monIngredient.nomIngredient)
                })
            }
            }
           
            Text("Recette faites du Challenge:   ")

            DetailChallengeListRecettes(challenge: challenge)
                
/*  to DetailChallengeListRecettes.swift by Yoko 12/11/2020*/

        } //Vstack end
        } //ScrollView end
        // create recette icon added by Yoko 12/11/2020
        .navigationBarItems(trailing:
            
                /* NavigationLink ****/
                NavigationLink(
                destination: ViewCreateNewRecette() ,
                label: {
                    Image(systemName: "contextualmenu.and.cursorarrow")
                })
                //NavigationLink end
        )//NavigationBarItems
    //  } //NavigationView end
    }
}



struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView()
            
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}
    



struct recetteFaites: View {
    
    var imageRecetteFaites:String = "banana"
    
    var body: some View {
        
        HStack {
            Image(imageRecetteFaites)
                
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(20)
                .padding(5)
        }
    }
}

struct ingredientCellView: View {
    var ingredient: String
    var body: some View {
        
        HStack {
            
            Image(ingredient)
                .resizable()
                .scaledToFit()
                .frame(width: 40.0, height: 40.0,alignment:.leading)
                .padding(0)
        }
    }
}


