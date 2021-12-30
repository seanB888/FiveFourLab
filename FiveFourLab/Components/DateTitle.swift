//
//  DateTitle.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 12/29/21.
//

import SwiftUI

struct DateTitle: View {
    var title: String
    @State private var date: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(date.uppercased())
                .font(.footnote.weight(.medium))
                .opacity(0.7)
            
            Text(title)
                .font(.largeTitle).bold()
        }
        .onAppear {
            date = Date.now.formatted(.dateTime.weekday(.wide).month().day())
        }
    }
}

struct DateTitle_Previews: PreviewProvider {
    static var previews: some View {
        DateTitle(title: "Learning SwiftUI")
    }
}