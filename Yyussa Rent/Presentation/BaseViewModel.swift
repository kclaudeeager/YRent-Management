//
//  BaseViewModel.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/9/23.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    
    // A cancellable object that cancels the asynchronous operation when the view is no longer available.
    var cancellables = Set<AnyCancellable>()
    
    // A function that cancels all the operations.
    func cancel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
    
}
