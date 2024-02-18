//
//  ModelProtocol.swift
//  Model
//
//  Copyright © 2023 Artificer AI. All rights reserved.
//

import Runtime

public class TensorBinary {
    public class BinaryNode { }
    
    public class Model: BinaryNode, Equatable {
        public enum ElementKind: UInt {
            case int8
            case uInt8
            case int16
            case uInt16
            case int32
            case uInt32
            case int64
            case uInt64
            case float32
            case float64
            case string
            case unknown
        } // ElementKind
        
        public enum CoordinatesAxis: UInt {
            case batchIndex
            case channelIndex
            case rowIndex
            case columnIndex
        } // CoordinatesAxis
        
        public class Dimension: BinaryNode, Equatable {
            public enum DimOneOf: UInt {
                case fixedDim
                case variableDim
                case unknownDim
            } // DimOneOf
            public enum Dim: Equatable {
                case fixedDim( UInt32 )
                case variableDim( String )
                case unknownDim( String )
            } // Dim
            public var dim: Dim
            
            public init( dim: Dim ) {
                self.dim = dim
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                switch dim {
                case .fixedDim( let fixedDim ):
                    guard buffer.put( uInt: DimOneOf.fixedDim.rawValue ) else { return false }
                    guard buffer.put( uInt32: fixedDim ) else { return false }
                case .variableDim( let variableDim ):
                    guard buffer.put( uInt: DimOneOf.variableDim.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( variableDim.utf8.count ) ) else { return false }
                    guard buffer.put( string: variableDim ) else { return false }
                case .unknownDim( let unknownDim ):
                    guard buffer.put( uInt: DimOneOf.unknownDim.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( unknownDim.utf8.count ) ) else { return false }
                    guard buffer.put( string: unknownDim ) else { return false }
                }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Dimension? {
                guard let dimOneOfRawValue = buffer.getUInt() else { return nil }
                guard let dimOneOf = DimOneOf( rawValue: dimOneOfRawValue ) else { return nil }
                let dim: Dim
                switch dimOneOf {
                case .fixedDim:
                    guard let fixedDim = buffer.getUInt32() else { return nil }
                    dim = Dim.fixedDim( fixedDim )
                case .variableDim:
                    guard let variableDimSize = buffer.getUInt() else { return nil }
                    guard let variableDim = buffer.getString( size: Int( variableDimSize ) ) else { return nil }
                    dim = Dim.variableDim( variableDim )
                case .unknownDim:
                    guard let unknownDimSize = buffer.getUInt() else { return nil }
                    guard let unknownDim = buffer.getString( size: Int( unknownDimSize ) ) else { return nil }
                    dim = Dim.unknownDim( unknownDim )
                }
                
                let dimension = Dimension( dim: dim )
                return dimension
            }
            
            public static func == ( lhs: TensorBinary.Model.Dimension, rhs: TensorBinary.Model.Dimension ) -> Bool {
                if lhs === rhs { return true }
                return lhs.dim == rhs.dim
            }
        } // Dimension
        
        public class Coordinates: BinaryNode, Equatable {
            public var batchIndex: Int32
            public var channelIndex: Int32
            public var rowIndex: Int32
            public var columnIndex: Int32
            
            public init( batchIndex: Int32, channelIndex: Int32, rowIndex: Int32, columnIndex: Int32 ) {
                self.batchIndex = batchIndex
                self.channelIndex = channelIndex
                self.rowIndex = rowIndex
                self.columnIndex = columnIndex
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                guard buffer.put( int32: batchIndex ) else { return false }
                guard buffer.put( int32: channelIndex ) else { return false }
                guard buffer.put( int32: rowIndex ) else { return false }
                guard buffer.put( int32: columnIndex ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Coordinates? {
                guard let batchIndex = buffer.getInt32() else { return nil }
                guard let channelIndex = buffer.getInt32() else { return nil }
                guard let rowIndex = buffer.getInt32() else { return nil }
                guard let columnIndex = buffer.getInt32() else { return nil }
                
                let coordinates = Coordinates( batchIndex: batchIndex, channelIndex: channelIndex, rowIndex: rowIndex, columnIndex: columnIndex )
                return coordinates
            }
            
            public static func == ( lhs: TensorBinary.Model.Coordinates, rhs: TensorBinary.Model.Coordinates ) -> Bool {
                if lhs === rhs { return true }
                return lhs.batchIndex == rhs.batchIndex && lhs.channelIndex == rhs.channelIndex && lhs.rowIndex == rhs.rowIndex && lhs.columnIndex == rhs.columnIndex
            }
        } // Coordinates
        
        public class Pad: BinaryNode, Equatable {
            public var topPad: UInt32
            public var leftPad: UInt32
            public var bottomPad: UInt32
            public var rightPad: UInt32
            
            public init( topPad: UInt32, leftPad: UInt32, bottomPad: UInt32, rightPad: UInt32 ) {
                self.topPad = topPad
                self.leftPad = leftPad
                self.bottomPad = bottomPad
                self.rightPad = rightPad
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                guard buffer.put( uInt32: topPad ) else { return false }
                guard buffer.put( uInt32: leftPad ) else { return false }
                guard buffer.put( uInt32: bottomPad ) else { return false }
                guard buffer.put( uInt32: rightPad ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Pad? {
                guard let topPad = buffer.getUInt32() else { return nil }
                guard let leftPad = buffer.getUInt32() else { return nil }
                guard let bottomPad = buffer.getUInt32() else { return nil }
                guard let rightPad = buffer.getUInt32() else { return nil }
                
                let pad = Pad( topPad: topPad, leftPad: leftPad, bottomPad: bottomPad, rightPad: rightPad )
                return pad
            }
            
            public static func == ( lhs: TensorBinary.Model.Pad, rhs: TensorBinary.Model.Pad ) -> Bool {
                if lhs === rhs { return true }
                return lhs.topPad == rhs.topPad && lhs.leftPad == rhs.leftPad && lhs.bottomPad == rhs.bottomPad && lhs.rightPad == rhs.rightPad
            }
        } // Pad
        
        public class Stride: BinaryNode, Equatable {
            public var downStride: UInt32
            public var rightStride: UInt32
            
            public init( downStride: UInt32, rightStride: UInt32 ) {
                self.downStride = downStride
                self.rightStride = rightStride
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                guard buffer.put( uInt32: downStride ) else { return false }
                guard buffer.put( uInt32: rightStride ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Stride? {
                guard let downStride = buffer.getUInt32() else { return nil }
                guard let rightStride = buffer.getUInt32() else { return nil }
                
                let stride = Stride( downStride: downStride, rightStride: rightStride )
                return stride
            }
            
            public static func == ( lhs: TensorBinary.Model.Stride, rhs: TensorBinary.Model.Stride ) -> Bool {
                if lhs === rhs { return true }
                return lhs.downStride == rhs.downStride && lhs.rightStride == rhs.rightStride
            }
        } // Stride
        
        public class Dilation: BinaryNode, Equatable {
            public var downDilation: UInt32
            public var rightDilation: UInt32
            
            public init( downDilation: UInt32, rightDilation: UInt32 ) {
                self.downDilation = downDilation
                self.rightDilation = rightDilation
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                guard buffer.put( uInt32: downDilation ) else { return false }
                guard buffer.put( uInt32: rightDilation ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Dilation? {
                guard let downDilation = buffer.getUInt32() else { return nil }
                guard let rightDilation = buffer.getUInt32() else { return nil }
                
                let dilation = Dilation( downDilation: downDilation, rightDilation: rightDilation )
                return dilation
            }
            
            public static func == ( lhs: TensorBinary.Model.Dilation, rhs: TensorBinary.Model.Dilation ) -> Bool {
                if lhs === rhs { return true }
                return lhs.downDilation == rhs.downDilation && lhs.rightDilation == rhs.rightDilation
            }
        } // Dilation
        
        public class Dimensions: BinaryNode, Equatable {
            public var batchCount: Dimension
            public var channelCount: Dimension
            public var rowCount: Dimension
            public var columnCount: Dimension
            
            public init( batchCount: Dimension, channelCount: Dimension, rowCount: Dimension, columnCount: Dimension ) {
                self.batchCount = batchCount
                self.channelCount = channelCount
                self.rowCount = rowCount
                self.columnCount = columnCount
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                guard batchCount.encode( buffer: buffer ) else { return false }
                guard channelCount.encode( buffer: buffer ) else { return false }
                guard rowCount.encode( buffer: buffer ) else { return false }
                guard columnCount.encode( buffer: buffer ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Dimensions? {
                guard let batchCount = Dimension.decode( buffer: buffer ) else { return nil }
                guard let channelCount = Dimension.decode( buffer: buffer ) else { return nil }
                guard let rowCount = Dimension.decode( buffer: buffer ) else { return nil }
                guard let columnCount = Dimension.decode( buffer: buffer ) else { return nil }
                
                let dimensions = Dimensions( batchCount: batchCount, channelCount: channelCount, rowCount: rowCount, columnCount: columnCount )
                return dimensions
            }
            
            public static func == ( lhs: TensorBinary.Model.Dimensions, rhs: TensorBinary.Model.Dimensions ) -> Bool {
                if lhs === rhs { return true }
                return lhs.batchCount == rhs.batchCount && lhs.channelCount == rhs.channelCount && lhs.rowCount == rhs.rowCount && lhs.columnCount == rhs.columnCount
            }
        } // Dimensions
        
        public class Tensor: BinaryNode, Equatable {
            public var dimensions: Dimensions
            public var elementKind: ElementKind
            
            public init( dimensions: Dimensions, elementKind: ElementKind ) {
                self.dimensions = dimensions
                self.elementKind = elementKind
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                guard dimensions.encode( buffer: buffer ) else { return false }
                guard buffer.put( uInt: elementKind.rawValue ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Tensor? {
                guard let dimensions = Dimensions.decode( buffer: buffer ) else { return nil }
                guard let elementKindRawValue = buffer.getUInt() else { return nil }
                guard let elementKind = ElementKind( rawValue: elementKindRawValue ) else { return nil }
                
                let tensor = Tensor( dimensions: dimensions, elementKind: elementKind )
                return tensor
            }
            
            public static func == ( lhs: TensorBinary.Model.Tensor, rhs: TensorBinary.Model.Tensor ) -> Bool {
                if lhs === rhs { return true }
                return lhs.dimensions == rhs.dimensions && lhs.elementKind == rhs.elementKind
            }
        } // Tensor
        
        public class Subtensor: BinaryNode, Equatable {
            public var tensor: Tensor
            public var dimensions: Dimensions
            public var coordinates: Coordinates
            
            public init( tensor: Tensor, dimensions: Dimensions, coordinates: Coordinates ) {
                self.tensor = tensor
                self.dimensions = dimensions
                self.coordinates = coordinates
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                guard tensor.encode( buffer: buffer ) else { return false }
                guard dimensions.encode( buffer: buffer ) else { return false }
                guard coordinates.encode( buffer: buffer ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Subtensor? {
                guard let tensor = Tensor.decode( buffer: buffer ) else { return nil }
                guard let dimensions = Dimensions.decode( buffer: buffer ) else { return nil }
                guard let coordinates = Coordinates.decode( buffer: buffer ) else { return nil }
                
                let subtensor = Subtensor( tensor: tensor, dimensions: dimensions, coordinates: coordinates )
                return subtensor
            }
            
            public static func == ( lhs: TensorBinary.Model.Subtensor, rhs: TensorBinary.Model.Subtensor ) -> Bool {
                if lhs === rhs { return true }
                return lhs.tensor == rhs.tensor && lhs.dimensions == rhs.dimensions && lhs.coordinates == rhs.coordinates
            }
        } // Subtensor
        
        public class Input: BinaryNode, Equatable {
            public var name: String
            public var fullName: String
            public var subtensor: Subtensor
            
            public init( name: String, fullName: String, subtensor: Subtensor ) {
                self.name = name
                self.fullName = fullName
                self.subtensor = subtensor
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                    guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
                guard buffer.put( string: name ) else { return false }
                    guard buffer.put( uInt: UInt( fullName.utf8.count ) ) else { return false }
                guard buffer.put( string: fullName ) else { return false }
                guard subtensor.encode( buffer: buffer ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Input? {
                guard let nameSize = buffer.getUInt() else { return nil }
                guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
                guard let fullNameSize = buffer.getUInt() else { return nil }
                guard let fullName = buffer.getString( size: Int( fullNameSize ) ) else { return nil }
                guard let subtensor = Subtensor.decode( buffer: buffer ) else { return nil }
                
                let input = Input( name: name, fullName: fullName, subtensor: subtensor )
                return input
            }
            
            public static func == ( lhs: TensorBinary.Model.Input, rhs: TensorBinary.Model.Input ) -> Bool {
                if lhs === rhs { return true }
                return lhs.name == rhs.name && lhs.fullName == rhs.fullName && lhs.subtensor == rhs.subtensor
            }
        } // Input
        
        public class Output: BinaryNode, Equatable {
            public var name: String
            public var fullName: String
            public var subtensor: Subtensor
            
            public init( name: String, fullName: String, subtensor: Subtensor ) {
                self.name = name
                self.fullName = fullName
                self.subtensor = subtensor
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                    guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
                guard buffer.put( string: name ) else { return false }
                    guard buffer.put( uInt: UInt( fullName.utf8.count ) ) else { return false }
                guard buffer.put( string: fullName ) else { return false }
                guard subtensor.encode( buffer: buffer ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Output? {
                guard let nameSize = buffer.getUInt() else { return nil }
                guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
                guard let fullNameSize = buffer.getUInt() else { return nil }
                guard let fullName = buffer.getString( size: Int( fullNameSize ) ) else { return nil }
                guard let subtensor = Subtensor.decode( buffer: buffer ) else { return nil }
                
                let output = Output( name: name, fullName: fullName, subtensor: subtensor )
                return output
            }
            
            public static func == ( lhs: TensorBinary.Model.Output, rhs: TensorBinary.Model.Output ) -> Bool {
                if lhs === rhs { return true }
                return lhs.name == rhs.name && lhs.fullName == rhs.fullName && lhs.subtensor == rhs.subtensor
            }
        } // Output
        
        public class VariableData: BinaryNode, Equatable {
            public enum DataOneOf: UInt {
                case int8s
                case uInt8s
                case int16s
                case uInt16s
                case int32s
                case uInt32s
                case int64s
                case uInt64s
                case float32s
                case float64s
                case strings
            } // DataOneOf
            public enum Data: Equatable {
                case int8s( [Int8] )
                case uInt8s( [UInt8] )
                case int16s( [Int16] )
                case uInt16s( [UInt16] )
                case int32s( [Int32] )
                case uInt32s( [UInt32] )
                case int64s( [Int64] )
                case uInt64s( [UInt64] )
                case float32s( [Float32] )
                case float64s( [Float64] )
                case strings( [String] )
            } // Data
            public var data: Data
            
            public init( data: Data ) {
                self.data = data
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                switch data {
                case .int8s( let int8s ):
                    guard buffer.put( uInt: DataOneOf.int8s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( int8s.count ) ) else { return false }
                    for index in 0 ..< int8s.count {
                        guard buffer.put( int8: int8s[ index ] ) else { return false }
                    }
                case .uInt8s( let uInt8s ):
                    guard buffer.put( uInt: DataOneOf.uInt8s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( uInt8s.count ) ) else { return false }
                    for index in 0 ..< uInt8s.count {
                        guard buffer.put( uInt8: uInt8s[ index ] ) else { return false }
                    }
                case .int16s( let int16s ):
                    guard buffer.put( uInt: DataOneOf.int16s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( int16s.count ) ) else { return false }
                    for index in 0 ..< int16s.count {
                        guard buffer.put( int16: int16s[ index ] ) else { return false }
                    }
                case .uInt16s( let uInt16s ):
                    guard buffer.put( uInt: DataOneOf.uInt16s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( uInt16s.count ) ) else { return false }
                    for index in 0 ..< uInt16s.count {
                        guard buffer.put( uInt16: uInt16s[ index ] ) else { return false }
                    }
                case .int32s( let int32s ):
                    guard buffer.put( uInt: DataOneOf.int32s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( int32s.count ) ) else { return false }
                    for index in 0 ..< int32s.count {
                        guard buffer.put( int32: int32s[ index ] ) else { return false }
                    }
                case .uInt32s( let uInt32s ):
                    guard buffer.put( uInt: DataOneOf.uInt32s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( uInt32s.count ) ) else { return false }
                    for index in 0 ..< uInt32s.count {
                        guard buffer.put( uInt32: uInt32s[ index ] ) else { return false }
                    }
                case .int64s( let int64s ):
                    guard buffer.put( uInt: DataOneOf.int64s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( int64s.count ) ) else { return false }
                    for index in 0 ..< int64s.count {
                        guard buffer.put( int64: int64s[ index ] ) else { return false }
                    }
                case .uInt64s( let uInt64s ):
                    guard buffer.put( uInt: DataOneOf.uInt64s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( uInt64s.count ) ) else { return false }
                    for index in 0 ..< uInt64s.count {
                        guard buffer.put( uInt64: uInt64s[ index ] ) else { return false }
                    }
                case .float32s( let float32s ):
                    guard buffer.put( uInt: DataOneOf.float32s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( float32s.count ) ) else { return false }
                    for index in 0 ..< float32s.count {
                        guard buffer.put( float: float32s[ index ] ) else { return false }
                    }
                case .float64s( let float64s ):
                    guard buffer.put( uInt: DataOneOf.float64s.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( float64s.count ) ) else { return false }
                    for index in 0 ..< float64s.count {
                        guard buffer.put( double: float64s[ index ] ) else { return false }
                    }
                case .strings( let strings ):
                    guard buffer.put( uInt: DataOneOf.strings.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( strings.count ) ) else { return false }
                    for index in 0 ..< strings.count {
                        guard buffer.put( uInt: UInt( strings[ index ].utf8.count ) ) else { return false }
                        guard buffer.put( string: strings[ index ] ) else { return false }
                    }
                }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> VariableData? {
                guard let dataOneOfRawValue = buffer.getUInt() else { return nil }
                guard let dataOneOf = DataOneOf( rawValue: dataOneOfRawValue ) else { return nil }
                let data: Data
                switch dataOneOf {
                case .int8s:
                    var int8s = [Int8]()
                    guard let int8sCount = buffer.getUInt() else { return nil }
                    while int8s.count < int8sCount {
                        guard let value = buffer.getInt8() else { return nil }
                        int8s.append( value )
                    }
                    data = Data.int8s( int8s )
                case .uInt8s:
                    var uInt8s = [UInt8]()
                    guard let uInt8sCount = buffer.getUInt() else { return nil }
                    while uInt8s.count < uInt8sCount {
                        guard let value = buffer.getUInt8() else { return nil }
                        uInt8s.append( value )
                    }
                    data = Data.uInt8s( uInt8s )
                case .int16s:
                    var int16s = [Int16]()
                    guard let int16sCount = buffer.getUInt() else { return nil }
                    while int16s.count < int16sCount {
                        guard let value = buffer.getInt16() else { return nil }
                        int16s.append( value )
                    }
                    data = Data.int16s( int16s )
                case .uInt16s:
                    var uInt16s = [UInt16]()
                    guard let uInt16sCount = buffer.getUInt() else { return nil }
                    while uInt16s.count < uInt16sCount {
                        guard let value = buffer.getUInt16() else { return nil }
                        uInt16s.append( value )
                    }
                    data = Data.uInt16s( uInt16s )
                case .int32s:
                    var int32s = [Int32]()
                    guard let int32sCount = buffer.getUInt() else { return nil }
                    while int32s.count < int32sCount {
                        guard let value = buffer.getInt32() else { return nil }
                        int32s.append( value )
                    }
                    data = Data.int32s( int32s )
                case .uInt32s:
                    var uInt32s = [UInt32]()
                    guard let uInt32sCount = buffer.getUInt() else { return nil }
                    while uInt32s.count < uInt32sCount {
                        guard let value = buffer.getUInt32() else { return nil }
                        uInt32s.append( value )
                    }
                    data = Data.uInt32s( uInt32s )
                case .int64s:
                    var int64s = [Int64]()
                    guard let int64sCount = buffer.getUInt() else { return nil }
                    while int64s.count < int64sCount {
                        guard let value = buffer.getInt64() else { return nil }
                        int64s.append( value )
                    }
                    data = Data.int64s( int64s )
                case .uInt64s:
                    var uInt64s = [UInt64]()
                    guard let uInt64sCount = buffer.getUInt() else { return nil }
                    while uInt64s.count < uInt64sCount {
                        guard let value = buffer.getUInt64() else { return nil }
                        uInt64s.append( value )
                    }
                    data = Data.uInt64s( uInt64s )
                case .float32s:
                    var float32s = [Float]()
                    guard let float32sCount = buffer.getUInt() else { return nil }
                    while float32s.count < float32sCount {
                        guard let value = buffer.getFloat() else { return nil }
                        float32s.append( value )
                    }
                    data = Data.float32s( float32s )
                case .float64s:
                    var float64s = [Double]()
                    guard let float64sCount = buffer.getUInt() else { return nil }
                    while float64s.count < float64sCount {
                        guard let value = buffer.getDouble() else { return nil }
                        float64s.append( value )
                    }
                    data = Data.float64s( float64s )
                case .strings:
                    var strings = [String]()
                    guard let stringsCount = buffer.getUInt() else { return nil }
                    while strings.count < stringsCount {
                        guard let valueSize = buffer.getUInt() else { return nil }
                        guard let value = buffer.getString( size: Int( valueSize ) ) else { return nil }
                        strings.append( value )
                    }
                    data = Data.strings( strings )
                }
                
                let variableData = VariableData( data: data )
                return variableData
            }
            
            public static func == ( lhs: TensorBinary.Model.VariableData, rhs: TensorBinary.Model.VariableData ) -> Bool {
                if lhs === rhs { return true }
                return lhs.data == rhs.data
            }
        } // VariableData
        
        public class Variable: BinaryNode, Equatable {
            public var name: String
            public var fullName: String
            public var subtensor: Subtensor
            public var variableData: VariableData?
            
            public init( name: String, fullName: String, subtensor: Subtensor, variableData: VariableData? ) {
                self.name = name
                self.fullName = fullName
                self.subtensor = subtensor
                self.variableData = variableData
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                    guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
                guard buffer.put( string: name ) else { return false }
                    guard buffer.put( uInt: UInt( fullName.utf8.count ) ) else { return false }
                guard buffer.put( string: fullName ) else { return false }
                guard subtensor.encode( buffer: buffer ) else { return false }
                if variableData != nil {
                    guard buffer.put( uInt: 1 ) else { return false }
                    guard variableData!.encode( buffer: buffer ) else { return false }
                } else {
                    guard buffer.put( uInt: 0 ) else { return false }
                }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Variable? {
                guard let nameSize = buffer.getUInt() else { return nil }
                guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
                guard let fullNameSize = buffer.getUInt() else { return nil }
                guard let fullName = buffer.getString( size: Int( fullNameSize ) ) else { return nil }
                guard let subtensor = Subtensor.decode( buffer: buffer ) else { return nil }
                guard let variableDataCount = buffer.getUInt() else { return nil }
                guard variableDataCount < 2 else { return nil }
                var variableData: VariableData? = nil
                if variableDataCount == 1 {
                    guard let value = VariableData.decode( buffer: buffer ) else { return nil }
                    variableData = value
                }
                
                let variable = Variable( name: name, fullName: fullName, subtensor: subtensor, variableData: variableData )
                return variable
            }
            
            public static func == ( lhs: TensorBinary.Model.Variable, rhs: TensorBinary.Model.Variable ) -> Bool {
                if lhs === rhs { return true }
                return lhs.name == rhs.name && lhs.fullName == rhs.fullName && lhs.subtensor == rhs.subtensor && lhs.variableData == rhs.variableData
            }
        } // Variable
        
        public class Argument: BinaryNode, Equatable {
            public var name: String
            public var fullName: String
            
            public init( name: String, fullName: String ) {
                self.name = name
                self.fullName = fullName
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                    guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
                guard buffer.put( string: name ) else { return false }
                    guard buffer.put( uInt: UInt( fullName.utf8.count ) ) else { return false }
                guard buffer.put( string: fullName ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Argument? {
                guard let nameSize = buffer.getUInt() else { return nil }
                guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
                guard let fullNameSize = buffer.getUInt() else { return nil }
                guard let fullName = buffer.getString( size: Int( fullNameSize ) ) else { return nil }
                
                let argument = Argument( name: name, fullName: fullName )
                return argument
            }
            
            public static func == ( lhs: TensorBinary.Model.Argument, rhs: TensorBinary.Model.Argument ) -> Bool {
                if lhs === rhs { return true }
                return lhs.name == rhs.name && lhs.fullName == rhs.fullName
            }
        } // Argument
        
        public class AttributeValue: BinaryNode, Equatable {
            public enum DataOneOf: UInt {
                case ints
                case floats
                case strings
                case int
                case float
                case string
                case funct
                case vari
            } // DataOneOf
            public enum Data: Equatable {
                case ints( [Int] )
                case floats( [Float32] )
                case strings( [String] )
                case int( Int )
                case float( Float )
                case string( String )
                case funct( String )
                case vari( String )
            } // Data
            public var data: Data
            
            public init( data: Data ) {
                self.data = data
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                switch data {
                case .ints( let ints ):
                    guard buffer.put( uInt: DataOneOf.ints.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( ints.count ) ) else { return false }
                    for index in 0 ..< ints.count {
                        guard buffer.put( int: ints[ index ] ) else { return false }
                    }
                case .floats( let floats ):
                    guard buffer.put( uInt: DataOneOf.floats.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( floats.count ) ) else { return false }
                    for index in 0 ..< floats.count {
                        guard buffer.put( float: floats[ index ] ) else { return false }
                    }
                case .strings( let strings ):
                    guard buffer.put( uInt: DataOneOf.strings.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( strings.count ) ) else { return false }
                    for index in 0 ..< strings.count {
                        guard buffer.put( uInt: UInt( strings[ index ].utf8.count ) ) else { return false }
                        guard buffer.put( string: strings[ index ] ) else { return false }
                    }
                case .int( let int ):
                    guard buffer.put( uInt: DataOneOf.int.rawValue ) else { return false }
                    guard buffer.put( int: int ) else { return false }
                case .float( let float ):
                    guard buffer.put( uInt: DataOneOf.float.rawValue ) else { return false }
                    guard buffer.put( float: float ) else { return false }
                case .string( let string ):
                    guard buffer.put( uInt: DataOneOf.string.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( string.utf8.count ) ) else { return false }
                    guard buffer.put( string: string ) else { return false }
                case .funct( let funct ):
                    guard buffer.put( uInt: DataOneOf.funct.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( funct.utf8.count ) ) else { return false }
                    guard buffer.put( string: funct ) else { return false }
                case .vari( let vari ):
                    guard buffer.put( uInt: DataOneOf.vari.rawValue ) else { return false }
                    guard buffer.put( uInt: UInt( vari.utf8.count ) ) else { return false }
                    guard buffer.put( string: vari ) else { return false }
                }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> AttributeValue? {
                guard let dataOneOfRawValue = buffer.getUInt() else { return nil }
                guard let dataOneOf = DataOneOf( rawValue: dataOneOfRawValue ) else { return nil }
                let data: Data
                switch dataOneOf {
                case .ints:
                    var ints = [Int]()
                    guard let intsCount = buffer.getUInt() else { return nil }
                    while ints.count < intsCount {
                        guard let value = buffer.getInt() else { return nil }
                        ints.append( value )
                    }
                    data = Data.ints( ints )
                case .floats:
                    var floats = [Float]()
                    guard let floatsCount = buffer.getUInt() else { return nil }
                    while floats.count < floatsCount {
                        guard let value = buffer.getFloat() else { return nil }
                        floats.append( value )
                    }
                    data = Data.floats( floats )
                case .strings:
                    var strings = [String]()
                    guard let stringsCount = buffer.getUInt() else { return nil }
                    while strings.count < stringsCount {
                        guard let valueSize = buffer.getUInt() else { return nil }
                        guard let value = buffer.getString( size: Int( valueSize ) ) else { return nil }
                        strings.append( value )
                    }
                    data = Data.strings( strings )
                case .int:
                    guard let int = buffer.getInt() else { return nil }
                    data = Data.int( int )
                case .float:
                    guard let float = buffer.getFloat() else { return nil }
                    data = Data.float( float )
                case .string:
                    guard let stringSize = buffer.getUInt() else { return nil }
                    guard let string = buffer.getString( size: Int( stringSize ) ) else { return nil }
                    data = Data.string( string )
                case .funct:
                    guard let functSize = buffer.getUInt() else { return nil }
                    guard let funct = buffer.getString( size: Int( functSize ) ) else { return nil }
                    data = Data.funct( funct )
                case .vari:
                    guard let variSize = buffer.getUInt() else { return nil }
                    guard let vari = buffer.getString( size: Int( variSize ) ) else { return nil }
                    data = Data.vari( vari )
                }
                
                let attributeValue = AttributeValue( data: data )
                return attributeValue
            }
            
            public static func == ( lhs: TensorBinary.Model.AttributeValue, rhs: TensorBinary.Model.AttributeValue ) -> Bool {
                if lhs === rhs { return true }
                return lhs.data == rhs.data
            }
        } // AttributeValue
        
        public class Attribute: BinaryNode, Equatable {
            public var name: String
            public var value: AttributeValue
            
            public init( name: String, value: AttributeValue ) {
                self.name = name
                self.value = value
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                    guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
                guard buffer.put( string: name ) else { return false }
                guard value.encode( buffer: buffer ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Attribute? {
                guard let nameSize = buffer.getUInt() else { return nil }
                guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
                guard let value = AttributeValue.decode( buffer: buffer ) else { return nil }
                
                let attribute = Attribute( name: name, value: value )
                return attribute
            }
            
            public static func == ( lhs: TensorBinary.Model.Attribute, rhs: TensorBinary.Model.Attribute ) -> Bool {
                if lhs === rhs { return true }
                return lhs.name == rhs.name && lhs.value == rhs.value
            }
        } // Attribute
        
        public class Result: BinaryNode, Equatable {
            public var name: String
            public var fullName: String
            
            public init( name: String, fullName: String ) {
                self.name = name
                self.fullName = fullName
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                    guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
                guard buffer.put( string: name ) else { return false }
                    guard buffer.put( uInt: UInt( fullName.utf8.count ) ) else { return false }
                guard buffer.put( string: fullName ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Result? {
                guard let nameSize = buffer.getUInt() else { return nil }
                guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
                guard let fullNameSize = buffer.getUInt() else { return nil }
                guard let fullName = buffer.getString( size: Int( fullNameSize ) ) else { return nil }
                
                let result = Result( name: name, fullName: fullName )
                return result
            }
            
            public static func == ( lhs: TensorBinary.Model.Result, rhs: TensorBinary.Model.Result ) -> Bool {
                if lhs === rhs { return true }
                return lhs.name == rhs.name && lhs.fullName == rhs.fullName
            }
        } // Result
        
        public class Operation: BinaryNode, Equatable {
            public var name: String
            public var fullName: String
            public var arguments: [Argument]
            public var attributes: [Attribute]
            public var results: [Result]
            
            public init( name: String, fullName: String, arguments: [Argument], attributes: [Attribute], results: [Result] ) {
                self.name = name
                self.fullName = fullName
                self.arguments = arguments
                self.attributes = attributes
                self.results = results
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                    guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
                guard buffer.put( string: name ) else { return false }
                    guard buffer.put( uInt: UInt( fullName.utf8.count ) ) else { return false }
                guard buffer.put( string: fullName ) else { return false }
                guard buffer.put( uInt: UInt( arguments.count ) ) else { return false }
                for index in 0 ..< arguments.count {
                    guard arguments[ index ].encode( buffer: buffer ) else { return false }
                }
                guard buffer.put( uInt: UInt( attributes.count ) ) else { return false }
                for index in 0 ..< attributes.count {
                    guard attributes[ index ].encode( buffer: buffer ) else { return false }
                }
                guard buffer.put( uInt: UInt( results.count ) ) else { return false }
                for index in 0 ..< results.count {
                    guard results[ index ].encode( buffer: buffer ) else { return false }
                }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Operation? {
                guard let nameSize = buffer.getUInt() else { return nil }
                guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
                guard let fullNameSize = buffer.getUInt() else { return nil }
                guard let fullName = buffer.getString( size: Int( fullNameSize ) ) else { return nil }
                guard let argumentsCount = buffer.getUInt() else { return nil }
                var arguments = [Argument]()
                for _ in 0 ..< argumentsCount {
                    guard let value = Argument.decode( buffer: buffer ) else { return nil }
                    arguments.append( value )
                }
                guard let attributesCount = buffer.getUInt() else { return nil }
                var attributes = [Attribute]()
                for _ in 0 ..< attributesCount {
                    guard let value = Attribute.decode( buffer: buffer ) else { return nil }
                    attributes.append( value )
                }
                guard let resultsCount = buffer.getUInt() else { return nil }
                var results = [Result]()
                for _ in 0 ..< resultsCount {
                    guard let value = Result.decode( buffer: buffer ) else { return nil }
                    results.append( value )
                }
                
                let operation = Operation( name: name, fullName: fullName, arguments: arguments, attributes: attributes, results: results )
                return operation
            }
            
            public static func == ( lhs: TensorBinary.Model.Operation, rhs: TensorBinary.Model.Operation ) -> Bool {
                if lhs === rhs { return true }
                return lhs.name == rhs.name && lhs.fullName == rhs.fullName && lhs.arguments == rhs.arguments && lhs.attributes == rhs.attributes && lhs.results == rhs.results
            }
        } // Operation
        
        public class Kernel: BinaryNode, Equatable {
            public var name: String
            public var fullName: String
            public var signature: String?
            public var inputs: [Input]
            public var outputs: [Output]
            public var code: String
            
            public init( name: String, fullName: String, signature: String?, inputs: [Input], outputs: [Output], code: String ) {
                self.name = name
                self.fullName = fullName
                self.signature = signature
                self.inputs = inputs
                self.outputs = outputs
                self.code = code
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                    guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
                guard buffer.put( string: name ) else { return false }
                    guard buffer.put( uInt: UInt( fullName.utf8.count ) ) else { return false }
                guard buffer.put( string: fullName ) else { return false }
                if signature != nil {
                    guard buffer.put( uInt: 1 ) else { return false }
                    guard buffer.put( uInt: UInt( signature!.utf8.count ) ) else { return false }
                    guard buffer.put( string: signature! ) else { return false }
                } else {
                    guard buffer.put( uInt: 0 ) else { return false }
                }
                guard buffer.put( uInt: UInt( inputs.count ) ) else { return false }
                for index in 0 ..< inputs.count {
                    guard inputs[ index ].encode( buffer: buffer ) else { return false }
                }
                guard buffer.put( uInt: UInt( outputs.count ) ) else { return false }
                for index in 0 ..< outputs.count {
                    guard outputs[ index ].encode( buffer: buffer ) else { return false }
                }
                    guard buffer.put( uInt: UInt( code.utf8.count ) ) else { return false }
                guard buffer.put( string: code ) else { return false }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Kernel? {
                guard let nameSize = buffer.getUInt() else { return nil }
                guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
                guard let fullNameSize = buffer.getUInt() else { return nil }
                guard let fullName = buffer.getString( size: Int( fullNameSize ) ) else { return nil }
                guard let signatureCount = buffer.getUInt() else { return nil }
                guard signatureCount < 2 else { return nil }
                var signature: String? = nil
                if signatureCount == 1 {
                    guard let signatureSize = buffer.getUInt() else { return nil }
                    guard let value = buffer.getString( size: Int( signatureSize ) ) else { return nil }
                    signature = value
                }
                guard let inputsCount = buffer.getUInt() else { return nil }
                var inputs = [Input]()
                for _ in 0 ..< inputsCount {
                    guard let value = Input.decode( buffer: buffer ) else { return nil }
                    inputs.append( value )
                }
                guard let outputsCount = buffer.getUInt() else { return nil }
                var outputs = [Output]()
                for _ in 0 ..< outputsCount {
                    guard let value = Output.decode( buffer: buffer ) else { return nil }
                    outputs.append( value )
                }
                guard let codeSize = buffer.getUInt() else { return nil }
                guard let code = buffer.getString( size: Int( codeSize ) ) else { return nil }
                
                let kernel = Kernel( name: name, fullName: fullName, signature: signature, inputs: inputs, outputs: outputs, code: code )
                return kernel
            }
            
            public static func == ( lhs: TensorBinary.Model.Kernel, rhs: TensorBinary.Model.Kernel ) -> Bool {
                if lhs === rhs { return true }
                return lhs.name == rhs.name && lhs.fullName == rhs.fullName && lhs.signature == rhs.signature && lhs.inputs == rhs.inputs && lhs.outputs == rhs.outputs && lhs.code == rhs.code
            }
        } // Kernel
        
        public class Function: BinaryNode, Equatable {
            public var name: String
            public var fullName: String
            public var signature: String?
            public var inputs: [Input]
            public var outputs: [Output]
            public var functions: [Function]
            public var operations: [Operation]
            public var variables: [Variable]
            public var kernels: [Kernel]
            
            public init( name: String, fullName: String, signature: String?, inputs: [Input], outputs: [Output], functions: [Function], operations: [Operation], variables: [Variable], kernels: [Kernel] ) {
                self.name = name
                self.fullName = fullName
                self.signature = signature
                self.inputs = inputs
                self.outputs = outputs
                self.functions = functions
                self.operations = operations
                self.variables = variables
                self.kernels = kernels
            }
            
            public func encode( buffer: Buffer ) -> Bool {
                    guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
                guard buffer.put( string: name ) else { return false }
                    guard buffer.put( uInt: UInt( fullName.utf8.count ) ) else { return false }
                guard buffer.put( string: fullName ) else { return false }
                if signature != nil {
                    guard buffer.put( uInt: 1 ) else { return false }
                    guard buffer.put( uInt: UInt( signature!.utf8.count ) ) else { return false }
                    guard buffer.put( string: signature! ) else { return false }
                } else {
                    guard buffer.put( uInt: 0 ) else { return false }
                }
                guard buffer.put( uInt: UInt( inputs.count ) ) else { return false }
                for index in 0 ..< inputs.count {
                    guard inputs[ index ].encode( buffer: buffer ) else { return false }
                }
                guard buffer.put( uInt: UInt( outputs.count ) ) else { return false }
                for index in 0 ..< outputs.count {
                    guard outputs[ index ].encode( buffer: buffer ) else { return false }
                }
                guard buffer.put( uInt: UInt( functions.count ) ) else { return false }
                for index in 0 ..< functions.count {
                    guard functions[ index ].encode( buffer: buffer ) else { return false }
                }
                guard buffer.put( uInt: UInt( operations.count ) ) else { return false }
                for index in 0 ..< operations.count {
                    guard operations[ index ].encode( buffer: buffer ) else { return false }
                }
                guard buffer.put( uInt: UInt( variables.count ) ) else { return false }
                for index in 0 ..< variables.count {
                    guard variables[ index ].encode( buffer: buffer ) else { return false }
                }
                guard buffer.put( uInt: UInt( kernels.count ) ) else { return false }
                for index in 0 ..< kernels.count {
                    guard kernels[ index ].encode( buffer: buffer ) else { return false }
                }
                
                return true
            }
            
            public static func decode( buffer: Buffer ) -> Function? {
                guard let nameSize = buffer.getUInt() else { return nil }
                guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
                guard let fullNameSize = buffer.getUInt() else { return nil }
                guard let fullName = buffer.getString( size: Int( fullNameSize ) ) else { return nil }
                guard let signatureCount = buffer.getUInt() else { return nil }
                guard signatureCount < 2 else { return nil }
                var signature: String? = nil
                if signatureCount == 1 {
                    guard let signatureSize = buffer.getUInt() else { return nil }
                    guard let value = buffer.getString( size: Int( signatureSize ) ) else { return nil }
                    signature = value
                }
                guard let inputsCount = buffer.getUInt() else { return nil }
                var inputs = [Input]()
                for _ in 0 ..< inputsCount {
                    guard let value = Input.decode( buffer: buffer ) else { return nil }
                    inputs.append( value )
                }
                guard let outputsCount = buffer.getUInt() else { return nil }
                var outputs = [Output]()
                for _ in 0 ..< outputsCount {
                    guard let value = Output.decode( buffer: buffer ) else { return nil }
                    outputs.append( value )
                }
                guard let functionsCount = buffer.getUInt() else { return nil }
                var functions = [Function]()
                for _ in 0 ..< functionsCount {
                    guard let value = Function.decode( buffer: buffer ) else { return nil }
                    functions.append( value )
                }
                guard let operationsCount = buffer.getUInt() else { return nil }
                var operations = [Operation]()
                for _ in 0 ..< operationsCount {
                    guard let value = Operation.decode( buffer: buffer ) else { return nil }
                    operations.append( value )
                }
                guard let variablesCount = buffer.getUInt() else { return nil }
                var variables = [Variable]()
                for _ in 0 ..< variablesCount {
                    guard let value = Variable.decode( buffer: buffer ) else { return nil }
                    variables.append( value )
                }
                guard let kernelsCount = buffer.getUInt() else { return nil }
                var kernels = [Kernel]()
                for _ in 0 ..< kernelsCount {
                    guard let value = Kernel.decode( buffer: buffer ) else { return nil }
                    kernels.append( value )
                }
                
                let function = Function( name: name, fullName: fullName, signature: signature, inputs: inputs, outputs: outputs, functions: functions, operations: operations, variables: variables, kernels: kernels )
                return function
            }
            
            public static func == ( lhs: TensorBinary.Model.Function, rhs: TensorBinary.Model.Function ) -> Bool {
                if lhs === rhs { return true }
                return lhs.name == rhs.name && lhs.fullName == rhs.fullName && lhs.signature == rhs.signature && lhs.inputs == rhs.inputs && lhs.outputs == rhs.outputs && lhs.functions == rhs.functions && lhs.operations == rhs.operations && lhs.variables == rhs.variables && lhs.kernels == rhs.kernels
            }
        } // Function
        
        public var name: String
        public var function: Function
        
        public init( name: String, function: Function ) {
            self.name = name
            self.function = function
        }
        
        public func encode( buffer: Buffer ) -> Bool {
                guard buffer.put( uInt: UInt( name.utf8.count ) ) else { return false }
            guard buffer.put( string: name ) else { return false }
            guard function.encode( buffer: buffer ) else { return false }
            
            return true
        }
        
        public static func decode( buffer: Buffer ) -> Model? {
            guard let nameSize = buffer.getUInt() else { return nil }
            guard let name = buffer.getString( size: Int( nameSize ) ) else { return nil }
            guard let function = Function.decode( buffer: buffer ) else { return nil }
            
            let model = Model( name: name, function: function )
            return model
        }
        
        public static func == ( lhs: TensorBinary.Model, rhs: TensorBinary.Model ) -> Bool {
            if lhs === rhs { return true }
            return lhs.name == rhs.name && lhs.function == rhs.function
        }
    } // Model
    
} // class TensorBinary
