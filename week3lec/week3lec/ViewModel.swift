//
//  ViewModel.swift
//  week3lec
//
//  Created by Rashid Ahamed on 18/10/25.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
  @Published  private(set) var count: Int = 0
    
    func increment() {
        count += 1
    }
      func decrement() {
        count -= 1
        
    }
    
      func resetCount() {
        count = 0
    }
    
}
