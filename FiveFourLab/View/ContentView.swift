//
//  ContentView.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Learn Now")
            }
            SectionsView()
                .tabItem{
                    Image(systemName: "square.stack.3d.down.right.fill")
                    Text("Sections")
                }
        }
        .task {
            await courseViewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
