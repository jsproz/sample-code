//
//  RiscvCmdDecoder.swift
//  RiscvCmd
//
//  Copyright © 2023 Artificer AI. All rights reserved.
//

import Runtime

extension RiscvCmd {
    
    public class Decoder {
        public let memory: Memory
        public var address: UInt32
        public let logger: Logger
        
        public var instruction: UInt32 = 0
        
        public var addr: UInt32 = 0
        public var cnt: UInt32 = 0
        public var dst: UInt32 = 0
        public var src: UInt32 = 0
        
        public init( memory: Memory, address: UInt32, logger: Logger ) {
            self.memory = memory
            self.address = address
            self.logger = logger
        }
        
        public func decode_addr_Address_f31t16() {
            var value: UInt32 = 0
            value |= ( instruction & 0xFFFF0000 ) >> 16
            addr = value
        }
        
        public func decode_cnt_Count0000_f7t4_0000() {
            var value: UInt32 = 0
            value |= ( instruction & 0xF0 ) >> 0
            cnt = value
        }
        
        public func decode_dst_Address0000_f31t20_0000() {
            var value: UInt32 = 0
            value |= ( instruction & 0xFFF00000 ) >> 16
            dst = value
        }
        
        public func decode_src_Address0000_f19t8_0000() {
            var value: UInt32 = 0
            value |= ( instruction & 0xFFF00 ) >> 4
            src = value
        }
        
        public func fetchInstruction() -> Bool {
            guard let lowerBytes = memory.getUInt16( address: address ) else { return false }
            address += 2
            if ( lowerBytes & 0x3 ) == 0x3 {
                guard let upperBytes = memory.getUInt16( address: address ) else { return false }
                address += 2
                instruction = ( UInt32( upperBytes ) << 16 ) | UInt32( lowerBytes )
            } else {
                instruction = UInt32( lowerBytes )
            }
            return true
        }
        
        public func decodeInstruction() -> Instruction? {
            let bitPattern = instruction & 0xF
            switch bitPattern {
            case 0x0:
                if instruction & 0xFFFFFFFF == 0x0 {
                    // "ignore	"
                    return Ignore()
                }
            case 0x4:
                if instruction & 0xF == 0x4 {
                    // "copy	$dst, $src, $cnt"
                    decode_cnt_Count0000_f7t4_0000()
                    decode_dst_Address0000_f31t20_0000()
                    decode_src_Address0000_f19t8_0000()
                    return Copy( cnt: cnt, dst: dst, src: src )
                }
            case 0x5:
                if instruction & 0xFFF0F == 0x5 {
                    // "clear	$dst, $cnt"
                    decode_cnt_Count0000_f7t4_0000()
                    decode_dst_Address0000_f31t20_0000()
                    return Clear( cnt: cnt, dst: dst )
                }
            case 0x7:
                if instruction & 0xFFFF == 0x7 {
                    // "setSp	$addr"
                    decode_addr_Address_f31t16()
                    return SetSp( addr: addr )
                }
            case 0x8:
                if instruction & 0xFFFF == 0x8 {
                    // "setGp	$addr"
                    decode_addr_Address_f31t16()
                    return SetGp( addr: addr )
                }
            case 0x9:
                if instruction & 0xFFFF == 0x9 {
                    // "run	$addr"
                    decode_addr_Address_f31t16()
                    return Run( addr: addr )
                }
            default:
                return nil
            }
            
            return nil
        }
    }
}
