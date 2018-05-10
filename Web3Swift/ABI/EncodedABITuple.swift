//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// EncodedABITuple.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

//Bytes of the encoded abi tuple
public final class EncodedABITuple: BytesScalar {

    private let parameters: [ABIEncodedParameter]

    /**
    Ctor

    - parameters:
        - parameters: parameters of the tuple
    */
    public init(parameters: [ABIEncodedParameter]) {
        self.parameters = parameters
    }

    /**
    - returns:
    Encoded tuple as `Data`

    - throws:
    `DescribedError` if something went wrong.
    */
    public func value() throws -> Data {
        return try ConcatenatedBytes(
            bytes: ABITuple(
                parameters: parameters
            ).heads(offset: 0)
        ).value()
    }

}
