//
//  Block.swift
//  UnBlock
//
//  Created by Danny Franklin on 8/16/17.
//  Copyright © 2017 VDN. All rights reserved.
//

import UIKit

class Block: NSObject {

    let block: Com_Unblock_Proto_Block
    var color: UIColor?
    var bezierPath: UIBezierPath?
    
    init(block: Com_Unblock_Proto_Block) {
        self.block = block
    }
    
    func set(color: UIColor) {
        self.color = color
    }
    
    func set(bezierPath: UIBezierPath) {
        self.bezierPath = bezierPath
    }
}
