//
//  HomeView.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/29/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            DateTitle(title: "Learn SwiftUI")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            FeaturedCourseList()
                .padding(.top, 20)
            
            Text("All Courses")
                .font(.title2.weight(.bold))
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
            
            CourseList()
                .padding(.top, 20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
