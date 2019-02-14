//
//  Questions.swift
//  Quizzler
//
//  Created by Abhishek Patel on 2019-02-05.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Questions {
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
