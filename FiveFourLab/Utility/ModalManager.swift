//
//  ModalManager.swift
//  FiveFourLab
//
//  Created by SEAN BLAKE on 1/2/22.
//

import Foundation

class ModalManager: ObservableObject {
    enum ActiveModals {
        case signIn
        case signUp
        case resetPassword
    }
    
    @Published public var showModal: Bool = false
    @Published public var activeModal: ActiveModals = .signIn
}
