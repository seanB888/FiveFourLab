//
//  SectionsView.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/31/21.
//

import SwiftUI

struct SectionsView: View {
    @EnvironmentObject var sectionViewModel: SectionViewModel
    @Environment(\.isSearching) var isSearching
    
    var body: some View {
        VStack {
            if isSearching {
                if sectionViewModel.filteredSections.count > 0 {
                    // Display the filtered sections
                    List(sectionViewModel.filteredSections) { section in
                        Text(section.title)
                    }
                } else {
                    List(0..<1) { section in
                        Text("No Results")
                    }
                }
            } else {
                SectionList()
            }
        }
        .navigationTitle("All Sections")
    }
}

struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionsView()
            .environmentObject(SectionViewModel())
    }
}
