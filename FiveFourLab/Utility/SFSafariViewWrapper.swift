//
//  SFSafariViewWrapper.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 1/2/22.
//

import SwiftUI
import SafariServices

// used to create a Safari browser in the app.
struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> some SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}
