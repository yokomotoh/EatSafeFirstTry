//
//  SearchBar.swift
//  EatSafeFirstTry
//
//  Created by Maikel Tinjod on 06/11/2020.
//

import SwiftUI


/* comment our by yoko 13/11/2020
struct SearchBar: View {
    var array = ["fruit rouge"]

    @State private var searchText = ""
    
    var body: some View {
        
        
        List{
            TextField("Type your search",text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self){searchText in
                Text(searchText)
            
            
            NavigationLink(
                destination: ChallengeDetailView(challenge: tableauChallengeDeJour[0]),
                label: {
                    Text("legumevert")
                })
            
            
            
            
            
            }
        } .navigationBarTitle(Text("Search"))
        
        
    }
}
 
 struct SearchBar_Previews: PreviewProvider {
     static var previews: some View {
         SearchBar()
     }
 }


*/
struct SearchBar: View {

    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $text)
                .padding(7)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}

struct SearchBarModalView: View {
    @State private var searchText = ""
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        //ZStack {
            VStack {
                SearchBar(text: $searchText)
                    //.padding(.top, -30)
                List(tableauChallengeDeJour.filter({ searchText.isEmpty ? true : $0.nomDuChallenge.contains(searchText) })) { item in Text(item.nomDuChallenge)}
                //Text("À developper").foregroundColor(Color.black)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Exit")
                        .foregroundColor(Color.black)
                    
                }
 
            }
        //}
    }

}

struct CommunPostesSearchBarModalView: View {
    @State private var searchText = ""
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var isShowingDetailView = false
    
    var body: some View {
        ZStack {
            VStack {
                SearchBar(text: $searchText)
                    //.padding(.top, -30)
                
                List(listRecettes.filter({ searchText.isEmpty ? true : $0.nomRecette.contains(searchText) })
                     //,  id: \.self
                ) { item in
                /* modified by yoko 13/11/20 */
                /*
                    NavigationLink(destination: DetailChaqueRecette(unRecette: item),
                        isActive: $isShowingDetailView
                        ){
                        Text("")
                        //EmptyView()
                        }
                    
                    Button(item.nomRecette) {
                        self.isShowingDetailView = true
                        
                        //self.presentationMode.wrappedValue.dismiss()
                    }
                */
                    NavigationLink(
                        destination:
                            DetailChaqueRecette(unRecette: item),
                        label: {
                            Button(action: {self.presentationMode.wrappedValue.dismiss()}, label:{Text(item.nomRecette)}
                            )
                            //Text(item.nomRecette)
                        })
                    /*
                    Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        NavigationLink(
                            destination:
                                DetailChaqueRecette(unRecette: item),
                                
                            label: {
                                Text(item.nomRecette)
                            })
                            //DetailChaqueRecette(unRecette: item)
                        
                    },
                        label: {Text(item.nomRecette)})
                    */
                } // list 15/11/2020 end
                    // modified end
                    //Text(item.nomRecette)}

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
