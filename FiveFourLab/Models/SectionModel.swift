//
//  SectionModel.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/31/21.
//

import Foundation

typealias SectionsCollectionData = SectionQuery.Data.SectionCollection

struct SectionsDataCollection: Decodable {
    let sections: [SectionModel]
    
    init(_ sectionsCollection: SectionsCollectionData?) {
        self.sections = sectionsCollection?.sections.map({ section -> SectionModel in
           SectionModel(section)
        }) ?? []
    }
    
    struct SectionModel: Decodable, Identifiable {
        let id: String
        let title: String
        var isPinned: Bool
        
        init(_ section: SectionQuery.Data.SectionCollection.Section?) {
            self.id = section?.sys.id ?? ""
            self.title = section?.title ?? ""
            self.isPinned = false
        }
    }
}
