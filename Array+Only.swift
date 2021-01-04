//
//  Array+Only.swift
//  Memorize
//
//  Created by Reed Kellett on 1/2/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
