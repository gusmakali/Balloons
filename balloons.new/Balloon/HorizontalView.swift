//
//  HorizontalView.swift
//  balloons.new
//
//  Created by Liliia Makashova on 2022-04-06.
//

import SwiftUI

struct HorizontalScroll: View {
    @State var balloonData = [ListBalloonsQuery.Data.Balloon.Edge.Node]()
    @EnvironmentObject var feedback: UserFeedback
    
    var body: some View {
        ScrollView (.horizontal) {
            HStack {
                ForEach(balloonData, id:\.name) { balloon in
                    BalloonDetail(balloonData: balloon)
                   
                }
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
                }
                .frame(width: 300.0, height: 500.0, alignment: .center)
            }
//
        }
        .navigationBarTitle(Text("Balloons"))
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


struct HorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScroll()
            .environmentObject(UserFeedback())
    }
}
