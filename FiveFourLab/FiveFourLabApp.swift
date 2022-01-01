//
//  FiveFourLabApp.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/29/21.
//

import SwiftUI

@main
struct FiveFourLabApp: App {
    @StateObject var courseViewModel = CourseViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(courseViewModel)
        }
    }
}
