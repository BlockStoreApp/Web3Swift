//
// Created by Timofey on 3/7/18.
//

import Foundation

private final class AmbiguousHexStringError: DescribedError {

    private let hex: String
    init(hex: String) {
        self.hex = hex
    }

    var description: String {
        return "Hex string \(hex) length \(hex.count) is not even"
    }

}

private final class IncorrectHexCharacterError: DescribedError {

    private let hex: String

    public init(hex: String) {
        self.hex = hex
    }

    public var description: String {
        //TODO: Highlight incorrect characters here
        return "Incorrect hex string \"\(self.hex)\""
    }

}

public final class HexString: StringScalar {

    private let hex: StringScalar
    init(hex: StringScalar) {
        self.hex = hex
    }

    convenience init(hex: String) {
        self.init(hex: SimpleString{ hex })
    }

    func value() throws -> String {
        let hex = try self.hex.value()
        guard hex.count.isEven() else { throw AmbiguousHexStringError(hex: hex) }
        guard hex.range(
            of: "^[a-f0-9]+$",
            options: [.regularExpression, .caseInsensitive]
        ) != nil else { throw IncorrectHexCharacterError(hex: hex) }
        return hex
    }

}