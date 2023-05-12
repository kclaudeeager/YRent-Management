//
//    BoxView.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/11/23.
//

import Foundation
import SwiftUI

struct BoxView<Content: View>: View {
    let content: Content
    let cornerRadius: CGFloat
    let padding: CGFloat

    init(cornerRadius: CGFloat = 5, padding: CGFloat = 2, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.cornerRadius = cornerRadius
        self.padding = padding
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color(UIColor.systemBackground))
            content
                .padding(padding)
        }
    }
}
                          
