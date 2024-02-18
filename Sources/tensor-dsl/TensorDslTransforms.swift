//
//  TensorDslTransforms.swift
//  TensorDsl
//
//  Copyright © 2023 Artificer AI. All rights reserved.
//

class GetFunctions: TensorDslCompiler.Transformer {
    var functions = [TensorDslCompiler.Transformer.Function]()
    
    override func begin( function: TensorDslCompiler.Transformer.Function ) {
        functions.append( function )
    }
}

func getFunctions( model: TensorDslCompiler.Transformer.Model ) -> [TensorDslCompiler.Transformer.Function] {
    let getFunctions = GetFunctions()
    getFunctions.transform( model: model )
    let functions = getFunctions.functions
    return functions
}

class GetArguments: TensorDslCompiler.Transformer {
    var arguments = [TensorDslCompiler.Transformer.Argument]()
    
    override func begin( argument: TensorDslCompiler.Transformer.Argument ) {
        arguments.append( argument )
    }
}

func getArguments( operation: TensorDslCompiler.Transformer.Operation ) -> [TensorDslCompiler.Transformer.Argument] {
    let getArguments = GetArguments()
    getArguments.transform( operation: operation )
    let arguments = getArguments.arguments
    return arguments
}

class GetAttributes: TensorDslCompiler.Transformer {
    var attributes = [TensorDslCompiler.Transformer.Attribute]()
    
    override func begin( attribute: TensorDslCompiler.Transformer.Attribute ) {
        attributes.append( attribute )
    }
}

func getAttributes( operation: TensorDslCompiler.Transformer.Operation ) -> [TensorDslCompiler.Transformer.Attribute] {
    let getAttributes = GetAttributes()
    getAttributes.transform( operation: operation )
    let attributes = getAttributes.attributes
    return attributes
}

class GetResults: TensorDslCompiler.Transformer {
    var results = [TensorDslCompiler.Transformer.Result]()
    
    override func begin( result: TensorDslCompiler.Transformer.Result ) {
        results.append( result )
    }
}

func getResults( operation: TensorDslCompiler.Transformer.Operation ) -> [TensorDslCompiler.Transformer.Result] {
    let getResults = GetResults()
    getResults.transform( operation: operation )
    let results = getResults.results
    return results
}

class GetDimensions: TensorDslCompiler.Transformer {
    var dimensions = [TensorDslCompiler.Transformer.Dimension]()
    
    override func begin( dimension: TensorDslCompiler.Transformer.Dimension ) {
        dimensions.append( dimension )
    }
}

func getDimensions( variable: TensorDslCompiler.Transformer.Variable ) -> [TensorDslCompiler.Transformer.Dimension] {
    let getDimensions = GetDimensions()
    getDimensions.transform( variable: variable )
    let dimensions = getDimensions.dimensions
    return dimensions
}

class GetIntegers: TensorDslCompiler.Transformer {
    var integers = [TensorDslCompiler.Transformer.Integer]()
    
    override func begin( integer: TensorDslCompiler.Transformer.Integer ) {
        integers.append( integer )
    }
}

func getIntegers( initializer: TensorDslCompiler.Transformer.Initializer ) -> [TensorDslCompiler.Transformer.Integer] {
    let getIntegers = GetIntegers()
    getIntegers.transform( initializer: initializer )
    let integers = getIntegers.integers
    return integers
}

class GetFloatingPoints: TensorDslCompiler.Transformer {
    var floatingPoints = [TensorDslCompiler.Transformer.FloatingPoint]()
    
    override func begin( floatingPoint: TensorDslCompiler.Transformer.FloatingPoint ) {
        floatingPoints.append( floatingPoint )
    }
}

func getFloatingPoints( initializer: TensorDslCompiler.Transformer.Initializer ) -> [TensorDslCompiler.Transformer.FloatingPoint] {
    let getFloatingPoints = GetFloatingPoints()
    getFloatingPoints.transform( initializer: initializer )
    let floatingPoints = getFloatingPoints.floatingPoints
    return floatingPoints
}

class GetStringValues: TensorDslCompiler.Transformer {
    var stringValues = [TensorDslCompiler.Transformer.StringValue]()
    
    override func begin( stringValue: TensorDslCompiler.Transformer.StringValue ) {
        stringValues.append( stringValue )
    }
}

func getStringValues( initializer: TensorDslCompiler.Transformer.Initializer ) -> [TensorDslCompiler.Transformer.StringValue] {
    let getStringValues = GetStringValues()
    getStringValues.transform( initializer: initializer )
    let stringValues = getStringValues.stringValues
    return stringValues
}
