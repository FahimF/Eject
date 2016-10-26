//
//  IBObject.swift
//  Eject
//
//  Created by Brian King on 10/19/16.
//  Copyright © 2016 Brian King. All rights reserved.
//

import Foundation

public class IBObject: IBReference {
    public var identifier: String
    public var className: String
    public var userLabel: String?

    init (identifier: String, className: String, userLabel: String? = nil) {
        self.identifier = identifier
        self.className = className
        self.userLabel = userLabel
    }

}
