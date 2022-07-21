//
//  Enum + UIStates.swift
//  SwiftUIMovieDBWithCombine
//
//  Created by MACBOOK Pro - WSIT on 7/18/22.
//

import Foundation
enum UIStates<V>{
    case empty
    case success (V)
    case failure (Error)
    
    var value : V?{
        if case .success (let value) = self {
            return value
        }
        return nil
    }
}
