//
//  RetryView.swift
//  SwiftUIMovieDBWithCombine
//
//  Created by MACBOOK Pro - WSIT on 7/18/22.
//

import SwiftUI

import SwiftUI

struct RetryView: View {
    
    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Try Again")
            }
        }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView(text: "An Error occured") {
            print("Retry Tapped")
        }
    }
}
