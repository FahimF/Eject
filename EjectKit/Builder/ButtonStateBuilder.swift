//
//  ButtonStateBuilder.swift
//  Eject
//
//  Created by Brian King on 10/19/16.
//  Copyright © 2016 Brian King. All rights reserved.
//

import Foundation

struct ButtonStateBuilder: Builder {

    func buildElement(attributes: inout [String: String], document: XIBDocument, parent: Reference?) throws -> Reference? {
        guard let parent = parent else { throw XIBParser.Error.needParent }
        let state = try attributes.removeRequiredValue(forKey: "key")

        document.containerContext = .setter(suffix: "for: \(ValueFormat.enumeration.transform(string: state))")

        let attributeFormat: [(String, ValueFormat)] = [("title", .string), ("image", .image)]
        for (key, format) in attributeFormat {
            if let value = attributes.removeValue(forKey: key) {
                document.addVariableConfiguration(for: parent.identifier, key: key, value: BasicValue(value: value, format: format))
            }
        }
        return parent
    }

    func complete(document: XIBDocument) {
        document.containerContext = nil
    }

}
