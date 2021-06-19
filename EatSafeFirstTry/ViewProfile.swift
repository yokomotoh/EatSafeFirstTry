//
//  ViewProfile.swift
//  EatSafeFirstTry
//


import SwiftUI

struct ViewProfile: View {
    
    var body: some View {
        
       
        NavigationView {
            VStack {
                
                Profile1()
                
                sousProfile()
                Divider()
                Description()
                Divider()
                Recettes()
            }
            .padding()
        }
            
            
            
    
    }
}
// DON'T TOUCH -----------------------
struct ViewProfile_Previews: PreviewProvider {
    static var previews: some View {
        ViewProfile()
        
    }
}
// ----------------------
struct Profile1: View {
    var post: Int = listRecettes.count
    var abonne: Int = 56
    var body: some View {
        
        HStack {
            
            VStack {
                
                HStack {
                    
                    Image("User")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 50)
                        .clipShape(Circle())
                    
                }
                
            }
            .padding(.leading, -20.0/*@END_MENU_TOKEN@*/)
            
            
            Spacer()
            Spacer()
            Text("\(post)")
            
            
            Text("Post")
            
            Spacer()
            
            Text("\(abonne)")
            
            Text("Abonné")
            
        }
        .padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        
        
        Spacer()
        Spacer()
    }
}
struct sousProfile: View {
    @State private var showModal = false
    @Environment(\.presentationMode) var prensatationMode
    var nom: String = "Gates"
    var prenom: String = "Bill"
    @State private var modif: String = "Modifier profil"
    var body: some View {
        
        
        HStack {
            Spacer()
            Spacer()
            Spacer()
            HStack {
                Text(nom)
                    .fontWeight(.bold)
                
                
                
                Text(prenom)
                    .fontWeight(.bold)
                    .padding(.trailing, 27.0)
                
            }
            
            Spacer()
            Spacer()
            
            Button(action: {
                self.showModal = true
            }, label: {
                Text(modif)
                    .frame(width: 170.0, height: 24.0)
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
            }).sheet(isPresented: self.$showModal) {
                ModalView()
            }
            Spacer()
            Spacer()
        }
        .padding(-30.0/*@END_MENU_TOKEN@*/)
    }
}
struct Description: View {
    var description: String = "Apprenti cuisinier 👨🏻‍🍳"
    var body: some View {
        VStack {
            
            HStack {
                
                Text(description)
                Spacer()
                
            }
            .padding(.bottom, 30.0/*@END_MENU_TOKEN@*/)
            Divider()
            
            HStack {
                
                Text("Recettes réalisés :")
                Spacer()
                
            }
        }
    }
}
struct ModalView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                
                Text("À developper")
                    .foregroundColor(Color.black)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Exit")
                        .foregroundColor(Color.black)
                    
                }
            }
        }
    }
}
struct Recettes: View {
    @State var voirRecette: Recette = tarteTatin
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var fandbFoodies: [Recette] = [tarteTatin, tarteCitronMeringuee, parisBrest, saladLentilles, saladeDeFruit, millefeuille, fondantChocolat]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: threeColumnGrid, spacing: 0) {
                ForEach(fandbFoodies) { item in
                    VStack {
                        NavigationLink(
                            destination: DetailChaqueRecette(unRecette: item),
                            label: {
                                VStack {
                                    Image(item.photoChallenge)
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(15)
                                        .padding()
                                        .frame(width: 100.0, height: 80.0)
                                        
                                        .navigationBarTitle("Profile", displayMode: .inline)
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

                                
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
