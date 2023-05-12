//
//  ProfileDetails.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/11/23.
//

import Foundation
import SwiftUI

struct ProfileDetails: View {
    let user: User
    var body: some View {
    
        BoxView(){
            VStack(spacing: 8) {
                Text("\(user.f_name) \(user.l_name)")
                    .font(.headline)
                
                Text(user.mobile)
                    .font(.title2)
            }
            
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
        }
    }
}
