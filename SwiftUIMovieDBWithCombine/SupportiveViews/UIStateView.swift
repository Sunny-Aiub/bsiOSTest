//
//  UIStateView.swift
//  SwiftUIMovieDBWithCombine
//
//  Created by MACBOOK Pro - WSIT on 7/18/22.
//

import SwiftUI

protocol EmptyData {
    var isEmpty: Bool { get }
}


struct UIStateView <V:EmptyData>: View {
    
    let phase: UIStates<V>
    let retryAction: () -> ()

    
    var body: some View {
        switch phase {
        case .empty:
            ProgressView()
        case .success(let value) where value.isEmpty:
            EmptyUIView(text: "No data", image: Image(systemName: "film"))
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: retryAction)
        default:
            EmptyView()
        }
    }
}

extension Array: EmptyData {}
extension Optional: EmptyData {
    
    var isEmpty: Bool {
        if case .none = self {
            return true
        }
        return false
    }
    
}


struct UIStateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UIStateView(phase: .success([])) {
                print("Retry")
            }
            
            UIStateView<[Movie]>(phase: .empty) {
                print("Retry")
            }
            UIStateView<Movie?>(phase: .failure(MovieError.invalidResponse)) {
                print("Retry")
            }
        }
        
    }
}
