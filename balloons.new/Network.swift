//
//  Network.swift
//  balloons.new
//
//  Created by Liliia Makashova on 2022-04-04.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let url = URL(string: "https://balloons.thetc.se/graphql")!

        return ApolloClient(url: url)
    }()
}

func listBalloons() {
    Network.shared.apollo.fetch(query: ListBalloonsQuery()) { result in
        switch result {
            case .success(let graphQLResult):
            if let items = graphQLResult.data?.balloons.edges {
                    for balloon in items {
                        print(balloon)
                    }
                }
        case .failure(let error):
                print("Failure! Error: \(error)")
        }
    }
}
