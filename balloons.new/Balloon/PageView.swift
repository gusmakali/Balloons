////
////  PageView.swift
////  balloons.new
////
////  Created by Liliia Makashova on 2022-04-11.
////
//
//
import SwiftUI



import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @EnvironmentObject var feedback: UserFeedback
    @State private var currentPage: Int
    
    init(openAtPage: Int, pages: [Page]) {
        self.pages = pages
        self.currentPage = openAtPage
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(openAtPage: 0, pages:  [BalloonDetail(balloonData: balloonData[1]) ])
            .aspectRatio(3 / 2, contentMode: .fit).environmentObject(UserFeedback())
    }
}
