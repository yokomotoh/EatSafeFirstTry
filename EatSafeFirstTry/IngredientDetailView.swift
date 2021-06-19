//
//  IngredientDetailView.swift
//  EatSafeFirstTry
//
//  Created by da  Saqueto on 11/5/20.
//

import SwiftUI

struct IngredientDetailView: View {
    
    @State var ingredient: Ingredient = pomme
        var body: some View {
            ScrollView{
                //            selectionView(itemName: "Strawberry", itemDatail: "Vitamin C")
            Image(ingredient.nomIngredient)// i gave it a default parametter
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .padding()
            Text(ingredient.nomIngredient)
                        
                .frame(width: 320, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .colorInvert()
                .padding()
                .background(Color.pink)
                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                
            Text(ingredient.detailIngredient)
                .frame(width: 320, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .colorInvert()
                .padding()
                .background(Color.purple)
                .cornerRadius(30)
            
/* /// added by Yoko and commented out by Yoko 12/11/2020
                .navigationBarItems(trailing:
                    
                        /* NavigationLink ****/
                        NavigationLink(
                        destination: ViewCreateNewRecette() ,
                        label: {
                            Image(systemName: "contextualmenu.and.cursorarrow")
                        })
                        //NavigationLink end
                )//NavigationBarItems
  */
            } //Scrollview end
        }
    }
      
       
// ========================HERE YOU CAN CHANGE INGREDIENT INFO============
           
              
//======================================================================= }
    

//===============================================================
struct IngredientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            IngredientDetailView()
            
        }
       
    }
}

