//
//  BalloonDetail.swift
//  balloons.new
//
//  Created by Liliia Makashova on 2022-04-04.
//


import SwiftUI

struct BalloonDetail: View {
    let balloonData: ListBalloonsQuery.Data.Balloon.Edge.Node
    @State private var showingSheet = false
    @EnvironmentObject var feedback: UserFeedback
//    @State var userComment: String = ""
    @StateObject var edits = UserFeedback()

    var body: some View {

        VStack {
            AsyncImage(url: URL(string: "https://balloons.thetc.se\(balloonData.imageUrl)")!, content: { image in
                image.resizable()
            }) {
                Image("ImagePlaceholder")
            }.frame(width: 100.0, height: 100.0)
                .cornerRadius(16.0)
            VStack(alignment: .leading, spacing: 8.0) {
                Text(balloonData.name ?? "")
                    .font(.system(size: 24.0))
                    .bold()
                HStack {
                    Text("Description:").font(.system(size: 14.0))
                    Text(balloonData.description).font(.system(size: 14.0))
                }
                HStack {
                    Text("Price:").font(.system(size: 14.0))
                    Text("\(balloonData.price) SEK").font(.system(size: 14.0))
                }
                HStack {
                    Text("Color:").font(.system(size: 14.0))
                    Text("\(balloonData.color.rawValue.lowercased())").font(.system(size: 14.0))
                }
                HStack {
                    Text("Update description:").font(.system(size: 14.0))
                    Button("Leave a message") {
                        showingSheet.toggle()
                        
                    }
                    .sheet(isPresented: $showingSheet) {
                            SheetView { text in
                                feedback.comments[balloonData.name] = text
//                                balloonData.description += userComment
                              
                    }
                    }
                    
                }
                Text(feedback.comments[balloonData.name] ?? "").font(.system(size: 14.0))
               
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding()
       
        }
    }
}

struct BalloonDetail_Previews: PreviewProvider {
    static var previews: some View {
        BalloonDetail(balloonData: balloonData[1])
    }
}


struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var userInput: String = ""
    var onSubmit: (String) -> ()

    var body: some View {
        
        Text("Type here")
        TextField("Type here", text:$userInput, onEditingChanged: { (changed) in
            print("Username onEditingChanged - \(changed)")
        }) {
            print("Username onCommit")
        }
        
        Text("Your edit: \(userInput)")
        
        Button("Submit") {
            onSubmit("\nYour update: \(userInput)")
            dismiss()
        }
        Button("Press to exit") {
            dismiss()
        }
        .font(.footnote)
        .padding()
        
        
    }
}

