//
//  AccountView.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 1/2/22.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountViewModel = AccountViewModel()
    @State private var user: User?
    
    var body: some View {
        VStack {
            if let user = user {
                ProfileCard(user: user)
                    .padding(.horizontal, 8)
            } else {
                Text("No User Found!")
            }
        }
        
        .task {
            do {
                user = try await accountViewModel.getUser()
            } catch {
                print("Error while fetching User Data: \(error)")
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AccountViewModel())
    }
}
