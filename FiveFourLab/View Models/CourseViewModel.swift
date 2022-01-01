//
//  CourseViewModel.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/30/21.
//

import Foundation
import Apollo

enum FeaturedSubject: String, CaseIterable {
    case Jamaican = "Patios"
    case Vietnam = "Tieng Viet"
}

class CourseViewModel: ObservableObject {
    @Published public private(set) var courses: [Course] = []
    var featuredSubject: FeaturedSubject = FeaturedSubject.allCases.randomElement() ?? .Jamaican
    @Published public private(set) var featuredCourses: [Course] = []
    
    private func queryCourses() async throws -> GraphQLResult<CourseQuery.Data>? {
        return await withCheckedContinuation{ continuation in
            // let preferredLanguage = locale.preferredLanguage[0]
            // let locale = preferredLanguage.contains("fr") ? "fr-CA" : "en-US"
            Network.shared.apollo.fetch(query: CourseQuery(locale: "")) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult)
                case .failure(let error ):
                    if let error = error as? Never {
                        continuation.resume(throwing: error)
                    }
                }
                
            }
        }
    }
    
    func fetch() async {
        do {
            let result = try await queryCourses()  // Catch the course using Apollo
            if let result = result {
                if let courseCollection = result.data?.courseCollection { // Unwrapping the optional result we get from Apollo
                    courses = process(data: courseCollection) // Processing the data into the model, and assigning it to the courses variable
                    findFeaturedCourses() // Finding the featured courses, depending on the featuredSubject value
                }
            }
        } catch {
            print("ERROR: ", error)
        }
    }
    
    private func process(data: CourseData) -> [Course] {
        let content = CourseCollection.init(data)
        
        return content.courses
    }
    
    private func findFeaturedCourses() {
        guard courses.count > 0 else { return }
        
        featuredCourses = courses.filter { course in
            course.subject == featuredSubject.rawValue
        }
    }
}
