//
//  ListChallengesJours.swift
//  EatSafeFirstTry
//
//  Created Laura on 02/11/2020.
//

import SwiftUI


struct ListChallengesJours: View {
    @State private var showModal = false
    
    var body: some View {
        
        VStack{
            
            NavigationView{
                
                ScrollView {
                    
                    
                    NavigationLink(
                        destination:
                            ChallengeDetailView(challenge: tableauChallengeDeJour[0]),
                            //ChallengeDetailViewYoko(challenge: tableauChallengeDeJour[0]),
                        label: {
                            ChallengeTittleView(imageDuChallenge: "legumevert", ecrireLeChallenge: tableauChallengeDeJour[0].nomDuChallenge)
                        })
                    NavigationLink(
                        destination:
                            ChallengeDetailView(challenge: tableauChallengeDeJour[1]),
                            //ChallengeDetailViewYoko(challenge: tableauChallengeDeJour[1]),
                        label: {
                            ChallengeTittleView(imageDuChallenge: "legumejaune", ecrireLeChallenge: tableauChallengeDeJour[1].nomDuChallenge)
                        })
                    NavigationLink(
                        destination: ChallengeDetailView(challenge: tableauChallengeDeJour[2]),
                            //ChallengeDetailViewYoko(challenge: tableauChallengeDeJour[2]),
                        label: {
                            ChallengeTittleView(imageDuChallenge: "fruitrouge", ecrireLeChallenge: tableauChallengeDeJour[2].nomDuChallenge)
                        })
                    
                    NavigationLink(
                        destination: ChallengeDetailView(challenge: tableauChallengeDeJour[3]),
                         //ChallengeDetailViewYoko(challenge: tableauChallengeDeJour[3]),
                        label: {
                            ChallengeTittleView(imageDuChallenge: "mureetmyrtille", ecrireLeChallenge: tableauChallengeDeJour[3].nomDuChallenge)
                        })
                    NavigationLink(
                        destination: ChallengeDetailView(challenge: tableauChallengeDeJour[4]),
                        //ChallengeDetailViewYoko(challenge: tableauChallengeDeJour[4]),
                        label: {
                            ChallengeTittleView(imageDuChallenge: "courge", ecrireLeChallenge: tableauChallengeDeJour[4].nomDuChallenge)
                        })
                    
                    
                } /*Fin ScrollView*/
                .navigationTitle("Challenges")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(
                    leading:
                    HStack{
                        NavigationLink(
                            destination: ViewCreateNewRecette(),
                            label: {
                                Image(systemName: "camera.fill")
                            }).foregroundColor(Color.black)
                    },
                    trailing:
/* yoko comment out
                                            HStack{
                                                NavigationLink(
                                                    destination:
                                      
                                        //SearchBar(),
                                                        Text("search bar"),                              label: {
                                                        Image(systemName: "magnifyingglass")
                                                            .foregroundColor(Color.black)
                                                    }
                                                )}
*/ // yoko comment out end
                    Button(action: {
                        self.showModal = true
                        },
                        label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.black)
                        }).sheet(isPresented: self.$showModal) {
                            SearchBarModalView()
                        }
            ) // NavigationBarItems end
                
            } //ScrollView end
                 
            
            
        } /*FIN Vstack*/
        
    }
    
    /* Ne pas toucher */
    
    struct ListChallengesJours_Previews: PreviewProvider {
        static var previews: some View {
            ListChallengesJours()
        }
    }
    /* Ne pas toucher */
    
    
    struct ChallengeTittleView: View {
        @State var imageDuChallenge : String
        var ecrireLeChallenge : String
        
        
        
        var body: some View {
            ZStack {
                
                Image(imageDuChallenge)
                    .resizable()
                    .scaledToFill()
                
                Text(ecrireLeChallenge)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    
                    .background(Color.gray.opacity(0.5))
            }.frame(height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(6.5)
        }
    }
    
}

struct Search : View {

      var body: some View {


          NavigationView{
            
            HStack {
          NavigationLink(
            destination:
                //SearchBar(),
                Text("seachBar test"),
                label: {
            }).navigationBarItems(trailing: Image(systemName: "magnifyingglass"))
                
        
            }
          }


      }
    }
