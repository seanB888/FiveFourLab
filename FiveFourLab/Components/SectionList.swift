//
//  SectionList.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/31/21.
//

import SwiftUI

struct SectionList: View {
    @StateObject var sectionViewModel = SectionViewModel()
    
    var body: some View {
        List {
            ForEach($sectionViewModel.sections, id: \.id) { $section in
                HStack {
                    Text(section.title)
                    Spacer()
                    
                    if section.isPinned {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.purple)
                    }
                }
                    .swipeActions {
                        Button {
                            section.isPinned.toggle()
                            sectionViewModel.orderSectionsByPinned()
                        } label: {
                            if section.isPinned {
                                Label("Unpin", systemImage: "pin.slash")
                            } else {
                                Label("pin", systemImage: "pin")
                            }
                        }
                    }
                    .tint(.purple)
            }
        }
        .task {
            await sectionViewModel.fetch()
        }
        .refreshable {
            await sectionViewModel.randomizedSections()
        }
    }
}

struct SectionList_Previews: PreviewProvider {
    static var previews: some View {
        SectionList()
    }
}
