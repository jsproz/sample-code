//
//  CommandLineTensorDslTransform.swift
//  TensorDsl
//
//  Copyright © 2023 Artificer AI. All rights reserved.
//

import Runtime

public class CommandLineForm {
}

/// tensor-dsl -td <td_input_file> [-library <tdb_library_file>] [-include-data] [-construct] [-save-td] [-save-tdb] [-save-kernels] -output <output_folder> [--]
public class CommandLineForm0 : CommandLineForm, Encodable, Decodable, CustomDebugStringConvertible {
    let commandName: String
    let td: String
    let library: String?
    let includeData: Bool
    let construct: Bool
    let saveTd: Bool
    let saveTdb: Bool
    let saveKernels: Bool
    let output: String
    
    public var debugDescription: String {
            let debugDescription = try! JsonEncoder.jsonString( self, pretty: true )
            return debugDescription
    }
    
    init( commandName: String, td: String, library: String?, includeData: Bool, construct: Bool, saveTd: Bool, saveTdb: Bool, saveKernels: Bool, output: String ) {
        self.commandName = commandName
        self.td = td
        self.library = library
        self.includeData = includeData
        self.construct = construct
        self.saveTd = saveTd
        self.saveTdb = saveTdb
        self.saveKernels = saveKernels
        self.output = output
    }
}

/// tensor-dsl -tdb <tdb_input_file> [-library <tdb_library_file>] [-include-data] [-construct] [-save-td] [-save-tdb] [-save-kernels] -output <output_folder> [--]
public class CommandLineForm1 : CommandLineForm, Encodable, Decodable, CustomDebugStringConvertible {
    let commandName: String
    let tdb: String
    let library: String?
    let includeData: Bool
    let construct: Bool
    let saveTd: Bool
    let saveTdb: Bool
    let saveKernels: Bool
    let output: String
    
    public var debugDescription: String {
            let debugDescription = try! JsonEncoder.jsonString( self, pretty: true )
            return debugDescription
    }
    
    init( commandName: String, tdb: String, library: String?, includeData: Bool, construct: Bool, saveTd: Bool, saveTdb: Bool, saveKernels: Bool, output: String ) {
        self.commandName = commandName
        self.tdb = tdb
        self.library = library
        self.includeData = includeData
        self.construct = construct
        self.saveTd = saveTd
        self.saveTdb = saveTdb
        self.saveKernels = saveKernels
        self.output = output
    }
}

public class CommandLineFormHelp : CommandLineForm {
}

public class CommandLineFormVersion : CommandLineForm {
}

public class CommandLineTransform : CommandLineTensorDslCompiler.Transformer {
    var form: CommandLineForm?
    
    var commandName = [String]()
    var td = [String]()
    var library = [String]()
    var includeData = [Bool]()
    var construct = [Bool]()
    var saveTd = [Bool]()
    var saveTdb = [Bool]()
    var saveKernels = [Bool]()
    var output = [String]()
    var tdb = [String]()
    
    override public func end( formHelp: CommandLineTensorDslCompiler.Transformer.FormHelp ) {
        self.form = CommandLineFormHelp()
    }
    
    override public func end( formVersion: CommandLineTensorDslCompiler.Transformer.FormVersion ) {
        self.form = CommandLineFormVersion()
    }
    
    override public func end( form0CommandName: CommandLineTensorDslCompiler.Transformer.Form0CommandName ) {
        commandName.append( form0CommandName.token.text )
    }
    
    override public func end( form0OperandTd: CommandLineTensorDslCompiler.Transformer.Form0OperandTd ) {
        td.append( form0OperandTd.token.text )
    }
    
    override public func end( form0OperandLibrary: CommandLineTensorDslCompiler.Transformer.Form0OperandLibrary ) {
        library.append( form0OperandLibrary.token.text )
    }
    
    override public func end( form0IncludeData: CommandLineTensorDslCompiler.Transformer.Form0IncludeData ) {
        includeData.append( true )
    }
    
    override public func end( form0Construct: CommandLineTensorDslCompiler.Transformer.Form0Construct ) {
        construct.append( true )
    }
    
    override public func end( form0SaveTd: CommandLineTensorDslCompiler.Transformer.Form0SaveTd ) {
        saveTd.append( true )
    }
    
    override public func end( form0SaveTdb: CommandLineTensorDslCompiler.Transformer.Form0SaveTdb ) {
        saveTdb.append( true )
    }
    
    override public func end( form0SaveKernels: CommandLineTensorDslCompiler.Transformer.Form0SaveKernels ) {
        saveKernels.append( true )
    }
    
    override public func end( form0OperandOutput: CommandLineTensorDslCompiler.Transformer.Form0OperandOutput ) {
        output.append( form0OperandOutput.token.text )
    }
    
    override public func end( form0: CommandLineTensorDslCompiler.Transformer.Form0 ) {
        if self.commandName.count != 1 {
            return
        }
        
        if self.td.count != 1 {
            return
        }
        
        if self.library.count > 1 {
            return
        }
        
        if self.includeData.count > 1 {
            return
        }
        
        if self.construct.count > 1 {
            return
        }
        
        if self.saveTd.count > 1 {
            return
        }
        
        if self.saveTdb.count > 1 {
            return
        }
        
        if self.saveKernels.count > 1 {
            return
        }
        
        if self.output.count != 1 {
            return
        }
        
        self.form = CommandLineForm0( commandName: commandName.first!, td: td.first!, library: library.first, includeData: includeData.count > 0, construct: construct.count > 0, saveTd: saveTd.count > 0, saveTdb: saveTdb.count > 0, saveKernels: saveKernels.count > 0, output: output.first! )
    }
    
    override public func end( form1CommandName: CommandLineTensorDslCompiler.Transformer.Form1CommandName ) {
        commandName.append( form1CommandName.token.text )
    }
    
    override public func end( form1OperandTdb: CommandLineTensorDslCompiler.Transformer.Form1OperandTdb ) {
        tdb.append( form1OperandTdb.token.text )
    }
    
    override public func end( form1OperandLibrary: CommandLineTensorDslCompiler.Transformer.Form1OperandLibrary ) {
        library.append( form1OperandLibrary.token.text )
    }
    
    override public func end( form1IncludeData: CommandLineTensorDslCompiler.Transformer.Form1IncludeData ) {
        includeData.append( true )
    }
    
    override public func end( form1Construct: CommandLineTensorDslCompiler.Transformer.Form1Construct ) {
        construct.append( true )
    }
    
    override public func end( form1SaveTd: CommandLineTensorDslCompiler.Transformer.Form1SaveTd ) {
        saveTd.append( true )
    }
    
    override public func end( form1SaveTdb: CommandLineTensorDslCompiler.Transformer.Form1SaveTdb ) {
        saveTdb.append( true )
    }
    
    override public func end( form1SaveKernels: CommandLineTensorDslCompiler.Transformer.Form1SaveKernels ) {
        saveKernels.append( true )
    }
    
    override public func end( form1OperandOutput: CommandLineTensorDslCompiler.Transformer.Form1OperandOutput ) {
        output.append( form1OperandOutput.token.text )
    }
    
    override public func end( form1: CommandLineTensorDslCompiler.Transformer.Form1 ) {
        if self.commandName.count != 1 {
            return
        }
        
        if self.tdb.count != 1 {
            return
        }
        
        if self.library.count > 1 {
            return
        }
        
        if self.includeData.count > 1 {
            return
        }
        
        if self.construct.count > 1 {
            return
        }
        
        if self.saveTd.count > 1 {
            return
        }
        
        if self.saveTdb.count > 1 {
            return
        }
        
        if self.saveKernels.count > 1 {
            return
        }
        
        if self.output.count != 1 {
            return
        }
        
        self.form = CommandLineForm1( commandName: commandName.first!, tdb: tdb.first!, library: library.first, includeData: includeData.count > 0, construct: construct.count > 0, saveTd: saveTd.count > 0, saveTdb: saveTdb.count > 0, saveKernels: saveKernels.count > 0, output: output.first! )
    }
}

public protocol CommandLineHandling {
    func doForm( form0: CommandLineForm0 ) -> Bool
    func doForm( form1: CommandLineForm1 ) -> Bool
}

public class Main {
    var commandLineHandler : CommandLineHandling
    let version = "0.0.0"
    var help = """
This sample project for a compiler base tool written in Swift.
"""
    var usage = """
Usage:
    tensor-dsl -td <td_input_file> [-library <tdb_library_file>] [-include-data] [-construct] [-save-td] [-save-tdb] [-save-kernels] -output <output_folder> [--]
    tensor-dsl -tdb <tdb_input_file> [-library <tdb_library_file>] [-include-data] [-construct] [-save-td] [-save-tdb] [-save-kernels] -output <output_folder> [--]
    tensor-dsl -version [--]
    tensor-dsl -help [--]
"""
    var copyright = """
Copyright 2006-2019 Predicted Results. All rights reserved.
"""
    
    public init( commandLineHandler : CommandLineHandling ) {
        self.commandLineHandler = commandLineHandler
    }
    
    public func doForm() -> Bool {
        let tokenList = TokenList.tokenListFromArguments()
        let scanner = CommandLineTensorDslCompiler.Scanner()
        let newTokenList = scanner.getTokenList( buffer: tokenList )
        
        let parser = CommandLineTensorDslCompiler.Parser()
        if let parseTree = parser.parse( tokenList: newTokenList ) {
            let transform = CommandLineTransform()
            transform.transform( commandLine: parseTree )
            
            if let form = transform.form {
                switch form {
                case let formHelp as CommandLineFormHelp :
                    return doForm( formHelp: formHelp )
                case let formVersion as CommandLineFormVersion :
                    return doForm( formVersion: formVersion )
                case let form0 as CommandLineForm0 :
                    return commandLineHandler.doForm( form0: form0 )
                case let form1 as CommandLineForm1 :
                    return commandLineHandler.doForm( form1: form1 )
                default :
                    print( "\(usage)" )
                    return false
                }
            }
        }
        
        print( "\(usage)" )
        return false
    }
    
    public func doForm( formHelp : CommandLineFormHelp ) -> Bool {
        print( "\(help)\n\n\(usage)\n\n\(copyright)" )
        return true
    }
    
    public func doForm( formVersion : CommandLineFormVersion ) -> Bool {
        print( "\(getUtilityName()) v\(version)" )
        return true
    }

    static public func run() -> Bool {
        let commandLineHandler = CommandLineHandler()
        let main = Main( commandLineHandler: commandLineHandler )
        
        if main.doForm() {
            return true
        } else {
            return false
        }
    }
}
