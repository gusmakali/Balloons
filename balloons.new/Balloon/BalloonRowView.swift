//
//  BalloonRowView.swift
//  balloons.new
//
//  Created by Liliia Makashova on 2022-04-04.
//

import SwiftUI

struct BalloonRowView: View {
    var balloon: ListBalloonsQuery.Data.Balloon.Edge.Node
    @EnvironmentObject var feedback: UserFeedback
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: CGFloat(16.0)) {
                AsyncImage(url: URL(string: "https://balloons.thetc.se\(balloon.imageUrl)")!, content: { image in
                    image.resizable()
                }) {
                    Image("ImagePlaceholder")
                }.frame(width: 90.0, height: 90.0)
                    .cornerRadius(16.0)
                    
                VStack(alignment: .leading) {
                    Text(balloon.name)
                        .font(.system(size: 18.0))
                        .bold()
                    HStack {
                        Text("•")
                        Text("\(balloon.price) SEK")
                        Text("•")
                       
                    }
                    if feedback.comments[balloon.name] != nil {
                        Text("🖊️ Reviewed")
                    }
                }
               
                Spacer()
            }
        }
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BalloonRowView(balloon: balloonData[0])
            BalloonRowView(balloon: balloonData[1])
            BalloonRowView(balloon: balloonData[2])
          
        }
        .previewLayout(.fixed(width: 375, height: 100))
    }
}
