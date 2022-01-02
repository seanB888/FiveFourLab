//
//  FeaturedCourseList.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/29/21.
//

import SwiftUI

struct FeaturedCourseList: View {
    var featuredCourse: [Course]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                if featuredCourse.count > 0 {
                    ForEach(featuredCourse, id: \.id) { course in
                        FeaturedCourseCard(featuredCourse: course)
                            .frame(width: 250, height:350)
                    }
                } else {
                    ForEach(0..<4, id: \.self) { number in
                        FeaturedCourseCard(featuredCourse: coursePreviewData)
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
        FeaturedCourseList(featuredCourse: [coursePreviewData])
    }
}
