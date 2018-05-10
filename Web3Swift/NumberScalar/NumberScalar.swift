//
// This source file is part of the Web3Swift.io open source project
// Copyright 2018 The Web3Swift Authors
// Licensed under Apache License v2.0
//
// NumberScalar.swift
//
// Created by Timofey Solonin on 10/05/2018
//

import Foundation

//Just a number
public protocol NumberScalar {

    /**
    Hexadecimal representation of a number
    */
    func hex() throws -> BytesScalar

    /**
    Integer representation of a number
    */
    func uint() throws -> UInt

}
