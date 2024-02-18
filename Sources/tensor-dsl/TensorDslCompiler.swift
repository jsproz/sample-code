//
//  TensorDslCompiler.swift
//  TensorDsl
//
//  Copyright © 2023 Artificer AI. All rights reserved.
//

import Runtime

public class TensorDslCompiler {
}

extension TensorDslCompiler {
    
    public enum TokenKind : Int {
        case unknown
        case literal
        case indent
        case dedent
        case endOfInput
        case white
        case string
        case identifier
        case integer
        case floatingPoint
        case code
    }
    
    public enum LiteralKind : Int {
        case unknown
        case literal0
        case literal1
        case literal2
        case literal3
        case literal4
        case literal5
        case literal6
        case literal7
        case literal8
        case literal9
        case literal10
        case literal11
        case literal12
        case literal13
        case literal14
        case literal15
        case literal16
        case literal17
        case literal18
        case literal19
        case literal20
        case literal21
        case literal22
        case literal23
        case literal24
    }
    
    public class Scanner {
        
        public var tabSize: Int
        
        public init( tabSize: Int = 8 ) {
            self.tabSize = tabSize
        }
        
        // "func"
        func scanLiteral0( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "func" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral0( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral0( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal0.rawValue )
            } else {
                return nil
            }
        }
        
        // "->"
        func scanLiteral1( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "->" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral1( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral1( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal1.rawValue )
            } else {
                return nil
            }
        }
        
        // "{"
        func scanLiteral2( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "{" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral2( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral2( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal2.rawValue )
            } else {
                return nil
            }
        }
        
        // "}"
        func scanLiteral3( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "}" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral3( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral3( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal3.rawValue )
            } else {
                return nil
            }
        }
        
        // "("
        func scanLiteral4( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "(" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral4( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral4( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal4.rawValue )
            } else {
                return nil
            }
        }
        
        // ","
        func scanLiteral5( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "," )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral5( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral5( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal5.rawValue )
            } else {
                return nil
            }
        }
        
        // ")"
        func scanLiteral6( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( ")" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral6( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral6( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal6.rawValue )
            } else {
                return nil
            }
        }
        
        // ":"
        func scanLiteral7( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( ":" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral7( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral7( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal7.rawValue )
            } else {
                return nil
            }
        }
        
        // "var"
        func scanLiteral8( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "var" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral8( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral8( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal8.rawValue )
            } else {
                return nil
            }
        }
        
        // "="
        func scanLiteral9( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "=" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral9( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral9( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal9.rawValue )
            } else {
                return nil
            }
        }
        
        // "["
        func scanLiteral10( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "[" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral10( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral10( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal10.rawValue )
            } else {
                return nil
            }
        }
        
        // "]"
        func scanLiteral11( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "]" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral11( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral11( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal11.rawValue )
            } else {
                return nil
            }
        }
        
        // "*"
        func scanLiteral12( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "*" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral12( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral12( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal12.rawValue )
            } else {
                return nil
            }
        }
        
        // "Int8"
        func scanLiteral13( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "Int8" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral13( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral13( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal13.rawValue )
            } else {
                return nil
            }
        }
        
        // "UInt8"
        func scanLiteral14( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "UInt8" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral14( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral14( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal14.rawValue )
            } else {
                return nil
            }
        }
        
        // "Int16"
        func scanLiteral15( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "Int16" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral15( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral15( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal15.rawValue )
            } else {
                return nil
            }
        }
        
        // "UInt16"
        func scanLiteral16( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "UInt16" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral16( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral16( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal16.rawValue )
            } else {
                return nil
            }
        }
        
        // "Int32"
        func scanLiteral17( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "Int32" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral17( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral17( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal17.rawValue )
            } else {
                return nil
            }
        }
        
        // "UInt32"
        func scanLiteral18( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "UInt32" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral18( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral18( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal18.rawValue )
            } else {
                return nil
            }
        }
        
        // "Int64"
        func scanLiteral19( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "Int64" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral19( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral19( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal19.rawValue )
            } else {
                return nil
            }
        }
        
        // "UInt64"
        func scanLiteral20( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "UInt64" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral20( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral20( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal20.rawValue )
            } else {
                return nil
            }
        }
        
        // "Float32"
        func scanLiteral21( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "Float32" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral21( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral21( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal21.rawValue )
            } else {
                return nil
            }
        }
        
        // "Float64"
        func scanLiteral22( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "Float64" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral22( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral22( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal22.rawValue )
            } else {
                return nil
            }
        }
        
        // "String"
        func scanLiteral23( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "String" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral23( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral23( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal23.rawValue )
            } else {
                return nil
            }
        }
        
        // "?"
        func scanLiteral24( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "?" )
            if matchStringAndPosition.matches {
                buffer.position = matchStringAndPosition.newIndex
            }
            return matchStringAndPosition.matches
        }
        
        func getTokenLiteral24( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanLiteral24( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.literal.rawValue, literalKind: LiteralKind.literal24.rawValue )
            } else {
                return nil
            }
        }
        
        // ""
        func scanSetEmpty( buffer : TokenList ) -> Bool {
            if !buffer.isAtBreak {
                return false
            } else {
                return true
            }
        }
        
        // ~""
        func scanNotSetEmpty( buffer : TokenList ) -> Bool {
            if ( !buffer.isAtBreak ) {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
            return false
        }
        
        // U+0009,U+0020
        func scanSet0( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 9 || unicodeScalarValue == 32 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0009,U+0020
        func scanNotSet0( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet0( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0009,U+0020
        func scanSet0( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet0( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0009,U+0020
        func scanSet0( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet0( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+000D
        func scanSet1( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 13 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+000D
        func scanNotSet1( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet1( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+000D
        func scanSet1( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet1( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+000D
        func scanSet1( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet1( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+000A
        func scanSet2( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 10 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+000A
        func scanNotSet2( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet2( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+000A
        func scanSet2( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet2( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+000A
        func scanSet2( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet2( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002F
        func scanSet3( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 47 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+002F
        func scanNotSet3( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet3( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+002F
        func scanSet3( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet3( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002F
        func scanSet3( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet3( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+000A,U+000D
        func scanSet4( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 10 || unicodeScalarValue == 13 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+000A,U+000D
        func scanNotSet4( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet4( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+000A,U+000D
        func scanSet4( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet4( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+000A,U+000D
        func scanSet4( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet4( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002A
        func scanSet5( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 42 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+002A
        func scanNotSet5( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet5( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+002A
        func scanSet5( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet5( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002A
        func scanSet5( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet5( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0022
        func scanSet6( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 34 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0022
        func scanNotSet6( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet6( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0022
        func scanSet6( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet6( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0022
        func scanSet6( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet6( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+000A,U+000D,U+0022,U+005C
        func scanSet7( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 10 || unicodeScalarValue == 13 || unicodeScalarValue == 34 || unicodeScalarValue == 92 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+000A,U+000D,U+0022,U+005C
        func scanNotSet7( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet7( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+000A,U+000D,U+0022,U+005C
        func scanSet7( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet7( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+000A,U+000D,U+0022,U+005C
        func scanSet7( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet7( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+005C
        func scanSet8( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 92 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+005C
        func scanNotSet8( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet8( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+005C
        func scanSet8( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet8( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+005C
        func scanSet8( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet8( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0075
        func scanSet9( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 117 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0075
        func scanNotSet9( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet9( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0075
        func scanSet9( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet9( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0075
        func scanSet9( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet9( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+007B
        func scanSet10( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 123 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+007B
        func scanNotSet10( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet10( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+007B
        func scanSet10( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet10( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+007B
        func scanSet10( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet10( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+007D
        func scanSet11( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 125 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+007D
        func scanNotSet11( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet11( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+007D
        func scanSet11( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet11( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+007D
        func scanSet11( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet11( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0030-U+0039,U+0041-U+0046,U+0061-U+0066
        func scanSet12( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if ( unicodeScalarValue <= 57 && unicodeScalarValue >= 48 ) || ( unicodeScalarValue <= 70 && unicodeScalarValue >= 65 ) || ( unicodeScalarValue <= 102 && unicodeScalarValue >= 97 ) {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0030-U+0039,U+0041-U+0046,U+0061-U+0066
        func scanNotSet12( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet12( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0030-U+0039,U+0041-U+0046,U+0061-U+0066
        func scanSet12( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet12( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0030-U+0039,U+0041-U+0046,U+0061-U+0066
        func scanSet12( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet12( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0022,U+0027,U+0030,U+005C,U+006E,U+0072,U+0074
        func scanSet13( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 34 || unicodeScalarValue == 39 || unicodeScalarValue == 48 || unicodeScalarValue == 92 || unicodeScalarValue == 110 || unicodeScalarValue == 114 || unicodeScalarValue == 116 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0022,U+0027,U+0030,U+005C,U+006E,U+0072,U+0074
        func scanNotSet13( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet13( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0022,U+0027,U+0030,U+005C,U+006E,U+0072,U+0074
        func scanSet13( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet13( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0022,U+0027,U+0030,U+005C,U+006E,U+0072,U+0074
        func scanSet13( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet13( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0041-U+005A,U+005F,U+0061-U+007A
        func scanSet14( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if ( unicodeScalarValue <= 90 && unicodeScalarValue >= 65 ) || unicodeScalarValue == 95 || ( unicodeScalarValue <= 122 && unicodeScalarValue >= 97 ) {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0041-U+005A,U+005F,U+0061-U+007A
        func scanNotSet14( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet14( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0041-U+005A,U+005F,U+0061-U+007A
        func scanSet14( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet14( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0041-U+005A,U+005F,U+0061-U+007A
        func scanSet14( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet14( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002F-U+0039,U+0041-U+005A,U+005F,U+0061-U+007A
        func scanSet15( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if ( unicodeScalarValue <= 57 && unicodeScalarValue >= 47 ) || ( unicodeScalarValue <= 90 && unicodeScalarValue >= 65 ) || unicodeScalarValue == 95 || ( unicodeScalarValue <= 122 && unicodeScalarValue >= 97 ) {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+002F-U+0039,U+0041-U+005A,U+005F,U+0061-U+007A
        func scanNotSet15( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet15( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+002F-U+0039,U+0041-U+005A,U+005F,U+0061-U+007A
        func scanSet15( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet15( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002F-U+0039,U+0041-U+005A,U+005F,U+0061-U+007A
        func scanSet15( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet15( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+003A
        func scanSet16( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 58 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+003A
        func scanNotSet16( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet16( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+003A
        func scanSet16( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet16( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+003A
        func scanSet16( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet16( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002D
        func scanSet17( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 45 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+002D
        func scanNotSet17( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet17( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+002D
        func scanSet17( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet17( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002D
        func scanSet17( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet17( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0030
        func scanSet18( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 48 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0030
        func scanNotSet18( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet18( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0030
        func scanSet18( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet18( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0030
        func scanSet18( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet18( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0031-U+0039
        func scanSet19( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if ( unicodeScalarValue <= 57 && unicodeScalarValue >= 49 ) {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0031-U+0039
        func scanNotSet19( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet19( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0031-U+0039
        func scanSet19( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet19( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0031-U+0039
        func scanSet19( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet19( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002E
        func scanSet20( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 46 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+002E
        func scanNotSet20( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet20( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+002E
        func scanSet20( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet20( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002E
        func scanSet20( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet20( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0045,U+0065
        func scanSet21( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 69 || unicodeScalarValue == 101 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0045,U+0065
        func scanNotSet21( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet21( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0045,U+0065
        func scanSet21( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet21( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0045,U+0065
        func scanSet21( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet21( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002B,U+002D
        func scanSet22( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 43 || unicodeScalarValue == 45 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+002B,U+002D
        func scanNotSet22( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet22( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+002B,U+002D
        func scanSet22( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet22( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+002B,U+002D
        func scanSet22( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet22( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0030-U+0039
        func scanSet23( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if ( unicodeScalarValue <= 57 && unicodeScalarValue >= 48 ) {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0030-U+0039
        func scanNotSet23( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet23( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0030-U+0039
        func scanSet23( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet23( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0030-U+0039
        func scanSet23( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet23( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+005B
        func scanSet24( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 91 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+005B
        func scanNotSet24( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet24( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+005B
        func scanSet24( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet24( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+005B
        func scanSet24( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet24( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0028
        func scanSet25( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 40 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0028
        func scanNotSet25( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet25( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0028
        func scanSet25( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet25( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0028
        func scanSet25( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet25( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0029
        func scanSet26( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 41 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+0029
        func scanNotSet26( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet26( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+0029
        func scanSet26( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet26( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+0029
        func scanSet26( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet26( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+005D
        func scanSet27( buffer : TokenList ) -> Bool {
            if ( buffer.isAtBreak ) {
                return false
            }
            let position = buffer.position
            let unicodeScalarValue = buffer.getUnicodeScalar().value
            if unicodeScalarValue == 93 {
                return true
            }
            buffer.position = position
            return false
        }
        
        // ~U+005D
        func scanNotSet27( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            if scanSet27( buffer: buffer ) {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        // U+005D
        func scanSet27( buffer : TokenList, minimum : Int ) -> Bool {
            let position = buffer.position
            var count = 0;
            while scanSet27( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        // U+005D
        func scanSet27( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let position = buffer.position
            var count = 0
            while count < maximum && scanSet27( buffer: buffer ) {
                count += 1
            }
            if count < minimum {
                buffer.position = position
                return false
            }
            return true
        }
        
        func scanWhite( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanWhiteSpace( buffer: buffer, minimum: 1 )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotWhite( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanWhite( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanWhite( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanWhite( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanWhite( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanWhite( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanWhiteSpace( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanWhiteCharacter( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanMultipleLineComment( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanSingleLineComment( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotWhiteSpace( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanWhiteSpace( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanWhiteSpace( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanWhiteSpace( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanWhiteSpace( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanWhiteSpace( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanWhiteCharacter( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet0( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanNewLine( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotWhiteCharacter( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanWhiteCharacter( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanWhiteCharacter( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanWhiteCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanWhiteCharacter( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanWhiteCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanNewLine( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet1( buffer: buffer ) && scanSet2( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanSet1( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanSet2( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotNewLine( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanNewLine( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanNewLine( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanNewLine( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanNewLine( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanNewLine( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanSingleLineComment( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet3( buffer: buffer ) && scanSet3( buffer: buffer ) && scanSingleLineCommentElement( buffer: buffer, minimum: 0 )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotSingleLineComment( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanSingleLineComment( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanSingleLineComment( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanSingleLineComment( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanSingleLineComment( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanSingleLineComment( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanSingleLineCommentElement( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanNotSet4( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotSingleLineCommentElement( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanSingleLineCommentElement( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanSingleLineCommentElement( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanSingleLineCommentElement( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanSingleLineCommentElement( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanSingleLineCommentElement( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanMultipleLineComment( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet3( buffer: buffer ) && scanSet5( buffer: buffer ) && scanMultipleLineCommentElement( buffer: buffer, minimum: 0 ) && scanMultipleLineCommentEnd( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotMultipleLineComment( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanMultipleLineComment( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanMultipleLineComment( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanMultipleLineComment( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanMultipleLineComment( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanMultipleLineComment( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanMultipleLineCommentElement( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanNotNonmultipleLineCommentElement( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanMultipleLineComment( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotMultipleLineCommentElement( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanMultipleLineCommentElement( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanMultipleLineCommentElement( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanMultipleLineCommentElement( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanMultipleLineCommentElement( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanMultipleLineCommentElement( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanNonmultipleLineCommentElement( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanMultipleLineCommentEnd( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanMultipleLineComment( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotNonmultipleLineCommentElement( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanNonmultipleLineCommentElement( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanNonmultipleLineCommentElement( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanNonmultipleLineCommentElement( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanNonmultipleLineCommentElement( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanNonmultipleLineCommentElement( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanMultipleLineCommentEnd( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet5( buffer: buffer ) && scanSet3( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotMultipleLineCommentEnd( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanMultipleLineCommentEnd( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanMultipleLineCommentEnd( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanMultipleLineCommentEnd( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanMultipleLineCommentEnd( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanMultipleLineCommentEnd( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanString( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet6( buffer: buffer ) && scanQuotedTextItem( buffer: buffer, minimum: 0 ) && scanSet6( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotString( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanString( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanString( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanString( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanString( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanString( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanQuotedTextItem( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanQuotedTextItemCharacter( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanEscapedCharacter( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotQuotedTextItem( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanQuotedTextItem( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanQuotedTextItem( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanQuotedTextItem( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanQuotedTextItem( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanQuotedTextItem( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanQuotedTextItemCharacter( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanNotNonquotedTextItemCharacter( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotQuotedTextItemCharacter( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanQuotedTextItemCharacter( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanQuotedTextItemCharacter( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanQuotedTextItemCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanQuotedTextItemCharacter( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanQuotedTextItemCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanNonquotedTextItemCharacter( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet7( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotNonquotedTextItemCharacter( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanNonquotedTextItemCharacter( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanNonquotedTextItemCharacter( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanNonquotedTextItemCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanNonquotedTextItemCharacter( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanNonquotedTextItemCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanEscapedCharacter( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanEscapedUnicodeScalar( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanEscapedCCharacter( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotEscapedCharacter( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanEscapedCharacter( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanEscapedCharacter( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanEscapedCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanEscapedCharacter( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanEscapedCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanEscapedUnicodeScalar( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet8( buffer: buffer ) && scanSet9( buffer: buffer ) && scanSet10( buffer: buffer ) && scanUnicodeScalarDigit( buffer: buffer, minimum: 1, maximum: 8 ) && scanSet11( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotEscapedUnicodeScalar( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanEscapedUnicodeScalar( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanEscapedUnicodeScalar( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanEscapedUnicodeScalar( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanEscapedUnicodeScalar( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanEscapedUnicodeScalar( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanUnicodeScalarDigit( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet12( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotUnicodeScalarDigit( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanUnicodeScalarDigit( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanUnicodeScalarDigit( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanUnicodeScalarDigit( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanUnicodeScalarDigit( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanUnicodeScalarDigit( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanEscapedCCharacter( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet8( buffer: buffer ) && scanSet13( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotEscapedCCharacter( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanEscapedCCharacter( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanEscapedCCharacter( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanEscapedCCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanEscapedCCharacter( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanEscapedCCharacter( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanIdentifier( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet14( buffer: buffer ) && scanIdentifierFollower( buffer: buffer, minimum: 0 )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotIdentifier( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanIdentifier( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanIdentifier( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanIdentifier( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanIdentifier( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanIdentifier( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanIdentifierFollower( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet15( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanColonInteger( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotIdentifierFollower( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanIdentifierFollower( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanIdentifierFollower( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanIdentifierFollower( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanIdentifierFollower( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanIdentifierFollower( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanColonInteger( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet16( buffer: buffer ) && scanDigit( buffer: buffer, minimum: 1 )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotColonInteger( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanColonInteger( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanColonInteger( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanColonInteger( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanColonInteger( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanColonInteger( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanInteger( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet17( buffer: buffer, minimum: 0, maximum: 1 ) && scanSet18( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanSet17( buffer: buffer, minimum: 0, maximum: 1 ) && scanSet19( buffer: buffer ) && scanDigit( buffer: buffer, minimum: 0 )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotInteger( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanInteger( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanInteger( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanInteger( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanInteger( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanInteger( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanFloatingPoint( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet17( buffer: buffer, minimum: 0, maximum: 1 ) && scanFractionalConstant( buffer: buffer ) && scanExponentPart( buffer: buffer, minimum: 0, maximum: 1 )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanSet17( buffer: buffer, minimum: 0, maximum: 1 ) && scanDigitSequence( buffer: buffer ) && scanExponentPart( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotFloatingPoint( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanFloatingPoint( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanFloatingPoint( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanFloatingPoint( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanFloatingPoint( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanFloatingPoint( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanFractionalConstant( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanDigitSequence( buffer: buffer, minimum: 0, maximum: 1 ) && scanSet20( buffer: buffer ) && scanDigitSequence( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            
            if !matches {
                matches = scanDigitSequence( buffer: buffer ) && scanSet20( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotFractionalConstant( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanFractionalConstant( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanFractionalConstant( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanFractionalConstant( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanFractionalConstant( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanFractionalConstant( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanExponentPart( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet21( buffer: buffer ) && scanSet22( buffer: buffer, minimum: 0, maximum: 1 ) && scanDigitSequence( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotExponentPart( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanExponentPart( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanExponentPart( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanExponentPart( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanExponentPart( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanExponentPart( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanDigitSequence( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanDigit( buffer: buffer, minimum: 1 )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotDigitSequence( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanDigitSequence( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanDigitSequence( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanDigitSequence( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanDigitSequence( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanDigitSequence( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanDigit( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet23( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotDigit( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanDigit( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanDigit( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanDigit( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanDigit( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanDigit( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanCode( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanCodeStart( buffer: buffer ) && scanCodeElement( buffer: buffer, minimum: 0 ) && scanCodeEnd( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotCode( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanCode( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanCode( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanCode( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanCode( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanCode( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanCodeStart( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet24( buffer: buffer ) && scanSet25( buffer: buffer ) && scanSet2( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotCodeStart( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanCodeStart( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanCodeStart( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanCodeStart( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanCodeStart( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanCodeStart( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanCodeEnd( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet26( buffer: buffer ) && scanSet27( buffer: buffer ) && scanSet2( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotCodeEnd( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanCodeEnd( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanCodeEnd( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanCodeEnd( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanCodeEnd( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanCodeEnd( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanCodeElement( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanNotCodeEnd( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotCodeElement( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanCodeElement( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanCodeElement( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanCodeElement( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func scanCodeElement( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanCodeElement( buffer: buffer ) {
                count += 1
                if count >= minimum && buffer.position == position {
                    break
                }
                position = buffer.position
            }
            if count < minimum {
                buffer.position = originalPosition
                return false
            }
            return true
        }
        
        func getTokenWhite( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanWhite( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.white.rawValue )
            } else {
                return nil
            }
        }
        
        func getTokenString( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanString( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.string.rawValue )
            } else {
                return nil
            }
        }
        
        func getTokenIdentifier( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanIdentifier( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.identifier.rawValue )
            } else {
                return nil
            }
        }
        
        func getTokenInteger( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanInteger( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.integer.rawValue )
            } else {
                return nil
            }
        }
        
        func getTokenFloatingPoint( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanFloatingPoint( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.floatingPoint.rawValue )
            } else {
                return nil
            }
        }
        
        func getTokenCode( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanCode( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.code.rawValue )
            } else {
                return nil
            }
        }
        
        func getTriviaToken( buffer : TokenList ) -> Token? {
            var token : Token? = nil
            if !buffer.isAtBreak {
                let originalPosition = buffer.position
                var maximumPosition = 0
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenWhite( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                if maximumPosition > 0 {
                    buffer.position = maximumPosition
                }
            }
            return token
        }
        
        func getTrivia( buffer : TokenList ) -> [Token] {
            var trivia = [Token]()
            
            var token: Token? = getTriviaToken( buffer: buffer )
            
            while token != nil {
                buffer.update()
                
                trivia.append( token! )
                token = getTriviaToken( buffer: buffer )
            }
            
            return trivia
        }
        
        func getNextToken( buffer : TokenList ) -> Token? {
            var token : Token? = nil
            if !buffer.isAtBreak {
                let originalPosition = buffer.position
                var maximumPosition = 0
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral0( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral1( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral2( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral3( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral4( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral5( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral6( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral7( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral8( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral9( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral10( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral11( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral12( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral13( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral14( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral15( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral16( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral17( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral18( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral19( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral20( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral21( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral22( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral23( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenLiteral24( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenString( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenIdentifier( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenInteger( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenFloatingPoint( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenCode( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                if maximumPosition > 0 {
                    buffer.position = maximumPosition
                }
            }
            return token
        }
        
        func getToken( buffer : TokenList ) -> Token? {
            if buffer.isAtBreak {
                return nil
            }
            
            let originalPosition = buffer.position
            var token = getNextToken( buffer: buffer )
            if token == nil {
                while !buffer.isAtBreak {
                    _ = buffer.getUnicodeScalar()
                    let previousPosition = buffer.position
                    token = getNextToken( buffer: buffer )
                    if token != nil {
                        buffer.position = previousPosition
                        break
                    }
                }
                token = buffer.getToken( beginPosition: originalPosition, tokenKind: TokenKind.unknown.rawValue, literalKind: LiteralKind.unknown.rawValue )
            }
            
            buffer.update()
            
            return token
        }
        
        public func getTokenList( buffer : TokenList ) -> TokenList {
            let tokenList = TokenList( tabSize: tabSize )
            
            var currentTrivia: [Token]
            
            while !buffer.isAtEnd {
                currentTrivia = getTrivia( buffer: buffer )
                if let token = getToken( buffer: buffer ) {
                    token.trivia = currentTrivia
                    tokenList.append( token )
                }
            }
            
            currentTrivia = getTrivia( buffer: buffer )
            let endOfInputToken = buffer.getToken( beginPosition: buffer.position, tokenKind: TokenKind.endOfInput.rawValue, literalKind: LiteralKind.unknown.rawValue )
            endOfInputToken.trivia = currentTrivia
            tokenList.append( endOfInputToken )
            
            if tokenList.tokens.count > 0 {
                tokenList.position = tokenList.tokens.first!.position
                tokenList.updatePosition = tokenList.tokens.first!.position
                tokenList.line = tokenList.tokens.first!.line
                tokenList.column = tokenList.tokens.first!.column
            }
            
            return tokenList;
        }
        
        public func getTokenListWithIndents( buffer : TokenList ) -> TokenList {
            let filter : [Int] = [ TokenKind.white.rawValue ]
            let tokens = Tokens( filter: filter, tabSize: tabSize )
            
            while !buffer.isAtEnd {
                if let token = getToken( buffer: buffer ) {
                    tokens.nextToken( token )
                }
            }
            
            tokens.inputEnd()
            
            if tokens.tokenList.tokens.count > 0 {
                tokens.tokenList.position = tokens.tokenList.tokens.first!.position
                tokens.tokenList.updatePosition = tokens.tokenList.tokens.first!.position
                tokens.tokenList.line = tokens.tokenList.tokens.first!.line
                tokens.tokenList.column = tokens.tokenList.tokens.first!.column
            }
            
            return tokens.tokenList
        }
    }
} // extension TensorDsl

extension TensorDslCompiler {
    
    public class Parser {
        var maximumIndex: Int = 0
        
        public init() {}
        
        func parse( literalValue: String, index: Int, tokenList: TokenList ) -> ( matches: Bool, index: Int )
        {
            if ( index < tokenList.count ) {
                let token: Token = tokenList[ index ]
                if ( token.tokenKind == TokenKind.literal.rawValue && token.text == literalValue ) {
                    if maximumIndex < index {
                        maximumIndex = index
                    }
                    let newIndex = index + 1
                    return ( true, newIndex )
                }
            }
            
            return ( false, index )
        }
        
        func parse( literalKind: LiteralKind, index: Int, tokenList: TokenList ) -> ( token: Token?, index: Int )
        {
            if ( index < tokenList.count ) {
                let token: Token = tokenList[ index ]
                if ( token.literalKind == literalKind.rawValue ) {
                    if maximumIndex < index {
                        maximumIndex = index
                    }
                    let newIndex = index + 1
                    return ( token, newIndex )
                }
            }
            
            return ( nil, index )
        }
        
        func parse( tokenKind: TokenKind, index: Int, tokenList: TokenList ) -> ( token: Token?, index: Int )
        {
            if ( index < tokenList.count ) {
                let token: Token = tokenList[ index ]
                if ( token.tokenKind == tokenKind.rawValue ) {
                    if maximumIndex < index {
                        maximumIndex = index
                    }
                    let newIndex = index + 1
                    return ( token, newIndex )
                }
            }
            
            return ( nil, index )
        }
        
        func parse( index: Int, tokenList: TokenList ) -> ( token: Token?, index: Int )
        {
            if ( index < tokenList.count ) {
                let token: Token = tokenList[ index ]
                if ( token.tokenKind != TokenKind.endOfInput.rawValue ) {
                    if maximumIndex < index {
                        maximumIndex = index
                    }
                    let newIndex = index + 1
                    return ( token, newIndex )
                }
            }
            
            return ( nil, index )
        }
        
        func parseFunctionName( index: Int, tokenList: TokenList ) -> ( node: Transformer.FunctionName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.FunctionName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseKernelName( index: Int, tokenList: TokenList ) -> ( node: Transformer.KernelName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.KernelName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseCode( index: Int, tokenList: TokenList ) -> ( node: Transformer.Code?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.code, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Code( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseInputName( index: Int, tokenList: TokenList ) -> ( node: Transformer.InputName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.InputName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseOutputName( index: Int, tokenList: TokenList ) -> ( node: Transformer.OutputName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.OutputName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseVariableName( index: Int, tokenList: TokenList ) -> ( node: Transformer.VariableName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.VariableName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseResult( index: Int, tokenList: TokenList ) -> ( node: Transformer.Result?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Result( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseOperationName( index: Int, tokenList: TokenList ) -> ( node: Transformer.OperationName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.OperationName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseArgument( index: Int, tokenList: TokenList ) -> ( node: Transformer.Argument?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Argument( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseFixedDimension( index: Int, tokenList: TokenList ) -> ( node: Transformer.FixedDimension?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.integer, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.FixedDimension( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseVariableDimension( index: Int, tokenList: TokenList ) -> ( node: Transformer.VariableDimension?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.VariableDimension( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseAttributeKey( index: Int, tokenList: TokenList ) -> ( node: Transformer.AttributeKey?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.AttributeKey( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseInteger( index: Int, tokenList: TokenList ) -> ( node: Transformer.Integer?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.integer, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Integer( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseFloatingPoint( index: Int, tokenList: TokenList ) -> ( node: Transformer.FloatingPoint?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.floatingPoint, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.FloatingPoint( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseStringValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.StringValue?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.string, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.StringValue( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseFunctionReferenceName( index: Int, tokenList: TokenList ) -> ( node: Transformer.FunctionReferenceName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.FunctionReferenceName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseVariableReferenceValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.VariableReferenceValue?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.identifier, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.VariableReferenceValue( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseStatement( index: Int, tokenList: TokenList ) -> ( node: Transformer.Statement?, index: Int ) {
            var result: ( node: Transformer.Statement?, index: Int )? = nil
            
            let variableAtIndex = parseVariable( index: index, tokenList: tokenList )
            let variable = variableAtIndex.node
            if variable != nil && ( result == nil || result!.index < variableAtIndex.index ) {
                let newIndex = variableAtIndex.index
                result = ( Transformer.Statement( variable: variable! ), newIndex )
            }
            
            let operationAtIndex = parseOperation( index: index, tokenList: tokenList )
            let operation = operationAtIndex.node
            if operation != nil && ( result == nil || result!.index < operationAtIndex.index ) {
                let newIndex = operationAtIndex.index
                result = ( Transformer.Statement( operation: operation! ), newIndex )
            }
            
            let functionAtIndex = parseFunction( index: index, tokenList: tokenList )
            let function = functionAtIndex.node
            if function != nil && ( result == nil || result!.index < functionAtIndex.index ) {
                let newIndex = functionAtIndex.index
                result = ( Transformer.Statement( function: function! ), newIndex )
            }
            
            let kernelAtIndex = parseKernel( index: index, tokenList: tokenList )
            let kernel = kernelAtIndex.node
            if kernel != nil && ( result == nil || result!.index < kernelAtIndex.index ) {
                let newIndex = kernelAtIndex.index
                result = ( Transformer.Statement( kernel: kernel! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseArgumentOrAttribute( index: Int, tokenList: TokenList ) -> ( node: Transformer.ArgumentOrAttribute?, index: Int ) {
            var result: ( node: Transformer.ArgumentOrAttribute?, index: Int )? = nil
            
            let attributeAtIndex = parseAttribute( index: index, tokenList: tokenList )
            let attribute = attributeAtIndex.node
            if attribute != nil && ( result == nil || result!.index < attributeAtIndex.index ) {
                let newIndex = attributeAtIndex.index
                result = ( Transformer.ArgumentOrAttribute( attribute: attribute! ), newIndex )
            }
            
            let argumentAtIndex = parseArgument( index: index, tokenList: tokenList )
            let argument = argumentAtIndex.node
            if argument != nil && ( result == nil || result!.index < argumentAtIndex.index ) {
                let newIndex = argumentAtIndex.index
                result = ( Transformer.ArgumentOrAttribute( argument: argument! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseConstantValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.ConstantValue?, index: Int ) {
            var result: ( node: Transformer.ConstantValue?, index: Int )? = nil
            
            let numberValueAtIndex = parseNumberValue( index: index, tokenList: tokenList )
            let numberValue = numberValueAtIndex.node
            if numberValue != nil && ( result == nil || result!.index < numberValueAtIndex.index ) {
                let newIndex = numberValueAtIndex.index
                result = ( Transformer.ConstantValue( numberValue: numberValue! ), newIndex )
            }
            
            let tensorValueAtIndex = parseTensorValue( index: index, tokenList: tokenList )
            let tensorValue = tensorValueAtIndex.node
            if tensorValue != nil && ( result == nil || result!.index < tensorValueAtIndex.index ) {
                let newIndex = tensorValueAtIndex.index
                result = ( Transformer.ConstantValue( tensorValue: tensorValue! ), newIndex )
            }
            
            let stringValueAtIndex = parseStringValue( index: index, tokenList: tokenList )
            let stringValue = stringValueAtIndex.node
            if stringValue != nil && ( result == nil || result!.index < stringValueAtIndex.index ) {
                let newIndex = stringValueAtIndex.index
                result = ( Transformer.ConstantValue( stringValue: stringValue! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseElementKind( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKind?, index: Int ) {
            var result: ( node: Transformer.ElementKind?, index: Int )? = nil
            
            let elementKindInt8AtIndex = parseElementKindInt8( index: index, tokenList: tokenList )
            let elementKindInt8 = elementKindInt8AtIndex.node
            if elementKindInt8 != nil && ( result == nil || result!.index < elementKindInt8AtIndex.index ) {
                let newIndex = elementKindInt8AtIndex.index
                result = ( Transformer.ElementKind( elementKindInt8: elementKindInt8! ), newIndex )
            }
            
            let elementKindUInt8AtIndex = parseElementKindUInt8( index: index, tokenList: tokenList )
            let elementKindUInt8 = elementKindUInt8AtIndex.node
            if elementKindUInt8 != nil && ( result == nil || result!.index < elementKindUInt8AtIndex.index ) {
                let newIndex = elementKindUInt8AtIndex.index
                result = ( Transformer.ElementKind( elementKindUInt8: elementKindUInt8! ), newIndex )
            }
            
            let elementKindInt16AtIndex = parseElementKindInt16( index: index, tokenList: tokenList )
            let elementKindInt16 = elementKindInt16AtIndex.node
            if elementKindInt16 != nil && ( result == nil || result!.index < elementKindInt16AtIndex.index ) {
                let newIndex = elementKindInt16AtIndex.index
                result = ( Transformer.ElementKind( elementKindInt16: elementKindInt16! ), newIndex )
            }
            
            let elementKindUInt16AtIndex = parseElementKindUInt16( index: index, tokenList: tokenList )
            let elementKindUInt16 = elementKindUInt16AtIndex.node
            if elementKindUInt16 != nil && ( result == nil || result!.index < elementKindUInt16AtIndex.index ) {
                let newIndex = elementKindUInt16AtIndex.index
                result = ( Transformer.ElementKind( elementKindUInt16: elementKindUInt16! ), newIndex )
            }
            
            let elementKindInt32AtIndex = parseElementKindInt32( index: index, tokenList: tokenList )
            let elementKindInt32 = elementKindInt32AtIndex.node
            if elementKindInt32 != nil && ( result == nil || result!.index < elementKindInt32AtIndex.index ) {
                let newIndex = elementKindInt32AtIndex.index
                result = ( Transformer.ElementKind( elementKindInt32: elementKindInt32! ), newIndex )
            }
            
            let elementKindUInt32AtIndex = parseElementKindUInt32( index: index, tokenList: tokenList )
            let elementKindUInt32 = elementKindUInt32AtIndex.node
            if elementKindUInt32 != nil && ( result == nil || result!.index < elementKindUInt32AtIndex.index ) {
                let newIndex = elementKindUInt32AtIndex.index
                result = ( Transformer.ElementKind( elementKindUInt32: elementKindUInt32! ), newIndex )
            }
            
            let elementKindInt64AtIndex = parseElementKindInt64( index: index, tokenList: tokenList )
            let elementKindInt64 = elementKindInt64AtIndex.node
            if elementKindInt64 != nil && ( result == nil || result!.index < elementKindInt64AtIndex.index ) {
                let newIndex = elementKindInt64AtIndex.index
                result = ( Transformer.ElementKind( elementKindInt64: elementKindInt64! ), newIndex )
            }
            
            let elementKindUInt64AtIndex = parseElementKindUInt64( index: index, tokenList: tokenList )
            let elementKindUInt64 = elementKindUInt64AtIndex.node
            if elementKindUInt64 != nil && ( result == nil || result!.index < elementKindUInt64AtIndex.index ) {
                let newIndex = elementKindUInt64AtIndex.index
                result = ( Transformer.ElementKind( elementKindUInt64: elementKindUInt64! ), newIndex )
            }
            
            let elementKindFloat32AtIndex = parseElementKindFloat32( index: index, tokenList: tokenList )
            let elementKindFloat32 = elementKindFloat32AtIndex.node
            if elementKindFloat32 != nil && ( result == nil || result!.index < elementKindFloat32AtIndex.index ) {
                let newIndex = elementKindFloat32AtIndex.index
                result = ( Transformer.ElementKind( elementKindFloat32: elementKindFloat32! ), newIndex )
            }
            
            let elementKindFloat64AtIndex = parseElementKindFloat64( index: index, tokenList: tokenList )
            let elementKindFloat64 = elementKindFloat64AtIndex.node
            if elementKindFloat64 != nil && ( result == nil || result!.index < elementKindFloat64AtIndex.index ) {
                let newIndex = elementKindFloat64AtIndex.index
                result = ( Transformer.ElementKind( elementKindFloat64: elementKindFloat64! ), newIndex )
            }
            
            let elementKindStringAtIndex = parseElementKindString( index: index, tokenList: tokenList )
            let elementKindString = elementKindStringAtIndex.node
            if elementKindString != nil && ( result == nil || result!.index < elementKindStringAtIndex.index ) {
                let newIndex = elementKindStringAtIndex.index
                result = ( Transformer.ElementKind( elementKindString: elementKindString! ), newIndex )
            }
            
            let elementKindUnknownAtIndex = parseElementKindUnknown( index: index, tokenList: tokenList )
            let elementKindUnknown = elementKindUnknownAtIndex.node
            if elementKindUnknown != nil && ( result == nil || result!.index < elementKindUnknownAtIndex.index ) {
                let newIndex = elementKindUnknownAtIndex.index
                result = ( Transformer.ElementKind( elementKindUnknown: elementKindUnknown! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseDimension( index: Int, tokenList: TokenList ) -> ( node: Transformer.Dimension?, index: Int ) {
            var result: ( node: Transformer.Dimension?, index: Int )? = nil
            
            let fixedDimensionAtIndex = parseFixedDimension( index: index, tokenList: tokenList )
            let fixedDimension = fixedDimensionAtIndex.node
            if fixedDimension != nil && ( result == nil || result!.index < fixedDimensionAtIndex.index ) {
                let newIndex = fixedDimensionAtIndex.index
                result = ( Transformer.Dimension( fixedDimension: fixedDimension! ), newIndex )
            }
            
            let variableDimensionAtIndex = parseVariableDimension( index: index, tokenList: tokenList )
            let variableDimension = variableDimensionAtIndex.node
            if variableDimension != nil && ( result == nil || result!.index < variableDimensionAtIndex.index ) {
                let newIndex = variableDimensionAtIndex.index
                result = ( Transformer.Dimension( variableDimension: variableDimension! ), newIndex )
            }
            
            let unknownDimensionAtIndex = parseUnknownDimension( index: index, tokenList: tokenList )
            let unknownDimension = unknownDimensionAtIndex.node
            if unknownDimension != nil && ( result == nil || result!.index < unknownDimensionAtIndex.index ) {
                let newIndex = unknownDimensionAtIndex.index
                result = ( Transformer.Dimension( unknownDimension: unknownDimension! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseAttributeValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.AttributeValue?, index: Int ) {
            var result: ( node: Transformer.AttributeValue?, index: Int )? = nil
            
            let integerArrayValueAtIndex = parseIntegerArrayValue( index: index, tokenList: tokenList )
            let integerArrayValue = integerArrayValueAtIndex.node
            if integerArrayValue != nil && ( result == nil || result!.index < integerArrayValueAtIndex.index ) {
                let newIndex = integerArrayValueAtIndex.index
                result = ( Transformer.AttributeValue( integerArrayValue: integerArrayValue! ), newIndex )
            }
            
            let floatingPointArrayValueAtIndex = parseFloatingPointArrayValue( index: index, tokenList: tokenList )
            let floatingPointArrayValue = floatingPointArrayValueAtIndex.node
            if floatingPointArrayValue != nil && ( result == nil || result!.index < floatingPointArrayValueAtIndex.index ) {
                let newIndex = floatingPointArrayValueAtIndex.index
                result = ( Transformer.AttributeValue( floatingPointArrayValue: floatingPointArrayValue! ), newIndex )
            }
            
            let stringArrayValueAtIndex = parseStringArrayValue( index: index, tokenList: tokenList )
            let stringArrayValue = stringArrayValueAtIndex.node
            if stringArrayValue != nil && ( result == nil || result!.index < stringArrayValueAtIndex.index ) {
                let newIndex = stringArrayValueAtIndex.index
                result = ( Transformer.AttributeValue( stringArrayValue: stringArrayValue! ), newIndex )
            }
            
            let integerAtIndex = parseInteger( index: index, tokenList: tokenList )
            let integer = integerAtIndex.node
            if integer != nil && ( result == nil || result!.index < integerAtIndex.index ) {
                let newIndex = integerAtIndex.index
                result = ( Transformer.AttributeValue( integer: integer! ), newIndex )
            }
            
            let floatingPointAtIndex = parseFloatingPoint( index: index, tokenList: tokenList )
            let floatingPoint = floatingPointAtIndex.node
            if floatingPoint != nil && ( result == nil || result!.index < floatingPointAtIndex.index ) {
                let newIndex = floatingPointAtIndex.index
                result = ( Transformer.AttributeValue( floatingPoint: floatingPoint! ), newIndex )
            }
            
            let stringValueAtIndex = parseStringValue( index: index, tokenList: tokenList )
            let stringValue = stringValueAtIndex.node
            if stringValue != nil && ( result == nil || result!.index < stringValueAtIndex.index ) {
                let newIndex = stringValueAtIndex.index
                result = ( Transformer.AttributeValue( stringValue: stringValue! ), newIndex )
            }
            
            let functionReferenceValueAtIndex = parseFunctionReferenceValue( index: index, tokenList: tokenList )
            let functionReferenceValue = functionReferenceValueAtIndex.node
            if functionReferenceValue != nil && ( result == nil || result!.index < functionReferenceValueAtIndex.index ) {
                let newIndex = functionReferenceValueAtIndex.index
                result = ( Transformer.AttributeValue( functionReferenceValue: functionReferenceValue! ), newIndex )
            }
            
            let variableReferenceValueAtIndex = parseVariableReferenceValue( index: index, tokenList: tokenList )
            let variableReferenceValue = variableReferenceValueAtIndex.node
            if variableReferenceValue != nil && ( result == nil || result!.index < variableReferenceValueAtIndex.index ) {
                let newIndex = variableReferenceValueAtIndex.index
                result = ( Transformer.AttributeValue( variableReferenceValue: variableReferenceValue! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseNumberValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.NumberValue?, index: Int ) {
            var result: ( node: Transformer.NumberValue?, index: Int )? = nil
            
            let integerAtIndex = parseInteger( index: index, tokenList: tokenList )
            let integer = integerAtIndex.node
            if integer != nil && ( result == nil || result!.index < integerAtIndex.index ) {
                let newIndex = integerAtIndex.index
                result = ( Transformer.NumberValue( integer: integer! ), newIndex )
            }
            
            let floatingPointAtIndex = parseFloatingPoint( index: index, tokenList: tokenList )
            let floatingPoint = floatingPointAtIndex.node
            if floatingPoint != nil && ( result == nil || result!.index < floatingPointAtIndex.index ) {
                let newIndex = floatingPointAtIndex.index
                result = ( Transformer.NumberValue( floatingPoint: floatingPoint! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseModel( index: Int, tokenList: TokenList ) -> ( node: Transformer.Model?, index: Int ) {
            var newIndex = index
            
            var function: Transformer.Function
            
            do {
                let functionAtIndex: ( node: Transformer.Function?, index: Int ) = parseFunction( index: newIndex, tokenList: tokenList )
                if ( functionAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    function = functionAtIndex.node!
                    newIndex = functionAtIndex.index
                }
            }
            
            do {
                let tokenAtIndex = parse( tokenKind: TokenKind.endOfInput, index: newIndex, tokenList: tokenList )
                
                if tokenAtIndex.token == nil {
                    return ( nil, index )
                }
            }
            
            return ( Transformer.Model( function: function ), newIndex )
        }
        
        func parseFunction( index: Int, tokenList: TokenList ) -> ( node: Transformer.Function?, index: Int ) {
            var newIndex = index
            
            var functionName: Transformer.FunctionName
            var inputPhrase: Transformer.InputPhrase
            var outputPhrase: Transformer.OutputPhrase
            var statement: [Transformer.Statement]? = nil
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal0, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let functionNameAtIndex: ( node: Transformer.FunctionName?, index: Int ) = parseFunctionName( index: newIndex, tokenList: tokenList )
                if ( functionNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    functionName = functionNameAtIndex.node!
                    newIndex = functionNameAtIndex.index
                }
            }
            
            do {
                let inputPhraseAtIndex: ( node: Transformer.InputPhrase?, index: Int ) = parseInputPhrase( index: newIndex, tokenList: tokenList )
                if ( inputPhraseAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    inputPhrase = inputPhraseAtIndex.node!
                    newIndex = inputPhraseAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal1, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let outputPhraseAtIndex: ( node: Transformer.OutputPhrase?, index: Int ) = parseOutputPhrase( index: newIndex, tokenList: tokenList )
                if ( outputPhraseAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    outputPhrase = outputPhraseAtIndex.node!
                    newIndex = outputPhraseAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal2, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let statementAtIndex: ( nodes: [Transformer.Statement]?, index: Int ) = parseStatement( index: newIndex, minimum: 0, tokenList: tokenList )
                statement = statementAtIndex.nodes
                if statement == nil {
                    return ( nil, index )
                } else {
                    newIndex = statementAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal3, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.Function( functionName: functionName, inputPhrase: inputPhrase, outputPhrase: outputPhrase, statement: statement! ), newIndex )
        }
        
        func parseKernel( index: Int, tokenList: TokenList ) -> ( node: Transformer.Kernel?, index: Int ) {
            var newIndex = index
            
            var kernelName: Transformer.KernelName
            var inputPhrase: Transformer.InputPhrase
            var outputPhrase: Transformer.OutputPhrase
            var code: Transformer.Code
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal0, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let kernelNameAtIndex: ( node: Transformer.KernelName?, index: Int ) = parseKernelName( index: newIndex, tokenList: tokenList )
                if ( kernelNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    kernelName = kernelNameAtIndex.node!
                    newIndex = kernelNameAtIndex.index
                }
            }
            
            do {
                let inputPhraseAtIndex: ( node: Transformer.InputPhrase?, index: Int ) = parseInputPhrase( index: newIndex, tokenList: tokenList )
                if ( inputPhraseAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    inputPhrase = inputPhraseAtIndex.node!
                    newIndex = inputPhraseAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal1, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let outputPhraseAtIndex: ( node: Transformer.OutputPhrase?, index: Int ) = parseOutputPhrase( index: newIndex, tokenList: tokenList )
                if ( outputPhraseAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    outputPhrase = outputPhraseAtIndex.node!
                    newIndex = outputPhraseAtIndex.index
                }
            }
            
            do {
                let codeAtIndex: ( node: Transformer.Code?, index: Int ) = parseCode( index: newIndex, tokenList: tokenList )
                if ( codeAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    code = codeAtIndex.node!
                    newIndex = codeAtIndex.index
                }
            }
            
            return ( Transformer.Kernel( kernelName: kernelName, inputPhrase: inputPhrase, outputPhrase: outputPhrase, code: code ), newIndex )
        }
        
        func parseInputPhrase( index: Int, tokenList: TokenList ) -> ( node: Transformer.InputPhrase?, index: Int ) {
            var newIndex = index
            
            var input: [Transformer.Input]? = nil
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal4, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let inputAtIndex: ( nodes: [Transformer.Input]?, index: Int ) = parseInput( index: newIndex, minimum: 0, separatorLiteral: ",", tokenList: tokenList )
                input = inputAtIndex.nodes
                if input == nil {
                    return ( nil, index )
                } else {
                    newIndex = inputAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal6, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.InputPhrase( input: input! ), newIndex )
        }
        
        func parseInput( index: Int, tokenList: TokenList ) -> ( node: Transformer.Input?, index: Int ) {
            var newIndex = index
            
            var inputName: Transformer.InputName
            var tensor: Transformer.Tensor
            
            do {
                let inputNameAtIndex: ( node: Transformer.InputName?, index: Int ) = parseInputName( index: newIndex, tokenList: tokenList )
                if ( inputNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    inputName = inputNameAtIndex.node!
                    newIndex = inputNameAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal7, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let tensorAtIndex: ( node: Transformer.Tensor?, index: Int ) = parseTensor( index: newIndex, tokenList: tokenList )
                if ( tensorAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    tensor = tensorAtIndex.node!
                    newIndex = tensorAtIndex.index
                }
            }
            
            return ( Transformer.Input( inputName: inputName, tensor: tensor ), newIndex )
        }
        
        func parseOutputPhrase( index: Int, tokenList: TokenList ) -> ( node: Transformer.OutputPhrase?, index: Int ) {
            var newIndex = index
            
            var output: [Transformer.Output]? = nil
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal4, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let outputAtIndex: ( nodes: [Transformer.Output]?, index: Int ) = parseOutput( index: newIndex, minimum: 0, separatorLiteral: ",", tokenList: tokenList )
                output = outputAtIndex.nodes
                if output == nil {
                    return ( nil, index )
                } else {
                    newIndex = outputAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal6, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.OutputPhrase( output: output! ), newIndex )
        }
        
        func parseOutput( index: Int, tokenList: TokenList ) -> ( node: Transformer.Output?, index: Int ) {
            var newIndex = index
            
            var outputName: Transformer.OutputName
            var tensor: Transformer.Tensor
            
            do {
                let outputNameAtIndex: ( node: Transformer.OutputName?, index: Int ) = parseOutputName( index: newIndex, tokenList: tokenList )
                if ( outputNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    outputName = outputNameAtIndex.node!
                    newIndex = outputNameAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal7, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let tensorAtIndex: ( node: Transformer.Tensor?, index: Int ) = parseTensor( index: newIndex, tokenList: tokenList )
                if ( tensorAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    tensor = tensorAtIndex.node!
                    newIndex = tensorAtIndex.index
                }
            }
            
            return ( Transformer.Output( outputName: outputName, tensor: tensor ), newIndex )
        }
        
        func parseVariable( index: Int, tokenList: TokenList ) -> ( node: Transformer.Variable?, index: Int ) {
            var newIndex = index
            
            var variableName: Transformer.VariableName
            var tensor: Transformer.Tensor
            var initializer: Transformer.Initializer?
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal8, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let variableNameAtIndex: ( node: Transformer.VariableName?, index: Int ) = parseVariableName( index: newIndex, tokenList: tokenList )
                if ( variableNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    variableName = variableNameAtIndex.node!
                    newIndex = variableNameAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal7, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let tensorAtIndex: ( node: Transformer.Tensor?, index: Int ) = parseTensor( index: newIndex, tokenList: tokenList )
                if ( tensorAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    tensor = tensorAtIndex.node!
                    newIndex = tensorAtIndex.index
                }
            }
            
            do {
                let initializerAtIndex: ( node: Transformer.Initializer?, index: Int ) = parseInitializer( index: newIndex, tokenList: tokenList )
                initializer = initializerAtIndex.node
                if initializer != nil {
                    newIndex = initializerAtIndex.index
                }
            }
            
            return ( Transformer.Variable( variableName: variableName, tensor: tensor, initializer: initializer ), newIndex )
        }
        
        func parseOperation( index: Int, tokenList: TokenList ) -> ( node: Transformer.Operation?, index: Int ) {
            var newIndex = index
            
            var resultPhrase: Transformer.ResultPhrase
            var operationName: Transformer.OperationName
            var argumentPhrase: Transformer.ArgumentPhrase
            
            do {
                let resultPhraseAtIndex: ( node: Transformer.ResultPhrase?, index: Int ) = parseResultPhrase( index: newIndex, tokenList: tokenList )
                if ( resultPhraseAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    resultPhrase = resultPhraseAtIndex.node!
                    newIndex = resultPhraseAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal9, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let operationNameAtIndex: ( node: Transformer.OperationName?, index: Int ) = parseOperationName( index: newIndex, tokenList: tokenList )
                if ( operationNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    operationName = operationNameAtIndex.node!
                    newIndex = operationNameAtIndex.index
                }
            }
            
            do {
                let argumentPhraseAtIndex: ( node: Transformer.ArgumentPhrase?, index: Int ) = parseArgumentPhrase( index: newIndex, tokenList: tokenList )
                if ( argumentPhraseAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    argumentPhrase = argumentPhraseAtIndex.node!
                    newIndex = argumentPhraseAtIndex.index
                }
            }
            
            return ( Transformer.Operation( resultPhrase: resultPhrase, operationName: operationName, argumentPhrase: argumentPhrase ), newIndex )
        }
        
        func parseResultPhrase( index: Int, tokenList: TokenList ) -> ( node: Transformer.ResultPhrase?, index: Int ) {
            var newIndex = index
            
            var result: [Transformer.Result]? = nil
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal4, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let resultAtIndex: ( nodes: [Transformer.Result]?, index: Int ) = parseResult( index: newIndex, minimum: 0, separatorLiteral: ",", tokenList: tokenList )
                result = resultAtIndex.nodes
                if result == nil {
                    return ( nil, index )
                } else {
                    newIndex = resultAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal6, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ResultPhrase( result: result! ), newIndex )
        }
        
        func parseArgumentPhrase( index: Int, tokenList: TokenList ) -> ( node: Transformer.ArgumentPhrase?, index: Int ) {
            var newIndex = index
            
            var argumentOrAttribute: [Transformer.ArgumentOrAttribute]? = nil
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal4, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let argumentOrAttributeAtIndex: ( nodes: [Transformer.ArgumentOrAttribute]?, index: Int ) = parseArgumentOrAttribute( index: newIndex, minimum: 0, separatorLiteral: ",", tokenList: tokenList )
                argumentOrAttribute = argumentOrAttributeAtIndex.nodes
                if argumentOrAttribute == nil {
                    return ( nil, index )
                } else {
                    newIndex = argumentOrAttributeAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal6, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ArgumentPhrase( argumentOrAttribute: argumentOrAttribute! ), newIndex )
        }
        
        func parseInitializer( index: Int, tokenList: TokenList ) -> ( node: Transformer.Initializer?, index: Int ) {
            var newIndex = index
            
            var tensorValue: Transformer.TensorValue
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal9, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let tensorValueAtIndex: ( node: Transformer.TensorValue?, index: Int ) = parseTensorValue( index: newIndex, tokenList: tokenList )
                if ( tensorValueAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    tensorValue = tensorValueAtIndex.node!
                    newIndex = tensorValueAtIndex.index
                }
            }
            
            return ( Transformer.Initializer( tensorValue: tensorValue ), newIndex )
        }
        
        func parseTensorValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.TensorValue?, index: Int ) {
            var newIndex = index
            
            var constantValue: [Transformer.ConstantValue]? = nil
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal10, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let constantValueAtIndex: ( nodes: [Transformer.ConstantValue]?, index: Int ) = parseConstantValue( index: newIndex, minimum: 0, separatorLiteral: ",", tokenList: tokenList )
                constantValue = constantValueAtIndex.nodes
                if constantValue == nil {
                    return ( nil, index )
                } else {
                    newIndex = constantValueAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal11, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.TensorValue( constantValue: constantValue! ), newIndex )
        }
        
        func parseTensor( index: Int, tokenList: TokenList ) -> ( node: Transformer.Tensor?, index: Int ) {
            var newIndex = index
            
            var dimension: [Transformer.Dimension]? = nil
            var elementKind: Transformer.ElementKind
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal10, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let dimensionAtIndex: ( nodes: [Transformer.Dimension]?, index: Int ) = parseDimension( index: newIndex, minimum: 0, separatorLiteral: "*", tokenList: tokenList )
                dimension = dimensionAtIndex.nodes
                if dimension == nil {
                    return ( nil, index )
                } else {
                    newIndex = dimensionAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal7, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let elementKindAtIndex: ( node: Transformer.ElementKind?, index: Int ) = parseElementKind( index: newIndex, tokenList: tokenList )
                if ( elementKindAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    elementKind = elementKindAtIndex.node!
                    newIndex = elementKindAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal11, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.Tensor( dimension: dimension!, elementKind: elementKind ), newIndex )
        }
        
        func parseElementKindInt8( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindInt8?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal13, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindInt8(), newIndex )
        }
        
        func parseElementKindUInt8( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindUInt8?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal14, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindUInt8(), newIndex )
        }
        
        func parseElementKindInt16( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindInt16?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal15, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindInt16(), newIndex )
        }
        
        func parseElementKindUInt16( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindUInt16?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal16, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindUInt16(), newIndex )
        }
        
        func parseElementKindInt32( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindInt32?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal17, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindInt32(), newIndex )
        }
        
        func parseElementKindUInt32( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindUInt32?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal18, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindUInt32(), newIndex )
        }
        
        func parseElementKindInt64( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindInt64?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal19, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindInt64(), newIndex )
        }
        
        func parseElementKindUInt64( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindUInt64?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal20, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindUInt64(), newIndex )
        }
        
        func parseElementKindFloat32( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindFloat32?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal21, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindFloat32(), newIndex )
        }
        
        func parseElementKindFloat64( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindFloat64?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal22, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindFloat64(), newIndex )
        }
        
        func parseElementKindString( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindString?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal23, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindString(), newIndex )
        }
        
        func parseElementKindUnknown( index: Int, tokenList: TokenList ) -> ( node: Transformer.ElementKindUnknown?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal24, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.ElementKindUnknown(), newIndex )
        }
        
        func parseUnknownDimension( index: Int, tokenList: TokenList ) -> ( node: Transformer.UnknownDimension?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal24, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.UnknownDimension(), newIndex )
        }
        
        func parseAttribute( index: Int, tokenList: TokenList ) -> ( node: Transformer.Attribute?, index: Int ) {
            var newIndex = index
            
            var attributeKey: Transformer.AttributeKey
            var attributeValue: Transformer.AttributeValue
            
            do {
                let attributeKeyAtIndex: ( node: Transformer.AttributeKey?, index: Int ) = parseAttributeKey( index: newIndex, tokenList: tokenList )
                if ( attributeKeyAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    attributeKey = attributeKeyAtIndex.node!
                    newIndex = attributeKeyAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal7, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let attributeValueAtIndex: ( node: Transformer.AttributeValue?, index: Int ) = parseAttributeValue( index: newIndex, tokenList: tokenList )
                if ( attributeValueAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    attributeValue = attributeValueAtIndex.node!
                    newIndex = attributeValueAtIndex.index
                }
            }
            
            return ( Transformer.Attribute( attributeKey: attributeKey, attributeValue: attributeValue ), newIndex )
        }
        
        func parseIntegerArrayValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.IntegerArrayValue?, index: Int ) {
            var newIndex = index
            
            var integer: [Transformer.Integer]? = nil
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal10, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let integerAtIndex: ( nodes: [Transformer.Integer]?, index: Int ) = parseInteger( index: newIndex, minimum: 0, separatorLiteral: ",", tokenList: tokenList )
                integer = integerAtIndex.nodes
                if integer == nil {
                    return ( nil, index )
                } else {
                    newIndex = integerAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal11, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.IntegerArrayValue( integer: integer! ), newIndex )
        }
        
        func parseFloatingPointArrayValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.FloatingPointArrayValue?, index: Int ) {
            var newIndex = index
            
            var floatingPoint: [Transformer.FloatingPoint]? = nil
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal10, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let floatingPointAtIndex: ( nodes: [Transformer.FloatingPoint]?, index: Int ) = parseFloatingPoint( index: newIndex, minimum: 0, separatorLiteral: ",", tokenList: tokenList )
                floatingPoint = floatingPointAtIndex.nodes
                if floatingPoint == nil {
                    return ( nil, index )
                } else {
                    newIndex = floatingPointAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal11, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.FloatingPointArrayValue( floatingPoint: floatingPoint! ), newIndex )
        }
        
        func parseStringArrayValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.StringArrayValue?, index: Int ) {
            var newIndex = index
            
            var stringValue: [Transformer.StringValue]? = nil
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal10, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let stringValueAtIndex: ( nodes: [Transformer.StringValue]?, index: Int ) = parseStringValue( index: newIndex, minimum: 0, separatorLiteral: ",", tokenList: tokenList )
                stringValue = stringValueAtIndex.nodes
                if stringValue == nil {
                    return ( nil, index )
                } else {
                    newIndex = stringValueAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal11, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.StringArrayValue( stringValue: stringValue! ), newIndex )
        }
        
        func parseFunctionReferenceValue( index: Int, tokenList: TokenList ) -> ( node: Transformer.FunctionReferenceValue?, index: Int ) {
            var newIndex = index
            
            var functionReferenceName: Transformer.FunctionReferenceName
            
            do {
                let functionReferenceNameAtIndex: ( node: Transformer.FunctionReferenceName?, index: Int ) = parseFunctionReferenceName( index: newIndex, tokenList: tokenList )
                if ( functionReferenceNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    functionReferenceName = functionReferenceNameAtIndex.node!
                    newIndex = functionReferenceNameAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal4, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal6, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.FunctionReferenceValue( functionReferenceName: functionReferenceName ), newIndex )
        }
        
        func parseStatement( index: Int, minimum: Int, tokenList: TokenList ) -> ( nodes: [Transformer.Statement]?, index: Int ) {
            var newIndex = index
            var nodes: [Transformer.Statement] = []
            var node: Transformer.Statement?
            
            var statementAtIndex = parseStatement( index: newIndex, tokenList: tokenList )
            node = statementAtIndex.node
            while node != nil && newIndex < statementAtIndex.index {
                nodes.append( node! )
                
                newIndex = statementAtIndex.index
                
                statementAtIndex = parseStatement( index: newIndex, tokenList: tokenList )
                node = statementAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseStatement( index: Int, minimum: Int, maximum: Int, tokenList: TokenList ) -> ( nodes: [Transformer.Statement]?, index: Int ) {
            var newIndex = index
            
            var nodes: [Transformer.Statement] = []
            var node: Transformer.Statement?
            
            var statementAtIndex = parseStatement( index: newIndex, tokenList: tokenList )
            node = statementAtIndex.node
            while node != nil && newIndex < statementAtIndex.index {
                nodes.append( node! )
                
                newIndex = statementAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                statementAtIndex = parseStatement( index: newIndex, tokenList: tokenList )
                node = statementAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseInput( index: Int, minimum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( [Transformer.Input]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Input] = []
            var node: Transformer.Input?
            
            var inputAtIndex = parseInput( index: newIndex, tokenList: tokenList )
            node = inputAtIndex.node
            while node != nil && newIndex < inputAtIndex.index {
                nodes.append( node! )
                
                newIndex = inputAtIndex.index
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                inputAtIndex = parseInput( index: separatorAtIndex.index, tokenList: tokenList )
                if inputAtIndex.node == nil {
                    break
                }
                node = inputAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseInput( index: Int, minimum: Int, maximum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( nodes: [Transformer.Input]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Input] = []
            var node: Transformer.Input?
            
            var inputAtIndex = parseInput( index: newIndex, tokenList: tokenList )
            node = inputAtIndex.node
            while node != nil && newIndex < inputAtIndex.index {
                nodes.append( node! )
                
                newIndex = inputAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                inputAtIndex = parseInput( index: separatorAtIndex.index, tokenList: tokenList )
                if inputAtIndex.node == nil {
                    break
                }
                node = inputAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseOutput( index: Int, minimum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( [Transformer.Output]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Output] = []
            var node: Transformer.Output?
            
            var outputAtIndex = parseOutput( index: newIndex, tokenList: tokenList )
            node = outputAtIndex.node
            while node != nil && newIndex < outputAtIndex.index {
                nodes.append( node! )
                
                newIndex = outputAtIndex.index
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                outputAtIndex = parseOutput( index: separatorAtIndex.index, tokenList: tokenList )
                if outputAtIndex.node == nil {
                    break
                }
                node = outputAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseOutput( index: Int, minimum: Int, maximum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( nodes: [Transformer.Output]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Output] = []
            var node: Transformer.Output?
            
            var outputAtIndex = parseOutput( index: newIndex, tokenList: tokenList )
            node = outputAtIndex.node
            while node != nil && newIndex < outputAtIndex.index {
                nodes.append( node! )
                
                newIndex = outputAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                outputAtIndex = parseOutput( index: separatorAtIndex.index, tokenList: tokenList )
                if outputAtIndex.node == nil {
                    break
                }
                node = outputAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseResult( index: Int, minimum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( [Transformer.Result]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Result] = []
            var node: Transformer.Result?
            
            var resultAtIndex = parseResult( index: newIndex, tokenList: tokenList )
            node = resultAtIndex.node
            while node != nil && newIndex < resultAtIndex.index {
                nodes.append( node! )
                
                newIndex = resultAtIndex.index
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                resultAtIndex = parseResult( index: separatorAtIndex.index, tokenList: tokenList )
                if resultAtIndex.node == nil {
                    break
                }
                node = resultAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseResult( index: Int, minimum: Int, maximum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( nodes: [Transformer.Result]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Result] = []
            var node: Transformer.Result?
            
            var resultAtIndex = parseResult( index: newIndex, tokenList: tokenList )
            node = resultAtIndex.node
            while node != nil && newIndex < resultAtIndex.index {
                nodes.append( node! )
                
                newIndex = resultAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                resultAtIndex = parseResult( index: separatorAtIndex.index, tokenList: tokenList )
                if resultAtIndex.node == nil {
                    break
                }
                node = resultAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseArgumentOrAttribute( index: Int, minimum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( [Transformer.ArgumentOrAttribute]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.ArgumentOrAttribute] = []
            var node: Transformer.ArgumentOrAttribute?
            
            var argumentOrAttributeAtIndex = parseArgumentOrAttribute( index: newIndex, tokenList: tokenList )
            node = argumentOrAttributeAtIndex.node
            while node != nil && newIndex < argumentOrAttributeAtIndex.index {
                nodes.append( node! )
                
                newIndex = argumentOrAttributeAtIndex.index
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                argumentOrAttributeAtIndex = parseArgumentOrAttribute( index: separatorAtIndex.index, tokenList: tokenList )
                if argumentOrAttributeAtIndex.node == nil {
                    break
                }
                node = argumentOrAttributeAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseArgumentOrAttribute( index: Int, minimum: Int, maximum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( nodes: [Transformer.ArgumentOrAttribute]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.ArgumentOrAttribute] = []
            var node: Transformer.ArgumentOrAttribute?
            
            var argumentOrAttributeAtIndex = parseArgumentOrAttribute( index: newIndex, tokenList: tokenList )
            node = argumentOrAttributeAtIndex.node
            while node != nil && newIndex < argumentOrAttributeAtIndex.index {
                nodes.append( node! )
                
                newIndex = argumentOrAttributeAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                argumentOrAttributeAtIndex = parseArgumentOrAttribute( index: separatorAtIndex.index, tokenList: tokenList )
                if argumentOrAttributeAtIndex.node == nil {
                    break
                }
                node = argumentOrAttributeAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseConstantValue( index: Int, minimum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( [Transformer.ConstantValue]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.ConstantValue] = []
            var node: Transformer.ConstantValue?
            
            var constantValueAtIndex = parseConstantValue( index: newIndex, tokenList: tokenList )
            node = constantValueAtIndex.node
            while node != nil && newIndex < constantValueAtIndex.index {
                nodes.append( node! )
                
                newIndex = constantValueAtIndex.index
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                constantValueAtIndex = parseConstantValue( index: separatorAtIndex.index, tokenList: tokenList )
                if constantValueAtIndex.node == nil {
                    break
                }
                node = constantValueAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseConstantValue( index: Int, minimum: Int, maximum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( nodes: [Transformer.ConstantValue]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.ConstantValue] = []
            var node: Transformer.ConstantValue?
            
            var constantValueAtIndex = parseConstantValue( index: newIndex, tokenList: tokenList )
            node = constantValueAtIndex.node
            while node != nil && newIndex < constantValueAtIndex.index {
                nodes.append( node! )
                
                newIndex = constantValueAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                constantValueAtIndex = parseConstantValue( index: separatorAtIndex.index, tokenList: tokenList )
                if constantValueAtIndex.node == nil {
                    break
                }
                node = constantValueAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseDimension( index: Int, minimum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( [Transformer.Dimension]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Dimension] = []
            var node: Transformer.Dimension?
            
            var dimensionAtIndex = parseDimension( index: newIndex, tokenList: tokenList )
            node = dimensionAtIndex.node
            while node != nil && newIndex < dimensionAtIndex.index {
                nodes.append( node! )
                
                newIndex = dimensionAtIndex.index
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                dimensionAtIndex = parseDimension( index: separatorAtIndex.index, tokenList: tokenList )
                if dimensionAtIndex.node == nil {
                    break
                }
                node = dimensionAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseDimension( index: Int, minimum: Int, maximum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( nodes: [Transformer.Dimension]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Dimension] = []
            var node: Transformer.Dimension?
            
            var dimensionAtIndex = parseDimension( index: newIndex, tokenList: tokenList )
            node = dimensionAtIndex.node
            while node != nil && newIndex < dimensionAtIndex.index {
                nodes.append( node! )
                
                newIndex = dimensionAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                dimensionAtIndex = parseDimension( index: separatorAtIndex.index, tokenList: tokenList )
                if dimensionAtIndex.node == nil {
                    break
                }
                node = dimensionAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseInteger( index: Int, minimum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( [Transformer.Integer]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Integer] = []
            var node: Transformer.Integer?
            
            var integerAtIndex = parseInteger( index: newIndex, tokenList: tokenList )
            node = integerAtIndex.node
            while node != nil && newIndex < integerAtIndex.index {
                nodes.append( node! )
                
                newIndex = integerAtIndex.index
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                integerAtIndex = parseInteger( index: separatorAtIndex.index, tokenList: tokenList )
                if integerAtIndex.node == nil {
                    break
                }
                node = integerAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseInteger( index: Int, minimum: Int, maximum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( nodes: [Transformer.Integer]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.Integer] = []
            var node: Transformer.Integer?
            
            var integerAtIndex = parseInteger( index: newIndex, tokenList: tokenList )
            node = integerAtIndex.node
            while node != nil && newIndex < integerAtIndex.index {
                nodes.append( node! )
                
                newIndex = integerAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                integerAtIndex = parseInteger( index: separatorAtIndex.index, tokenList: tokenList )
                if integerAtIndex.node == nil {
                    break
                }
                node = integerAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseFloatingPoint( index: Int, minimum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( [Transformer.FloatingPoint]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.FloatingPoint] = []
            var node: Transformer.FloatingPoint?
            
            var floatingPointAtIndex = parseFloatingPoint( index: newIndex, tokenList: tokenList )
            node = floatingPointAtIndex.node
            while node != nil && newIndex < floatingPointAtIndex.index {
                nodes.append( node! )
                
                newIndex = floatingPointAtIndex.index
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                floatingPointAtIndex = parseFloatingPoint( index: separatorAtIndex.index, tokenList: tokenList )
                if floatingPointAtIndex.node == nil {
                    break
                }
                node = floatingPointAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseFloatingPoint( index: Int, minimum: Int, maximum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( nodes: [Transformer.FloatingPoint]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.FloatingPoint] = []
            var node: Transformer.FloatingPoint?
            
            var floatingPointAtIndex = parseFloatingPoint( index: newIndex, tokenList: tokenList )
            node = floatingPointAtIndex.node
            while node != nil && newIndex < floatingPointAtIndex.index {
                nodes.append( node! )
                
                newIndex = floatingPointAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                floatingPointAtIndex = parseFloatingPoint( index: separatorAtIndex.index, tokenList: tokenList )
                if floatingPointAtIndex.node == nil {
                    break
                }
                node = floatingPointAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseStringValue( index: Int, minimum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( [Transformer.StringValue]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.StringValue] = []
            var node: Transformer.StringValue?
            
            var stringValueAtIndex = parseStringValue( index: newIndex, tokenList: tokenList )
            node = stringValueAtIndex.node
            while node != nil && newIndex < stringValueAtIndex.index {
                nodes.append( node! )
                
                newIndex = stringValueAtIndex.index
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                stringValueAtIndex = parseStringValue( index: separatorAtIndex.index, tokenList: tokenList )
                if stringValueAtIndex.node == nil {
                    break
                }
                node = stringValueAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseStringValue( index: Int, minimum: Int, maximum: Int, separatorLiteral: String, tokenList: TokenList ) -> ( nodes: [Transformer.StringValue]?, index: Int )
        {
            var newIndex = index;
            
            var nodes: [Transformer.StringValue] = []
            var node: Transformer.StringValue?
            
            var stringValueAtIndex = parseStringValue( index: newIndex, tokenList: tokenList )
            node = stringValueAtIndex.node
            while node != nil && newIndex < stringValueAtIndex.index {
                nodes.append( node! )
                
                newIndex = stringValueAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                let separatorAtIndex = parse( literalValue: separatorLiteral, index: newIndex, tokenList: tokenList )
                if !separatorAtIndex.matches {
                    break
                }
                
                stringValueAtIndex = parseStringValue( index: separatorAtIndex.index, tokenList: tokenList )
                if stringValueAtIndex.node == nil {
                    break
                }
                node = stringValueAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        public func parse( tokenList: TokenList, log: Log? = nil ) -> Transformer.Model? {
            var node: Transformer.Model?
            
            let index = 0
            maximumIndex = 0
            
            let nodeAtIndex: ( node: Transformer.Model?, index: Int ) = parseModel( index: index, tokenList: tokenList )
            node = nodeAtIndex.node
            
            if node == nil && log != nil {
                let logger = Logger( log: log! )
                
                if tokenList.count > 0 {
                    let token: Token = tokenList[ maximumIndex ]
                    
                    if maximumIndex < tokenList.count {
                        logger.error( "Parse error after token '\(token.text)'", token: token )
                    } else {
                        if let fileName = token.source {
                            logger.error( "Parse error before end of file '\(fileName)'" )
                        } else {
                            logger.error( "Parse error before end of input" )
                        }
                    }
                } else {
                    logger.error( "Parse error" )
                }
            }
            
            return node
        }
    }
    
} // extension TensorDsl

extension TensorDslCompiler {
    
    public class Transformer {
        
        public class Statement: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case variable
                case operation
                case function
                case kernel
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var variable: Variable? {
                get {
                    if childType != nil && childType! == .variable {
                        return child as? Variable
                    } else {
                        return nil
                    }
                }
                set ( variable ) {
                    childType = .variable
                    child = variable
                }
            }
            
            public var operation: Operation? {
                get {
                    if childType != nil && childType! == .operation {
                        return child as? Operation
                    } else {
                        return nil
                    }
                }
                set ( operation ) {
                    childType = .operation
                    child = operation
                }
            }
            
            public var function: Function? {
                get {
                    if childType != nil && childType! == .function {
                        return child as? Function
                    } else {
                        return nil
                    }
                }
                set ( function ) {
                    childType = .function
                    child = function
                }
            }
            
            public var kernel: Kernel? {
                get {
                    if childType != nil && childType! == .kernel {
                        return child as? Kernel
                    } else {
                        return nil
                    }
                }
                set ( kernel ) {
                    childType = .kernel
                    child = kernel
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .variable:
                        child = try container.decode( Variable.self, forKey: .variable )
                    case .operation:
                        child = try container.decode( Operation.self, forKey: .operation )
                    case .function:
                        child = try container.decode( Function.self, forKey: .function )
                    case .kernel:
                        child = try container.decode( Kernel.self, forKey: .kernel )
                    }
                }
            }
            
            public init( variable: Variable ) {
                childType = .variable
                child = variable
            }
            
            public init( operation: Operation ) {
                childType = .operation
                child = operation
            }
            
            public init( function: Function ) {
                childType = .function
                child = function
            }
            
            public init( kernel: Kernel ) {
                childType = .kernel
                child = kernel
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .variable:
                        try container.encode( self.child! as! Variable, forKey: .variable )
            
                    case .operation:
                        try container.encode( self.child! as! Operation, forKey: .operation )
            
                    case .function:
                        try container.encode( self.child! as! Function, forKey: .function )
            
                    case .kernel:
                        try container.encode( self.child! as! Kernel, forKey: .kernel )
                    }
                }
            }
        }
        
        public class ArgumentOrAttribute: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case attribute
                case argument
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var attribute: Attribute? {
                get {
                    if childType != nil && childType! == .attribute {
                        return child as? Attribute
                    } else {
                        return nil
                    }
                }
                set ( attribute ) {
                    childType = .attribute
                    child = attribute
                }
            }
            
            public var argument: Argument? {
                get {
                    if childType != nil && childType! == .argument {
                        return child as? Argument
                    } else {
                        return nil
                    }
                }
                set ( argument ) {
                    childType = .argument
                    child = argument
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .attribute:
                        child = try container.decode( Attribute.self, forKey: .attribute )
                    case .argument:
                        child = try container.decode( Argument.self, forKey: .argument )
                    }
                }
            }
            
            public init( attribute: Attribute ) {
                childType = .attribute
                child = attribute
            }
            
            public init( argument: Argument ) {
                childType = .argument
                child = argument
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .attribute:
                        try container.encode( self.child! as! Attribute, forKey: .attribute )
            
                    case .argument:
                        try container.encode( self.child! as! Argument, forKey: .argument )
                    }
                }
            }
        }
        
        public class ConstantValue: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case numberValue
                case tensorValue
                case stringValue
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var numberValue: NumberValue? {
                get {
                    if childType != nil && childType! == .numberValue {
                        return child as? NumberValue
                    } else {
                        return nil
                    }
                }
                set ( numberValue ) {
                    childType = .numberValue
                    child = numberValue
                }
            }
            
            public var tensorValue: TensorValue? {
                get {
                    if childType != nil && childType! == .tensorValue {
                        return child as? TensorValue
                    } else {
                        return nil
                    }
                }
                set ( tensorValue ) {
                    childType = .tensorValue
                    child = tensorValue
                }
            }
            
            public var stringValue: StringValue? {
                get {
                    if childType != nil && childType! == .stringValue {
                        return child as? StringValue
                    } else {
                        return nil
                    }
                }
                set ( stringValue ) {
                    childType = .stringValue
                    child = stringValue
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .numberValue:
                        child = try container.decode( NumberValue.self, forKey: .numberValue )
                    case .tensorValue:
                        child = try container.decode( TensorValue.self, forKey: .tensorValue )
                    case .stringValue:
                        child = try container.decode( StringValue.self, forKey: .stringValue )
                    }
                }
            }
            
            public init( numberValue: NumberValue ) {
                childType = .numberValue
                child = numberValue
            }
            
            public init( tensorValue: TensorValue ) {
                childType = .tensorValue
                child = tensorValue
            }
            
            public init( stringValue: StringValue ) {
                childType = .stringValue
                child = stringValue
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .numberValue:
                        try container.encode( self.child! as! NumberValue, forKey: .numberValue )
            
                    case .tensorValue:
                        try container.encode( self.child! as! TensorValue, forKey: .tensorValue )
            
                    case .stringValue:
                        try container.encode( self.child! as! StringValue, forKey: .stringValue )
                    }
                }
            }
        }
        
        public class ElementKind: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case elementKindInt8
                case elementKindUInt8
                case elementKindInt16
                case elementKindUInt16
                case elementKindInt32
                case elementKindUInt32
                case elementKindInt64
                case elementKindUInt64
                case elementKindFloat32
                case elementKindFloat64
                case elementKindString
                case elementKindUnknown
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var elementKindInt8: ElementKindInt8? {
                get {
                    if childType != nil && childType! == .elementKindInt8 {
                        return child as? ElementKindInt8
                    } else {
                        return nil
                    }
                }
                set ( elementKindInt8 ) {
                    childType = .elementKindInt8
                    child = elementKindInt8
                }
            }
            
            public var elementKindUInt8: ElementKindUInt8? {
                get {
                    if childType != nil && childType! == .elementKindUInt8 {
                        return child as? ElementKindUInt8
                    } else {
                        return nil
                    }
                }
                set ( elementKindUInt8 ) {
                    childType = .elementKindUInt8
                    child = elementKindUInt8
                }
            }
            
            public var elementKindInt16: ElementKindInt16? {
                get {
                    if childType != nil && childType! == .elementKindInt16 {
                        return child as? ElementKindInt16
                    } else {
                        return nil
                    }
                }
                set ( elementKindInt16 ) {
                    childType = .elementKindInt16
                    child = elementKindInt16
                }
            }
            
            public var elementKindUInt16: ElementKindUInt16? {
                get {
                    if childType != nil && childType! == .elementKindUInt16 {
                        return child as? ElementKindUInt16
                    } else {
                        return nil
                    }
                }
                set ( elementKindUInt16 ) {
                    childType = .elementKindUInt16
                    child = elementKindUInt16
                }
            }
            
            public var elementKindInt32: ElementKindInt32? {
                get {
                    if childType != nil && childType! == .elementKindInt32 {
                        return child as? ElementKindInt32
                    } else {
                        return nil
                    }
                }
                set ( elementKindInt32 ) {
                    childType = .elementKindInt32
                    child = elementKindInt32
                }
            }
            
            public var elementKindUInt32: ElementKindUInt32? {
                get {
                    if childType != nil && childType! == .elementKindUInt32 {
                        return child as? ElementKindUInt32
                    } else {
                        return nil
                    }
                }
                set ( elementKindUInt32 ) {
                    childType = .elementKindUInt32
                    child = elementKindUInt32
                }
            }
            
            public var elementKindInt64: ElementKindInt64? {
                get {
                    if childType != nil && childType! == .elementKindInt64 {
                        return child as? ElementKindInt64
                    } else {
                        return nil
                    }
                }
                set ( elementKindInt64 ) {
                    childType = .elementKindInt64
                    child = elementKindInt64
                }
            }
            
            public var elementKindUInt64: ElementKindUInt64? {
                get {
                    if childType != nil && childType! == .elementKindUInt64 {
                        return child as? ElementKindUInt64
                    } else {
                        return nil
                    }
                }
                set ( elementKindUInt64 ) {
                    childType = .elementKindUInt64
                    child = elementKindUInt64
                }
            }
            
            public var elementKindFloat32: ElementKindFloat32? {
                get {
                    if childType != nil && childType! == .elementKindFloat32 {
                        return child as? ElementKindFloat32
                    } else {
                        return nil
                    }
                }
                set ( elementKindFloat32 ) {
                    childType = .elementKindFloat32
                    child = elementKindFloat32
                }
            }
            
            public var elementKindFloat64: ElementKindFloat64? {
                get {
                    if childType != nil && childType! == .elementKindFloat64 {
                        return child as? ElementKindFloat64
                    } else {
                        return nil
                    }
                }
                set ( elementKindFloat64 ) {
                    childType = .elementKindFloat64
                    child = elementKindFloat64
                }
            }
            
            public var elementKindString: ElementKindString? {
                get {
                    if childType != nil && childType! == .elementKindString {
                        return child as? ElementKindString
                    } else {
                        return nil
                    }
                }
                set ( elementKindString ) {
                    childType = .elementKindString
                    child = elementKindString
                }
            }
            
            public var elementKindUnknown: ElementKindUnknown? {
                get {
                    if childType != nil && childType! == .elementKindUnknown {
                        return child as? ElementKindUnknown
                    } else {
                        return nil
                    }
                }
                set ( elementKindUnknown ) {
                    childType = .elementKindUnknown
                    child = elementKindUnknown
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .elementKindInt8:
                        child = try container.decode( ElementKindInt8.self, forKey: .elementKindInt8 )
                    case .elementKindUInt8:
                        child = try container.decode( ElementKindUInt8.self, forKey: .elementKindUInt8 )
                    case .elementKindInt16:
                        child = try container.decode( ElementKindInt16.self, forKey: .elementKindInt16 )
                    case .elementKindUInt16:
                        child = try container.decode( ElementKindUInt16.self, forKey: .elementKindUInt16 )
                    case .elementKindInt32:
                        child = try container.decode( ElementKindInt32.self, forKey: .elementKindInt32 )
                    case .elementKindUInt32:
                        child = try container.decode( ElementKindUInt32.self, forKey: .elementKindUInt32 )
                    case .elementKindInt64:
                        child = try container.decode( ElementKindInt64.self, forKey: .elementKindInt64 )
                    case .elementKindUInt64:
                        child = try container.decode( ElementKindUInt64.self, forKey: .elementKindUInt64 )
                    case .elementKindFloat32:
                        child = try container.decode( ElementKindFloat32.self, forKey: .elementKindFloat32 )
                    case .elementKindFloat64:
                        child = try container.decode( ElementKindFloat64.self, forKey: .elementKindFloat64 )
                    case .elementKindString:
                        child = try container.decode( ElementKindString.self, forKey: .elementKindString )
                    case .elementKindUnknown:
                        child = try container.decode( ElementKindUnknown.self, forKey: .elementKindUnknown )
                    }
                }
            }
            
            public init( elementKindInt8: ElementKindInt8 ) {
                childType = .elementKindInt8
                child = elementKindInt8
            }
            
            public init( elementKindUInt8: ElementKindUInt8 ) {
                childType = .elementKindUInt8
                child = elementKindUInt8
            }
            
            public init( elementKindInt16: ElementKindInt16 ) {
                childType = .elementKindInt16
                child = elementKindInt16
            }
            
            public init( elementKindUInt16: ElementKindUInt16 ) {
                childType = .elementKindUInt16
                child = elementKindUInt16
            }
            
            public init( elementKindInt32: ElementKindInt32 ) {
                childType = .elementKindInt32
                child = elementKindInt32
            }
            
            public init( elementKindUInt32: ElementKindUInt32 ) {
                childType = .elementKindUInt32
                child = elementKindUInt32
            }
            
            public init( elementKindInt64: ElementKindInt64 ) {
                childType = .elementKindInt64
                child = elementKindInt64
            }
            
            public init( elementKindUInt64: ElementKindUInt64 ) {
                childType = .elementKindUInt64
                child = elementKindUInt64
            }
            
            public init( elementKindFloat32: ElementKindFloat32 ) {
                childType = .elementKindFloat32
                child = elementKindFloat32
            }
            
            public init( elementKindFloat64: ElementKindFloat64 ) {
                childType = .elementKindFloat64
                child = elementKindFloat64
            }
            
            public init( elementKindString: ElementKindString ) {
                childType = .elementKindString
                child = elementKindString
            }
            
            public init( elementKindUnknown: ElementKindUnknown ) {
                childType = .elementKindUnknown
                child = elementKindUnknown
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .elementKindInt8:
                        try container.encode( self.child! as! ElementKindInt8, forKey: .elementKindInt8 )
            
                    case .elementKindUInt8:
                        try container.encode( self.child! as! ElementKindUInt8, forKey: .elementKindUInt8 )
            
                    case .elementKindInt16:
                        try container.encode( self.child! as! ElementKindInt16, forKey: .elementKindInt16 )
            
                    case .elementKindUInt16:
                        try container.encode( self.child! as! ElementKindUInt16, forKey: .elementKindUInt16 )
            
                    case .elementKindInt32:
                        try container.encode( self.child! as! ElementKindInt32, forKey: .elementKindInt32 )
            
                    case .elementKindUInt32:
                        try container.encode( self.child! as! ElementKindUInt32, forKey: .elementKindUInt32 )
            
                    case .elementKindInt64:
                        try container.encode( self.child! as! ElementKindInt64, forKey: .elementKindInt64 )
            
                    case .elementKindUInt64:
                        try container.encode( self.child! as! ElementKindUInt64, forKey: .elementKindUInt64 )
            
                    case .elementKindFloat32:
                        try container.encode( self.child! as! ElementKindFloat32, forKey: .elementKindFloat32 )
            
                    case .elementKindFloat64:
                        try container.encode( self.child! as! ElementKindFloat64, forKey: .elementKindFloat64 )
            
                    case .elementKindString:
                        try container.encode( self.child! as! ElementKindString, forKey: .elementKindString )
            
                    case .elementKindUnknown:
                        try container.encode( self.child! as! ElementKindUnknown, forKey: .elementKindUnknown )
                    }
                }
            }
        }
        
        public class Dimension: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case fixedDimension
                case variableDimension
                case unknownDimension
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var fixedDimension: FixedDimension? {
                get {
                    if childType != nil && childType! == .fixedDimension {
                        return child as? FixedDimension
                    } else {
                        return nil
                    }
                }
                set ( fixedDimension ) {
                    childType = .fixedDimension
                    child = fixedDimension
                }
            }
            
            public var variableDimension: VariableDimension? {
                get {
                    if childType != nil && childType! == .variableDimension {
                        return child as? VariableDimension
                    } else {
                        return nil
                    }
                }
                set ( variableDimension ) {
                    childType = .variableDimension
                    child = variableDimension
                }
            }
            
            public var unknownDimension: UnknownDimension? {
                get {
                    if childType != nil && childType! == .unknownDimension {
                        return child as? UnknownDimension
                    } else {
                        return nil
                    }
                }
                set ( unknownDimension ) {
                    childType = .unknownDimension
                    child = unknownDimension
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .fixedDimension:
                        child = try container.decode( FixedDimension.self, forKey: .fixedDimension )
                    case .variableDimension:
                        child = try container.decode( VariableDimension.self, forKey: .variableDimension )
                    case .unknownDimension:
                        child = try container.decode( UnknownDimension.self, forKey: .unknownDimension )
                    }
                }
            }
            
            public init( fixedDimension: FixedDimension ) {
                childType = .fixedDimension
                child = fixedDimension
            }
            
            public init( variableDimension: VariableDimension ) {
                childType = .variableDimension
                child = variableDimension
            }
            
            public init( unknownDimension: UnknownDimension ) {
                childType = .unknownDimension
                child = unknownDimension
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .fixedDimension:
                        try container.encode( self.child! as! FixedDimension, forKey: .fixedDimension )
            
                    case .variableDimension:
                        try container.encode( self.child! as! VariableDimension, forKey: .variableDimension )
            
                    case .unknownDimension:
                        try container.encode( self.child! as! UnknownDimension, forKey: .unknownDimension )
                    }
                }
            }
        }
        
        public class AttributeValue: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case integerArrayValue
                case floatingPointArrayValue
                case stringArrayValue
                case integer
                case floatingPoint
                case stringValue
                case functionReferenceValue
                case variableReferenceValue
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var integerArrayValue: IntegerArrayValue? {
                get {
                    if childType != nil && childType! == .integerArrayValue {
                        return child as? IntegerArrayValue
                    } else {
                        return nil
                    }
                }
                set ( integerArrayValue ) {
                    childType = .integerArrayValue
                    child = integerArrayValue
                }
            }
            
            public var floatingPointArrayValue: FloatingPointArrayValue? {
                get {
                    if childType != nil && childType! == .floatingPointArrayValue {
                        return child as? FloatingPointArrayValue
                    } else {
                        return nil
                    }
                }
                set ( floatingPointArrayValue ) {
                    childType = .floatingPointArrayValue
                    child = floatingPointArrayValue
                }
            }
            
            public var stringArrayValue: StringArrayValue? {
                get {
                    if childType != nil && childType! == .stringArrayValue {
                        return child as? StringArrayValue
                    } else {
                        return nil
                    }
                }
                set ( stringArrayValue ) {
                    childType = .stringArrayValue
                    child = stringArrayValue
                }
            }
            
            public var integer: Integer? {
                get {
                    if childType != nil && childType! == .integer {
                        return child as? Integer
                    } else {
                        return nil
                    }
                }
                set ( integer ) {
                    childType = .integer
                    child = integer
                }
            }
            
            public var floatingPoint: FloatingPoint? {
                get {
                    if childType != nil && childType! == .floatingPoint {
                        return child as? FloatingPoint
                    } else {
                        return nil
                    }
                }
                set ( floatingPoint ) {
                    childType = .floatingPoint
                    child = floatingPoint
                }
            }
            
            public var stringValue: StringValue? {
                get {
                    if childType != nil && childType! == .stringValue {
                        return child as? StringValue
                    } else {
                        return nil
                    }
                }
                set ( stringValue ) {
                    childType = .stringValue
                    child = stringValue
                }
            }
            
            public var functionReferenceValue: FunctionReferenceValue? {
                get {
                    if childType != nil && childType! == .functionReferenceValue {
                        return child as? FunctionReferenceValue
                    } else {
                        return nil
                    }
                }
                set ( functionReferenceValue ) {
                    childType = .functionReferenceValue
                    child = functionReferenceValue
                }
            }
            
            public var variableReferenceValue: VariableReferenceValue? {
                get {
                    if childType != nil && childType! == .variableReferenceValue {
                        return child as? VariableReferenceValue
                    } else {
                        return nil
                    }
                }
                set ( variableReferenceValue ) {
                    childType = .variableReferenceValue
                    child = variableReferenceValue
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .integerArrayValue:
                        child = try container.decode( IntegerArrayValue.self, forKey: .integerArrayValue )
                    case .floatingPointArrayValue:
                        child = try container.decode( FloatingPointArrayValue.self, forKey: .floatingPointArrayValue )
                    case .stringArrayValue:
                        child = try container.decode( StringArrayValue.self, forKey: .stringArrayValue )
                    case .integer:
                        child = try container.decode( Integer.self, forKey: .integer )
                    case .floatingPoint:
                        child = try container.decode( FloatingPoint.self, forKey: .floatingPoint )
                    case .stringValue:
                        child = try container.decode( StringValue.self, forKey: .stringValue )
                    case .functionReferenceValue:
                        child = try container.decode( FunctionReferenceValue.self, forKey: .functionReferenceValue )
                    case .variableReferenceValue:
                        child = try container.decode( VariableReferenceValue.self, forKey: .variableReferenceValue )
                    }
                }
            }
            
            public init( integerArrayValue: IntegerArrayValue ) {
                childType = .integerArrayValue
                child = integerArrayValue
            }
            
            public init( floatingPointArrayValue: FloatingPointArrayValue ) {
                childType = .floatingPointArrayValue
                child = floatingPointArrayValue
            }
            
            public init( stringArrayValue: StringArrayValue ) {
                childType = .stringArrayValue
                child = stringArrayValue
            }
            
            public init( integer: Integer ) {
                childType = .integer
                child = integer
            }
            
            public init( floatingPoint: FloatingPoint ) {
                childType = .floatingPoint
                child = floatingPoint
            }
            
            public init( stringValue: StringValue ) {
                childType = .stringValue
                child = stringValue
            }
            
            public init( functionReferenceValue: FunctionReferenceValue ) {
                childType = .functionReferenceValue
                child = functionReferenceValue
            }
            
            public init( variableReferenceValue: VariableReferenceValue ) {
                childType = .variableReferenceValue
                child = variableReferenceValue
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .integerArrayValue:
                        try container.encode( self.child! as! IntegerArrayValue, forKey: .integerArrayValue )
            
                    case .floatingPointArrayValue:
                        try container.encode( self.child! as! FloatingPointArrayValue, forKey: .floatingPointArrayValue )
            
                    case .stringArrayValue:
                        try container.encode( self.child! as! StringArrayValue, forKey: .stringArrayValue )
            
                    case .integer:
                        try container.encode( self.child! as! Integer, forKey: .integer )
            
                    case .floatingPoint:
                        try container.encode( self.child! as! FloatingPoint, forKey: .floatingPoint )
            
                    case .stringValue:
                        try container.encode( self.child! as! StringValue, forKey: .stringValue )
            
                    case .functionReferenceValue:
                        try container.encode( self.child! as! FunctionReferenceValue, forKey: .functionReferenceValue )
            
                    case .variableReferenceValue:
                        try container.encode( self.child! as! VariableReferenceValue, forKey: .variableReferenceValue )
                    }
                }
            }
        }
        
        public class NumberValue: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case integer
                case floatingPoint
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var integer: Integer? {
                get {
                    if childType != nil && childType! == .integer {
                        return child as? Integer
                    } else {
                        return nil
                    }
                }
                set ( integer ) {
                    childType = .integer
                    child = integer
                }
            }
            
            public var floatingPoint: FloatingPoint? {
                get {
                    if childType != nil && childType! == .floatingPoint {
                        return child as? FloatingPoint
                    } else {
                        return nil
                    }
                }
                set ( floatingPoint ) {
                    childType = .floatingPoint
                    child = floatingPoint
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .integer:
                        child = try container.decode( Integer.self, forKey: .integer )
                    case .floatingPoint:
                        child = try container.decode( FloatingPoint.self, forKey: .floatingPoint )
                    }
                }
            }
            
            public init( integer: Integer ) {
                childType = .integer
                child = integer
            }
            
            public init( floatingPoint: FloatingPoint ) {
                childType = .floatingPoint
                child = floatingPoint
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .integer:
                        try container.encode( self.child! as! Integer, forKey: .integer )
            
                    case .floatingPoint:
                        try container.encode( self.child! as! FloatingPoint, forKey: .floatingPoint )
                    }
                }
            }
        }
        
        public class FunctionName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class KernelName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Code: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class InputName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class OutputName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class VariableName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Result: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class OperationName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Argument: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class FixedDimension: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class VariableDimension: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class AttributeKey: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Integer: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class FloatingPoint: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class StringValue: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class FunctionReferenceName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class VariableReferenceValue: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Model: Codable {
            public let function: Function
            
            public init( function: Function ) {
                self.function = function
            }
        }
        
        public class Function: Codable {
            public let functionName: FunctionName
            public let inputPhrase: InputPhrase
            public let outputPhrase: OutputPhrase
            public let statement: [Statement]
            
            public init( functionName: FunctionName, inputPhrase: InputPhrase, outputPhrase: OutputPhrase, statement: [Statement] ) {
                self.functionName = functionName
                self.inputPhrase = inputPhrase
                self.outputPhrase = outputPhrase
                self.statement = statement
            }
        }
        
        public class Kernel: Codable {
            public let kernelName: KernelName
            public let inputPhrase: InputPhrase
            public let outputPhrase: OutputPhrase
            public let code: Code
            
            public init( kernelName: KernelName, inputPhrase: InputPhrase, outputPhrase: OutputPhrase, code: Code ) {
                self.kernelName = kernelName
                self.inputPhrase = inputPhrase
                self.outputPhrase = outputPhrase
                self.code = code
            }
        }
        
        public class InputPhrase: Codable {
            public let input: [Input]
            
            public init( input: [Input] ) {
                self.input = input
            }
        }
        
        public class Input: Codable {
            public let inputName: InputName
            public let tensor: Tensor
            
            public init( inputName: InputName, tensor: Tensor ) {
                self.inputName = inputName
                self.tensor = tensor
            }
        }
        
        public class OutputPhrase: Codable {
            public let output: [Output]
            
            public init( output: [Output] ) {
                self.output = output
            }
        }
        
        public class Output: Codable {
            public let outputName: OutputName
            public let tensor: Tensor
            
            public init( outputName: OutputName, tensor: Tensor ) {
                self.outputName = outputName
                self.tensor = tensor
            }
        }
        
        public class Variable: Codable {
            public let variableName: VariableName
            public let tensor: Tensor
            public let initializer: Initializer?
            
            public init( variableName: VariableName, tensor: Tensor, initializer: Initializer? ) {
                self.variableName = variableName
                self.tensor = tensor
                self.initializer = initializer
            }
        }
        
        public class Operation: Codable {
            public let resultPhrase: ResultPhrase
            public let operationName: OperationName
            public let argumentPhrase: ArgumentPhrase
            
            public init( resultPhrase: ResultPhrase, operationName: OperationName, argumentPhrase: ArgumentPhrase ) {
                self.resultPhrase = resultPhrase
                self.operationName = operationName
                self.argumentPhrase = argumentPhrase
            }
        }
        
        public class ResultPhrase: Codable {
            public let result: [Result]
            
            public init( result: [Result] ) {
                self.result = result
            }
        }
        
        public class ArgumentPhrase: Codable {
            public let argumentOrAttribute: [ArgumentOrAttribute]
            
            public init( argumentOrAttribute: [ArgumentOrAttribute] ) {
                self.argumentOrAttribute = argumentOrAttribute
            }
        }
        
        public class Initializer: Codable {
            public let tensorValue: TensorValue
            
            public init( tensorValue: TensorValue ) {
                self.tensorValue = tensorValue
            }
        }
        
        public class TensorValue: Codable {
            public let constantValue: [ConstantValue]
            
            public init( constantValue: [ConstantValue] ) {
                self.constantValue = constantValue
            }
        }
        
        public class Tensor: Codable {
            public let dimension: [Dimension]
            public let elementKind: ElementKind
            
            public init( dimension: [Dimension], elementKind: ElementKind ) {
                self.dimension = dimension
                self.elementKind = elementKind
            }
        }
        
        public class ElementKindInt8: Codable {
        }
        
        public class ElementKindUInt8: Codable {
        }
        
        public class ElementKindInt16: Codable {
        }
        
        public class ElementKindUInt16: Codable {
        }
        
        public class ElementKindInt32: Codable {
        }
        
        public class ElementKindUInt32: Codable {
        }
        
        public class ElementKindInt64: Codable {
        }
        
        public class ElementKindUInt64: Codable {
        }
        
        public class ElementKindFloat32: Codable {
        }
        
        public class ElementKindFloat64: Codable {
        }
        
        public class ElementKindString: Codable {
        }
        
        public class ElementKindUnknown: Codable {
        }
        
        public class UnknownDimension: Codable {
        }
        
        public class Attribute: Codable {
            public let attributeKey: AttributeKey
            public let attributeValue: AttributeValue
            
            public init( attributeKey: AttributeKey, attributeValue: AttributeValue ) {
                self.attributeKey = attributeKey
                self.attributeValue = attributeValue
            }
        }
        
        public class IntegerArrayValue: Codable {
            public let integer: [Integer]
            
            public init( integer: [Integer] ) {
                self.integer = integer
            }
        }
        
        public class FloatingPointArrayValue: Codable {
            public let floatingPoint: [FloatingPoint]
            
            public init( floatingPoint: [FloatingPoint] ) {
                self.floatingPoint = floatingPoint
            }
        }
        
        public class StringArrayValue: Codable {
            public let stringValue: [StringValue]
            
            public init( stringValue: [StringValue] ) {
                self.stringValue = stringValue
            }
        }
        
        public class FunctionReferenceValue: Codable {
            public let functionReferenceName: FunctionReferenceName
            
            public init( functionReferenceName: FunctionReferenceName ) {
                self.functionReferenceName = functionReferenceName
            }
        }
        
        public func transform( statement: Statement )
        {
            begin( statement: statement )
            
            if let childType = statement.childType {
                switch childType {
                case .variable:
                    transform( variable: statement.child! as! Variable )
                case .operation:
                    transform( operation: statement.child! as! Operation )
                case .function:
                    transform( function: statement.child! as! Function )
                case .kernel:
                    transform( kernel: statement.child! as! Kernel )
                    break
                }
            }
            
            end( statement: statement )
        }
        public func begin( statement: Statement ) {}
        public func end( statement: Statement ) {}
        
        public func transform( argumentOrAttribute: ArgumentOrAttribute )
        {
            begin( argumentOrAttribute: argumentOrAttribute )
            
            if let childType = argumentOrAttribute.childType {
                switch childType {
                case .attribute:
                    transform( attribute: argumentOrAttribute.child! as! Attribute )
                case .argument:
                    transform( argument: argumentOrAttribute.child! as! Argument )
                    break
                }
            }
            
            end( argumentOrAttribute: argumentOrAttribute )
        }
        public func begin( argumentOrAttribute: ArgumentOrAttribute ) {}
        public func end( argumentOrAttribute: ArgumentOrAttribute ) {}
        
        public func transform( constantValue: ConstantValue )
        {
            begin( constantValue: constantValue )
            
            if let childType = constantValue.childType {
                switch childType {
                case .numberValue:
                    transform( numberValue: constantValue.child! as! NumberValue )
                case .tensorValue:
                    transform( tensorValue: constantValue.child! as! TensorValue )
                case .stringValue:
                    transform( stringValue: constantValue.child! as! StringValue )
                    break
                }
            }
            
            end( constantValue: constantValue )
        }
        public func begin( constantValue: ConstantValue ) {}
        public func end( constantValue: ConstantValue ) {}
        
        public func transform( elementKind: ElementKind )
        {
            begin( elementKind: elementKind )
            
            if let childType = elementKind.childType {
                switch childType {
                case .elementKindInt8:
                    transform( elementKindInt8: elementKind.child! as! ElementKindInt8 )
                case .elementKindUInt8:
                    transform( elementKindUInt8: elementKind.child! as! ElementKindUInt8 )
                case .elementKindInt16:
                    transform( elementKindInt16: elementKind.child! as! ElementKindInt16 )
                case .elementKindUInt16:
                    transform( elementKindUInt16: elementKind.child! as! ElementKindUInt16 )
                case .elementKindInt32:
                    transform( elementKindInt32: elementKind.child! as! ElementKindInt32 )
                case .elementKindUInt32:
                    transform( elementKindUInt32: elementKind.child! as! ElementKindUInt32 )
                case .elementKindInt64:
                    transform( elementKindInt64: elementKind.child! as! ElementKindInt64 )
                case .elementKindUInt64:
                    transform( elementKindUInt64: elementKind.child! as! ElementKindUInt64 )
                case .elementKindFloat32:
                    transform( elementKindFloat32: elementKind.child! as! ElementKindFloat32 )
                case .elementKindFloat64:
                    transform( elementKindFloat64: elementKind.child! as! ElementKindFloat64 )
                case .elementKindString:
                    transform( elementKindString: elementKind.child! as! ElementKindString )
                case .elementKindUnknown:
                    transform( elementKindUnknown: elementKind.child! as! ElementKindUnknown )
                    break
                }
            }
            
            end( elementKind: elementKind )
        }
        public func begin( elementKind: ElementKind ) {}
        public func end( elementKind: ElementKind ) {}
        
        public func transform( dimension: Dimension )
        {
            begin( dimension: dimension )
            
            if let childType = dimension.childType {
                switch childType {
                case .fixedDimension:
                    transform( fixedDimension: dimension.child! as! FixedDimension )
                case .variableDimension:
                    transform( variableDimension: dimension.child! as! VariableDimension )
                case .unknownDimension:
                    transform( unknownDimension: dimension.child! as! UnknownDimension )
                    break
                }
            }
            
            end( dimension: dimension )
        }
        public func begin( dimension: Dimension ) {}
        public func end( dimension: Dimension ) {}
        
        public func transform( attributeValue: AttributeValue )
        {
            begin( attributeValue: attributeValue )
            
            if let childType = attributeValue.childType {
                switch childType {
                case .integerArrayValue:
                    transform( integerArrayValue: attributeValue.child! as! IntegerArrayValue )
                case .floatingPointArrayValue:
                    transform( floatingPointArrayValue: attributeValue.child! as! FloatingPointArrayValue )
                case .stringArrayValue:
                    transform( stringArrayValue: attributeValue.child! as! StringArrayValue )
                case .integer:
                    transform( integer: attributeValue.child! as! Integer )
                case .floatingPoint:
                    transform( floatingPoint: attributeValue.child! as! FloatingPoint )
                case .stringValue:
                    transform( stringValue: attributeValue.child! as! StringValue )
                case .functionReferenceValue:
                    transform( functionReferenceValue: attributeValue.child! as! FunctionReferenceValue )
                case .variableReferenceValue:
                    transform( variableReferenceValue: attributeValue.child! as! VariableReferenceValue )
                    break
                }
            }
            
            end( attributeValue: attributeValue )
        }
        public func begin( attributeValue: AttributeValue ) {}
        public func end( attributeValue: AttributeValue ) {}
        
        public func transform( numberValue: NumberValue )
        {
            begin( numberValue: numberValue )
            
            if let childType = numberValue.childType {
                switch childType {
                case .integer:
                    transform( integer: numberValue.child! as! Integer )
                case .floatingPoint:
                    transform( floatingPoint: numberValue.child! as! FloatingPoint )
                    break
                }
            }
            
            end( numberValue: numberValue )
        }
        public func begin( numberValue: NumberValue ) {}
        public func end( numberValue: NumberValue ) {}
        
        public func transform( functionName: FunctionName )
        {
            begin( functionName: functionName )
            
            end( functionName: functionName )
        }
        public func begin( functionName: FunctionName ) {}
        public func end( functionName: FunctionName ) {}
        
        public func transform( kernelName: KernelName )
        {
            begin( kernelName: kernelName )
            
            end( kernelName: kernelName )
        }
        public func begin( kernelName: KernelName ) {}
        public func end( kernelName: KernelName ) {}
        
        public func transform( code: Code )
        {
            begin( code: code )
            
            end( code: code )
        }
        public func begin( code: Code ) {}
        public func end( code: Code ) {}
        
        public func transform( inputName: InputName )
        {
            begin( inputName: inputName )
            
            end( inputName: inputName )
        }
        public func begin( inputName: InputName ) {}
        public func end( inputName: InputName ) {}
        
        public func transform( outputName: OutputName )
        {
            begin( outputName: outputName )
            
            end( outputName: outputName )
        }
        public func begin( outputName: OutputName ) {}
        public func end( outputName: OutputName ) {}
        
        public func transform( variableName: VariableName )
        {
            begin( variableName: variableName )
            
            end( variableName: variableName )
        }
        public func begin( variableName: VariableName ) {}
        public func end( variableName: VariableName ) {}
        
        public func transform( result: Result )
        {
            begin( result: result )
            
            end( result: result )
        }
        public func begin( result: Result ) {}
        public func end( result: Result ) {}
        
        public func transform( operationName: OperationName )
        {
            begin( operationName: operationName )
            
            end( operationName: operationName )
        }
        public func begin( operationName: OperationName ) {}
        public func end( operationName: OperationName ) {}
        
        public func transform( argument: Argument )
        {
            begin( argument: argument )
            
            end( argument: argument )
        }
        public func begin( argument: Argument ) {}
        public func end( argument: Argument ) {}
        
        public func transform( fixedDimension: FixedDimension )
        {
            begin( fixedDimension: fixedDimension )
            
            end( fixedDimension: fixedDimension )
        }
        public func begin( fixedDimension: FixedDimension ) {}
        public func end( fixedDimension: FixedDimension ) {}
        
        public func transform( variableDimension: VariableDimension )
        {
            begin( variableDimension: variableDimension )
            
            end( variableDimension: variableDimension )
        }
        public func begin( variableDimension: VariableDimension ) {}
        public func end( variableDimension: VariableDimension ) {}
        
        public func transform( attributeKey: AttributeKey )
        {
            begin( attributeKey: attributeKey )
            
            end( attributeKey: attributeKey )
        }
        public func begin( attributeKey: AttributeKey ) {}
        public func end( attributeKey: AttributeKey ) {}
        
        public func transform( integer: Integer )
        {
            begin( integer: integer )
            
            end( integer: integer )
        }
        public func begin( integer: Integer ) {}
        public func end( integer: Integer ) {}
        
        public func transform( floatingPoint: FloatingPoint )
        {
            begin( floatingPoint: floatingPoint )
            
            end( floatingPoint: floatingPoint )
        }
        public func begin( floatingPoint: FloatingPoint ) {}
        public func end( floatingPoint: FloatingPoint ) {}
        
        public func transform( stringValue: StringValue )
        {
            begin( stringValue: stringValue )
            
            end( stringValue: stringValue )
        }
        public func begin( stringValue: StringValue ) {}
        public func end( stringValue: StringValue ) {}
        
        public func transform( functionReferenceName: FunctionReferenceName )
        {
            begin( functionReferenceName: functionReferenceName )
            
            end( functionReferenceName: functionReferenceName )
        }
        public func begin( functionReferenceName: FunctionReferenceName ) {}
        public func end( functionReferenceName: FunctionReferenceName ) {}
        
        public func transform( variableReferenceValue: VariableReferenceValue )
        {
            begin( variableReferenceValue: variableReferenceValue )
            
            end( variableReferenceValue: variableReferenceValue )
        }
        public func begin( variableReferenceValue: VariableReferenceValue ) {}
        public func end( variableReferenceValue: VariableReferenceValue ) {}
        
        public func transform( model: Model )
        {
            begin( model: model )
            
            transform( function: model.function )
            
            end( model: model )
        }
        public func begin( model: Model ) {}
        public func end( model: Model ) {}
        
        public func transform( function: Function )
        {
            begin( function: function )
            
            transform( functionName: function.functionName )
            
            transform( inputPhrase: function.inputPhrase )
            
            transform( outputPhrase: function.outputPhrase )
            
            for statement in function.statement {
                transform( statement: statement )
            }
            
            end( function: function )
        }
        public func begin( function: Function ) {}
        public func end( function: Function ) {}
        
        public func transform( kernel: Kernel )
        {
            begin( kernel: kernel )
            
            transform( kernelName: kernel.kernelName )
            
            transform( inputPhrase: kernel.inputPhrase )
            
            transform( outputPhrase: kernel.outputPhrase )
            
            transform( code: kernel.code )
            
            end( kernel: kernel )
        }
        public func begin( kernel: Kernel ) {}
        public func end( kernel: Kernel ) {}
        
        public func transform( inputPhrase: InputPhrase )
        {
            begin( inputPhrase: inputPhrase )
            
            for input in inputPhrase.input {
                transform( input: input )
            }
            
            end( inputPhrase: inputPhrase )
        }
        public func begin( inputPhrase: InputPhrase ) {}
        public func end( inputPhrase: InputPhrase ) {}
        
        public func transform( input: Input )
        {
            begin( input: input )
            
            transform( inputName: input.inputName )
            
            transform( tensor: input.tensor )
            
            end( input: input )
        }
        public func begin( input: Input ) {}
        public func end( input: Input ) {}
        
        public func transform( outputPhrase: OutputPhrase )
        {
            begin( outputPhrase: outputPhrase )
            
            for output in outputPhrase.output {
                transform( output: output )
            }
            
            end( outputPhrase: outputPhrase )
        }
        public func begin( outputPhrase: OutputPhrase ) {}
        public func end( outputPhrase: OutputPhrase ) {}
        
        public func transform( output: Output )
        {
            begin( output: output )
            
            transform( outputName: output.outputName )
            
            transform( tensor: output.tensor )
            
            end( output: output )
        }
        public func begin( output: Output ) {}
        public func end( output: Output ) {}
        
        public func transform( variable: Variable )
        {
            begin( variable: variable )
            
            transform( variableName: variable.variableName )
            
            transform( tensor: variable.tensor )
            
            if let initializer = variable.initializer {
                transform( initializer: initializer )
            }
            
            end( variable: variable )
        }
        public func begin( variable: Variable ) {}
        public func end( variable: Variable ) {}
        
        public func transform( operation: Operation )
        {
            begin( operation: operation )
            
            transform( resultPhrase: operation.resultPhrase )
            
            transform( operationName: operation.operationName )
            
            transform( argumentPhrase: operation.argumentPhrase )
            
            end( operation: operation )
        }
        public func begin( operation: Operation ) {}
        public func end( operation: Operation ) {}
        
        public func transform( resultPhrase: ResultPhrase )
        {
            begin( resultPhrase: resultPhrase )
            
            for result in resultPhrase.result {
                transform( result: result )
            }
            
            end( resultPhrase: resultPhrase )
        }
        public func begin( resultPhrase: ResultPhrase ) {}
        public func end( resultPhrase: ResultPhrase ) {}
        
        public func transform( argumentPhrase: ArgumentPhrase )
        {
            begin( argumentPhrase: argumentPhrase )
            
            for argumentOrAttribute in argumentPhrase.argumentOrAttribute {
                transform( argumentOrAttribute: argumentOrAttribute )
            }
            
            end( argumentPhrase: argumentPhrase )
        }
        public func begin( argumentPhrase: ArgumentPhrase ) {}
        public func end( argumentPhrase: ArgumentPhrase ) {}
        
        public func transform( initializer: Initializer )
        {
            begin( initializer: initializer )
            
            transform( tensorValue: initializer.tensorValue )
            
            end( initializer: initializer )
        }
        public func begin( initializer: Initializer ) {}
        public func end( initializer: Initializer ) {}
        
        public func transform( tensorValue: TensorValue )
        {
            begin( tensorValue: tensorValue )
            
            for constantValue in tensorValue.constantValue {
                transform( constantValue: constantValue )
            }
            
            end( tensorValue: tensorValue )
        }
        public func begin( tensorValue: TensorValue ) {}
        public func end( tensorValue: TensorValue ) {}
        
        public func transform( tensor: Tensor )
        {
            begin( tensor: tensor )
            
            for dimension in tensor.dimension {
                transform( dimension: dimension )
            }
            
            transform( elementKind: tensor.elementKind )
            
            end( tensor: tensor )
        }
        public func begin( tensor: Tensor ) {}
        public func end( tensor: Tensor ) {}
        
        public func transform( elementKindInt8: ElementKindInt8 )
        {
            begin( elementKindInt8: elementKindInt8 )
            
            end( elementKindInt8: elementKindInt8 )
        }
        public func begin( elementKindInt8: ElementKindInt8 ) {}
        public func end( elementKindInt8: ElementKindInt8 ) {}
        
        public func transform( elementKindUInt8: ElementKindUInt8 )
        {
            begin( elementKindUInt8: elementKindUInt8 )
            
            end( elementKindUInt8: elementKindUInt8 )
        }
        public func begin( elementKindUInt8: ElementKindUInt8 ) {}
        public func end( elementKindUInt8: ElementKindUInt8 ) {}
        
        public func transform( elementKindInt16: ElementKindInt16 )
        {
            begin( elementKindInt16: elementKindInt16 )
            
            end( elementKindInt16: elementKindInt16 )
        }
        public func begin( elementKindInt16: ElementKindInt16 ) {}
        public func end( elementKindInt16: ElementKindInt16 ) {}
        
        public func transform( elementKindUInt16: ElementKindUInt16 )
        {
            begin( elementKindUInt16: elementKindUInt16 )
            
            end( elementKindUInt16: elementKindUInt16 )
        }
        public func begin( elementKindUInt16: ElementKindUInt16 ) {}
        public func end( elementKindUInt16: ElementKindUInt16 ) {}
        
        public func transform( elementKindInt32: ElementKindInt32 )
        {
            begin( elementKindInt32: elementKindInt32 )
            
            end( elementKindInt32: elementKindInt32 )
        }
        public func begin( elementKindInt32: ElementKindInt32 ) {}
        public func end( elementKindInt32: ElementKindInt32 ) {}
        
        public func transform( elementKindUInt32: ElementKindUInt32 )
        {
            begin( elementKindUInt32: elementKindUInt32 )
            
            end( elementKindUInt32: elementKindUInt32 )
        }
        public func begin( elementKindUInt32: ElementKindUInt32 ) {}
        public func end( elementKindUInt32: ElementKindUInt32 ) {}
        
        public func transform( elementKindInt64: ElementKindInt64 )
        {
            begin( elementKindInt64: elementKindInt64 )
            
            end( elementKindInt64: elementKindInt64 )
        }
        public func begin( elementKindInt64: ElementKindInt64 ) {}
        public func end( elementKindInt64: ElementKindInt64 ) {}
        
        public func transform( elementKindUInt64: ElementKindUInt64 )
        {
            begin( elementKindUInt64: elementKindUInt64 )
            
            end( elementKindUInt64: elementKindUInt64 )
        }
        public func begin( elementKindUInt64: ElementKindUInt64 ) {}
        public func end( elementKindUInt64: ElementKindUInt64 ) {}
        
        public func transform( elementKindFloat32: ElementKindFloat32 )
        {
            begin( elementKindFloat32: elementKindFloat32 )
            
            end( elementKindFloat32: elementKindFloat32 )
        }
        public func begin( elementKindFloat32: ElementKindFloat32 ) {}
        public func end( elementKindFloat32: ElementKindFloat32 ) {}
        
        public func transform( elementKindFloat64: ElementKindFloat64 )
        {
            begin( elementKindFloat64: elementKindFloat64 )
            
            end( elementKindFloat64: elementKindFloat64 )
        }
        public func begin( elementKindFloat64: ElementKindFloat64 ) {}
        public func end( elementKindFloat64: ElementKindFloat64 ) {}
        
        public func transform( elementKindString: ElementKindString )
        {
            begin( elementKindString: elementKindString )
            
            end( elementKindString: elementKindString )
        }
        public func begin( elementKindString: ElementKindString ) {}
        public func end( elementKindString: ElementKindString ) {}
        
        public func transform( elementKindUnknown: ElementKindUnknown )
        {
            begin( elementKindUnknown: elementKindUnknown )
            
            end( elementKindUnknown: elementKindUnknown )
        }
        public func begin( elementKindUnknown: ElementKindUnknown ) {}
        public func end( elementKindUnknown: ElementKindUnknown ) {}
        
        public func transform( unknownDimension: UnknownDimension )
        {
            begin( unknownDimension: unknownDimension )
            
            end( unknownDimension: unknownDimension )
        }
        public func begin( unknownDimension: UnknownDimension ) {}
        public func end( unknownDimension: UnknownDimension ) {}
        
        public func transform( attribute: Attribute )
        {
            begin( attribute: attribute )
            
            transform( attributeKey: attribute.attributeKey )
            
            transform( attributeValue: attribute.attributeValue )
            
            end( attribute: attribute )
        }
        public func begin( attribute: Attribute ) {}
        public func end( attribute: Attribute ) {}
        
        public func transform( integerArrayValue: IntegerArrayValue )
        {
            begin( integerArrayValue: integerArrayValue )
            
            for integer in integerArrayValue.integer {
                transform( integer: integer )
            }
            
            end( integerArrayValue: integerArrayValue )
        }
        public func begin( integerArrayValue: IntegerArrayValue ) {}
        public func end( integerArrayValue: IntegerArrayValue ) {}
        
        public func transform( floatingPointArrayValue: FloatingPointArrayValue )
        {
            begin( floatingPointArrayValue: floatingPointArrayValue )
            
            for floatingPoint in floatingPointArrayValue.floatingPoint {
                transform( floatingPoint: floatingPoint )
            }
            
            end( floatingPointArrayValue: floatingPointArrayValue )
        }
        public func begin( floatingPointArrayValue: FloatingPointArrayValue ) {}
        public func end( floatingPointArrayValue: FloatingPointArrayValue ) {}
        
        public func transform( stringArrayValue: StringArrayValue )
        {
            begin( stringArrayValue: stringArrayValue )
            
            for stringValue in stringArrayValue.stringValue {
                transform( stringValue: stringValue )
            }
            
            end( stringArrayValue: stringArrayValue )
        }
        public func begin( stringArrayValue: StringArrayValue ) {}
        public func end( stringArrayValue: StringArrayValue ) {}
        
        public func transform( functionReferenceValue: FunctionReferenceValue )
        {
            begin( functionReferenceValue: functionReferenceValue )
            
            transform( functionReferenceName: functionReferenceValue.functionReferenceName )
            
            end( functionReferenceValue: functionReferenceValue )
        }
        public func begin( functionReferenceValue: FunctionReferenceValue ) {}
        public func end( functionReferenceValue: FunctionReferenceValue ) {}
        
    } // class Transformer
    
} // extension TensorDsl

extension TensorDslCompiler {
    
    public class Formatter {
        
        public class Model: Codable {
            public var modelName: String?
            public var function: Function?
            
            public init() {
            }
            
            public init( modelName: String?, function: Function? ) {
                self.modelName = modelName
                self.function = function
            }
        }
        
        public class Function: Codable {
            public var indent: String?
            public var functionName: String?
            public var input: [Input]
            public var output: [Output]
            public var statement: [Statement]
            
            public init() {
                input = []
                output = []
                statement = []
            }
            
            public init( indent: String?, functionName: String?, input: [Input] = [], output: [Output] = [], statement: [Statement] = [] ) {
                self.indent = indent
                self.functionName = functionName
                self.input = input
                self.output = output
                self.statement = statement
            }
        }
        
        public class Input: Codable {
            public var inputName: String?
            public var tensor: Tensor?
            
            public init() {
            }
            
            public init( inputName: String?, tensor: Tensor? ) {
                self.inputName = inputName
                self.tensor = tensor
            }
        }
        
        public class Output: Codable {
            public var outputName: String?
            public var tensor: Tensor?
            
            public init() {
            }
            
            public init( outputName: String?, tensor: Tensor? ) {
                self.outputName = outputName
                self.tensor = tensor
            }
        }
        
        public class Statement: Codable {
            public var variable: Variable?
            public var operation: Operation?
            public var function: Function?
            public var kernel: Kernel?
            
            public init() {
            }
            
            public init( variable: Variable?, operation: Operation?, function: Function?, kernel: Kernel? ) {
                self.variable = variable
                self.operation = operation
                self.function = function
                self.kernel = kernel
            }
        }
        
        public class Variable: Codable {
            public var indent: String?
            public var variableName: String?
            public var tensor: Tensor?
            public var initializer: Initializer?
            
            public init() {
            }
            
            public init( indent: String?, variableName: String?, tensor: Tensor?, initializer: Initializer? ) {
                self.indent = indent
                self.variableName = variableName
                self.tensor = tensor
                self.initializer = initializer
            }
        }
        
        public class Operation: Codable {
            public var indent: String?
            public var comment: String?
            public var result: [Result]
            public var operationName: String?
            public var argumentOrAttribute: [ArgumentOrAttribute]
            
            public init() {
                result = []
                argumentOrAttribute = []
            }
            
            public init( indent: String?, comment: String?, result: [Result] = [], operationName: String?, argumentOrAttribute: [ArgumentOrAttribute] = [] ) {
                self.indent = indent
                self.comment = comment
                self.result = result
                self.operationName = operationName
                self.argumentOrAttribute = argumentOrAttribute
            }
        }
        
        public class Result: Codable {
            public var resultName: String?
            
            public init() {
            }
            
            public init( resultName: String? ) {
                self.resultName = resultName
            }
        }
        
        public class ArgumentOrAttribute: Codable {
            public var attribute: Attribute?
            public var argument: Argument?
            
            public init() {
            }
            
            public init( attribute: Attribute?, argument: Argument? ) {
                self.attribute = attribute
                self.argument = argument
            }
        }
        
        public class Argument: Codable {
            public var argumentName: String?
            
            public init() {
            }
            
            public init( argumentName: String? ) {
                self.argumentName = argumentName
            }
        }
        
        public class Attribute: Codable {
            public var attributeName: String?
            public var attributeValue: AttributeValue?
            
            public init() {
            }
            
            public init( attributeName: String?, attributeValue: AttributeValue? ) {
                self.attributeName = attributeName
                self.attributeValue = attributeValue
            }
        }
        
        public class AttributeValue: Codable {
            public var integerArrayValue: IntegerArrayValue?
            public var floatingPointArrayValue: FloatingPointArrayValue?
            public var stringArrayValue: StringArrayValue?
            public var integer: Integer?
            public var floatingPoint: FloatingPoint?
            public var stringValue: StringValue?
            public var functionReferenceValue: FunctionReferenceValue?
            public var variableReferenceValue: VariableReferenceValue?
            
            public init() {
            }
            
            public init( integerArrayValue: IntegerArrayValue?, floatingPointArrayValue: FloatingPointArrayValue?, stringArrayValue: StringArrayValue?, integer: Integer?, floatingPoint: FloatingPoint?, stringValue: StringValue?, functionReferenceValue: FunctionReferenceValue?, variableReferenceValue: VariableReferenceValue? ) {
                self.integerArrayValue = integerArrayValue
                self.floatingPointArrayValue = floatingPointArrayValue
                self.stringArrayValue = stringArrayValue
                self.integer = integer
                self.floatingPoint = floatingPoint
                self.stringValue = stringValue
                self.functionReferenceValue = functionReferenceValue
                self.variableReferenceValue = variableReferenceValue
            }
        }
        
        public class IntegerArrayValue: Codable {
            public var integer: [Integer]
            
            public init() {
                integer = []
            }
            
            public init( integer: [Integer] = [] ) {
                self.integer = integer
            }
        }
        
        public class Integer: Codable {
            public var integerValue: String?
            
            public init() {
            }
            
            public init( integerValue: String? ) {
                self.integerValue = integerValue
            }
        }
        
        public class FloatingPointArrayValue: Codable {
            public var floatingPoint: [FloatingPoint]
            
            public init() {
                floatingPoint = []
            }
            
            public init( floatingPoint: [FloatingPoint] = [] ) {
                self.floatingPoint = floatingPoint
            }
        }
        
        public class FloatingPoint: Codable {
            public var floatingPoint: String?
            
            public init() {
            }
            
            public init( floatingPoint: String? ) {
                self.floatingPoint = floatingPoint
            }
        }
        
        public class StringArrayValue: Codable {
            public var stringValue: [StringValue]
            
            public init() {
                stringValue = []
            }
            
            public init( stringValue: [StringValue] = [] ) {
                self.stringValue = stringValue
            }
        }
        
        public class StringValue: Codable {
            public var string: String?
            
            public init() {
            }
            
            public init( string: String? ) {
                self.string = string
            }
        }
        
        public class FunctionReferenceValue: Codable {
            public var functionName: String?
            
            public init() {
            }
            
            public init( functionName: String? ) {
                self.functionName = functionName
            }
        }
        
        public class VariableReferenceValue: Codable {
            public var variableName: String?
            
            public init() {
            }
            
            public init( variableName: String? ) {
                self.variableName = variableName
            }
        }
        
        public class Initializer: Codable {
            public var tensorValue: TensorValue?
            
            public init() {
            }
            
            public init( tensorValue: TensorValue? ) {
                self.tensorValue = tensorValue
            }
        }
        
        public class TensorValue: Codable {
            public var indent: String?
            public var subtensorValue: [SubtensorValue]
            public var comma: Comma?
            
            public init() {
                subtensorValue = []
            }
            
            public init( indent: String?, subtensorValue: [SubtensorValue] = [], comma: Comma? ) {
                self.indent = indent
                self.subtensorValue = subtensorValue
                self.comma = comma
            }
        }
        
        public class SubtensorValue: Codable {
            public var tensorValue: TensorValue?
            public var matrixValue: MatrixValue?
            
            public init() {
            }
            
            public init( tensorValue: TensorValue?, matrixValue: MatrixValue? ) {
                self.tensorValue = tensorValue
                self.matrixValue = matrixValue
            }
        }
        
        public class MatrixValue: Codable {
            public var rowValue: [RowValue]
            
            public init() {
                rowValue = []
            }
            
            public init( rowValue: [RowValue] = [] ) {
                self.rowValue = rowValue
            }
        }
        
        public class Comma: Codable {
        }
        
        public class RowValue: Codable {
            public var indent: String?
            public var columnValue: [ColumnValue]
            public var comma: Comma?
            
            public init() {
                columnValue = []
            }
            
            public init( indent: String?, columnValue: [ColumnValue] = [], comma: Comma? ) {
                self.indent = indent
                self.columnValue = columnValue
                self.comma = comma
            }
        }
        
        public class ColumnValue: Codable {
            public var numberValue: NumberValue?
            public var stringValue: StringValue?
            
            public init() {
            }
            
            public init( numberValue: NumberValue?, stringValue: StringValue? ) {
                self.numberValue = numberValue
                self.stringValue = stringValue
            }
        }
        
        public class NumberValue: Codable {
            public var integer: Integer?
            public var floatingPoint: FloatingPoint?
            
            public init() {
            }
            
            public init( integer: Integer?, floatingPoint: FloatingPoint? ) {
                self.integer = integer
                self.floatingPoint = floatingPoint
            }
        }
        
        public class Tensor: Codable {
            public var dimension: [Dimension]
            public var elementKind: String?
            
            public init() {
                dimension = []
            }
            
            public init( dimension: [Dimension] = [], elementKind: String? ) {
                self.dimension = dimension
                self.elementKind = elementKind
            }
        }
        
        public class Dimension: Codable {
            public var fixedDimension: FixedDimension?
            public var variableDimension: VariableDimension?
            public var unknownDimension: UnknownDimension?
            
            public init() {
            }
            
            public init( fixedDimension: FixedDimension?, variableDimension: VariableDimension?, unknownDimension: UnknownDimension? ) {
                self.fixedDimension = fixedDimension
                self.variableDimension = variableDimension
                self.unknownDimension = unknownDimension
            }
        }
        
        public class FixedDimension: Codable {
            public var integer: String?
            
            public init() {
            }
            
            public init( integer: String? ) {
                self.integer = integer
            }
        }
        
        public class VariableDimension: Codable {
            public var identifier: String?
            
            public init() {
            }
            
            public init( identifier: String? ) {
                self.identifier = identifier
            }
        }
        
        public class UnknownDimension: Codable {
        }
        
        public class Kernel: Codable {
            public var indent: String?
            public var kernelName: String?
            public var input: [Input]
            public var output: [Output]
            public var code: String?
            
            public init() {
                input = []
                output = []
            }
            
            public init( indent: String?, kernelName: String?, input: [Input] = [], output: [Output] = [], code: String? ) {
                self.indent = indent
                self.kernelName = kernelName
                self.input = input
                self.output = output
                self.code = code
            }
        }
        
        public static func format( model: Model, buffer: Buffer ) {
            _ = buffer.put( string: "//\n" )
            _ = buffer.put( string: "//  " )
            if let modelName = model.modelName {
                _ = buffer.put( string: modelName )
            }
            _ = buffer.put( string: ".td\n" )
            _ = buffer.put( string: "//  tensor-dsl\n" )
            _ = buffer.put( string: "//\n" )
            _ = buffer.put( string: "//  Copyright © 2023 Artificer AI. All rights reserved.\n" )
            _ = buffer.put( string: "//\n" )
            _ = buffer.put( string: "//\n" )
            if let function = model.function {
                format( function: function, buffer: buffer )
            }
        }
        
        public static func format( function: Function, buffer: Buffer ) {
            if let indent = function.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = function.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "func " )
            if let functionName = function.functionName {
                _ = buffer.put( string: functionName )
            }
            _ = buffer.put( string: "(" )
            if function.input.count > 0 {
                _ = buffer.put( string: " " )
                for input in function.input {
                    if input !== function.input.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( input: input, buffer: buffer )
                }
                _ = buffer.put( string: " " )
            }
            _ = buffer.put( string: ") -> (" )
            if function.output.count > 0 {
                _ = buffer.put( string: " " )
                for output in function.output {
                    if output !== function.output.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( output: output, buffer: buffer )
                }
                _ = buffer.put( string: " " )
            }
            _ = buffer.put( string: ") {\n" )
            if function.statement.count > 0 {
                _ = buffer.put( string: "" )
                for statement in function.statement {
                    if statement !== function.statement.first {
                        _ = buffer.put( string: "" )
                    }
                    format( statement: statement, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if let indent = function.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( input: Input, buffer: Buffer ) {
            if let inputName = input.inputName {
                _ = buffer.put( string: inputName )
            }
            _ = buffer.put( string: ": " )
            if let tensor = input.tensor {
                format( tensor: tensor, buffer: buffer )
            }
        }
        
        public static func format( output: Output, buffer: Buffer ) {
            if let outputName = output.outputName {
                _ = buffer.put( string: outputName )
            }
            _ = buffer.put( string: ": " )
            if let tensor = output.tensor {
                format( tensor: tensor, buffer: buffer )
            }
        }
        
        public static func format( statement: Statement, buffer: Buffer ) {
            if let variable = statement.variable {
                format( variable: variable, buffer: buffer )
            }
            if let operation = statement.operation {
                format( operation: operation, buffer: buffer )
            }
            if let function = statement.function {
                format( function: function, buffer: buffer )
            }
            if let kernel = statement.kernel {
                format( kernel: kernel, buffer: buffer )
            }
        }
        
        public static func format( variable: Variable, buffer: Buffer ) {
            if let indent = variable.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = variable.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "var " )
            if let variableName = variable.variableName {
                _ = buffer.put( string: variableName )
            }
            _ = buffer.put( string: ": " )
            if let tensor = variable.tensor {
                format( tensor: tensor, buffer: buffer )
            }
            if let initializer = variable.initializer {
                format( initializer: initializer, buffer: buffer )
            }
            _ = buffer.put( string: "\n" )
        }
        
        public static func format( operation: Operation, buffer: Buffer ) {
            if let indent = operation.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "  \n" )
            if let indent = operation.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "  // " )
            if let comment = operation.comment {
                _ = buffer.put( string: comment )
            }
            _ = buffer.put( string: "\n" )
            if let indent = operation.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "  (" )
            if operation.result.count > 0 {
                _ = buffer.put( string: " " )
                for result in operation.result {
                    if result !== operation.result.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( result: result, buffer: buffer )
                }
                _ = buffer.put( string: " " )
            }
            _ = buffer.put( string: ") = " )
            if let operationName = operation.operationName {
                _ = buffer.put( string: operationName )
            }
            _ = buffer.put( string: "(" )
            if operation.argumentOrAttribute.count > 0 {
                _ = buffer.put( string: " " )
                for argumentOrAttribute in operation.argumentOrAttribute {
                    if argumentOrAttribute !== operation.argumentOrAttribute.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( argumentOrAttribute: argumentOrAttribute, buffer: buffer )
                }
                _ = buffer.put( string: " " )
            }
            _ = buffer.put( string: ")\n" )
        }
        
        public static func format( result: Result, buffer: Buffer ) {
            if let resultName = result.resultName {
                _ = buffer.put( string: resultName )
            }
        }
        
        public static func format( argumentOrAttribute: ArgumentOrAttribute, buffer: Buffer ) {
            if let attribute = argumentOrAttribute.attribute {
                format( attribute: attribute, buffer: buffer )
            }
            if let argument = argumentOrAttribute.argument {
                format( argument: argument, buffer: buffer )
            }
        }
        
        public static func format( argument: Argument, buffer: Buffer ) {
            if let argumentName = argument.argumentName {
                _ = buffer.put( string: argumentName )
            }
        }
        
        public static func format( attribute: Attribute, buffer: Buffer ) {
            if let attributeName = attribute.attributeName {
                _ = buffer.put( string: attributeName )
            }
            _ = buffer.put( string: ": " )
            if let attributeValue = attribute.attributeValue {
                format( attributeValue: attributeValue, buffer: buffer )
            }
        }
        
        public static func format( attributeValue: AttributeValue, buffer: Buffer ) {
            if let integerArrayValue = attributeValue.integerArrayValue {
                format( integerArrayValue: integerArrayValue, buffer: buffer )
            }
            if let floatingPointArrayValue = attributeValue.floatingPointArrayValue {
                format( floatingPointArrayValue: floatingPointArrayValue, buffer: buffer )
            }
            if let stringArrayValue = attributeValue.stringArrayValue {
                format( stringArrayValue: stringArrayValue, buffer: buffer )
            }
            if let integer = attributeValue.integer {
                format( integer: integer, buffer: buffer )
            }
            if let floatingPoint = attributeValue.floatingPoint {
                format( floatingPoint: floatingPoint, buffer: buffer )
            }
            if let stringValue = attributeValue.stringValue {
                format( stringValue: stringValue, buffer: buffer )
            }
            if let functionReferenceValue = attributeValue.functionReferenceValue {
                format( functionReferenceValue: functionReferenceValue, buffer: buffer )
            }
            if let variableReferenceValue = attributeValue.variableReferenceValue {
                format( variableReferenceValue: variableReferenceValue, buffer: buffer )
            }
        }
        
        public static func format( integerArrayValue: IntegerArrayValue, buffer: Buffer ) {
            _ = buffer.put( string: "[" )
            if integerArrayValue.integer.count > 0 {
                _ = buffer.put( string: " " )
                for integer in integerArrayValue.integer {
                    if integer !== integerArrayValue.integer.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( integer: integer, buffer: buffer )
                }
                _ = buffer.put( string: " " )
            }
            _ = buffer.put( string: "]" )
        }
        
        public static func format( integer: Integer, buffer: Buffer ) {
            if let integerValue = integer.integerValue {
                _ = buffer.put( string: integerValue )
            }
        }
        
        public static func format( floatingPointArrayValue: FloatingPointArrayValue, buffer: Buffer ) {
            _ = buffer.put( string: "[" )
            if floatingPointArrayValue.floatingPoint.count > 0 {
                _ = buffer.put( string: " " )
                for floatingPoint in floatingPointArrayValue.floatingPoint {
                    if floatingPoint !== floatingPointArrayValue.floatingPoint.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( floatingPoint: floatingPoint, buffer: buffer )
                }
                _ = buffer.put( string: " " )
            }
            _ = buffer.put( string: "]" )
        }
        
        public static func format( floatingPoint: FloatingPoint, buffer: Buffer ) {
            if let floatingPoint = floatingPoint.floatingPoint {
                _ = buffer.put( string: floatingPoint )
            }
        }
        
        public static func format( stringArrayValue: StringArrayValue, buffer: Buffer ) {
            _ = buffer.put( string: "[" )
            if stringArrayValue.stringValue.count > 0 {
                _ = buffer.put( string: " " )
                for stringValue in stringArrayValue.stringValue {
                    if stringValue !== stringArrayValue.stringValue.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( stringValue: stringValue, buffer: buffer )
                }
                _ = buffer.put( string: " " )
            }
            _ = buffer.put( string: "]" )
        }
        
        public static func format( stringValue: StringValue, buffer: Buffer ) {
            if let string = stringValue.string {
                _ = buffer.put( string: string )
            }
        }
        
        public static func format( functionReferenceValue: FunctionReferenceValue, buffer: Buffer ) {
            if let functionName = functionReferenceValue.functionName {
                _ = buffer.put( string: functionName )
            }
            _ = buffer.put( string: "(" )
            _ = buffer.put( string: ")" )
        }
        
        public static func format( variableReferenceValue: VariableReferenceValue, buffer: Buffer ) {
            if let variableName = variableReferenceValue.variableName {
                _ = buffer.put( string: variableName )
            }
        }
        
        public static func format( initializer: Initializer, buffer: Buffer ) {
            _ = buffer.put( string: " =\n" )
            if let tensorValue = initializer.tensorValue {
                format( tensorValue: tensorValue, buffer: buffer )
            }
        }
        
        public static func format( tensorValue: TensorValue, buffer: Buffer ) {
            if let indent = tensorValue.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "[\n" )
            if tensorValue.subtensorValue.count > 0 {
                _ = buffer.put( string: "" )
                for subtensorValue in tensorValue.subtensorValue {
                    if subtensorValue !== tensorValue.subtensorValue.first {
                        _ = buffer.put( string: "" )
                    }
                    format( subtensorValue: subtensorValue, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if let indent = tensorValue.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "]" )
            if let comma = tensorValue.comma {
                format( comma: comma, buffer: buffer )
            }
            _ = buffer.put( string: "\n" )
        }
        
        public static func format( subtensorValue: SubtensorValue, buffer: Buffer ) {
            if let tensorValue = subtensorValue.tensorValue {
                format( tensorValue: tensorValue, buffer: buffer )
            }
            if let matrixValue = subtensorValue.matrixValue {
                format( matrixValue: matrixValue, buffer: buffer )
            }
        }
        
        public static func format( matrixValue: MatrixValue, buffer: Buffer ) {
            if matrixValue.rowValue.count > 0 {
                _ = buffer.put( string: "" )
                for rowValue in matrixValue.rowValue {
                    if rowValue !== matrixValue.rowValue.first {
                        _ = buffer.put( string: "" )
                    }
                    format( rowValue: rowValue, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
        }
        
        public static func format( comma: Comma, buffer: Buffer ) {
            _ = buffer.put( string: "," )
        }
        
        public static func format( rowValue: RowValue, buffer: Buffer ) {
            if let indent = rowValue.indent {
                _ = buffer.put( string: indent )
            }
            if rowValue.columnValue.count > 0 {
                _ = buffer.put( string: "" )
                for columnValue in rowValue.columnValue {
                    if columnValue !== rowValue.columnValue.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( columnValue: columnValue, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if let comma = rowValue.comma {
                format( comma: comma, buffer: buffer )
            }
            _ = buffer.put( string: "\n" )
        }
        
        public static func format( columnValue: ColumnValue, buffer: Buffer ) {
            if let numberValue = columnValue.numberValue {
                format( numberValue: numberValue, buffer: buffer )
            }
            if let stringValue = columnValue.stringValue {
                format( stringValue: stringValue, buffer: buffer )
            }
        }
        
        public static func format( numberValue: NumberValue, buffer: Buffer ) {
            if let integer = numberValue.integer {
                format( integer: integer, buffer: buffer )
            }
            if let floatingPoint = numberValue.floatingPoint {
                format( floatingPoint: floatingPoint, buffer: buffer )
            }
        }
        
        public static func format( tensor: Tensor, buffer: Buffer ) {
            _ = buffer.put( string: "[" )
            if tensor.dimension.count > 0 {
                _ = buffer.put( string: "" )
                for dimension in tensor.dimension {
                    if dimension !== tensor.dimension.first {
                        _ = buffer.put( string: "*" )
                    }
                    format( dimension: dimension, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            _ = buffer.put( string: ":" )
            if let elementKind = tensor.elementKind {
                _ = buffer.put( string: elementKind )
            }
            _ = buffer.put( string: "]" )
        }
        
        public static func format( dimension: Dimension, buffer: Buffer ) {
            if let fixedDimension = dimension.fixedDimension {
                format( fixedDimension: fixedDimension, buffer: buffer )
            }
            if let variableDimension = dimension.variableDimension {
                format( variableDimension: variableDimension, buffer: buffer )
            }
            if let unknownDimension = dimension.unknownDimension {
                format( unknownDimension: unknownDimension, buffer: buffer )
            }
        }
        
        public static func format( fixedDimension: FixedDimension, buffer: Buffer ) {
            if let integer = fixedDimension.integer {
                _ = buffer.put( string: integer )
            }
        }
        
        public static func format( variableDimension: VariableDimension, buffer: Buffer ) {
            if let identifier = variableDimension.identifier {
                _ = buffer.put( string: identifier )
            }
        }
        
        public static func format( unknownDimension: UnknownDimension, buffer: Buffer ) {
            _ = buffer.put( string: "?" )
        }
        
        public static func format( kernel: Kernel, buffer: Buffer ) {
            if let indent = kernel.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = kernel.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "func " )
            if let kernelName = kernel.kernelName {
                _ = buffer.put( string: kernelName )
            }
            _ = buffer.put( string: "(" )
            if kernel.input.count > 0 {
                _ = buffer.put( string: " " )
                for input in kernel.input {
                    if input !== kernel.input.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( input: input, buffer: buffer )
                }
                _ = buffer.put( string: " " )
            }
            _ = buffer.put( string: ") -> (" )
            if kernel.output.count > 0 {
                _ = buffer.put( string: " " )
                for output in kernel.output {
                    if output !== kernel.output.first {
                        _ = buffer.put( string: ", " )
                    }
                    format( output: output, buffer: buffer )
                }
                _ = buffer.put( string: " " )
            }
            _ = buffer.put( string: ")\n" )
            if let indent = kernel.indent {
                _ = buffer.put( string: indent )
            }
            if let code = kernel.code {
                _ = buffer.put( string: code )
            }
        }
    }
} // extension TensorDsl

extension TensorDslCompiler {
    
    public class Printer {
    }
} // extension TensorDsl

extension TensorDslCompiler {
    
    class ErrorTransform : Transformer {
    }
    
    class DefinitionsTransform : ErrorTransform {
        
        func check() {
        }
    }
}
