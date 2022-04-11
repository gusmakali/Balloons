//
//  MyBalloons.swift
//  balloons.new
//
//  Created by Liliia Makashova on 2022-04-06.
//

import SwiftUI

struct FavoritesList: View {
    @State var balloonData = [ListBalloonsQuery.Data.Balloon.Edge.Node]()
    @EnvironmentObject var feedback: UserFeedback
    
    var filteredBalloons: [ListBalloonsQuery.Data.Balloon.Edge.Node] {
        balloonData.filter { balloon in
            return feedback.comments[balloon.name] != nil
        }
    }

    var body: some View {
        List(filteredBalloons, id: \.name) { balloon in
            NavigationLink(destination: BalloonDetail(balloonData: balloon)) {
                    BalloonRowView(balloon:balloon)
                        .onAppear {
                          self.loadData()
                        }
//                  }
                }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
        }
        .navigationBarTitle(Text("My Balloons"))
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        Network.shared.apollo.fetch(query: ListBalloonsQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let results = graphQLResult.data?.balloons.edges {
                    self.balloonData = []
                    for item in results {
                        self.balloonData.append(item.node)
                    }
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}

struct MyBalloonsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesList()
    }
}
//struct LandmarkList_Previews: PreviewProvider {
//    static var previews: some View {
//        LandmarkList()
//            .environmentObject(ModelData())
//    }
//}
