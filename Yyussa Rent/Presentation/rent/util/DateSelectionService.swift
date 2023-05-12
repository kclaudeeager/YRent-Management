//
//  DateSelectionService.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/12/23.
//

import Foundation

class DateSelectionService {
    
    static let shared = DateSelectionService()
    
    var invoiceSelectedDate: Date? = nil
    var paymentSelectedDate: Date? = nil
    
    private init() {}
}
