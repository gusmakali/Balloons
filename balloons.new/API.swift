// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum Color: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case red
  case pink
  case green
  case blue
  case yellow
  case purple
  case white
  case orange
  case black
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "RED": self = .red
      case "PINK": self = .pink
      case "GREEN": self = .green
      case "BLUE": self = .blue
      case "YELLOW": self = .yellow
      case "PURPLE": self = .purple
      case "WHITE": self = .white
      case "ORANGE": self = .orange
      case "BLACK": self = .black
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .red: return "RED"
      case .pink: return "PINK"
      case .green: return "GREEN"
      case .blue: return "BLUE"
      case .yellow: return "YELLOW"
      case .purple: return "PURPLE"
      case .white: return "WHITE"
      case .orange: return "ORANGE"
      case .black: return "BLACK"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Color, rhs: Color) -> Bool {
    switch (lhs, rhs) {
      case (.red, .red): return true
      case (.pink, .pink): return true
      case (.green, .green): return true
      case (.blue, .blue): return true
      case (.yellow, .yellow): return true
      case (.purple, .purple): return true
      case (.white, .white): return true
      case (.orange, .orange): return true
      case (.black, .black): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Color] {
    return [
      .red,
      .pink,
      .green,
      .blue,
      .yellow,
      .purple,
      .white,
      .orange,
      .black,
    ]
  }
}

public final class ListBalloonsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ListBalloons {
      balloons {
        __typename
        edges {
          __typename
          node {
            __typename
            name
            imageUrl
            description
            color
            price
          }
        }
      }
    }
    """

  public let operationName: String = "ListBalloons"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("balloons", type: .nonNull(.object(Balloon.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(balloons: Balloon) {
      self.init(unsafeResultMap: ["__typename": "Query", "balloons": balloons.resultMap])
    }

    /// This API follows a simplified version of the Relay pagination pattern. Specify an ID on
    /// after or before to get 5 results. There is no option for controlling the count.
    /// 
    /// You can use variant and color to filter only matching results of those types.
    public var balloons: Balloon {
      get {
        return Balloon(unsafeResultMap: resultMap["balloons"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "balloons")
      }
    }

    public struct Balloon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["BalloonConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "BalloonConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["BalloonEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "BalloonEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Balloon"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("imageUrl", type: .nonNull(.scalar(String.self))),
              GraphQLField("description", type: .nonNull(.scalar(String.self))),
              GraphQLField("color", type: .nonNull(.scalar(Color.self))),
              GraphQLField("price", type: .nonNull(.scalar(Int.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, imageUrl: String, description: String, color: Color, price: Int) {
            self.init(unsafeResultMap: ["__typename": "Balloon", "name": name, "imageUrl": imageUrl, "description": description, "color": color, "price": price])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var imageUrl: String {
            get {
              return resultMap["imageUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "imageUrl")
            }
          }

          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          public var color: Color {
            get {
              return resultMap["color"]! as! Color
            }
            set {
              resultMap.updateValue(newValue, forKey: "color")
            }
          }

          /// This is denominated in SEK.
          public var price: Int {
            get {
              return resultMap["price"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "price")
            }
          }
        }
      }
    }
  }
}
