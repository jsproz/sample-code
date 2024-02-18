//
//  CommandLineTensorDslCompiler.swift
//  CommandLineTensorDsl
//
//  Copyright © 2023 Artificer AI. All rights reserved.
//

import Runtime

public class CommandLineTensorDslCompiler {
}

extension CommandLineTensorDslCompiler {
    
    public enum TokenKind : Int {
        case unknown
        case literal
        case indent
        case dedent
        case endOfInput
        case flagToken
        case operandToken
    }
    
    public enum LiteralKind : Int {
        case unknown
        case literal0
    }
    
    public class Scanner {
        
        public var tabSize: Int
        
        public init( tabSize: Int = 8 ) {
            self.tabSize = tabSize
        }
        
        // "--"
        func scanLiteral0( buffer : TokenList ) -> Bool {
            let matchStringAndPosition = buffer.stringMatches( "--" )
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
        
        // U+002D
        func scanSet0( buffer : TokenList ) -> Bool {
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
        
        // U+002D
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
        
        // U+002D
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
        
        func scanFlagToken( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanSet0( buffer: buffer ) && scanElement( buffer: buffer, minimum: 1 )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotFlagToken( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanFlagToken( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanFlagToken( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanFlagToken( buffer: buffer ) {
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
        
        func scanFlagToken( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanFlagToken( buffer: buffer ) {
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
        
        func scanOperandToken( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanElement( buffer: buffer, minimum: 1 )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotOperandToken( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanOperandToken( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanOperandToken( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanOperandToken( buffer: buffer ) {
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
        
        func scanOperandToken( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanOperandToken( buffer: buffer ) {
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
        
        func scanElement( buffer : TokenList ) -> Bool {
            let position = buffer.position
            var matches = false
            if !matches {
                matches = scanNotSetEmpty( buffer: buffer )
            }
            if !matches {
                buffer.position = position
            }
            return matches
        }
        
        func scanNotElement( buffer : TokenList ) -> Bool {
            if buffer.isAtBreak {
                return false
            }
            let position = buffer.position
            let matches = scanElement( buffer: buffer )
            if matches {
                buffer.position = position
                return false
            } else {
                Runtime.Scanner.skipOneUnicodeScalar( buffer: buffer )
                return true
            }
        }
        
        func scanElement( buffer : TokenList, minimum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while scanElement( buffer: buffer ) {
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
        
        func scanElement( buffer : TokenList, minimum : Int, maximum : Int ) -> Bool {
            let originalPosition = buffer.position
            var position = buffer.position
            var count = 0
            while count < maximum && scanElement( buffer: buffer ) {
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
        
        func getTokenFlagToken( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanFlagToken( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.flagToken.rawValue )
            } else {
                return nil
            }
        }
        
        func getTokenOperandToken( buffer : TokenList ) -> Token? {
            let position = buffer.position
            if scanOperandToken( buffer: buffer ) {
                return buffer.getToken( beginPosition: position, tokenKind: TokenKind.operandToken.rawValue )
            } else {
                return nil
            }
        }
        
        func getTrivia( buffer : TokenList ) -> [Token] {
            return []
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
                if let temporaryToken = getTokenFlagToken( buffer: buffer ) {
                    if buffer.position > maximumPosition {
                        maximumPosition = buffer.position
                        token = temporaryToken
                    }
                }
                
                buffer.position = originalPosition
                if let temporaryToken = getTokenOperandToken( buffer: buffer ) {
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
            let filter : [Int] = []
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
} // extension CommandLineTensorDsl

extension CommandLineTensorDslCompiler {
    
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
        
        func parseFormHelpFlagOption( index: Int, tokenList: TokenList ) -> ( node: Transformer.FormHelpFlagOption?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-help" {
                    return ( nil, index )
                }
                return ( Transformer.FormHelpFlagOption( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseFormVersionFlagOption( index: Int, tokenList: TokenList ) -> ( node: Transformer.FormVersionFlagOption?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-version" {
                    return ( nil, index )
                }
                return ( Transformer.FormVersionFlagOption( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseCommandName( index: Int, tokenList: TokenList ) -> ( node: Transformer.CommandName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.operandToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "tensor-dsl" {
                    return ( nil, index )
                }
                return ( Transformer.CommandName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0CommandName( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0CommandName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.operandToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "tensor-dsl" {
                    return ( nil, index )
                }
                return ( Transformer.Form0CommandName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0FlagTd( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0FlagTd?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-td" {
                    return ( nil, index )
                }
                return ( Transformer.Form0FlagTd( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0OperandTd( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0OperandTd?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.operandToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Form0OperandTd( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0FlagLibrary( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0FlagLibrary?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-library" {
                    return ( nil, index )
                }
                return ( Transformer.Form0FlagLibrary( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0OperandLibrary( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0OperandLibrary?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.operandToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Form0OperandLibrary( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0FlagIncludeData( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0FlagIncludeData?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-include-data" {
                    return ( nil, index )
                }
                return ( Transformer.Form0FlagIncludeData( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0FlagConstruct( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0FlagConstruct?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-construct" {
                    return ( nil, index )
                }
                return ( Transformer.Form0FlagConstruct( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0FlagSaveTd( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0FlagSaveTd?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-save-td" {
                    return ( nil, index )
                }
                return ( Transformer.Form0FlagSaveTd( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0FlagSaveTdb( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0FlagSaveTdb?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-save-tdb" {
                    return ( nil, index )
                }
                return ( Transformer.Form0FlagSaveTdb( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0FlagSaveKernels( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0FlagSaveKernels?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-save-kernels" {
                    return ( nil, index )
                }
                return ( Transformer.Form0FlagSaveKernels( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0FlagOutput( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0FlagOutput?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-output" {
                    return ( nil, index )
                }
                return ( Transformer.Form0FlagOutput( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0OperandOutput( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0OperandOutput?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.operandToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Form0OperandOutput( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1CommandName( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1CommandName?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.operandToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "tensor-dsl" {
                    return ( nil, index )
                }
                return ( Transformer.Form1CommandName( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1FlagTdb( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1FlagTdb?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-tdb" {
                    return ( nil, index )
                }
                return ( Transformer.Form1FlagTdb( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1OperandTdb( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1OperandTdb?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.operandToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Form1OperandTdb( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1FlagLibrary( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1FlagLibrary?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-library" {
                    return ( nil, index )
                }
                return ( Transformer.Form1FlagLibrary( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1OperandLibrary( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1OperandLibrary?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.operandToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Form1OperandLibrary( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1FlagIncludeData( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1FlagIncludeData?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-include-data" {
                    return ( nil, index )
                }
                return ( Transformer.Form1FlagIncludeData( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1FlagConstruct( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1FlagConstruct?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-construct" {
                    return ( nil, index )
                }
                return ( Transformer.Form1FlagConstruct( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1FlagSaveTd( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1FlagSaveTd?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-save-td" {
                    return ( nil, index )
                }
                return ( Transformer.Form1FlagSaveTd( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1FlagSaveTdb( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1FlagSaveTdb?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-save-tdb" {
                    return ( nil, index )
                }
                return ( Transformer.Form1FlagSaveTdb( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1FlagSaveKernels( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1FlagSaveKernels?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-save-kernels" {
                    return ( nil, index )
                }
                return ( Transformer.Form1FlagSaveKernels( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1FlagOutput( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1FlagOutput?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.flagToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                if token.text != "-output" {
                    return ( nil, index )
                }
                return ( Transformer.Form1FlagOutput( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1OperandOutput( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1OperandOutput?, index: Int ) {
            let tokenAtIndex = parse( tokenKind: TokenKind.operandToken, index: index, tokenList: tokenList )
            if maximumIndex < index {
                maximumIndex = index
            }
            
            if let token = tokenAtIndex.token {
                return ( Transformer.Form1OperandOutput( token: token ), tokenAtIndex.index )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form?, index: Int ) {
            var result: ( node: Transformer.Form?, index: Int )? = nil
            
            let formHelpAtIndex = parseFormHelp( index: index, tokenList: tokenList )
            let formHelp = formHelpAtIndex.node
            if formHelp != nil && ( result == nil || result!.index < formHelpAtIndex.index ) {
                let newIndex = formHelpAtIndex.index
                result = ( Transformer.Form( formHelp: formHelp! ), newIndex )
            }
            
            let formVersionAtIndex = parseFormVersion( index: index, tokenList: tokenList )
            let formVersion = formVersionAtIndex.node
            if formVersion != nil && ( result == nil || result!.index < formVersionAtIndex.index ) {
                let newIndex = formVersionAtIndex.index
                result = ( Transformer.Form( formVersion: formVersion! ), newIndex )
            }
            
            let form0AtIndex = parseForm0( index: index, tokenList: tokenList )
            let form0 = form0AtIndex.node
            if form0 != nil && ( result == nil || result!.index < form0AtIndex.index ) {
                let newIndex = form0AtIndex.index
                result = ( Transformer.Form( form0: form0! ), newIndex )
            }
            
            let form1AtIndex = parseForm1( index: index, tokenList: tokenList )
            let form1 = form1AtIndex.node
            if form1 != nil && ( result == nil || result!.index < form1AtIndex.index ) {
                let newIndex = form1AtIndex.index
                result = ( Transformer.Form( form1: form1! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0Option( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0Option?, index: Int ) {
            var result: ( node: Transformer.Form0Option?, index: Int )? = nil
            
            let form0TdAtIndex = parseForm0Td( index: index, tokenList: tokenList )
            let form0Td = form0TdAtIndex.node
            if form0Td != nil && ( result == nil || result!.index < form0TdAtIndex.index ) {
                let newIndex = form0TdAtIndex.index
                result = ( Transformer.Form0Option( form0Td: form0Td! ), newIndex )
            }
            
            let form0LibraryAtIndex = parseForm0Library( index: index, tokenList: tokenList )
            let form0Library = form0LibraryAtIndex.node
            if form0Library != nil && ( result == nil || result!.index < form0LibraryAtIndex.index ) {
                let newIndex = form0LibraryAtIndex.index
                result = ( Transformer.Form0Option( form0Library: form0Library! ), newIndex )
            }
            
            let form0IncludeDataAtIndex = parseForm0IncludeData( index: index, tokenList: tokenList )
            let form0IncludeData = form0IncludeDataAtIndex.node
            if form0IncludeData != nil && ( result == nil || result!.index < form0IncludeDataAtIndex.index ) {
                let newIndex = form0IncludeDataAtIndex.index
                result = ( Transformer.Form0Option( form0IncludeData: form0IncludeData! ), newIndex )
            }
            
            let form0ConstructAtIndex = parseForm0Construct( index: index, tokenList: tokenList )
            let form0Construct = form0ConstructAtIndex.node
            if form0Construct != nil && ( result == nil || result!.index < form0ConstructAtIndex.index ) {
                let newIndex = form0ConstructAtIndex.index
                result = ( Transformer.Form0Option( form0Construct: form0Construct! ), newIndex )
            }
            
            let form0SaveTdAtIndex = parseForm0SaveTd( index: index, tokenList: tokenList )
            let form0SaveTd = form0SaveTdAtIndex.node
            if form0SaveTd != nil && ( result == nil || result!.index < form0SaveTdAtIndex.index ) {
                let newIndex = form0SaveTdAtIndex.index
                result = ( Transformer.Form0Option( form0SaveTd: form0SaveTd! ), newIndex )
            }
            
            let form0SaveTdbAtIndex = parseForm0SaveTdb( index: index, tokenList: tokenList )
            let form0SaveTdb = form0SaveTdbAtIndex.node
            if form0SaveTdb != nil && ( result == nil || result!.index < form0SaveTdbAtIndex.index ) {
                let newIndex = form0SaveTdbAtIndex.index
                result = ( Transformer.Form0Option( form0SaveTdb: form0SaveTdb! ), newIndex )
            }
            
            let form0SaveKernelsAtIndex = parseForm0SaveKernels( index: index, tokenList: tokenList )
            let form0SaveKernels = form0SaveKernelsAtIndex.node
            if form0SaveKernels != nil && ( result == nil || result!.index < form0SaveKernelsAtIndex.index ) {
                let newIndex = form0SaveKernelsAtIndex.index
                result = ( Transformer.Form0Option( form0SaveKernels: form0SaveKernels! ), newIndex )
            }
            
            let form0OutputAtIndex = parseForm0Output( index: index, tokenList: tokenList )
            let form0Output = form0OutputAtIndex.node
            if form0Output != nil && ( result == nil || result!.index < form0OutputAtIndex.index ) {
                let newIndex = form0OutputAtIndex.index
                result = ( Transformer.Form0Option( form0Output: form0Output! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1Option( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1Option?, index: Int ) {
            var result: ( node: Transformer.Form1Option?, index: Int )? = nil
            
            let form1TdbAtIndex = parseForm1Tdb( index: index, tokenList: tokenList )
            let form1Tdb = form1TdbAtIndex.node
            if form1Tdb != nil && ( result == nil || result!.index < form1TdbAtIndex.index ) {
                let newIndex = form1TdbAtIndex.index
                result = ( Transformer.Form1Option( form1Tdb: form1Tdb! ), newIndex )
            }
            
            let form1LibraryAtIndex = parseForm1Library( index: index, tokenList: tokenList )
            let form1Library = form1LibraryAtIndex.node
            if form1Library != nil && ( result == nil || result!.index < form1LibraryAtIndex.index ) {
                let newIndex = form1LibraryAtIndex.index
                result = ( Transformer.Form1Option( form1Library: form1Library! ), newIndex )
            }
            
            let form1IncludeDataAtIndex = parseForm1IncludeData( index: index, tokenList: tokenList )
            let form1IncludeData = form1IncludeDataAtIndex.node
            if form1IncludeData != nil && ( result == nil || result!.index < form1IncludeDataAtIndex.index ) {
                let newIndex = form1IncludeDataAtIndex.index
                result = ( Transformer.Form1Option( form1IncludeData: form1IncludeData! ), newIndex )
            }
            
            let form1ConstructAtIndex = parseForm1Construct( index: index, tokenList: tokenList )
            let form1Construct = form1ConstructAtIndex.node
            if form1Construct != nil && ( result == nil || result!.index < form1ConstructAtIndex.index ) {
                let newIndex = form1ConstructAtIndex.index
                result = ( Transformer.Form1Option( form1Construct: form1Construct! ), newIndex )
            }
            
            let form1SaveTdAtIndex = parseForm1SaveTd( index: index, tokenList: tokenList )
            let form1SaveTd = form1SaveTdAtIndex.node
            if form1SaveTd != nil && ( result == nil || result!.index < form1SaveTdAtIndex.index ) {
                let newIndex = form1SaveTdAtIndex.index
                result = ( Transformer.Form1Option( form1SaveTd: form1SaveTd! ), newIndex )
            }
            
            let form1SaveTdbAtIndex = parseForm1SaveTdb( index: index, tokenList: tokenList )
            let form1SaveTdb = form1SaveTdbAtIndex.node
            if form1SaveTdb != nil && ( result == nil || result!.index < form1SaveTdbAtIndex.index ) {
                let newIndex = form1SaveTdbAtIndex.index
                result = ( Transformer.Form1Option( form1SaveTdb: form1SaveTdb! ), newIndex )
            }
            
            let form1SaveKernelsAtIndex = parseForm1SaveKernels( index: index, tokenList: tokenList )
            let form1SaveKernels = form1SaveKernelsAtIndex.node
            if form1SaveKernels != nil && ( result == nil || result!.index < form1SaveKernelsAtIndex.index ) {
                let newIndex = form1SaveKernelsAtIndex.index
                result = ( Transformer.Form1Option( form1SaveKernels: form1SaveKernels! ), newIndex )
            }
            
            let form1OutputAtIndex = parseForm1Output( index: index, tokenList: tokenList )
            let form1Output = form1OutputAtIndex.node
            if form1Output != nil && ( result == nil || result!.index < form1OutputAtIndex.index ) {
                let newIndex = form1OutputAtIndex.index
                result = ( Transformer.Form1Option( form1Output: form1Output! ), newIndex )
            }
            
            if result != nil {
                return result!
            } else {
                return ( nil, index )
            }
        }
        
        func parseCommandLine( index: Int, tokenList: TokenList ) -> ( node: Transformer.CommandLine?, index: Int ) {
            var newIndex = index
            
            var form: Transformer.Form
            
            do {
                let formAtIndex: ( node: Transformer.Form?, index: Int ) = parseForm( index: newIndex, tokenList: tokenList )
                if ( formAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form = formAtIndex.node!
                    newIndex = formAtIndex.index
                }
            }
            
            do {
                let tokenAtIndex = parse( tokenKind: TokenKind.endOfInput, index: newIndex, tokenList: tokenList )
                
                if tokenAtIndex.token == nil {
                    return ( nil, index )
                }
            }
            
            return ( Transformer.CommandLine( form: form ), newIndex )
        }
        
        func parseFormHelp( index: Int, tokenList: TokenList ) -> ( node: Transformer.FormHelp?, index: Int ) {
            var newIndex = index
            
            var commandName: Transformer.CommandName
            var formHelpOption: Transformer.FormHelpOption
            var optionsEnd: Transformer.OptionsEnd?
            
            do {
                let commandNameAtIndex: ( node: Transformer.CommandName?, index: Int ) = parseCommandName( index: newIndex, tokenList: tokenList )
                if ( commandNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    commandName = commandNameAtIndex.node!
                    newIndex = commandNameAtIndex.index
                }
            }
            
            do {
                let formHelpOptionAtIndex: ( node: Transformer.FormHelpOption?, index: Int ) = parseFormHelpOption( index: newIndex, tokenList: tokenList )
                if ( formHelpOptionAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    formHelpOption = formHelpOptionAtIndex.node!
                    newIndex = formHelpOptionAtIndex.index
                }
            }
            
            do {
                let optionsEndAtIndex: ( node: Transformer.OptionsEnd?, index: Int ) = parseOptionsEnd( index: newIndex, tokenList: tokenList )
                optionsEnd = optionsEndAtIndex.node
                if optionsEnd != nil {
                    newIndex = optionsEndAtIndex.index
                }
            }
            
            do {
                let tokenAtIndex = parse( tokenKind: TokenKind.endOfInput, index: newIndex, tokenList: tokenList )
                
                if tokenAtIndex.token == nil {
                    return ( nil, index )
                }
            }
            
            return ( Transformer.FormHelp( commandName: commandName, formHelpOption: formHelpOption, optionsEnd: optionsEnd ), newIndex )
        }
        
        func parseFormHelpOption( index: Int, tokenList: TokenList ) -> ( node: Transformer.FormHelpOption?, index: Int ) {
            var newIndex = index
            
            var formHelpFlagOption: Transformer.FormHelpFlagOption
            
            do {
                let formHelpFlagOptionAtIndex: ( node: Transformer.FormHelpFlagOption?, index: Int ) = parseFormHelpFlagOption( index: newIndex, tokenList: tokenList )
                if ( formHelpFlagOptionAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    formHelpFlagOption = formHelpFlagOptionAtIndex.node!
                    newIndex = formHelpFlagOptionAtIndex.index
                }
            }
            
            return ( Transformer.FormHelpOption( formHelpFlagOption: formHelpFlagOption ), newIndex )
        }
        
        func parseFormVersion( index: Int, tokenList: TokenList ) -> ( node: Transformer.FormVersion?, index: Int ) {
            var newIndex = index
            
            var commandName: Transformer.CommandName
            var formVersionOption: Transformer.FormVersionOption
            var optionsEnd: Transformer.OptionsEnd?
            
            do {
                let commandNameAtIndex: ( node: Transformer.CommandName?, index: Int ) = parseCommandName( index: newIndex, tokenList: tokenList )
                if ( commandNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    commandName = commandNameAtIndex.node!
                    newIndex = commandNameAtIndex.index
                }
            }
            
            do {
                let formVersionOptionAtIndex: ( node: Transformer.FormVersionOption?, index: Int ) = parseFormVersionOption( index: newIndex, tokenList: tokenList )
                if ( formVersionOptionAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    formVersionOption = formVersionOptionAtIndex.node!
                    newIndex = formVersionOptionAtIndex.index
                }
            }
            
            do {
                let optionsEndAtIndex: ( node: Transformer.OptionsEnd?, index: Int ) = parseOptionsEnd( index: newIndex, tokenList: tokenList )
                optionsEnd = optionsEndAtIndex.node
                if optionsEnd != nil {
                    newIndex = optionsEndAtIndex.index
                }
            }
            
            do {
                let tokenAtIndex = parse( tokenKind: TokenKind.endOfInput, index: newIndex, tokenList: tokenList )
                
                if tokenAtIndex.token == nil {
                    return ( nil, index )
                }
            }
            
            return ( Transformer.FormVersion( commandName: commandName, formVersionOption: formVersionOption, optionsEnd: optionsEnd ), newIndex )
        }
        
        func parseFormVersionOption( index: Int, tokenList: TokenList ) -> ( node: Transformer.FormVersionOption?, index: Int ) {
            var newIndex = index
            
            var formVersionFlagOption: Transformer.FormVersionFlagOption
            
            do {
                let formVersionFlagOptionAtIndex: ( node: Transformer.FormVersionFlagOption?, index: Int ) = parseFormVersionFlagOption( index: newIndex, tokenList: tokenList )
                if ( formVersionFlagOptionAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    formVersionFlagOption = formVersionFlagOptionAtIndex.node!
                    newIndex = formVersionFlagOptionAtIndex.index
                }
            }
            
            return ( Transformer.FormVersionOption( formVersionFlagOption: formVersionFlagOption ), newIndex )
        }
        
        func parseOptionsEnd( index: Int, tokenList: TokenList ) -> ( node: Transformer.OptionsEnd?, index: Int ) {
            var newIndex = index
            
            do {
                let literalAtIndex = parse( literalKind: LiteralKind.literal0, index: newIndex, tokenList: tokenList )
                if literalAtIndex.token == nil {
                    return ( nil, index )
                } else {
                    newIndex = literalAtIndex.index
                }
            }
            
            return ( Transformer.OptionsEnd(), newIndex )
        }
        
        func parseForm0( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0?, index: Int ) {
            var newIndex = index
            
            var form0CommandName: Transformer.Form0CommandName
            var form0Option: [Transformer.Form0Option]? = nil
            var optionsEnd: Transformer.OptionsEnd?
            
            do {
                let form0CommandNameAtIndex: ( node: Transformer.Form0CommandName?, index: Int ) = parseForm0CommandName( index: newIndex, tokenList: tokenList )
                if ( form0CommandNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0CommandName = form0CommandNameAtIndex.node!
                    newIndex = form0CommandNameAtIndex.index
                }
            }
            
            do {
                let form0OptionAtIndex: ( nodes: [Transformer.Form0Option]?, index: Int ) = parseForm0Option( index: newIndex, minimum: 0, tokenList: tokenList )
                form0Option = form0OptionAtIndex.nodes
                if form0Option == nil {
                    return ( nil, index )
                } else {
                    newIndex = form0OptionAtIndex.index
                }
            }
            
            do {
                let optionsEndAtIndex: ( node: Transformer.OptionsEnd?, index: Int ) = parseOptionsEnd( index: newIndex, tokenList: tokenList )
                optionsEnd = optionsEndAtIndex.node
                if optionsEnd != nil {
                    newIndex = optionsEndAtIndex.index
                }
            }
            
            do {
                let tokenAtIndex = parse( tokenKind: TokenKind.endOfInput, index: newIndex, tokenList: tokenList )
                
                if tokenAtIndex.token == nil {
                    return ( nil, index )
                }
            }
            
            return ( Transformer.Form0( form0CommandName: form0CommandName, form0Option: form0Option!, optionsEnd: optionsEnd ), newIndex )
        }
        
        func parseForm0Td( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0Td?, index: Int ) {
            var newIndex = index
            
            var form0FlagTd: Transformer.Form0FlagTd
            var form0OperandTd: Transformer.Form0OperandTd
            
            do {
                let form0FlagTdAtIndex: ( node: Transformer.Form0FlagTd?, index: Int ) = parseForm0FlagTd( index: newIndex, tokenList: tokenList )
                if ( form0FlagTdAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0FlagTd = form0FlagTdAtIndex.node!
                    newIndex = form0FlagTdAtIndex.index
                }
            }
            
            do {
                let form0OperandTdAtIndex: ( node: Transformer.Form0OperandTd?, index: Int ) = parseForm0OperandTd( index: newIndex, tokenList: tokenList )
                if ( form0OperandTdAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0OperandTd = form0OperandTdAtIndex.node!
                    newIndex = form0OperandTdAtIndex.index
                }
            }
            
            return ( Transformer.Form0Td( form0FlagTd: form0FlagTd, form0OperandTd: form0OperandTd ), newIndex )
        }
        
        func parseForm0Library( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0Library?, index: Int ) {
            var newIndex = index
            
            var form0FlagLibrary: Transformer.Form0FlagLibrary
            var form0OperandLibrary: Transformer.Form0OperandLibrary
            
            do {
                let form0FlagLibraryAtIndex: ( node: Transformer.Form0FlagLibrary?, index: Int ) = parseForm0FlagLibrary( index: newIndex, tokenList: tokenList )
                if ( form0FlagLibraryAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0FlagLibrary = form0FlagLibraryAtIndex.node!
                    newIndex = form0FlagLibraryAtIndex.index
                }
            }
            
            do {
                let form0OperandLibraryAtIndex: ( node: Transformer.Form0OperandLibrary?, index: Int ) = parseForm0OperandLibrary( index: newIndex, tokenList: tokenList )
                if ( form0OperandLibraryAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0OperandLibrary = form0OperandLibraryAtIndex.node!
                    newIndex = form0OperandLibraryAtIndex.index
                }
            }
            
            return ( Transformer.Form0Library( form0FlagLibrary: form0FlagLibrary, form0OperandLibrary: form0OperandLibrary ), newIndex )
        }
        
        func parseForm0IncludeData( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0IncludeData?, index: Int ) {
            var newIndex = index
            
            var form0FlagIncludeData: Transformer.Form0FlagIncludeData
            
            do {
                let form0FlagIncludeDataAtIndex: ( node: Transformer.Form0FlagIncludeData?, index: Int ) = parseForm0FlagIncludeData( index: newIndex, tokenList: tokenList )
                if ( form0FlagIncludeDataAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0FlagIncludeData = form0FlagIncludeDataAtIndex.node!
                    newIndex = form0FlagIncludeDataAtIndex.index
                }
            }
            
            return ( Transformer.Form0IncludeData( form0FlagIncludeData: form0FlagIncludeData ), newIndex )
        }
        
        func parseForm0Construct( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0Construct?, index: Int ) {
            var newIndex = index
            
            var form0FlagConstruct: Transformer.Form0FlagConstruct
            
            do {
                let form0FlagConstructAtIndex: ( node: Transformer.Form0FlagConstruct?, index: Int ) = parseForm0FlagConstruct( index: newIndex, tokenList: tokenList )
                if ( form0FlagConstructAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0FlagConstruct = form0FlagConstructAtIndex.node!
                    newIndex = form0FlagConstructAtIndex.index
                }
            }
            
            return ( Transformer.Form0Construct( form0FlagConstruct: form0FlagConstruct ), newIndex )
        }
        
        func parseForm0SaveTd( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0SaveTd?, index: Int ) {
            var newIndex = index
            
            var form0FlagSaveTd: Transformer.Form0FlagSaveTd
            
            do {
                let form0FlagSaveTdAtIndex: ( node: Transformer.Form0FlagSaveTd?, index: Int ) = parseForm0FlagSaveTd( index: newIndex, tokenList: tokenList )
                if ( form0FlagSaveTdAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0FlagSaveTd = form0FlagSaveTdAtIndex.node!
                    newIndex = form0FlagSaveTdAtIndex.index
                }
            }
            
            return ( Transformer.Form0SaveTd( form0FlagSaveTd: form0FlagSaveTd ), newIndex )
        }
        
        func parseForm0SaveTdb( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0SaveTdb?, index: Int ) {
            var newIndex = index
            
            var form0FlagSaveTdb: Transformer.Form0FlagSaveTdb
            
            do {
                let form0FlagSaveTdbAtIndex: ( node: Transformer.Form0FlagSaveTdb?, index: Int ) = parseForm0FlagSaveTdb( index: newIndex, tokenList: tokenList )
                if ( form0FlagSaveTdbAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0FlagSaveTdb = form0FlagSaveTdbAtIndex.node!
                    newIndex = form0FlagSaveTdbAtIndex.index
                }
            }
            
            return ( Transformer.Form0SaveTdb( form0FlagSaveTdb: form0FlagSaveTdb ), newIndex )
        }
        
        func parseForm0SaveKernels( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0SaveKernels?, index: Int ) {
            var newIndex = index
            
            var form0FlagSaveKernels: Transformer.Form0FlagSaveKernels
            
            do {
                let form0FlagSaveKernelsAtIndex: ( node: Transformer.Form0FlagSaveKernels?, index: Int ) = parseForm0FlagSaveKernels( index: newIndex, tokenList: tokenList )
                if ( form0FlagSaveKernelsAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0FlagSaveKernels = form0FlagSaveKernelsAtIndex.node!
                    newIndex = form0FlagSaveKernelsAtIndex.index
                }
            }
            
            return ( Transformer.Form0SaveKernels( form0FlagSaveKernels: form0FlagSaveKernels ), newIndex )
        }
        
        func parseForm0Output( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form0Output?, index: Int ) {
            var newIndex = index
            
            var form0FlagOutput: Transformer.Form0FlagOutput
            var form0OperandOutput: Transformer.Form0OperandOutput
            
            do {
                let form0FlagOutputAtIndex: ( node: Transformer.Form0FlagOutput?, index: Int ) = parseForm0FlagOutput( index: newIndex, tokenList: tokenList )
                if ( form0FlagOutputAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0FlagOutput = form0FlagOutputAtIndex.node!
                    newIndex = form0FlagOutputAtIndex.index
                }
            }
            
            do {
                let form0OperandOutputAtIndex: ( node: Transformer.Form0OperandOutput?, index: Int ) = parseForm0OperandOutput( index: newIndex, tokenList: tokenList )
                if ( form0OperandOutputAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form0OperandOutput = form0OperandOutputAtIndex.node!
                    newIndex = form0OperandOutputAtIndex.index
                }
            }
            
            return ( Transformer.Form0Output( form0FlagOutput: form0FlagOutput, form0OperandOutput: form0OperandOutput ), newIndex )
        }
        
        func parseForm1( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1?, index: Int ) {
            var newIndex = index
            
            var form1CommandName: Transformer.Form1CommandName
            var form1Option: [Transformer.Form1Option]? = nil
            var optionsEnd: Transformer.OptionsEnd?
            
            do {
                let form1CommandNameAtIndex: ( node: Transformer.Form1CommandName?, index: Int ) = parseForm1CommandName( index: newIndex, tokenList: tokenList )
                if ( form1CommandNameAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1CommandName = form1CommandNameAtIndex.node!
                    newIndex = form1CommandNameAtIndex.index
                }
            }
            
            do {
                let form1OptionAtIndex: ( nodes: [Transformer.Form1Option]?, index: Int ) = parseForm1Option( index: newIndex, minimum: 0, tokenList: tokenList )
                form1Option = form1OptionAtIndex.nodes
                if form1Option == nil {
                    return ( nil, index )
                } else {
                    newIndex = form1OptionAtIndex.index
                }
            }
            
            do {
                let optionsEndAtIndex: ( node: Transformer.OptionsEnd?, index: Int ) = parseOptionsEnd( index: newIndex, tokenList: tokenList )
                optionsEnd = optionsEndAtIndex.node
                if optionsEnd != nil {
                    newIndex = optionsEndAtIndex.index
                }
            }
            
            do {
                let tokenAtIndex = parse( tokenKind: TokenKind.endOfInput, index: newIndex, tokenList: tokenList )
                
                if tokenAtIndex.token == nil {
                    return ( nil, index )
                }
            }
            
            return ( Transformer.Form1( form1CommandName: form1CommandName, form1Option: form1Option!, optionsEnd: optionsEnd ), newIndex )
        }
        
        func parseForm1Tdb( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1Tdb?, index: Int ) {
            var newIndex = index
            
            var form1FlagTdb: Transformer.Form1FlagTdb
            var form1OperandTdb: Transformer.Form1OperandTdb
            
            do {
                let form1FlagTdbAtIndex: ( node: Transformer.Form1FlagTdb?, index: Int ) = parseForm1FlagTdb( index: newIndex, tokenList: tokenList )
                if ( form1FlagTdbAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1FlagTdb = form1FlagTdbAtIndex.node!
                    newIndex = form1FlagTdbAtIndex.index
                }
            }
            
            do {
                let form1OperandTdbAtIndex: ( node: Transformer.Form1OperandTdb?, index: Int ) = parseForm1OperandTdb( index: newIndex, tokenList: tokenList )
                if ( form1OperandTdbAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1OperandTdb = form1OperandTdbAtIndex.node!
                    newIndex = form1OperandTdbAtIndex.index
                }
            }
            
            return ( Transformer.Form1Tdb( form1FlagTdb: form1FlagTdb, form1OperandTdb: form1OperandTdb ), newIndex )
        }
        
        func parseForm1Library( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1Library?, index: Int ) {
            var newIndex = index
            
            var form1FlagLibrary: Transformer.Form1FlagLibrary
            var form1OperandLibrary: Transformer.Form1OperandLibrary
            
            do {
                let form1FlagLibraryAtIndex: ( node: Transformer.Form1FlagLibrary?, index: Int ) = parseForm1FlagLibrary( index: newIndex, tokenList: tokenList )
                if ( form1FlagLibraryAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1FlagLibrary = form1FlagLibraryAtIndex.node!
                    newIndex = form1FlagLibraryAtIndex.index
                }
            }
            
            do {
                let form1OperandLibraryAtIndex: ( node: Transformer.Form1OperandLibrary?, index: Int ) = parseForm1OperandLibrary( index: newIndex, tokenList: tokenList )
                if ( form1OperandLibraryAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1OperandLibrary = form1OperandLibraryAtIndex.node!
                    newIndex = form1OperandLibraryAtIndex.index
                }
            }
            
            return ( Transformer.Form1Library( form1FlagLibrary: form1FlagLibrary, form1OperandLibrary: form1OperandLibrary ), newIndex )
        }
        
        func parseForm1IncludeData( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1IncludeData?, index: Int ) {
            var newIndex = index
            
            var form1FlagIncludeData: Transformer.Form1FlagIncludeData
            
            do {
                let form1FlagIncludeDataAtIndex: ( node: Transformer.Form1FlagIncludeData?, index: Int ) = parseForm1FlagIncludeData( index: newIndex, tokenList: tokenList )
                if ( form1FlagIncludeDataAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1FlagIncludeData = form1FlagIncludeDataAtIndex.node!
                    newIndex = form1FlagIncludeDataAtIndex.index
                }
            }
            
            return ( Transformer.Form1IncludeData( form1FlagIncludeData: form1FlagIncludeData ), newIndex )
        }
        
        func parseForm1Construct( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1Construct?, index: Int ) {
            var newIndex = index
            
            var form1FlagConstruct: Transformer.Form1FlagConstruct
            
            do {
                let form1FlagConstructAtIndex: ( node: Transformer.Form1FlagConstruct?, index: Int ) = parseForm1FlagConstruct( index: newIndex, tokenList: tokenList )
                if ( form1FlagConstructAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1FlagConstruct = form1FlagConstructAtIndex.node!
                    newIndex = form1FlagConstructAtIndex.index
                }
            }
            
            return ( Transformer.Form1Construct( form1FlagConstruct: form1FlagConstruct ), newIndex )
        }
        
        func parseForm1SaveTd( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1SaveTd?, index: Int ) {
            var newIndex = index
            
            var form1FlagSaveTd: Transformer.Form1FlagSaveTd
            
            do {
                let form1FlagSaveTdAtIndex: ( node: Transformer.Form1FlagSaveTd?, index: Int ) = parseForm1FlagSaveTd( index: newIndex, tokenList: tokenList )
                if ( form1FlagSaveTdAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1FlagSaveTd = form1FlagSaveTdAtIndex.node!
                    newIndex = form1FlagSaveTdAtIndex.index
                }
            }
            
            return ( Transformer.Form1SaveTd( form1FlagSaveTd: form1FlagSaveTd ), newIndex )
        }
        
        func parseForm1SaveTdb( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1SaveTdb?, index: Int ) {
            var newIndex = index
            
            var form1FlagSaveTdb: Transformer.Form1FlagSaveTdb
            
            do {
                let form1FlagSaveTdbAtIndex: ( node: Transformer.Form1FlagSaveTdb?, index: Int ) = parseForm1FlagSaveTdb( index: newIndex, tokenList: tokenList )
                if ( form1FlagSaveTdbAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1FlagSaveTdb = form1FlagSaveTdbAtIndex.node!
                    newIndex = form1FlagSaveTdbAtIndex.index
                }
            }
            
            return ( Transformer.Form1SaveTdb( form1FlagSaveTdb: form1FlagSaveTdb ), newIndex )
        }
        
        func parseForm1SaveKernels( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1SaveKernels?, index: Int ) {
            var newIndex = index
            
            var form1FlagSaveKernels: Transformer.Form1FlagSaveKernels
            
            do {
                let form1FlagSaveKernelsAtIndex: ( node: Transformer.Form1FlagSaveKernels?, index: Int ) = parseForm1FlagSaveKernels( index: newIndex, tokenList: tokenList )
                if ( form1FlagSaveKernelsAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1FlagSaveKernels = form1FlagSaveKernelsAtIndex.node!
                    newIndex = form1FlagSaveKernelsAtIndex.index
                }
            }
            
            return ( Transformer.Form1SaveKernels( form1FlagSaveKernels: form1FlagSaveKernels ), newIndex )
        }
        
        func parseForm1Output( index: Int, tokenList: TokenList ) -> ( node: Transformer.Form1Output?, index: Int ) {
            var newIndex = index
            
            var form1FlagOutput: Transformer.Form1FlagOutput
            var form1OperandOutput: Transformer.Form1OperandOutput
            
            do {
                let form1FlagOutputAtIndex: ( node: Transformer.Form1FlagOutput?, index: Int ) = parseForm1FlagOutput( index: newIndex, tokenList: tokenList )
                if ( form1FlagOutputAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1FlagOutput = form1FlagOutputAtIndex.node!
                    newIndex = form1FlagOutputAtIndex.index
                }
            }
            
            do {
                let form1OperandOutputAtIndex: ( node: Transformer.Form1OperandOutput?, index: Int ) = parseForm1OperandOutput( index: newIndex, tokenList: tokenList )
                if ( form1OperandOutputAtIndex.node == nil ) {
                    return ( nil, index )
                } else {
                    form1OperandOutput = form1OperandOutputAtIndex.node!
                    newIndex = form1OperandOutputAtIndex.index
                }
            }
            
            return ( Transformer.Form1Output( form1FlagOutput: form1FlagOutput, form1OperandOutput: form1OperandOutput ), newIndex )
        }
        
        func parseForm0Option( index: Int, minimum: Int, tokenList: TokenList ) -> ( nodes: [Transformer.Form0Option]?, index: Int ) {
            var newIndex = index
            var nodes: [Transformer.Form0Option] = []
            var node: Transformer.Form0Option?
            
            var form0OptionAtIndex = parseForm0Option( index: newIndex, tokenList: tokenList )
            node = form0OptionAtIndex.node
            while node != nil && newIndex < form0OptionAtIndex.index {
                nodes.append( node! )
                
                newIndex = form0OptionAtIndex.index
                
                form0OptionAtIndex = parseForm0Option( index: newIndex, tokenList: tokenList )
                node = form0OptionAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm0Option( index: Int, minimum: Int, maximum: Int, tokenList: TokenList ) -> ( nodes: [Transformer.Form0Option]?, index: Int ) {
            var newIndex = index
            
            var nodes: [Transformer.Form0Option] = []
            var node: Transformer.Form0Option?
            
            var form0OptionAtIndex = parseForm0Option( index: newIndex, tokenList: tokenList )
            node = form0OptionAtIndex.node
            while node != nil && newIndex < form0OptionAtIndex.index {
                nodes.append( node! )
                
                newIndex = form0OptionAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                form0OptionAtIndex = parseForm0Option( index: newIndex, tokenList: tokenList )
                node = form0OptionAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1Option( index: Int, minimum: Int, tokenList: TokenList ) -> ( nodes: [Transformer.Form1Option]?, index: Int ) {
            var newIndex = index
            var nodes: [Transformer.Form1Option] = []
            var node: Transformer.Form1Option?
            
            var form1OptionAtIndex = parseForm1Option( index: newIndex, tokenList: tokenList )
            node = form1OptionAtIndex.node
            while node != nil && newIndex < form1OptionAtIndex.index {
                nodes.append( node! )
                
                newIndex = form1OptionAtIndex.index
                
                form1OptionAtIndex = parseForm1Option( index: newIndex, tokenList: tokenList )
                node = form1OptionAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        func parseForm1Option( index: Int, minimum: Int, maximum: Int, tokenList: TokenList ) -> ( nodes: [Transformer.Form1Option]?, index: Int ) {
            var newIndex = index
            
            var nodes: [Transformer.Form1Option] = []
            var node: Transformer.Form1Option?
            
            var form1OptionAtIndex = parseForm1Option( index: newIndex, tokenList: tokenList )
            node = form1OptionAtIndex.node
            while node != nil && newIndex < form1OptionAtIndex.index {
                nodes.append( node! )
                
                newIndex = form1OptionAtIndex.index
                
                if nodes.count >= maximum {
                    break
                }
                
                form1OptionAtIndex = parseForm1Option( index: newIndex, tokenList: tokenList )
                node = form1OptionAtIndex.node
            }
            
            if nodes.count >= minimum {
                return ( nodes, newIndex )
            } else {
                return ( nil, index )
            }
        }
        
        public func parse( tokenList: TokenList, log: Log? = nil ) -> Transformer.CommandLine? {
            var node: Transformer.CommandLine?
            
            let index = 0
            maximumIndex = 0
            
            let nodeAtIndex: ( node: Transformer.CommandLine?, index: Int ) = parseCommandLine( index: index, tokenList: tokenList )
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
    
} // extension CommandLineTensorDsl

extension CommandLineTensorDslCompiler {
    
    public class Transformer {
        
        public class Form: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case formHelp
                case formVersion
                case form0
                case form1
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var formHelp: FormHelp? {
                get {
                    if childType != nil && childType! == .formHelp {
                        return child as? FormHelp
                    } else {
                        return nil
                    }
                }
                set ( formHelp ) {
                    childType = .formHelp
                    child = formHelp
                }
            }
            
            public var formVersion: FormVersion? {
                get {
                    if childType != nil && childType! == .formVersion {
                        return child as? FormVersion
                    } else {
                        return nil
                    }
                }
                set ( formVersion ) {
                    childType = .formVersion
                    child = formVersion
                }
            }
            
            public var form0: Form0? {
                get {
                    if childType != nil && childType! == .form0 {
                        return child as? Form0
                    } else {
                        return nil
                    }
                }
                set ( form0 ) {
                    childType = .form0
                    child = form0
                }
            }
            
            public var form1: Form1? {
                get {
                    if childType != nil && childType! == .form1 {
                        return child as? Form1
                    } else {
                        return nil
                    }
                }
                set ( form1 ) {
                    childType = .form1
                    child = form1
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .formHelp:
                        child = try container.decode( FormHelp.self, forKey: .formHelp )
                    case .formVersion:
                        child = try container.decode( FormVersion.self, forKey: .formVersion )
                    case .form0:
                        child = try container.decode( Form0.self, forKey: .form0 )
                    case .form1:
                        child = try container.decode( Form1.self, forKey: .form1 )
                    }
                }
            }
            
            public init( formHelp: FormHelp ) {
                childType = .formHelp
                child = formHelp
            }
            
            public init( formVersion: FormVersion ) {
                childType = .formVersion
                child = formVersion
            }
            
            public init( form0: Form0 ) {
                childType = .form0
                child = form0
            }
            
            public init( form1: Form1 ) {
                childType = .form1
                child = form1
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .formHelp:
                        try container.encode( self.child! as! FormHelp, forKey: .formHelp )
            
                    case .formVersion:
                        try container.encode( self.child! as! FormVersion, forKey: .formVersion )
            
                    case .form0:
                        try container.encode( self.child! as! Form0, forKey: .form0 )
            
                    case .form1:
                        try container.encode( self.child! as! Form1, forKey: .form1 )
                    }
                }
            }
        }
        
        public class Form0Option: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case form0Td
                case form0Library
                case form0IncludeData
                case form0Construct
                case form0SaveTd
                case form0SaveTdb
                case form0SaveKernels
                case form0Output
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var form0Td: Form0Td? {
                get {
                    if childType != nil && childType! == .form0Td {
                        return child as? Form0Td
                    } else {
                        return nil
                    }
                }
                set ( form0Td ) {
                    childType = .form0Td
                    child = form0Td
                }
            }
            
            public var form0Library: Form0Library? {
                get {
                    if childType != nil && childType! == .form0Library {
                        return child as? Form0Library
                    } else {
                        return nil
                    }
                }
                set ( form0Library ) {
                    childType = .form0Library
                    child = form0Library
                }
            }
            
            public var form0IncludeData: Form0IncludeData? {
                get {
                    if childType != nil && childType! == .form0IncludeData {
                        return child as? Form0IncludeData
                    } else {
                        return nil
                    }
                }
                set ( form0IncludeData ) {
                    childType = .form0IncludeData
                    child = form0IncludeData
                }
            }
            
            public var form0Construct: Form0Construct? {
                get {
                    if childType != nil && childType! == .form0Construct {
                        return child as? Form0Construct
                    } else {
                        return nil
                    }
                }
                set ( form0Construct ) {
                    childType = .form0Construct
                    child = form0Construct
                }
            }
            
            public var form0SaveTd: Form0SaveTd? {
                get {
                    if childType != nil && childType! == .form0SaveTd {
                        return child as? Form0SaveTd
                    } else {
                        return nil
                    }
                }
                set ( form0SaveTd ) {
                    childType = .form0SaveTd
                    child = form0SaveTd
                }
            }
            
            public var form0SaveTdb: Form0SaveTdb? {
                get {
                    if childType != nil && childType! == .form0SaveTdb {
                        return child as? Form0SaveTdb
                    } else {
                        return nil
                    }
                }
                set ( form0SaveTdb ) {
                    childType = .form0SaveTdb
                    child = form0SaveTdb
                }
            }
            
            public var form0SaveKernels: Form0SaveKernels? {
                get {
                    if childType != nil && childType! == .form0SaveKernels {
                        return child as? Form0SaveKernels
                    } else {
                        return nil
                    }
                }
                set ( form0SaveKernels ) {
                    childType = .form0SaveKernels
                    child = form0SaveKernels
                }
            }
            
            public var form0Output: Form0Output? {
                get {
                    if childType != nil && childType! == .form0Output {
                        return child as? Form0Output
                    } else {
                        return nil
                    }
                }
                set ( form0Output ) {
                    childType = .form0Output
                    child = form0Output
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .form0Td:
                        child = try container.decode( Form0Td.self, forKey: .form0Td )
                    case .form0Library:
                        child = try container.decode( Form0Library.self, forKey: .form0Library )
                    case .form0IncludeData:
                        child = try container.decode( Form0IncludeData.self, forKey: .form0IncludeData )
                    case .form0Construct:
                        child = try container.decode( Form0Construct.self, forKey: .form0Construct )
                    case .form0SaveTd:
                        child = try container.decode( Form0SaveTd.self, forKey: .form0SaveTd )
                    case .form0SaveTdb:
                        child = try container.decode( Form0SaveTdb.self, forKey: .form0SaveTdb )
                    case .form0SaveKernels:
                        child = try container.decode( Form0SaveKernels.self, forKey: .form0SaveKernels )
                    case .form0Output:
                        child = try container.decode( Form0Output.self, forKey: .form0Output )
                    }
                }
            }
            
            public init( form0Td: Form0Td ) {
                childType = .form0Td
                child = form0Td
            }
            
            public init( form0Library: Form0Library ) {
                childType = .form0Library
                child = form0Library
            }
            
            public init( form0IncludeData: Form0IncludeData ) {
                childType = .form0IncludeData
                child = form0IncludeData
            }
            
            public init( form0Construct: Form0Construct ) {
                childType = .form0Construct
                child = form0Construct
            }
            
            public init( form0SaveTd: Form0SaveTd ) {
                childType = .form0SaveTd
                child = form0SaveTd
            }
            
            public init( form0SaveTdb: Form0SaveTdb ) {
                childType = .form0SaveTdb
                child = form0SaveTdb
            }
            
            public init( form0SaveKernels: Form0SaveKernels ) {
                childType = .form0SaveKernels
                child = form0SaveKernels
            }
            
            public init( form0Output: Form0Output ) {
                childType = .form0Output
                child = form0Output
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .form0Td:
                        try container.encode( self.child! as! Form0Td, forKey: .form0Td )
            
                    case .form0Library:
                        try container.encode( self.child! as! Form0Library, forKey: .form0Library )
            
                    case .form0IncludeData:
                        try container.encode( self.child! as! Form0IncludeData, forKey: .form0IncludeData )
            
                    case .form0Construct:
                        try container.encode( self.child! as! Form0Construct, forKey: .form0Construct )
            
                    case .form0SaveTd:
                        try container.encode( self.child! as! Form0SaveTd, forKey: .form0SaveTd )
            
                    case .form0SaveTdb:
                        try container.encode( self.child! as! Form0SaveTdb, forKey: .form0SaveTdb )
            
                    case .form0SaveKernels:
                        try container.encode( self.child! as! Form0SaveKernels, forKey: .form0SaveKernels )
            
                    case .form0Output:
                        try container.encode( self.child! as! Form0Output, forKey: .form0Output )
                    }
                }
            }
        }
        
        public class Form1Option: Codable {
            public enum ChildType: String, Codable, CodingKey {
                case form1Tdb
                case form1Library
                case form1IncludeData
                case form1Construct
                case form1SaveTd
                case form1SaveTdb
                case form1SaveKernels
                case form1Output
            }
            
            public var childType: ChildType? = nil
            public var child: AnyObject? = nil
            
            public var form1Tdb: Form1Tdb? {
                get {
                    if childType != nil && childType! == .form1Tdb {
                        return child as? Form1Tdb
                    } else {
                        return nil
                    }
                }
                set ( form1Tdb ) {
                    childType = .form1Tdb
                    child = form1Tdb
                }
            }
            
            public var form1Library: Form1Library? {
                get {
                    if childType != nil && childType! == .form1Library {
                        return child as? Form1Library
                    } else {
                        return nil
                    }
                }
                set ( form1Library ) {
                    childType = .form1Library
                    child = form1Library
                }
            }
            
            public var form1IncludeData: Form1IncludeData? {
                get {
                    if childType != nil && childType! == .form1IncludeData {
                        return child as? Form1IncludeData
                    } else {
                        return nil
                    }
                }
                set ( form1IncludeData ) {
                    childType = .form1IncludeData
                    child = form1IncludeData
                }
            }
            
            public var form1Construct: Form1Construct? {
                get {
                    if childType != nil && childType! == .form1Construct {
                        return child as? Form1Construct
                    } else {
                        return nil
                    }
                }
                set ( form1Construct ) {
                    childType = .form1Construct
                    child = form1Construct
                }
            }
            
            public var form1SaveTd: Form1SaveTd? {
                get {
                    if childType != nil && childType! == .form1SaveTd {
                        return child as? Form1SaveTd
                    } else {
                        return nil
                    }
                }
                set ( form1SaveTd ) {
                    childType = .form1SaveTd
                    child = form1SaveTd
                }
            }
            
            public var form1SaveTdb: Form1SaveTdb? {
                get {
                    if childType != nil && childType! == .form1SaveTdb {
                        return child as? Form1SaveTdb
                    } else {
                        return nil
                    }
                }
                set ( form1SaveTdb ) {
                    childType = .form1SaveTdb
                    child = form1SaveTdb
                }
            }
            
            public var form1SaveKernels: Form1SaveKernels? {
                get {
                    if childType != nil && childType! == .form1SaveKernels {
                        return child as? Form1SaveKernels
                    } else {
                        return nil
                    }
                }
                set ( form1SaveKernels ) {
                    childType = .form1SaveKernels
                    child = form1SaveKernels
                }
            }
            
            public var form1Output: Form1Output? {
                get {
                    if childType != nil && childType! == .form1Output {
                        return child as? Form1Output
                    } else {
                        return nil
                    }
                }
                set ( form1Output ) {
                    childType = .form1Output
                    child = form1Output
                }
            }
            
            public init() {
            }
            
            required public init( from decoder: Decoder ) throws {
                let container = try decoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
                    case .form1Tdb:
                        child = try container.decode( Form1Tdb.self, forKey: .form1Tdb )
                    case .form1Library:
                        child = try container.decode( Form1Library.self, forKey: .form1Library )
                    case .form1IncludeData:
                        child = try container.decode( Form1IncludeData.self, forKey: .form1IncludeData )
                    case .form1Construct:
                        child = try container.decode( Form1Construct.self, forKey: .form1Construct )
                    case .form1SaveTd:
                        child = try container.decode( Form1SaveTd.self, forKey: .form1SaveTd )
                    case .form1SaveTdb:
                        child = try container.decode( Form1SaveTdb.self, forKey: .form1SaveTdb )
                    case .form1SaveKernels:
                        child = try container.decode( Form1SaveKernels.self, forKey: .form1SaveKernels )
                    case .form1Output:
                        child = try container.decode( Form1Output.self, forKey: .form1Output )
                    }
                }
            }
            
            public init( form1Tdb: Form1Tdb ) {
                childType = .form1Tdb
                child = form1Tdb
            }
            
            public init( form1Library: Form1Library ) {
                childType = .form1Library
                child = form1Library
            }
            
            public init( form1IncludeData: Form1IncludeData ) {
                childType = .form1IncludeData
                child = form1IncludeData
            }
            
            public init( form1Construct: Form1Construct ) {
                childType = .form1Construct
                child = form1Construct
            }
            
            public init( form1SaveTd: Form1SaveTd ) {
                childType = .form1SaveTd
                child = form1SaveTd
            }
            
            public init( form1SaveTdb: Form1SaveTdb ) {
                childType = .form1SaveTdb
                child = form1SaveTdb
            }
            
            public init( form1SaveKernels: Form1SaveKernels ) {
                childType = .form1SaveKernels
                child = form1SaveKernels
            }
            
            public init( form1Output: Form1Output ) {
                childType = .form1Output
                child = form1Output
            }
            
            public func encode( to encoder: Encoder ) throws {
                var container = encoder.container( keyedBy: ChildType.self )
                if let childType = self.childType {
                    switch childType {
            
                    case .form1Tdb:
                        try container.encode( self.child! as! Form1Tdb, forKey: .form1Tdb )
            
                    case .form1Library:
                        try container.encode( self.child! as! Form1Library, forKey: .form1Library )
            
                    case .form1IncludeData:
                        try container.encode( self.child! as! Form1IncludeData, forKey: .form1IncludeData )
            
                    case .form1Construct:
                        try container.encode( self.child! as! Form1Construct, forKey: .form1Construct )
            
                    case .form1SaveTd:
                        try container.encode( self.child! as! Form1SaveTd, forKey: .form1SaveTd )
            
                    case .form1SaveTdb:
                        try container.encode( self.child! as! Form1SaveTdb, forKey: .form1SaveTdb )
            
                    case .form1SaveKernels:
                        try container.encode( self.child! as! Form1SaveKernels, forKey: .form1SaveKernels )
            
                    case .form1Output:
                        try container.encode( self.child! as! Form1Output, forKey: .form1Output )
                    }
                }
            }
        }
        
        public class FormHelpFlagOption: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class FormVersionFlagOption: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class CommandName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0CommandName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0FlagTd: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0OperandTd: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0FlagLibrary: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0OperandLibrary: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0FlagIncludeData: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0FlagConstruct: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0FlagSaveTd: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0FlagSaveTdb: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0FlagSaveKernels: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0FlagOutput: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form0OperandOutput: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1CommandName: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1FlagTdb: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1OperandTdb: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1FlagLibrary: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1OperandLibrary: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1FlagIncludeData: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1FlagConstruct: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1FlagSaveTd: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1FlagSaveTdb: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1FlagSaveKernels: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1FlagOutput: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class Form1OperandOutput: Codable {
            public let token: Token
            
            public init( token: Token ) {
                self.token = token
            }
        }
        
        public class CommandLine: Codable {
            public let form: Form
            
            public init( form: Form ) {
                self.form = form
            }
        }
        
        public class FormHelp: Codable {
            public let commandName: CommandName
            public let formHelpOption: FormHelpOption
            public let optionsEnd: OptionsEnd?
            
            public init( commandName: CommandName, formHelpOption: FormHelpOption, optionsEnd: OptionsEnd? ) {
                self.commandName = commandName
                self.formHelpOption = formHelpOption
                self.optionsEnd = optionsEnd
            }
        }
        
        public class FormHelpOption: Codable {
            public let formHelpFlagOption: FormHelpFlagOption
            
            public init( formHelpFlagOption: FormHelpFlagOption ) {
                self.formHelpFlagOption = formHelpFlagOption
            }
        }
        
        public class FormVersion: Codable {
            public let commandName: CommandName
            public let formVersionOption: FormVersionOption
            public let optionsEnd: OptionsEnd?
            
            public init( commandName: CommandName, formVersionOption: FormVersionOption, optionsEnd: OptionsEnd? ) {
                self.commandName = commandName
                self.formVersionOption = formVersionOption
                self.optionsEnd = optionsEnd
            }
        }
        
        public class FormVersionOption: Codable {
            public let formVersionFlagOption: FormVersionFlagOption
            
            public init( formVersionFlagOption: FormVersionFlagOption ) {
                self.formVersionFlagOption = formVersionFlagOption
            }
        }
        
        public class OptionsEnd: Codable {
        }
        
        public class Form0: Codable {
            public let form0CommandName: Form0CommandName
            public let form0Option: [Form0Option]
            public let optionsEnd: OptionsEnd?
            
            public init( form0CommandName: Form0CommandName, form0Option: [Form0Option], optionsEnd: OptionsEnd? ) {
                self.form0CommandName = form0CommandName
                self.form0Option = form0Option
                self.optionsEnd = optionsEnd
            }
        }
        
        public class Form0Td: Codable {
            public let form0FlagTd: Form0FlagTd
            public let form0OperandTd: Form0OperandTd
            
            public init( form0FlagTd: Form0FlagTd, form0OperandTd: Form0OperandTd ) {
                self.form0FlagTd = form0FlagTd
                self.form0OperandTd = form0OperandTd
            }
        }
        
        public class Form0Library: Codable {
            public let form0FlagLibrary: Form0FlagLibrary
            public let form0OperandLibrary: Form0OperandLibrary
            
            public init( form0FlagLibrary: Form0FlagLibrary, form0OperandLibrary: Form0OperandLibrary ) {
                self.form0FlagLibrary = form0FlagLibrary
                self.form0OperandLibrary = form0OperandLibrary
            }
        }
        
        public class Form0IncludeData: Codable {
            public let form0FlagIncludeData: Form0FlagIncludeData
            
            public init( form0FlagIncludeData: Form0FlagIncludeData ) {
                self.form0FlagIncludeData = form0FlagIncludeData
            }
        }
        
        public class Form0Construct: Codable {
            public let form0FlagConstruct: Form0FlagConstruct
            
            public init( form0FlagConstruct: Form0FlagConstruct ) {
                self.form0FlagConstruct = form0FlagConstruct
            }
        }
        
        public class Form0SaveTd: Codable {
            public let form0FlagSaveTd: Form0FlagSaveTd
            
            public init( form0FlagSaveTd: Form0FlagSaveTd ) {
                self.form0FlagSaveTd = form0FlagSaveTd
            }
        }
        
        public class Form0SaveTdb: Codable {
            public let form0FlagSaveTdb: Form0FlagSaveTdb
            
            public init( form0FlagSaveTdb: Form0FlagSaveTdb ) {
                self.form0FlagSaveTdb = form0FlagSaveTdb
            }
        }
        
        public class Form0SaveKernels: Codable {
            public let form0FlagSaveKernels: Form0FlagSaveKernels
            
            public init( form0FlagSaveKernels: Form0FlagSaveKernels ) {
                self.form0FlagSaveKernels = form0FlagSaveKernels
            }
        }
        
        public class Form0Output: Codable {
            public let form0FlagOutput: Form0FlagOutput
            public let form0OperandOutput: Form0OperandOutput
            
            public init( form0FlagOutput: Form0FlagOutput, form0OperandOutput: Form0OperandOutput ) {
                self.form0FlagOutput = form0FlagOutput
                self.form0OperandOutput = form0OperandOutput
            }
        }
        
        public class Form1: Codable {
            public let form1CommandName: Form1CommandName
            public let form1Option: [Form1Option]
            public let optionsEnd: OptionsEnd?
            
            public init( form1CommandName: Form1CommandName, form1Option: [Form1Option], optionsEnd: OptionsEnd? ) {
                self.form1CommandName = form1CommandName
                self.form1Option = form1Option
                self.optionsEnd = optionsEnd
            }
        }
        
        public class Form1Tdb: Codable {
            public let form1FlagTdb: Form1FlagTdb
            public let form1OperandTdb: Form1OperandTdb
            
            public init( form1FlagTdb: Form1FlagTdb, form1OperandTdb: Form1OperandTdb ) {
                self.form1FlagTdb = form1FlagTdb
                self.form1OperandTdb = form1OperandTdb
            }
        }
        
        public class Form1Library: Codable {
            public let form1FlagLibrary: Form1FlagLibrary
            public let form1OperandLibrary: Form1OperandLibrary
            
            public init( form1FlagLibrary: Form1FlagLibrary, form1OperandLibrary: Form1OperandLibrary ) {
                self.form1FlagLibrary = form1FlagLibrary
                self.form1OperandLibrary = form1OperandLibrary
            }
        }
        
        public class Form1IncludeData: Codable {
            public let form1FlagIncludeData: Form1FlagIncludeData
            
            public init( form1FlagIncludeData: Form1FlagIncludeData ) {
                self.form1FlagIncludeData = form1FlagIncludeData
            }
        }
        
        public class Form1Construct: Codable {
            public let form1FlagConstruct: Form1FlagConstruct
            
            public init( form1FlagConstruct: Form1FlagConstruct ) {
                self.form1FlagConstruct = form1FlagConstruct
            }
        }
        
        public class Form1SaveTd: Codable {
            public let form1FlagSaveTd: Form1FlagSaveTd
            
            public init( form1FlagSaveTd: Form1FlagSaveTd ) {
                self.form1FlagSaveTd = form1FlagSaveTd
            }
        }
        
        public class Form1SaveTdb: Codable {
            public let form1FlagSaveTdb: Form1FlagSaveTdb
            
            public init( form1FlagSaveTdb: Form1FlagSaveTdb ) {
                self.form1FlagSaveTdb = form1FlagSaveTdb
            }
        }
        
        public class Form1SaveKernels: Codable {
            public let form1FlagSaveKernels: Form1FlagSaveKernels
            
            public init( form1FlagSaveKernels: Form1FlagSaveKernels ) {
                self.form1FlagSaveKernels = form1FlagSaveKernels
            }
        }
        
        public class Form1Output: Codable {
            public let form1FlagOutput: Form1FlagOutput
            public let form1OperandOutput: Form1OperandOutput
            
            public init( form1FlagOutput: Form1FlagOutput, form1OperandOutput: Form1OperandOutput ) {
                self.form1FlagOutput = form1FlagOutput
                self.form1OperandOutput = form1OperandOutput
            }
        }
        
        public func transform( form: Form )
        {
            begin( form: form )
            
            if let childType = form.childType {
                switch childType {
                case .formHelp:
                    transform( formHelp: form.child! as! FormHelp )
                case .formVersion:
                    transform( formVersion: form.child! as! FormVersion )
                case .form0:
                    transform( form0: form.child! as! Form0 )
                case .form1:
                    transform( form1: form.child! as! Form1 )
                    break
                }
            }
            
            end( form: form )
        }
        public func begin( form: Form ) {}
        public func end( form: Form ) {}
        
        public func transform( form0Option: Form0Option )
        {
            begin( form0Option: form0Option )
            
            if let childType = form0Option.childType {
                switch childType {
                case .form0Td:
                    transform( form0Td: form0Option.child! as! Form0Td )
                case .form0Library:
                    transform( form0Library: form0Option.child! as! Form0Library )
                case .form0IncludeData:
                    transform( form0IncludeData: form0Option.child! as! Form0IncludeData )
                case .form0Construct:
                    transform( form0Construct: form0Option.child! as! Form0Construct )
                case .form0SaveTd:
                    transform( form0SaveTd: form0Option.child! as! Form0SaveTd )
                case .form0SaveTdb:
                    transform( form0SaveTdb: form0Option.child! as! Form0SaveTdb )
                case .form0SaveKernels:
                    transform( form0SaveKernels: form0Option.child! as! Form0SaveKernels )
                case .form0Output:
                    transform( form0Output: form0Option.child! as! Form0Output )
                    break
                }
            }
            
            end( form0Option: form0Option )
        }
        public func begin( form0Option: Form0Option ) {}
        public func end( form0Option: Form0Option ) {}
        
        public func transform( form1Option: Form1Option )
        {
            begin( form1Option: form1Option )
            
            if let childType = form1Option.childType {
                switch childType {
                case .form1Tdb:
                    transform( form1Tdb: form1Option.child! as! Form1Tdb )
                case .form1Library:
                    transform( form1Library: form1Option.child! as! Form1Library )
                case .form1IncludeData:
                    transform( form1IncludeData: form1Option.child! as! Form1IncludeData )
                case .form1Construct:
                    transform( form1Construct: form1Option.child! as! Form1Construct )
                case .form1SaveTd:
                    transform( form1SaveTd: form1Option.child! as! Form1SaveTd )
                case .form1SaveTdb:
                    transform( form1SaveTdb: form1Option.child! as! Form1SaveTdb )
                case .form1SaveKernels:
                    transform( form1SaveKernels: form1Option.child! as! Form1SaveKernels )
                case .form1Output:
                    transform( form1Output: form1Option.child! as! Form1Output )
                    break
                }
            }
            
            end( form1Option: form1Option )
        }
        public func begin( form1Option: Form1Option ) {}
        public func end( form1Option: Form1Option ) {}
        
        public func transform( formHelpFlagOption: FormHelpFlagOption )
        {
            begin( formHelpFlagOption: formHelpFlagOption )
            
            end( formHelpFlagOption: formHelpFlagOption )
        }
        public func begin( formHelpFlagOption: FormHelpFlagOption ) {}
        public func end( formHelpFlagOption: FormHelpFlagOption ) {}
        
        public func transform( formVersionFlagOption: FormVersionFlagOption )
        {
            begin( formVersionFlagOption: formVersionFlagOption )
            
            end( formVersionFlagOption: formVersionFlagOption )
        }
        public func begin( formVersionFlagOption: FormVersionFlagOption ) {}
        public func end( formVersionFlagOption: FormVersionFlagOption ) {}
        
        public func transform( commandName: CommandName )
        {
            begin( commandName: commandName )
            
            end( commandName: commandName )
        }
        public func begin( commandName: CommandName ) {}
        public func end( commandName: CommandName ) {}
        
        public func transform( form0CommandName: Form0CommandName )
        {
            begin( form0CommandName: form0CommandName )
            
            end( form0CommandName: form0CommandName )
        }
        public func begin( form0CommandName: Form0CommandName ) {}
        public func end( form0CommandName: Form0CommandName ) {}
        
        public func transform( form0FlagTd: Form0FlagTd )
        {
            begin( form0FlagTd: form0FlagTd )
            
            end( form0FlagTd: form0FlagTd )
        }
        public func begin( form0FlagTd: Form0FlagTd ) {}
        public func end( form0FlagTd: Form0FlagTd ) {}
        
        public func transform( form0OperandTd: Form0OperandTd )
        {
            begin( form0OperandTd: form0OperandTd )
            
            end( form0OperandTd: form0OperandTd )
        }
        public func begin( form0OperandTd: Form0OperandTd ) {}
        public func end( form0OperandTd: Form0OperandTd ) {}
        
        public func transform( form0FlagLibrary: Form0FlagLibrary )
        {
            begin( form0FlagLibrary: form0FlagLibrary )
            
            end( form0FlagLibrary: form0FlagLibrary )
        }
        public func begin( form0FlagLibrary: Form0FlagLibrary ) {}
        public func end( form0FlagLibrary: Form0FlagLibrary ) {}
        
        public func transform( form0OperandLibrary: Form0OperandLibrary )
        {
            begin( form0OperandLibrary: form0OperandLibrary )
            
            end( form0OperandLibrary: form0OperandLibrary )
        }
        public func begin( form0OperandLibrary: Form0OperandLibrary ) {}
        public func end( form0OperandLibrary: Form0OperandLibrary ) {}
        
        public func transform( form0FlagIncludeData: Form0FlagIncludeData )
        {
            begin( form0FlagIncludeData: form0FlagIncludeData )
            
            end( form0FlagIncludeData: form0FlagIncludeData )
        }
        public func begin( form0FlagIncludeData: Form0FlagIncludeData ) {}
        public func end( form0FlagIncludeData: Form0FlagIncludeData ) {}
        
        public func transform( form0FlagConstruct: Form0FlagConstruct )
        {
            begin( form0FlagConstruct: form0FlagConstruct )
            
            end( form0FlagConstruct: form0FlagConstruct )
        }
        public func begin( form0FlagConstruct: Form0FlagConstruct ) {}
        public func end( form0FlagConstruct: Form0FlagConstruct ) {}
        
        public func transform( form0FlagSaveTd: Form0FlagSaveTd )
        {
            begin( form0FlagSaveTd: form0FlagSaveTd )
            
            end( form0FlagSaveTd: form0FlagSaveTd )
        }
        public func begin( form0FlagSaveTd: Form0FlagSaveTd ) {}
        public func end( form0FlagSaveTd: Form0FlagSaveTd ) {}
        
        public func transform( form0FlagSaveTdb: Form0FlagSaveTdb )
        {
            begin( form0FlagSaveTdb: form0FlagSaveTdb )
            
            end( form0FlagSaveTdb: form0FlagSaveTdb )
        }
        public func begin( form0FlagSaveTdb: Form0FlagSaveTdb ) {}
        public func end( form0FlagSaveTdb: Form0FlagSaveTdb ) {}
        
        public func transform( form0FlagSaveKernels: Form0FlagSaveKernels )
        {
            begin( form0FlagSaveKernels: form0FlagSaveKernels )
            
            end( form0FlagSaveKernels: form0FlagSaveKernels )
        }
        public func begin( form0FlagSaveKernels: Form0FlagSaveKernels ) {}
        public func end( form0FlagSaveKernels: Form0FlagSaveKernels ) {}
        
        public func transform( form0FlagOutput: Form0FlagOutput )
        {
            begin( form0FlagOutput: form0FlagOutput )
            
            end( form0FlagOutput: form0FlagOutput )
        }
        public func begin( form0FlagOutput: Form0FlagOutput ) {}
        public func end( form0FlagOutput: Form0FlagOutput ) {}
        
        public func transform( form0OperandOutput: Form0OperandOutput )
        {
            begin( form0OperandOutput: form0OperandOutput )
            
            end( form0OperandOutput: form0OperandOutput )
        }
        public func begin( form0OperandOutput: Form0OperandOutput ) {}
        public func end( form0OperandOutput: Form0OperandOutput ) {}
        
        public func transform( form1CommandName: Form1CommandName )
        {
            begin( form1CommandName: form1CommandName )
            
            end( form1CommandName: form1CommandName )
        }
        public func begin( form1CommandName: Form1CommandName ) {}
        public func end( form1CommandName: Form1CommandName ) {}
        
        public func transform( form1FlagTdb: Form1FlagTdb )
        {
            begin( form1FlagTdb: form1FlagTdb )
            
            end( form1FlagTdb: form1FlagTdb )
        }
        public func begin( form1FlagTdb: Form1FlagTdb ) {}
        public func end( form1FlagTdb: Form1FlagTdb ) {}
        
        public func transform( form1OperandTdb: Form1OperandTdb )
        {
            begin( form1OperandTdb: form1OperandTdb )
            
            end( form1OperandTdb: form1OperandTdb )
        }
        public func begin( form1OperandTdb: Form1OperandTdb ) {}
        public func end( form1OperandTdb: Form1OperandTdb ) {}
        
        public func transform( form1FlagLibrary: Form1FlagLibrary )
        {
            begin( form1FlagLibrary: form1FlagLibrary )
            
            end( form1FlagLibrary: form1FlagLibrary )
        }
        public func begin( form1FlagLibrary: Form1FlagLibrary ) {}
        public func end( form1FlagLibrary: Form1FlagLibrary ) {}
        
        public func transform( form1OperandLibrary: Form1OperandLibrary )
        {
            begin( form1OperandLibrary: form1OperandLibrary )
            
            end( form1OperandLibrary: form1OperandLibrary )
        }
        public func begin( form1OperandLibrary: Form1OperandLibrary ) {}
        public func end( form1OperandLibrary: Form1OperandLibrary ) {}
        
        public func transform( form1FlagIncludeData: Form1FlagIncludeData )
        {
            begin( form1FlagIncludeData: form1FlagIncludeData )
            
            end( form1FlagIncludeData: form1FlagIncludeData )
        }
        public func begin( form1FlagIncludeData: Form1FlagIncludeData ) {}
        public func end( form1FlagIncludeData: Form1FlagIncludeData ) {}
        
        public func transform( form1FlagConstruct: Form1FlagConstruct )
        {
            begin( form1FlagConstruct: form1FlagConstruct )
            
            end( form1FlagConstruct: form1FlagConstruct )
        }
        public func begin( form1FlagConstruct: Form1FlagConstruct ) {}
        public func end( form1FlagConstruct: Form1FlagConstruct ) {}
        
        public func transform( form1FlagSaveTd: Form1FlagSaveTd )
        {
            begin( form1FlagSaveTd: form1FlagSaveTd )
            
            end( form1FlagSaveTd: form1FlagSaveTd )
        }
        public func begin( form1FlagSaveTd: Form1FlagSaveTd ) {}
        public func end( form1FlagSaveTd: Form1FlagSaveTd ) {}
        
        public func transform( form1FlagSaveTdb: Form1FlagSaveTdb )
        {
            begin( form1FlagSaveTdb: form1FlagSaveTdb )
            
            end( form1FlagSaveTdb: form1FlagSaveTdb )
        }
        public func begin( form1FlagSaveTdb: Form1FlagSaveTdb ) {}
        public func end( form1FlagSaveTdb: Form1FlagSaveTdb ) {}
        
        public func transform( form1FlagSaveKernels: Form1FlagSaveKernels )
        {
            begin( form1FlagSaveKernels: form1FlagSaveKernels )
            
            end( form1FlagSaveKernels: form1FlagSaveKernels )
        }
        public func begin( form1FlagSaveKernels: Form1FlagSaveKernels ) {}
        public func end( form1FlagSaveKernels: Form1FlagSaveKernels ) {}
        
        public func transform( form1FlagOutput: Form1FlagOutput )
        {
            begin( form1FlagOutput: form1FlagOutput )
            
            end( form1FlagOutput: form1FlagOutput )
        }
        public func begin( form1FlagOutput: Form1FlagOutput ) {}
        public func end( form1FlagOutput: Form1FlagOutput ) {}
        
        public func transform( form1OperandOutput: Form1OperandOutput )
        {
            begin( form1OperandOutput: form1OperandOutput )
            
            end( form1OperandOutput: form1OperandOutput )
        }
        public func begin( form1OperandOutput: Form1OperandOutput ) {}
        public func end( form1OperandOutput: Form1OperandOutput ) {}
        
        public func transform( commandLine: CommandLine )
        {
            begin( commandLine: commandLine )
            
            transform( form: commandLine.form )
            
            end( commandLine: commandLine )
        }
        public func begin( commandLine: CommandLine ) {}
        public func end( commandLine: CommandLine ) {}
        
        public func transform( formHelp: FormHelp )
        {
            begin( formHelp: formHelp )
            
            transform( commandName: formHelp.commandName )
            
            transform( formHelpOption: formHelp.formHelpOption )
            
            if let optionsEnd = formHelp.optionsEnd {
                transform( optionsEnd: optionsEnd )
            }
            
            end( formHelp: formHelp )
        }
        public func begin( formHelp: FormHelp ) {}
        public func end( formHelp: FormHelp ) {}
        
        public func transform( formHelpOption: FormHelpOption )
        {
            begin( formHelpOption: formHelpOption )
            
            transform( formHelpFlagOption: formHelpOption.formHelpFlagOption )
            
            end( formHelpOption: formHelpOption )
        }
        public func begin( formHelpOption: FormHelpOption ) {}
        public func end( formHelpOption: FormHelpOption ) {}
        
        public func transform( formVersion: FormVersion )
        {
            begin( formVersion: formVersion )
            
            transform( commandName: formVersion.commandName )
            
            transform( formVersionOption: formVersion.formVersionOption )
            
            if let optionsEnd = formVersion.optionsEnd {
                transform( optionsEnd: optionsEnd )
            }
            
            end( formVersion: formVersion )
        }
        public func begin( formVersion: FormVersion ) {}
        public func end( formVersion: FormVersion ) {}
        
        public func transform( formVersionOption: FormVersionOption )
        {
            begin( formVersionOption: formVersionOption )
            
            transform( formVersionFlagOption: formVersionOption.formVersionFlagOption )
            
            end( formVersionOption: formVersionOption )
        }
        public func begin( formVersionOption: FormVersionOption ) {}
        public func end( formVersionOption: FormVersionOption ) {}
        
        public func transform( optionsEnd: OptionsEnd )
        {
            begin( optionsEnd: optionsEnd )
            
            end( optionsEnd: optionsEnd )
        }
        public func begin( optionsEnd: OptionsEnd ) {}
        public func end( optionsEnd: OptionsEnd ) {}
        
        public func transform( form0: Form0 )
        {
            begin( form0: form0 )
            
            transform( form0CommandName: form0.form0CommandName )
            
            for form0Option in form0.form0Option {
                transform( form0Option: form0Option )
            }
            
            if let optionsEnd = form0.optionsEnd {
                transform( optionsEnd: optionsEnd )
            }
            
            end( form0: form0 )
        }
        public func begin( form0: Form0 ) {}
        public func end( form0: Form0 ) {}
        
        public func transform( form0Td: Form0Td )
        {
            begin( form0Td: form0Td )
            
            transform( form0FlagTd: form0Td.form0FlagTd )
            
            transform( form0OperandTd: form0Td.form0OperandTd )
            
            end( form0Td: form0Td )
        }
        public func begin( form0Td: Form0Td ) {}
        public func end( form0Td: Form0Td ) {}
        
        public func transform( form0Library: Form0Library )
        {
            begin( form0Library: form0Library )
            
            transform( form0FlagLibrary: form0Library.form0FlagLibrary )
            
            transform( form0OperandLibrary: form0Library.form0OperandLibrary )
            
            end( form0Library: form0Library )
        }
        public func begin( form0Library: Form0Library ) {}
        public func end( form0Library: Form0Library ) {}
        
        public func transform( form0IncludeData: Form0IncludeData )
        {
            begin( form0IncludeData: form0IncludeData )
            
            transform( form0FlagIncludeData: form0IncludeData.form0FlagIncludeData )
            
            end( form0IncludeData: form0IncludeData )
        }
        public func begin( form0IncludeData: Form0IncludeData ) {}
        public func end( form0IncludeData: Form0IncludeData ) {}
        
        public func transform( form0Construct: Form0Construct )
        {
            begin( form0Construct: form0Construct )
            
            transform( form0FlagConstruct: form0Construct.form0FlagConstruct )
            
            end( form0Construct: form0Construct )
        }
        public func begin( form0Construct: Form0Construct ) {}
        public func end( form0Construct: Form0Construct ) {}
        
        public func transform( form0SaveTd: Form0SaveTd )
        {
            begin( form0SaveTd: form0SaveTd )
            
            transform( form0FlagSaveTd: form0SaveTd.form0FlagSaveTd )
            
            end( form0SaveTd: form0SaveTd )
        }
        public func begin( form0SaveTd: Form0SaveTd ) {}
        public func end( form0SaveTd: Form0SaveTd ) {}
        
        public func transform( form0SaveTdb: Form0SaveTdb )
        {
            begin( form0SaveTdb: form0SaveTdb )
            
            transform( form0FlagSaveTdb: form0SaveTdb.form0FlagSaveTdb )
            
            end( form0SaveTdb: form0SaveTdb )
        }
        public func begin( form0SaveTdb: Form0SaveTdb ) {}
        public func end( form0SaveTdb: Form0SaveTdb ) {}
        
        public func transform( form0SaveKernels: Form0SaveKernels )
        {
            begin( form0SaveKernels: form0SaveKernels )
            
            transform( form0FlagSaveKernels: form0SaveKernels.form0FlagSaveKernels )
            
            end( form0SaveKernels: form0SaveKernels )
        }
        public func begin( form0SaveKernels: Form0SaveKernels ) {}
        public func end( form0SaveKernels: Form0SaveKernels ) {}
        
        public func transform( form0Output: Form0Output )
        {
            begin( form0Output: form0Output )
            
            transform( form0FlagOutput: form0Output.form0FlagOutput )
            
            transform( form0OperandOutput: form0Output.form0OperandOutput )
            
            end( form0Output: form0Output )
        }
        public func begin( form0Output: Form0Output ) {}
        public func end( form0Output: Form0Output ) {}
        
        public func transform( form1: Form1 )
        {
            begin( form1: form1 )
            
            transform( form1CommandName: form1.form1CommandName )
            
            for form1Option in form1.form1Option {
                transform( form1Option: form1Option )
            }
            
            if let optionsEnd = form1.optionsEnd {
                transform( optionsEnd: optionsEnd )
            }
            
            end( form1: form1 )
        }
        public func begin( form1: Form1 ) {}
        public func end( form1: Form1 ) {}
        
        public func transform( form1Tdb: Form1Tdb )
        {
            begin( form1Tdb: form1Tdb )
            
            transform( form1FlagTdb: form1Tdb.form1FlagTdb )
            
            transform( form1OperandTdb: form1Tdb.form1OperandTdb )
            
            end( form1Tdb: form1Tdb )
        }
        public func begin( form1Tdb: Form1Tdb ) {}
        public func end( form1Tdb: Form1Tdb ) {}
        
        public func transform( form1Library: Form1Library )
        {
            begin( form1Library: form1Library )
            
            transform( form1FlagLibrary: form1Library.form1FlagLibrary )
            
            transform( form1OperandLibrary: form1Library.form1OperandLibrary )
            
            end( form1Library: form1Library )
        }
        public func begin( form1Library: Form1Library ) {}
        public func end( form1Library: Form1Library ) {}
        
        public func transform( form1IncludeData: Form1IncludeData )
        {
            begin( form1IncludeData: form1IncludeData )
            
            transform( form1FlagIncludeData: form1IncludeData.form1FlagIncludeData )
            
            end( form1IncludeData: form1IncludeData )
        }
        public func begin( form1IncludeData: Form1IncludeData ) {}
        public func end( form1IncludeData: Form1IncludeData ) {}
        
        public func transform( form1Construct: Form1Construct )
        {
            begin( form1Construct: form1Construct )
            
            transform( form1FlagConstruct: form1Construct.form1FlagConstruct )
            
            end( form1Construct: form1Construct )
        }
        public func begin( form1Construct: Form1Construct ) {}
        public func end( form1Construct: Form1Construct ) {}
        
        public func transform( form1SaveTd: Form1SaveTd )
        {
            begin( form1SaveTd: form1SaveTd )
            
            transform( form1FlagSaveTd: form1SaveTd.form1FlagSaveTd )
            
            end( form1SaveTd: form1SaveTd )
        }
        public func begin( form1SaveTd: Form1SaveTd ) {}
        public func end( form1SaveTd: Form1SaveTd ) {}
        
        public func transform( form1SaveTdb: Form1SaveTdb )
        {
            begin( form1SaveTdb: form1SaveTdb )
            
            transform( form1FlagSaveTdb: form1SaveTdb.form1FlagSaveTdb )
            
            end( form1SaveTdb: form1SaveTdb )
        }
        public func begin( form1SaveTdb: Form1SaveTdb ) {}
        public func end( form1SaveTdb: Form1SaveTdb ) {}
        
        public func transform( form1SaveKernels: Form1SaveKernels )
        {
            begin( form1SaveKernels: form1SaveKernels )
            
            transform( form1FlagSaveKernels: form1SaveKernels.form1FlagSaveKernels )
            
            end( form1SaveKernels: form1SaveKernels )
        }
        public func begin( form1SaveKernels: Form1SaveKernels ) {}
        public func end( form1SaveKernels: Form1SaveKernels ) {}
        
        public func transform( form1Output: Form1Output )
        {
            begin( form1Output: form1Output )
            
            transform( form1FlagOutput: form1Output.form1FlagOutput )
            
            transform( form1OperandOutput: form1Output.form1OperandOutput )
            
            end( form1Output: form1Output )
        }
        public func begin( form1Output: Form1Output ) {}
        public func end( form1Output: Form1Output ) {}
        
    } // class Transformer
    
} // extension CommandLineTensorDsl

extension CommandLineTensorDslCompiler {
    
    public class Formatter {
    }
} // extension CommandLineTensorDsl

extension CommandLineTensorDslCompiler {
    
    public class Printer {
    }
} // extension CommandLineTensorDsl

extension CommandLineTensorDslCompiler {
    
    class ErrorTransform : Transformer {
    }
    
    class DefinitionsTransform : ErrorTransform {
        
        func check() {
        }
    }
}
