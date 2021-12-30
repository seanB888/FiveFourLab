//
//  ContentView.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .tabItem{
                Image(systemName: "house")
                Text("Learn Now")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
