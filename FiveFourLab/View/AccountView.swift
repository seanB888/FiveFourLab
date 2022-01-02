//
//  AccountView.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 1/2/22.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountViewModel = AccountViewModel()
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                accountViewModel.getUser()
            }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AccountViewModel())
    }
}
