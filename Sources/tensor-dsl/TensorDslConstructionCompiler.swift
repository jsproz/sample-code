//
//  TensorDslConstructionCompiler.swift
//  TensorDslConstruction
//
//  Copyright © 2023 Artificer AI. All rights reserved.
//

import Runtime

public class TensorDslConstructionCompiler {
}

extension TensorDslConstructionCompiler {
    
    public class Transformer {
        
    } // class Transformer
    
} // extension TensorDslConstruction

extension TensorDslConstructionCompiler {
    
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
            public var modelName: String?
            public var functionInput: [FunctionInput]
            public var functionOutput: [FunctionOutput]
            public var statement: [Statement]
            
            public init() {
                functionInput = []
                functionOutput = []
                statement = []
            }
            
            public init( indent: String?, functionName: String?, modelName: String?, functionInput: [FunctionInput] = [], functionOutput: [FunctionOutput] = [], statement: [Statement] = [] ) {
                self.indent = indent
                self.functionName = functionName
                self.modelName = modelName
                self.functionInput = functionInput
                self.functionOutput = functionOutput
                self.statement = statement
            }
        }
        
        public class Subfunction: Codable {
            public var indent: String?
            public var functionName: String?
            public var functionInput: [FunctionInput]
            public var functionOutput: [FunctionOutput]
            public var statement: [Statement]
            
            public init() {
                functionInput = []
                functionOutput = []
                statement = []
            }
            
            public init( indent: String?, functionName: String?, functionInput: [FunctionInput] = [], functionOutput: [FunctionOutput] = [], statement: [Statement] = [] ) {
                self.indent = indent
                self.functionName = functionName
                self.functionInput = functionInput
                self.functionOutput = functionOutput
                self.statement = statement
            }
        }
        
        public class Kernel: Codable {
            public var indent: String?
            public var functionName: String?
            public var kernelInput: [KernelInput]
            public var kernelOutput: [KernelOutput]
            
            public init() {
                kernelInput = []
                kernelOutput = []
            }
            
            public init( indent: String?, functionName: String?, kernelInput: [KernelInput] = [], kernelOutput: [KernelOutput] = [] ) {
                self.indent = indent
                self.functionName = functionName
                self.kernelInput = kernelInput
                self.kernelOutput = kernelOutput
            }
        }
        
        public class FunctionInput: Codable {
            public var indent: String?
            public var inputName: String?
            public var tensor: Tensor?
            
            public init() {
            }
            
            public init( indent: String?, inputName: String?, tensor: Tensor? ) {
                self.indent = indent
                self.inputName = inputName
                self.tensor = tensor
            }
        }
        
        public class FunctionOutput: Codable {
            public var indent: String?
            public var outputName: String?
            public var tensor: Tensor?
            
            public init() {
            }
            
            public init( indent: String?, outputName: String?, tensor: Tensor? ) {
                self.indent = indent
                self.outputName = outputName
                self.tensor = tensor
            }
        }
        
        public class KernelInput: Codable {
            public var indent: String?
            public var inputName: String?
            public var tensor: Tensor?
            
            public init() {
            }
            
            public init( indent: String?, inputName: String?, tensor: Tensor? ) {
                self.indent = indent
                self.inputName = inputName
                self.tensor = tensor
            }
        }
        
        public class KernelOutput: Codable {
            public var indent: String?
            public var outputName: String?
            public var tensor: Tensor?
            
            public init() {
            }
            
            public init( indent: String?, outputName: String?, tensor: Tensor? ) {
                self.indent = indent
                self.outputName = outputName
                self.tensor = tensor
            }
        }
        
        public class Statement: Codable {
            public var variable: Variable?
            public var operation: Operation?
            public var subfunction: Subfunction?
            public var kernel: Kernel?
            
            public init() {
            }
            
            public init( variable: Variable?, operation: Operation?, subfunction: Subfunction?, kernel: Kernel? ) {
                self.variable = variable
                self.operation = operation
                self.subfunction = subfunction
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
            public var operationName: String?
            public var result: [Result]
            public var argument: [Argument]
            public var attribute: [Attribute]
            
            public init() {
                result = []
                argument = []
                attribute = []
            }
            
            public init( indent: String?, operationName: String?, result: [Result] = [], argument: [Argument] = [], attribute: [Attribute] = [] ) {
                self.indent = indent
                self.operationName = operationName
                self.result = result
                self.argument = argument
                self.attribute = attribute
            }
        }
        
        public class Result: Codable {
            public var indent: String?
            public var resultName: String?
            
            public init() {
            }
            
            public init( indent: String?, resultName: String? ) {
                self.indent = indent
                self.resultName = resultName
            }
        }
        
        public class Argument: Codable {
            public var indent: String?
            public var argumentName: String?
            
            public init() {
            }
            
            public init( indent: String?, argumentName: String? ) {
                self.indent = indent
                self.argumentName = argumentName
            }
        }
        
        public class Attribute: Codable {
            public var indent: String?
            public var attributeName: String?
            public var attributeValue: AttributeValue?
            
            public init() {
            }
            
            public init( indent: String?, attributeName: String?, attributeValue: AttributeValue? ) {
                self.indent = indent
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
            public var indent: String?
            public var dataString: String?
            
            public init() {
            }
            
            public init( indent: String?, dataString: String? ) {
                self.indent = indent
                self.dataString = dataString
            }
        }
        
        public class FloatingPointArrayValue: Codable {
            public var indent: String?
            public var dataString: String?
            
            public init() {
            }
            
            public init( indent: String?, dataString: String? ) {
                self.indent = indent
                self.dataString = dataString
            }
        }
        
        public class StringArrayValue: Codable {
            public var indent: String?
            public var dataString: String?
            
            public init() {
            }
            
            public init( indent: String?, dataString: String? ) {
                self.indent = indent
                self.dataString = dataString
            }
        }
        
        public class Integer: Codable {
            public var indent: String?
            public var dataString: String?
            
            public init() {
            }
            
            public init( indent: String?, dataString: String? ) {
                self.indent = indent
                self.dataString = dataString
            }
        }
        
        public class FloatingPoint: Codable {
            public var indent: String?
            public var dataString: String?
            
            public init() {
            }
            
            public init( indent: String?, dataString: String? ) {
                self.indent = indent
                self.dataString = dataString
            }
        }
        
        public class StringValue: Codable {
            public var indent: String?
            public var dataString: String?
            
            public init() {
            }
            
            public init( indent: String?, dataString: String? ) {
                self.indent = indent
                self.dataString = dataString
            }
        }
        
        public class FunctionReferenceValue: Codable {
            public var indent: String?
            public var functionName: String?
            
            public init() {
            }
            
            public init( indent: String?, functionName: String? ) {
                self.indent = indent
                self.functionName = functionName
            }
        }
        
        public class VariableReferenceValue: Codable {
            public var indent: String?
            public var variableName: String?
            
            public init() {
            }
            
            public init( indent: String?, variableName: String? ) {
                self.indent = indent
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
            public var indent: String?
            public var dimension: [Dimension]
            public var enumName: String?
            
            public init() {
                dimension = []
            }
            
            public init( indent: String?, dimension: [Dimension] = [], enumName: String? ) {
                self.indent = indent
                self.dimension = dimension
                self.enumName = enumName
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
            public var indent: String?
            public var integer: String?
            
            public init() {
            }
            
            public init( indent: String?, integer: String? ) {
                self.indent = indent
                self.integer = integer
            }
        }
        
        public class VariableDimension: Codable {
            public var indent: String?
            public var identifier: String?
            
            public init() {
            }
            
            public init( indent: String?, identifier: String? ) {
                self.indent = indent
                self.identifier = identifier
            }
        }
        
        public class UnknownDimension: Codable {
            public var indent: String?
            
            public init() {
            }
            
            public init( indent: String? ) {
                self.indent = indent
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
            _ = buffer.put( string: "\n" )
            _ = buffer.put( string: "import Runtime\n" )
            _ = buffer.put( string: "\n" )
            _ = buffer.put( string: "func construct" )
            if let modelName = model.modelName {
                _ = buffer.put( string: modelName )
            }
            _ = buffer.put( string: "() -> TensorBinary.Model {\n" )
            _ = buffer.put( string: "    \n" )
            _ = buffer.put( string: "    let tdbModel: TensorBinary.Model\n" )
            if let function = model.function {
                format( function: function, buffer: buffer )
            }
            _ = buffer.put( string: "    \n" )
            _ = buffer.put( string: "    return tdbModel\n" )
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( function: Function, buffer: Buffer ) {
            if let indent = function.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = function.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // func " )
            if let functionName = function.functionName {
                _ = buffer.put( string: functionName )
            }
            _ = buffer.put( string: "\n" )
            if let indent = function.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbFunction = TensorBinary.Model.Function( name: \"" )
            if let functionName = function.functionName {
                _ = buffer.put( string: functionName )
            }
            _ = buffer.put( string: "\" )\n" )
            if let indent = function.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbModel = TensorBinary.Model( name: \"" )
            if let modelName = function.modelName {
                _ = buffer.put( string: modelName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = function.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                   function: tdbFunction )\n" )
            if function.functionInput.count > 0 {
                _ = buffer.put( string: "" )
                for functionInput in function.functionInput {
                    if functionInput !== function.functionInput.first {
                        _ = buffer.put( string: "" )
                    }
                    format( functionInput: functionInput, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if function.functionOutput.count > 0 {
                _ = buffer.put( string: "" )
                for functionOutput in function.functionOutput {
                    if functionOutput !== function.functionOutput.first {
                        _ = buffer.put( string: "" )
                    }
                    format( functionOutput: functionOutput, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
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
        
        public static func format( subfunction: Subfunction, buffer: Buffer ) {
            if let indent = subfunction.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = subfunction.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // func " )
            if let functionName = subfunction.functionName {
                _ = buffer.put( string: functionName )
            }
            _ = buffer.put( string: "\n" )
            if let indent = subfunction.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbParentFunction = tdbFunction\n" )
            if let indent = subfunction.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbFunction = TensorBinary.Model.Function( name: \"" )
            if let functionName = subfunction.functionName {
                _ = buffer.put( string: functionName )
            }
            _ = buffer.put( string: "\" )\n" )
            if let indent = subfunction.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbParentFunction.functions.append( tdbFunction )\n" )
            if subfunction.functionInput.count > 0 {
                _ = buffer.put( string: "" )
                for functionInput in subfunction.functionInput {
                    if functionInput !== subfunction.functionInput.first {
                        _ = buffer.put( string: "" )
                    }
                    format( functionInput: functionInput, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if subfunction.functionOutput.count > 0 {
                _ = buffer.put( string: "" )
                for functionOutput in subfunction.functionOutput {
                    if functionOutput !== subfunction.functionOutput.first {
                        _ = buffer.put( string: "" )
                    }
                    format( functionOutput: functionOutput, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if subfunction.statement.count > 0 {
                _ = buffer.put( string: "" )
                for statement in subfunction.statement {
                    if statement !== subfunction.statement.first {
                        _ = buffer.put( string: "" )
                    }
                    format( statement: statement, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if let indent = subfunction.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( kernel: Kernel, buffer: Buffer ) {
            if let indent = kernel.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = kernel.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // func " )
            if let functionName = kernel.functionName {
                _ = buffer.put( string: functionName )
            }
            _ = buffer.put( string: "\n" )
            if let indent = kernel.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbKernel = TensorBinary.Model.Kernel( name: \"" )
            if let functionName = kernel.functionName {
                _ = buffer.put( string: functionName )
            }
            _ = buffer.put( string: "\" )\n" )
            if let indent = kernel.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbFunction.kernels.append( tdbKernel )\n" )
            if kernel.kernelInput.count > 0 {
                _ = buffer.put( string: "" )
                for kernelInput in kernel.kernelInput {
                    if kernelInput !== kernel.kernelInput.first {
                        _ = buffer.put( string: "" )
                    }
                    format( kernelInput: kernelInput, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if kernel.kernelOutput.count > 0 {
                _ = buffer.put( string: "" )
                for kernelOutput in kernel.kernelOutput {
                    if kernelOutput !== kernel.kernelOutput.first {
                        _ = buffer.put( string: "" )
                    }
                    format( kernelOutput: kernelOutput, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if let indent = kernel.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( functionInput: FunctionInput, buffer: Buffer ) {
            if let indent = functionInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = functionInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // " )
            if let inputName = functionInput.inputName {
                _ = buffer.put( string: inputName )
            }
            _ = buffer.put( string: "\n" )
            if let tensor = functionInput.tensor {
                format( tensor: tensor, buffer: buffer )
            }
            if let indent = functionInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbInput = TensorBinary.Model.Input( name: \"" )
            if let inputName = functionInput.inputName {
                _ = buffer.put( string: inputName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = functionInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                             fullName: \"" )
            if let inputName = functionInput.inputName {
                _ = buffer.put( string: inputName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = functionInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                             subtensor: tdbSubtensor )\n" )
            if let indent = functionInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbFunction.inputs.append( tdbInput )\n" )
            if let indent = functionInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( functionOutput: FunctionOutput, buffer: Buffer ) {
            if let indent = functionOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = functionOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // " )
            if let outputName = functionOutput.outputName {
                _ = buffer.put( string: outputName )
            }
            _ = buffer.put( string: "\n" )
            if let tensor = functionOutput.tensor {
                format( tensor: tensor, buffer: buffer )
            }
            if let indent = functionOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbOutput = TensorBinary.Model.Output( name: \"" )
            if let outputName = functionOutput.outputName {
                _ = buffer.put( string: outputName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = functionOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                               fullName: \"" )
            if let outputName = functionOutput.outputName {
                _ = buffer.put( string: outputName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = functionOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                               subtensor: tdbSubtensor )\n" )
            if let indent = functionOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbFunction.outputs.append( tdbOutput )\n" )
            if let indent = functionOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( kernelInput: KernelInput, buffer: Buffer ) {
            if let indent = kernelInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = kernelInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // " )
            if let inputName = kernelInput.inputName {
                _ = buffer.put( string: inputName )
            }
            _ = buffer.put( string: "\n" )
            if let tensor = kernelInput.tensor {
                format( tensor: tensor, buffer: buffer )
            }
            if let indent = kernelInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbInput = TensorBinary.Model.Input( name: \"" )
            if let inputName = kernelInput.inputName {
                _ = buffer.put( string: inputName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = kernelInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                             fullName: \"" )
            if let inputName = kernelInput.inputName {
                _ = buffer.put( string: inputName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = kernelInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                             subtensor: tdbSubtensor )\n" )
            if let indent = kernelInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbKernel.inputs.append( tdbInput )\n" )
            if let indent = kernelInput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( kernelOutput: KernelOutput, buffer: Buffer ) {
            if let indent = kernelOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = kernelOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // " )
            if let outputName = kernelOutput.outputName {
                _ = buffer.put( string: outputName )
            }
            _ = buffer.put( string: "\n" )
            if let tensor = kernelOutput.tensor {
                format( tensor: tensor, buffer: buffer )
            }
            if let indent = kernelOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbOutput = TensorBinary.Model.Output( name: \"" )
            if let outputName = kernelOutput.outputName {
                _ = buffer.put( string: outputName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = kernelOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                               fullName: \"" )
            if let outputName = kernelOutput.outputName {
                _ = buffer.put( string: outputName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = kernelOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                               subtensor: tdbSubtensor )\n" )
            if let indent = kernelOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbKernel.outputs.append( tdbOutput )\n" )
            if let indent = kernelOutput.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( statement: Statement, buffer: Buffer ) {
            if let variable = statement.variable {
                format( variable: variable, buffer: buffer )
            }
            if let operation = statement.operation {
                format( operation: operation, buffer: buffer )
            }
            if let subfunction = statement.subfunction {
                format( subfunction: subfunction, buffer: buffer )
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
            _ = buffer.put( string: "do { // " )
            if let variableName = variable.variableName {
                _ = buffer.put( string: variableName )
            }
            _ = buffer.put( string: "\n" )
            if let tensor = variable.tensor {
                format( tensor: tensor, buffer: buffer )
            }
            if let initializer = variable.initializer {
                format( initializer: initializer, buffer: buffer )
            }
            if let indent = variable.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbVariable = TensorBinary.Model.Variable( name: \"" )
            if let variableName = variable.variableName {
                _ = buffer.put( string: variableName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = variable.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                                   fullName: \"" )
            if let variableName = variable.variableName {
                _ = buffer.put( string: variableName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = variable.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                                   subtensor: tdbSubtensor,\n" )
            if let indent = variable.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                                   variableData: nil )\n" )
            if let indent = variable.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbFunction.variables.append( tdbVariable )\n" )
            if let indent = variable.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( operation: Operation, buffer: Buffer ) {
            if let indent = operation.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "\n" )
            if let indent = operation.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // " )
            if let operationName = operation.operationName {
                _ = buffer.put( string: operationName )
            }
            _ = buffer.put( string: "\n" )
            if let indent = operation.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbOperation = TensorBinary.Model.Operation( name: \"" )
            if let operationName = operation.operationName {
                _ = buffer.put( string: operationName )
            }
            _ = buffer.put( string: "\" )\n" )
            if let indent = operation.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbFunction.operations.append( tdbOperation )\n" )
            if operation.result.count > 0 {
                _ = buffer.put( string: "" )
                for result in operation.result {
                    if result !== operation.result.first {
                        _ = buffer.put( string: "" )
                    }
                    format( result: result, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if operation.argument.count > 0 {
                _ = buffer.put( string: "" )
                for argument in operation.argument {
                    if argument !== operation.argument.first {
                        _ = buffer.put( string: "" )
                    }
                    format( argument: argument, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if operation.attribute.count > 0 {
                _ = buffer.put( string: "" )
                for attribute in operation.attribute {
                    if attribute !== operation.attribute.first {
                        _ = buffer.put( string: "" )
                    }
                    format( attribute: attribute, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if let indent = operation.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( result: Result, buffer: Buffer ) {
            if let indent = result.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // " )
            if let resultName = result.resultName {
                _ = buffer.put( string: resultName )
            }
            _ = buffer.put( string: "\n" )
            if let indent = result.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbResult = TensorBinary.Model.Result( name: \"" )
            if let resultName = result.resultName {
                _ = buffer.put( string: resultName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = result.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                               fullName: \"" )
            if let resultName = result.resultName {
                _ = buffer.put( string: resultName )
            }
            _ = buffer.put( string: "\" )\n" )
            if let indent = result.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbOperation.results.append( tdbResult )\n" )
            if let indent = result.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( argument: Argument, buffer: Buffer ) {
            if let indent = argument.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // " )
            if let argumentName = argument.argumentName {
                _ = buffer.put( string: argumentName )
            }
            _ = buffer.put( string: "\n" )
            if let indent = argument.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbArgument = TensorBinary.Model.Argument( name: \"" )
            if let argumentName = argument.argumentName {
                _ = buffer.put( string: argumentName )
            }
            _ = buffer.put( string: "\",\n" )
            if let indent = argument.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                                   fullName: \"" )
            if let argumentName = argument.argumentName {
                _ = buffer.put( string: argumentName )
            }
            _ = buffer.put( string: "\" )\n" )
            if let indent = argument.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbOperation.arguments.append( tdbArgument )\n" )
            if let indent = argument.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( attribute: Attribute, buffer: Buffer ) {
            if let indent = attribute.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do { // " )
            if let attributeName = attribute.attributeName {
                _ = buffer.put( string: attributeName )
            }
            _ = buffer.put( string: "\n" )
            if let attributeValue = attribute.attributeValue {
                format( attributeValue: attributeValue, buffer: buffer )
            }
            if let indent = attribute.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbAttributeValue = TensorBinary.Model.AttributeValue( data: tdbData )\n" )
            if let indent = attribute.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbAttribute = TensorBinary.Model.Attribute( name: \"" )
            if let attributeName = attribute.attributeName {
                _ = buffer.put( string: attributeName )
            }
            _ = buffer.put( string: "\", value: tdbAttributeValue )\n" )
            if let indent = attribute.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbOperation.attributes.append( tdbAttribute )\n" )
            if let indent = attribute.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
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
            if let indent = integerArrayValue.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbData = TensorBinary.Model.AttributeValue.Data.ints( " )
            if let dataString = integerArrayValue.dataString {
                _ = buffer.put( string: dataString )
            }
            _ = buffer.put( string: " )\n" )
        }
        
        public static func format( floatingPointArrayValue: FloatingPointArrayValue, buffer: Buffer ) {
            if let indent = floatingPointArrayValue.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbData = TensorBinary.Model.AttributeValue.Data.floats( " )
            if let dataString = floatingPointArrayValue.dataString {
                _ = buffer.put( string: dataString )
            }
            _ = buffer.put( string: " )\n" )
        }
        
        public static func format( stringArrayValue: StringArrayValue, buffer: Buffer ) {
            if let indent = stringArrayValue.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbData = TensorBinary.Model.AttributeValue.Data.strings( " )
            if let dataString = stringArrayValue.dataString {
                _ = buffer.put( string: dataString )
            }
            _ = buffer.put( string: " )\n" )
        }
        
        public static func format( integer: Integer, buffer: Buffer ) {
            if let indent = integer.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbData = TensorBinary.Model.AttributeValue.Data.int( " )
            if let dataString = integer.dataString {
                _ = buffer.put( string: dataString )
            }
            _ = buffer.put( string: " )\n" )
        }
        
        public static func format( floatingPoint: FloatingPoint, buffer: Buffer ) {
            if let indent = floatingPoint.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbData = TensorBinary.Model.AttributeValue.Data.float( " )
            if let dataString = floatingPoint.dataString {
                _ = buffer.put( string: dataString )
            }
            _ = buffer.put( string: " )\n" )
        }
        
        public static func format( stringValue: StringValue, buffer: Buffer ) {
            if let indent = stringValue.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbData = TensorBinary.Model.AttributeValue.Data.string( " )
            if let dataString = stringValue.dataString {
                _ = buffer.put( string: dataString )
            }
            _ = buffer.put( string: " )\n" )
        }
        
        public static func format( functionReferenceValue: FunctionReferenceValue, buffer: Buffer ) {
            if let indent = functionReferenceValue.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbData = TensorBinary.Model.AttributeValue.Data.funct( " )
            if let functionName = functionReferenceValue.functionName {
                _ = buffer.put( string: functionName )
            }
            _ = buffer.put( string: " )\n" )
        }
        
        public static func format( variableReferenceValue: VariableReferenceValue, buffer: Buffer ) {
            if let indent = variableReferenceValue.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbData = TensorBinary.Model.AttributeValue.Data.vari( " )
            if let variableName = variableReferenceValue.variableName {
                _ = buffer.put( string: variableName )
            }
            _ = buffer.put( string: " )\n" )
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
            if let indent = tensor.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    var tdbDimensions = [TensorBinary.Model.Dimension]()\n" )
            if tensor.dimension.count > 0 {
                _ = buffer.put( string: "" )
                for dimension in tensor.dimension {
                    if dimension !== tensor.dimension.first {
                        _ = buffer.put( string: "" )
                    }
                    format( dimension: dimension, buffer: buffer )
                }
                _ = buffer.put( string: "" )
            }
            if let indent = tensor.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbElementKind = TensorBinary.Model.ElementKind." )
            if let enumName = tensor.enumName {
                _ = buffer.put( string: enumName )
            }
            _ = buffer.put( string: "\n" )
            if let indent = tensor.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbTensor = TensorBinary.Model.Tensor( dimensions: tdbDimensions,\n" )
            if let indent = tensor.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "                                               elementKind: tdbElementKind )\n" )
            if let indent = tensor.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbSubtensor = TensorBinary.Model.Subtensor( tensor: tdbTensor )\n" )
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
            if let indent = fixedDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do {\n" )
            if let indent = fixedDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbDim = TensorBinary.Model.Dimension.Dim.fixedDim( " )
            if let integer = fixedDimension.integer {
                _ = buffer.put( string: integer )
            }
            _ = buffer.put( string: " )\n" )
            if let indent = fixedDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbDimension = TensorBinary.Model.Dimension( dim: tdbDim )\n" )
            if let indent = fixedDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbDimensions.append( tdbDimension )\n" )
            if let indent = fixedDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( variableDimension: VariableDimension, buffer: Buffer ) {
            if let indent = variableDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do {\n" )
            if let indent = variableDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbDim = TensorBinary.Model.Dimension.Dim.variableDim( " )
            if let identifier = variableDimension.identifier {
                _ = buffer.put( string: identifier )
            }
            _ = buffer.put( string: " )\n" )
            if let indent = variableDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbDimension = TensorBinary.Model.Dimension( dim: tdbDim )\n" )
            if let indent = variableDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbDimensions.append( tdbDimension )\n" )
            if let indent = variableDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
        
        public static func format( unknownDimension: UnknownDimension, buffer: Buffer ) {
            if let indent = unknownDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "do {\n" )
            if let indent = unknownDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbDim = TensorBinary.Model.Dimension.Dim.unknownDim( \"?\" )\n" )
            if let indent = unknownDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    let tdbDimension = TensorBinary.Model.Dimension( dim: tdbDim )\n" )
            if let indent = unknownDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "    tdbDimensions.append( tdbDimension )\n" )
            if let indent = unknownDimension.indent {
                _ = buffer.put( string: indent )
            }
            _ = buffer.put( string: "}\n" )
        }
    }
} // extension TensorDslConstruction

extension TensorDslConstructionCompiler {
    
    public class Printer {
    }
} // extension TensorDslConstruction
