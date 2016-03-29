//
//  notes.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/28/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
class Notes {
    private let knote = "note"
    var note: String = ""
    init?(dictionary: [String: AnyObject]) {
        self.note = dictionary[knote] as? String ?? ""
    }
}