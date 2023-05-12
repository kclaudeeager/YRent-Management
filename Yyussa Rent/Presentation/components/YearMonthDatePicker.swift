//
//  YearMonthDatePicker.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/11/23.
//

import Foundation

import SwiftUI

struct YearMonthDatePicker: View {
    @Binding var selectedDate: Date
    var onDateSelected: ((Date) -> Void)?

    private let datePickerFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        return formatter
    }()

    var body: some View {
        VStack {
            DatePicker("Date", selection: $selectedDate, in: ...Date(), displayedComponents: [.date])
                .labelsHidden()
                .padding(.bottom, 20)
        }
        .onChange(of: selectedDate, perform: { value in
           
            onDateSelected?(value)
        })
    }
}




struct YearMonthDatePicker_Previews: PreviewProvider {
  
    static var previews: some View {
     @State var selectedDate = Date()
        YearMonthDatePicker(selectedDate: $selectedDate){ date in
            print(date)
            
        }
    }
}
