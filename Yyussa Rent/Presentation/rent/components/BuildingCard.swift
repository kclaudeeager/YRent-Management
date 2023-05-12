//
//  BuildingCard.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI

struct BuildingCard: View {
    let building: Building
    let isSelected: Bool
    let onClick: () -> Void
    
    var body: some View {
        let backgroundColor = isSelected ? Color.blue : Color.white
        let textColor = isSelected ? Color.white : Color.black
        
        VStack(alignment: .leading, spacing: 12) {
            Text(building.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(textColor)
                .lineLimit(2)
                .padding(12)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 1)
                .background(backgroundColor)
        )
        .padding()
        .onTapGesture {
            onClick()
        }
    }
}
