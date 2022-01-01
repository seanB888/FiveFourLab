//
//  Network.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/30/21.
//
import Foundation
import Apollo

class Network {
  static let shared = Network()
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/3lsw6ta9ohjy?access_token=9k0kGnS2za3lrWeccTIMlTfXcYmLUdAe0igsumx1zIk")!)
}

