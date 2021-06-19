//
//  createRecette.swift
//  EatSafeFirstTry
//
//  Created by vincent schmitt on 06/11/2020.
//

import SwiftUI

struct createRecette: View {
    //@State var name: String = ""
    //@State var existedListRecettes: [Recette] = []
    //@State var newRecette: Recette = Recette(nomRecette: "", utilisateur: Profile(userName: "", nom: "", prenom: "", Ne: Date(jour: 01, mois: 01, anne: 1900), email: "", photoProfile: ""), dateRecette: Date(jour: 01, mois: 01, anne: 2020), like: 0, commentaires: [], photoChallenge: "", ingredientsChallenger: [Ingredient(nomIngredient: "pomme", quantiteIngredient: 0, unitIngredient: "pommes", nutritionIngredient: "bonne pour sante")], recette: "")
    @State private var newRecette: Recette = Recette(nomRecette: "", utilisateur: actualUserLoggedIn, dateRecette: dateToday, like: 0, commentaires: [], photoChallenge: "", ingredientsChallenger: [Ingredient(nomIngredient: "pomme", quantiteIngredient: 0, unitIngredient: "pommes", nutritionIngredient: "bonne pour sante")], recette: "")
    @State private var nameOfIngredientRecette: String = ""
    @State private var quantiteOfIngredientRecette:
        String = ""
    @State private var unitOfIngredientRecette: String = ""
    @State private var nutritionOfIngredientRecette: String = "test"
    @State private var arrayOfIngredientRecette: [Ingredient] = []
    @State private var dayMonthYear: String = ""
//    @State private var newIngredientRecette: Ingredient
    private var numOfIngredients :String = "3"
    @State private var userNameString: String = ""
    var body: some View {
        
        NavigationView{
            ScrollView{
            VStack{
            /* newRecette.utilisateur = actualUserLoggedIn*/
            
                VStack{
                    Text("Your userName: \(newRecette.utilisateur.userName)")
                //simpleProfPhotoName(simpleProf: newRecette.utilisateur)
                }
                
                /* Enter userName */
                //LabelTextField(parametre: $newRecette.utilisateur.userName, label: "userName", placeHolder: "Enter your userName")
                
                /* dateRecette = dateToday*/
                VStack(alignment: .leading){
                    Text("Date: \(newRecette.dateRecette.jour)/\(newRecette.dateRecette.mois)/ \(String(newRecette.dateRecette.anne))")
                }
                //.padding(.horizontal, 15)
                
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
                    LabelTextField(parametre: $nameOfIngredientRecette, label: "Ingredient", placeHolder: "Enter the name of ingredient")
                    
                    LabelTextField(parametre: $quantiteOfIngredientRecette, label: "quantite", placeHolder: "Enter the quantite of ingredient").keyboardType(.numberPad)
                    
                    LabelTextField(parametre: $unitOfIngredientRecette, label: "unit", placeHolder: "Enter the unit of ingredients")
                
                    Button(action: {
                        arrayOfIngredientRecette.append (Ingredient(nomIngredient: nameOfIngredientRecette, quantiteIngredient: Int(quantiteOfIngredientRecette) ?? 0, unitIngredient: unitOfIngredientRecette, nutritionIngredient: nutritionOfIngredientRecette))
                        
                        newRecette.ingredientsChallenger =  arrayOfIngredientRecette
                        
                        nameOfIngredientRecette = ""
                        quantiteOfIngredientRecette = ""
                        unitOfIngredientRecette = ""
                        
                    }, label: {
                    Text("Save ingredient No.\(item+1)")
                    }) //Button end
                    
                }  // ForEach end
                
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
                    })
                 //NavigationLinkEnd
                
                NavigationLink(
                        destination: ViewCommunPostes(),
                        //destination: commnunauteRecettes(actualListRecette: listRecettes),
                    label: {
                    Button(action: {listRecettes.insert(newRecette, at: 0)}, label: {Text("Add new rescipe")})
                    
                        Text("See the listRecette")
                    })

            } //vstack end
            } // scrollview end
        .navigationTitle("Create your recipe!")
        } // natigationView end
    }
}


struct createRecette_Previews: PreviewProvider {
    static var previews: some View {
        createRecette()
    }
}
/* declared in CreateNewRecette.swift
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
*/

/*
struct LabelIntegerField: View {
    @Binding var parametreInteger: Int
    private var paramet: String
    var label: String
    var placeHolder: String
    var body: some View {
        VStack(alignment: .leading){
            //Text("Hello, \(name)!")
            Text(label)
            TextField(placeHolder, text: paramet)
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
            //$parametreInteger = Int(paramet) ?? 0
        }
        .padding(.horizontal, 15)
        
    }
}
 */
