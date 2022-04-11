//
//  data.swift
//  balloons.new
//
//  Created by Liliia Makashova on 2022-04-04.
//

import Foundation

let balloonData: [ListBalloonsQuery.Data.Balloon.Edge.Node] = [
    ListBalloonsQuery.Data.Balloon.Edge.Node.init(name: "Light Blue Heart Balloon",
                                             imageUrl: "/balloons/heart-blue.jpg",
                                             description: "A blue balloon, great for occasions involving hearts.",
                                             color: Color.blue,
                                             price: 10),
    ListBalloonsQuery.Data.Balloon.Edge.Node.init(name: "Light Blue Heart Balloon",
                                             imageUrl: "/balloons/heart-blue.jpg",
                                             description: "A blue balloon, great for occasions involving hearts.",
                                                  color: Color.red,
                                             price: 10),
    ListBalloonsQuery.Data.Balloon.Edge.Node.init(name: "Light Blue Heart Balloon",
                                             imageUrl: "/balloons/heart-blue.jpg",
                                             description: "A blue balloon, great for occasions involving hearts.",
                                                  color: Color.green,
                                             price: 10)
]
