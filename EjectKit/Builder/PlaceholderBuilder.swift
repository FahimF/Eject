//
//  PlaceholderBuilder.swift
//  Eject
//
//  Created by Brian King on 10/19/16.
//  Copyright © 2016 Brian King. All rights reserved.
//

import Foundation

struct PlaceholderBuilder: Builder {

    func buildElement(attributes: [String: String], document: IBDocument, parent: IBReference?) -> IBReference? {
        guard let identifier = attributes["id"] else { fatalError("Must have identifier") }
        let className = attributes["customClass"] ?? "NSObject"
        let placeholder = document.addPlaceholder(for: identifier,
                                                  className: className,
                                                  userLabel: attributes["userLabel"])
        return placeholder
    }

}
