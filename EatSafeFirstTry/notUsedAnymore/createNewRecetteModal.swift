//
//  createNewRecetteModal.swift
//  EatSafeFirstTry
//
//  Created by vincent schmitt on 09/11/2020.
//

import SwiftUI

/* actual user logged in */
//var actualUserLoggedIn: Profile = yokoM

/* today's date */
//var dateToday: DateFromatYoko = DateFormatYoko(jour: 08, mois: 11, anne: 2020)

private var intNumOfIngredients = 3

struct createNewRecetteModal: View {
/*
    @State private var newRecette: Recette = Recette(nomRecette: "", utilisateur: actualUserLoggedIn, dateRecette: dateToday, like: 0, commentaires: [], photoChallenge: "", ingredientsChallenger: [Ingredient(nomIngredient: "pomme", quantiteIngredient: 0, unitIngredient: "pommes", nutritionIngredient: "bonne pour sante")], recette: "")
    private var numOfIngredients :String = "\(intNumOfIngredients)"
    @State private var nameOfIngredientRecette = Array(repeating: "", count: intNumOfIngredients)
    @State private var quantiteOfIngredientRecette =
        Array(repeating: "", count: intNumOfIngredients)
    @State private var unitOfIngredientRecette =
        Array(repeating: "", count: intNumOfIngredients)
    @State private var nutritionOfIngredientRecette: String = "test"
    @State private var arrayOfIngredientRecette: [Ingredient] = []
    @State private var dayMonthYear: String = ""
    //    @State private var newIngredientRecette: Ingredient

    @State private var userNameString: String = ""
  */
    @Binding var showCreateNewRecetteModal: Bool
    
    var body: some View {
            
        // ScrollView{
        VStack{
            /* try comment out
            /* newRecette.utilisateur = actualUserLoggedIn*/
                  
            /* try comment out
            VStack(alignment: .leading){
                //Text("Your userName: \(newRecette.utilisateur.userName)")
                //simpleProfPhotoName(simpleProf: newRecette.utilisateur)
                        .padding(.all)
            }.padding(.horizontal, 15)
            */
            
            /* Enter userName */
            //LabelTextField(parametre: $newRecette.utilisateur.userName, label: "userName", placeHolder: "Enter your userName")
                        
            /* dateRecette = dateToday*/
            VStack(alignment: .leading){
                Text("Date of the recipe: \(newRecette.dateRecette.jour)/\(newRecette.dateRecette.mois)/ \(String(newRecette.dateRecette.anne))")
                        .padding(.all)
            }.padding(.horizontal, 15)
                        
            /* Enter the date of the recipe */
            //LabelTextField(parametre: $dayMonthYear, label: "Date of recette: day", placeHolder: "Enter the day of your recipe realised").keyboardType(.numberPad)
                /* Enter the name of the recipe */
                LabelTextField(parametre: $newRecette.nomRecette, label: "Name of your recipe", placeHolder: "Enter the name of your recipe")
                        
            /* Enter the picture of the recipe */
            LabelTextField(parametre: $newRecette.photoChallenge, label: "Picture of your recipe", placeHolder: "Enter the file name of the recipe's picture")
                        
            /* Enter the ingredients */
            Text("<your main \(numOfIngredients) ingredients>")
                        
            ForEach(0..<Int(numOfIngredients)!){ item in
                            
                Text("Ingredient No.\(item+1)")
                    
                LabelTextField(parametre: $nameOfIngredientRecette[item], label: "Ingredient", placeHolder: "Enter the name of ingredient")
                            
                LabelTextField(parametre: $quantiteOfIngredientRecette[item], label: "quantite", placeHolder: "Enter the quantite of ingredient").keyboardType(.numberPad)
                            
                LabelTextField(parametre: $unitOfIngredientRecette[item], label: "unit", placeHolder: "Enter the unit of ingredients")
                    
                Button(action: {
                    arrayOfIngredientRecette.append (Ingredient(nomIngredient: nameOfIngredientRecette[item], quantiteIngredient: Int(quantiteOfIngredientRecette[item]) ?? 0, unitIngredient: unitOfIngredientRecette[item], nutritionIngredient: nutritionOfIngredientRecette))
                                
                        newRecette.ingredientsChallenger =  arrayOfIngredientRecette
                        /*
                        nameOfIngredientRecette[item] = ""
                        quantiteOfIngredientRecette = ""
                        unitOfIngredientRecette = ""
                             */
                    }, label: {
                        Text("Save ingredient No.\(item+1)")
                    })  //Button end
                            
                }  // ForEach end
                        
                /* Enter the etail of recipe */
                LabelTextField(parametre: $newRecette.recette, label: "Recipe", placeHolder: "Write the detail of your recipe")
                        
                Button(action: {
                    listRecettes.insert(contentsOf: [newRecette], at: 0)
                    //existedListRecettes.append(newRecette)
                    }, label: {
                        Text("Create this recipe")
                    })
                        
                /* navigationLink starts */
                NavigationLink(
                    destination:
                        //Text(newRecette.nomRecette),
                        DetailChaqueRecette(unRecette: newRecette),
                    label: {Text("See the recipe you created")
                }) //NavigationLinkEnd
                        
                NavigationLink(
                    //destination: ViewCommunPostes(),
                    destination:
                        ViewCommunPostes(),
                        //commnunauteRecettes(actualListRecette: listRecettes),
                    label: {
                        VStack{
                        /*Button(action: {listRecettes.insert(sushi, at: 0)}, label: {Text(
                                "Add this recipe you created to the community"
                                )}
                            )*/ //Button end
                        Text("See the community")
                        }
                }) //NavigationLink end
            */ //try commentout end
            /* test modal */
            Text("Inside Modal View")
                .padding()
            Button("Dismiss") {self.showCreateNewRecetteModal.toggle()}
            /*test modal end*/
            } //vstack end
            //} // scrollview end

        }
}

struct createNewRecetteModal_Previews: PreviewProvider {
    static var previews: some View {
        createNewRecetteModal(showCreateNewRecetteModal: .constant(true))
    }
}
