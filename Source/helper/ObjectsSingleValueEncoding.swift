//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 20.05.21.
//

import Foundation

struct ObjectsSingleValueEncoding: SingleValueEncodingContainer {

    private let data: ObjectEncoding.Data

    init(data: ObjectEncoding.Data, codingPath: [CodingKey]) {
        self.data = data
        self.codingPath = codingPath
    }

    let codingPath: [CodingKey]

    mutating func encodeNil() throws {
        data.encode(key: codingPath, value: .primitive(.null))
    }

    mutating func encode(_ value: Bool) throws {
        data.encode(key: codingPath, value: .primitive(.bool(value)))
    }

    mutating func encode(_ value: String) throws {
        data.encode(key: codingPath, value: .primitive(.string(value)))
    }

    mutating func encode(_ value: Double) throws {
        data.encode(key: codingPath, value: .primitive(.float64(value)))
    }

    mutating func encode(_ value: Float) throws {
        data.encode(key: codingPath, value: .primitive(.float64(Double(value))))
    }

    mutating func encode(_ value: Int) throws {
        data.encode(key: codingPath, value: .primitive(.int(value)))
    }

    mutating func encode(_ value: Int8) throws {
        data.encode(key: codingPath, value: .primitive(.int(Int(value))))
    }

    mutating func encode(_ value: Int16) throws {
        data.encode(key: codingPath, value: .primitive(.int(Int(value))))
    }

    mutating func encode(_ value: Int32) throws {
        data.encode(key: codingPath, value: .primitive(.int(Int(value))))
    }

    mutating func encode(_ value: Int64) throws {
        data.encode(key: codingPath, value: .primitive(.int(Int(value))))
    }

    mutating func encode(_ value: UInt) throws {
        data.encode(key: codingPath, value: .primitive(.uint(value)))
    }

    mutating func encode(_ value: UInt8) throws {
        data.encode(key: codingPath, value: .primitive(.uint(UInt(value))))
    }

    mutating func encode(_ value: UInt16) throws {
        data.encode(key: codingPath, value: .primitive(.uint(UInt(value))))
    }

    mutating func encode(_ value: UInt32) throws {
        data.encode(key: codingPath, value: .primitive(.uint(UInt(value))))
    }

    mutating func encode(_ value: UInt64) throws {
        data.encode(key: codingPath, value: .primitive(.uint(UInt(value))))
    }

    mutating func encode<T: Encodable>(_ value: T) throws {
        let objectEncoding = ObjectEncoding(encodedData: data, codingPath: codingPath)
        try value.encode(to: objectEncoding)
    }
}
