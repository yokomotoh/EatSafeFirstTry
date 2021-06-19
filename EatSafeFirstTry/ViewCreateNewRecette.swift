//
//  ViewCreateNewRecette.swift
//  EatSafeFirstTry
//
//  Created by vincent schmitt on 09/11/2020.
//

import SwiftUI



private var intNumOfIngredients = 3

struct ViewCreateNewRecette: View {
    //@Binding var showCreateNewRecetteModal: Bool
    
    @State private var newRecette: Recette = Recette(nomRecette: "", utilisateur: actualUserLoggedIn, dateRecette: dateToday, like: 0, commentaires: [], photoChallenge: "", ingredientsChallenger: [Ingredient(nomIngredient: "", quantiteIngredient: 0, unitIngredient: "", nutritionIngredient: "")], recette: "")
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
    
    var body: some View {
            
        //NavigationView{
        ScrollView{
        VStack{
            /* newRecette.utilisateur = actualUserLoggedIn*/
                
            VStack(alignment: .leading){
                    //Text("Your userName: \(newRecette.utilisateur.userName)")
                    simpleProfPhotoName(simpleProf: newRecette.utilisateur)
                    .padding(.all)
            }.padding(.horizontal, 15)
                    
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
            LabelTextField(parametre: $newRecette.photoChallenge, label: "Picture of your recipe", placeHolder: "Enter file name of picture of recipe")
                    
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

        } //vstack end
        } // scrollview end
        .navigationTitle("New recipe")

        //} // natigationView end
        
    }
}

struct createNewRecette_Previews: PreviewProvider {
    static var previews: some View {
        ViewCreateNewRecette()
    }
}

struct LabelTextField: View {
    @Binding var parametre: String
    var label: String
    var placeHolder: String
    var body: some View {
        VStack(alignment: .leading){
            //Text("Hello, \(parametre)!")
            Text(label)
            TextField(placeHolder, text:$parametre)
                .padding(.all)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
        }
        .padding(.horizontal, 15)
    }
}
