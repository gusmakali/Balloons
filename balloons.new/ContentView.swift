//
//  ContentView.swift
//  balloons.new
//
//  Created by Liliia Makashova on 2022-04-04.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    private var userFeedback = UserFeedback()

    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                BalloonListView()
            }.environmentObject(userFeedback).tabItem {
                Label("Featured", systemImage: "list.bullet") .tag(Tab.featured)
            }
            NavigationView{
                FavoritesList()
            }.environmentObject(userFeedback).tabItem {
                Label("My balloons", systemImage: "star") .tag(Tab.featured)
            }
        }
    }
}

class UserFeedback: ObservableObject {
    @Published var comments: Dictionary<String, String> = [:]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct ContentView: View {
//    @State private var selection: Tab = .featured
//
//    enum Tab {
//        case featured
//        case list
//    }

//    var body: some View {
//        TabView(selection: $selection) {
//            CategoryHome()
//                .tabItem {
//                    Label("Featured", systemImage: "star")
//                }
//                .tag(Tab.featured)
//
//            LandmarkList()
//                .tabItem {
//                    Label("List", systemImage: "list.bullet")
//                }
//                .tag(Tab.list)
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            )
//    }
//}
