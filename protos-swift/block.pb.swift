// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: block.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Com_Unblock_Proto_Block: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".Block"

  var id: String {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  var name: String {
    get {return _storage._name}
    set {_uniqueStorage()._name = newValue}
  }

  var bounds: Com_Unblock_Proto_Block.Bounds {
    get {return _storage._bounds ?? Com_Unblock_Proto_Block.Bounds()}
    set {_uniqueStorage()._bounds = newValue}
  }
  /// Returns true if `bounds` has been explicitly set.
  var hasBounds: Bool {return _storage._bounds != nil}
  /// Clears the value of `bounds`. Subsequent reads from it will return its default value.
  mutating func clearBounds() {_storage._bounds = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  struct Bounds: SwiftProtobuf.Message {
    static let protoMessageName: String = Com_Unblock_Proto_Block.protoMessageName + ".Bounds"

    var points: [Com_Unblock_Proto_Block.Bounds.Point] = []

    var unknownFields = SwiftProtobuf.UnknownStorage()

    struct Point: SwiftProtobuf.Message {
      static let protoMessageName: String = Com_Unblock_Proto_Block.Bounds.protoMessageName + ".Point"

      var x: Int32 = 0

      var y: Int32 = 0

      var unknownFields = SwiftProtobuf.UnknownStorage()

      init() {}

      /// Used by the decoding initializers in the SwiftProtobuf library, not generally
      /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
      /// initializers are defined in the SwiftProtobuf library. See the Message and
      /// Message+*Additions` files.
      mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
          switch fieldNumber {
          case 1: try decoder.decodeSingularInt32Field(value: &self.x)
          case 2: try decoder.decodeSingularInt32Field(value: &self.y)
          default: break
          }
        }
      }

      /// Used by the encoding methods of the SwiftProtobuf library, not generally
      /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
      /// other serializer methods are defined in the SwiftProtobuf library. See the
      /// `Message` and `Message+*Additions` files.
      func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if self.x != 0 {
          try visitor.visitSingularInt32Field(value: self.x, fieldNumber: 1)
        }
        if self.y != 0 {
          try visitor.visitSingularInt32Field(value: self.y, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
      }
    }

    init() {}

    /// Used by the decoding initializers in the SwiftProtobuf library, not generally
    /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
    /// initializers are defined in the SwiftProtobuf library. See the Message and
    /// Message+*Additions` files.
    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeRepeatedMessageField(value: &self.points)
        default: break
        }
      }
    }

    /// Used by the encoding methods of the SwiftProtobuf library, not generally
    /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
    /// other serializer methods are defined in the SwiftProtobuf library. See the
    /// `Message` and `Message+*Additions` files.
    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
      if !self.points.isEmpty {
        try visitor.visitRepeatedMessageField(value: self.points, fieldNumber: 1)
      }
      try unknownFields.traverse(visitor: &visitor)
    }
  }

  init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._id)
        case 2: try decoder.decodeSingularStringField(value: &_storage._name)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._bounds)
        default: break
        }
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._id.isEmpty {
        try visitor.visitSingularStringField(value: _storage._id, fieldNumber: 1)
      }
      if !_storage._name.isEmpty {
        try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 2)
      }
      if let v = _storage._bounds {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "com.unblock.proto"

extension Com_Unblock_Proto_Block: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "bounds"),
  ]

  fileprivate class _StorageClass {
    var _id: String = String()
    var _name: String = String()
    var _bounds: Com_Unblock_Proto_Block.Bounds? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _name = source._name
      _bounds = source._bounds
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  func _protobuf_generated_isEqualTo(other: Com_Unblock_Proto_Block) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._id != other_storage._id {return false}
        if _storage._name != other_storage._name {return false}
        if _storage._bounds != other_storage._bounds {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Com_Unblock_Proto_Block.Bounds: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "points"),
  ]

  func _protobuf_generated_isEqualTo(other: Com_Unblock_Proto_Block.Bounds) -> Bool {
    if self.points != other.points {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Com_Unblock_Proto_Block.Bounds.Point: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "x"),
    2: .same(proto: "y"),
  ]

  func _protobuf_generated_isEqualTo(other: Com_Unblock_Proto_Block.Bounds.Point) -> Bool {
    if self.x != other.x {return false}
    if self.y != other.y {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
