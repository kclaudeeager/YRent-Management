//
//  InfoDialog.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI

struct InfoDialog: View {
    var title: String?
    var desc: String?
    var onRetry: () -> Void
    var onCancel: () -> Void
    @State var isDialogShowing = true
    
    var body: some View {
        if isDialogShowing {
            ZStack {
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    Spacer()
                    VStack(spacing: 24) {
                        Image("bolt_uix_no_internet")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 180)
                        Text(title ?? "Message")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Text(desc ?? "Your Message")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary)
                        HStack(spacing: 16) {
                            Button(action: {
                                isDialogShowing = false
                                onRetry()
                            }, label: {
                                Text("Retry")
                                    .fontWeight(.semibold)
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.primary)
                            .foregroundColor(.white)
                            .buttonStyle(.bordered)
                            .tint(.primary)
                            .cornerRadius(10)
                            Button(action: {
                                isDialogShowing = false
                                onCancel()
                            }, label: {
                                Text("Close")
                                    .fontWeight(.semibold)
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.primary)
                            .foregroundColor(.white)
                            .buttonStyle(.bordered)
                            .tint(.primary)
                            .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemBackground))
                    )
                    .shadow(radius: 5)
                }
                Spacer()
            }
        }
    }
}


struct InfoDialog_Previews: PreviewProvider {
    static var previews: some View {
        InfoDialog(
            title: "Connection Lost",
            desc: "Please check your internet connection and try again.",
            onRetry: {},
            onCancel: {}
        )
    }
}
