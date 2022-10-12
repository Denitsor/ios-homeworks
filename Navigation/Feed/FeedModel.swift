//
//  FeedModel.swift
//  Navigation
//
//  Created by MacBook on 11.10.2022.
//

import Foundation

class FeedModel {
    
    var secretWord: String = "sw"
    
    func check(word: String) -> Bool {
        if word == self.secretWord {
            return true
        } else {
            return false
        }
    }
}
