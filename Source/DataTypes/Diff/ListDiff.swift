//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 06.05.21.
//

import Foundation

final class ListDiff: Codable {

    init(objectId: ObjectId, type: ListType, edits: [Edit] = []) {
        self.objectId = objectId
        self.type = type
        self.edits = edits
    }

    enum ListType: String, Codable {
        case list
        case text
    }

    let objectId: ObjectId
    let type: ListType
    var edits: [Edit]

}

extension ListDiff: Equatable {

    static func == (lhs: ListDiff, rhs: ListDiff) -> Bool {
        return lhs.objectId == rhs.objectId &&
            lhs.type == rhs.type &&
            lhs.edits == rhs.edits
    }

}
