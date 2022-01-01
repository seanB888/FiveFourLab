//
//  FeaturedCourseList.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/29/21.
//

import SwiftUI

struct FeaturedCourseList: View {
    var featuredCourses: [Course]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                if featuredCourses.count > 0 {
                    ForEach(featuredCourses, id: \.id) { course in
                        FeaturedCourseCard(featuredCourses: course)
                            .frame(width: 250, height:350)
                    }
                } else {
                    ForEach(0..<4, id: \.self) { number in
                        FeaturedCourseCard(featuredCourses: coursePreviewData)
                            .frame(width: 250, height:350)
                            .redacted(reason: .placeholder)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FeaturedCourseList_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCourseList(featuredCourses: [coursePreviewData])
    }
}
