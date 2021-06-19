//
//  ViewProfile.swift
//  EatSafeFirstTry
//


import SwiftUI

struct ViewProfileYoko: View {
    var profileToView: Profile = billgates
    var body: some View {

        //NavigationView {
            VStack{
                
                Profile2(profileToViewDetail: profileToView)
                
                sousProfile2(profileToViewDetail: profileToView)
                
                Divider()
                Description2(profileToViewDetail: profileToView)
                
                Divider()
                YokoModifiedRecettes(profileToViewDetail: profileToView)
            
            }
            .padding()
        //}
    }
}

// DON'T TOUCH -----------------------
struct ViewProfileYoko_Previews: PreviewProvider {
    static var previews: some View {
        ViewProfileYoko()
        
    }
}

struct Profile2: View {
    @State var profileToViewDetail: Profile
    //var post: Int = listRecettes.count
    //var abonne: Int = 56
    var body: some View {
    
        HStack {
            Image(profileToViewDetail.photoProfile)
                    .resizable()
                    //.scaledToFill()
                    .scaledToFit()
                    //.frame(width: 150, height: 150)
                    .clipShape(Circle())
            Spacer()
            let count = listRecettes.filter({ $0.utilisateur.userName == profileToViewDetail.userName }).count
            Text("\(count)")
            Text(" Post")
                .font(.caption)
            //Spacer()
            Text("\(profileToViewDetail.NumAbonne)")
            Text(" Abonné")
                .font(.caption)
            //Spacer()
        }
        //.padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)

        //Spacer()
        //Spacer()
    }
}

struct sousProfile2: View {
    @State var profileToViewDetail: Profile
    @State private var showModal = false
    @Environment(\.presentationMode) var prensatationMode
    var nom: String = "Gates"
    var prenom: String = "Bill"
    @State private var modif: String = "Modifier profil"
    var body: some View {
    
        HStack {
            //Spacer()
            //Spacer()
            //Spacer()
            HStack{
                //Text(nom)
                Text(profileToViewDetail.nom)
                    .font(.title)
                    .fontWeight(.bold)
                //Text(prenom)
                Text(profileToViewDetail.prenom)
                    .font(.title)
                    .fontWeight(.bold)
                    //.padding(.trailing, 27.0)
            }
            
            //Spacer()
            Spacer()
            
            if (profileToViewDetail.userName==actualUserLoggedIn.userName)
            {
            /* Button Modifier profil */
            Button(action: {
                self.showModal = true
            }, label: {
                HStack{
                    Image(systemName: "person")
                    Text(modif)
                        //.frame(width: 110.0, height: 24.0)
                        //.padding(3.0).background(Color.green).cornerRadius(10).foregroundColor(Color.white)
                }.padding(3.0)
                .background(Color.green)
                .cornerRadius(10)
                .foregroundColor(Color.white)
            }).sheet(isPresented: self.$showModal) {
                ModalView2(profileToViewDetail: profileToViewDetail)
            }
            }else{
                Button(action: {
                    profileToViewDetail.NumAbonne += 1
                }, label: {
                    HStack{
                    Image(systemName: "person.fill.checkmark")
                    Text("Abonée")
                        //.padding(3.0).background(Color.blue).cornerRadius(10).foregroundColor(Color.white)
                    }.padding(3.0)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                })
            }
            // Button Modifier profile end
            //Spacer()
            //Spacer()
        }
        .frame(alignment: .leading)
        //.padding(-30.0/*@END_MENU_TOKEN@*/)
    }
}

struct Description2: View {
    @State var profileToViewDetail: Profile
    //var description: String = "Apprenti cuisinier 👨🏻‍🍳"
    var body: some View {
        VStack {
            
            HStack {
                
                Text(profileToViewDetail.description)
                Spacer()
                
            }
            //.padding(.bottom, 30.0/*@END_MENU_TOKEN@*/)
            //Divider()
            
            
        }
    }
}

struct ModalView2: View {
    @State var profileToViewDetail: Profile
    @State private var newUserName : String = ""
    @State private var newNom : String = ""
    @State private var newPrenom : String = ""
    @State private var newJour : String = ""
    @State private var newMois : String = ""
    @State private var newAnne : String = ""
    @State private var newEmail : String = ""
    @State private var newPhotoProfile : String = ""
    @State private var newDescription : String = ""
    @Environment(\.presentationMode) private var presentationMode
    
    /* date by Picker */
    @State var daySelection = 0
    @State var monthSelection = 0
    @State var yearSelection = 0
        
    var days = [Int](1...31)
    var months : [String]=["Jan","Feb","Mar","Avr","Mai","Jui","Jul","Aou","Sep","Oct","Nov","Dec"]//=[Int](1...12)
    var years = [Int](1950...2020)
    /* date by Picker end */
    
    var body: some View {
        //ZStack {
        GeometryReader { geometry in
        ScrollView{
            VStack {
                
                /*Text("A developper").foregroundColor(Color.red)
                */
                /* userName */
                LabelTextField(parametre: $newUserName, label: "userName", placeHolder: "\(profileToViewDetail.userName)")
                
                LabelTextField(parametre: $newNom, label: "nom", placeHolder: "\(profileToViewDetail.nom)")
                
                LabelTextField(parametre: $newPrenom, label: "prenom", placeHolder: "\(profileToViewDetail.prenom)")

/*
                /* dateRecette = dateToday*/
                VStack(alignment: .leading){
                    Text("Date of the recipe: \(newRecette.dateRecette.jour)/\(newRecette.dateRecette.mois)/ \(String(newRecette.dateRecette.anne))")
                        .padding(.all)
                }.padding(.horizontal, 15)
*/
                
/* comment out Yoko 17/11/2020 *
                /* Enter the birthday */
                LabelTextField(parametre: $newJour, label: "Ne: jour", placeHolder: "\(profileToViewDetail.Ne.jour)").keyboardType(.numberPad)
                
                LabelTextField(parametre: $newMois, label: "Ne: mois", placeHolder: "\(profileToViewDetail.Ne.mois)").keyboardType(.numberPad)
                
                LabelTextField(parametre: $newAnne, label: "Ne: anne", placeHolder: "\(profileToViewDetail.Ne.anne)").keyboardType(.numberPad)
* comment out yoko end */
                
                Text("né: j / m / a")
                HStack {
                    Picker(selection: self.$daySelection, label: Text("")) {
                    ForEach(0 ..< self.days.count) { index in
                        Text("\(self.days[index]) ").tag(index)
                        }
                    }
                    .frame(maxWidth: geometry.size.width/3)
                    //.frame(minWidth: 0, idealWidth: geometry.size.width/3,maxWidth: 100, //geometry.size.width/3,minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 100, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //.pickerStyle(WheelPickerStyle())
                    //.frame(width: geometry.size.width/3, height: 20, alignment: .center)//.frame(width: 100, height: 80, alignment: .center)
                    
                        
                    
                    Picker(selection: self.$monthSelection, label: Text("")) {
                    ForEach(0 ..< self.months.count) { index in
                        Text("\(self.months[index]) ").tag(index)
                        }
                    }
                    .frame(maxWidth: geometry.size.width/3)
                    //.frame(minWidth: 0, idealWidth: geometry.size.width/3, maxWidth: 80, //geometry.size.width/3, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 100, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //.pickerStyle(WheelPickerStyle())
                    //.frame(width: geometry.size.width/3, height: 20, alignment: .center)//.frame(width: 100, height: 80, alignment: .center)
                    
                    Picker(selection: self.$yearSelection, label: Text("")) {
                    ForEach(0 ..< self.years.count) { index in
                        Text("\(self.years[index]) ").tag(index)
                        }
                    }.frame(maxWidth: geometry.size.width/3)
                    //.frame(minWidth: 0, idealWidth: geometry.size.width/3,maxWidth: 80, //geometry.size.width/3,minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //.pickerStyle(WheelPickerStyle())
                    //.frame(width: geometry.size.width/3, height: 20, alignment: .center)//.frame(width: 100, height: 80, alignment: .center)
                    
                }
                
                /* Enter email */
                LabelTextField(parametre: $newEmail, label: "email", placeHolder: "\(profileToViewDetail.email)")
                        
                /* Enter your profile picture */
                LabelTextField(parametre: $newPhotoProfile, label: "photo profile", placeHolder: "\(profileToViewDetail.photoProfile)")
                        
                /* Enter the description */
                LabelTextField(parametre: $newDescription, label: "description", placeHolder: "\(profileToViewDetail.description)")
                            
                Button(action: {
                    
                    profileToViewDetail.userName = newUserName
                    profileToViewDetail.nom = newNom
                    profileToViewDetail.prenom = newPrenom
                    profileToViewDetail.Ne.jour = Int(newJour) ?? 1
                    profileToViewDetail.Ne.mois = Int(newMois) ?? 1
                    profileToViewDetail.Ne.anne = Int(newAnne) ?? 1900
                    profileToViewDetail.email = newEmail
                    profileToViewDetail.description = newDescription
                    
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Exit")
                        //.foregroundColor(Color.black)
                    
                }
            } //Vstack end
        } //Scrollview end
        } //geometryReader end
        // } //Zstack end
    }
}


struct YokoModifiedRecettes: View {
    @State var voirRecette: Recette = tarteTatin
    
    @State var profileToViewDetail: Profile
    
    //private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    //private var fandbFoodies: [Recette] = listRecettes
        //[tarteTatin, tarteCitronMeringuee, parisBrest, saladLentilles, saladeDeFruit, millefeuille, fondantChocolat]
    
    var body: some View {
        //Text("test").padding(.bottom, -16.0)
        HStack {
            Text("Recettes réalisées par \(profileToViewDetail.prenom):")
            Spacer()
        }//.padding()
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
                        //threeColumnGrid
                      , spacing: 0) {
                
                ForEach(listRecettes) { item in
                //ForEach(fandbFoodies) { item in
                    if item.utilisateur.userName == profileToViewDetail.userName {
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
                                        .navigationBarTitle("Profile", displayMode: .automatic)
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
                        
                    } //if end
                } //ForEach end
                //.navigationBarTitleDisplayMode(.automatic)
            } //LazyVGrid end
        } //ScrollView end
    }
}


