//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 07.04.20.
//

import Foundation

enum Diff: Equatable {
    case object(ObjectDiff)
    case value(ValueDiff)

    var objectId: String? {
        if case .object(let object) = self {
            return object.objectId
        }
        return nil
    }

    var props: Props? {
        if case .object(let object) = self {
            return object.props
        }
        return nil
    }

    static func value(_ value: Primitives) -> Diff {
        return Diff.value(.init(value: value))
    }
}

struct ValueDiff: Equatable {

    init(value: Primitives, datatype: DataType? = nil) {
        self.value = value
        self.datatype = datatype
    }

    var value: Primitives
    var datatype: DataType?
}

typealias Props = [Key: [String: Diff]]

class ObjectDiff: Equatable {

    init(objectId: String,
         type: CollectionType,
         edits: [Edit]? = nil,
         props: Props? = nil
    ) {
        self.objectId = objectId
        self.type = type
        self.edits = edits
        self.props = props
    }

    var objectId: String
    var type: CollectionType
    var edits: [Edit]?
    var props: Props?

    static func ==(lhs: ObjectDiff, rhs: ObjectDiff) -> Bool {
        return lhs.objectId == rhs.objectId &&
                lhs.type == rhs.type &&
            lhs.edits == rhs.edits &&
            lhs.props == rhs.props
    }
}

enum CollectionType: Equatable {
    case list
    case map
    case table
    case text
}
