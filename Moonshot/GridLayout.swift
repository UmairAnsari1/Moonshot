//
//  GridLayout.swift
//  Moonshot
//
//  Created by Umair on 08/04/24.
//

import SwiftUI

struct GridLayout: View {
    
    let missions: [Mission]
       let astronauts: [String: Astronaut]
       
       let columns = [
           GridItem(.adaptive(minimum: 150))
       ]
    
var body: some View {
    ScrollView {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
    }

    struct GridLayout_Previews: PreviewProvider {
        static var previews: some View {
            GridLayout(missions: Bundle.main.decode("missions.json"), astronauts: Bundle.main.decode("astronauts.json"))
                .preferredColorScheme(.dark)
        }
    }
