//
// TensorDslDatabase.swift
//
//

#if os(Linux)
import Glibc
#else
import Darwin.C
#endif
import Runtime
import Sqlite

public class TensorDslDatabase {
    /* This table information about tables defined for the schema-tool. */
    public class SchemaTable : Encodable, Decodable, CustomDebugStringConvertible {
        
        public let id: Int64 // the unique identifier
        public let name: String // the name of the table in lower camelcase
        public let description: String // the description of the table
        
        public var debugDescription: String {
            let description = try! JsonEncoder.jsonString( self, pretty: true )
            return description
        }
        
        public init( id: Int64,
                     name: String,
                     description: String ) {
            self.id = id
            self.name = name
            self.description = description
        }
        
        public func visualize() {
        }
    }
    
    /* This table information about basic types defined for the schema-tool. */
    public class SchemaBasicType : Encodable, Decodable, CustomDebugStringConvertible {
        public enum BasicGroup : String, Codable {
            public typealias RawValue = String
            
            case array  // "an array"
            case builtin  // "an intrinsic type"
            case enumeration  // "a local enumeration"
            case foreign  // "a foreign reference"
            
            public init?( _ uInt16Value: UInt16? ) {
                switch uInt16Value {
                case 0:
                    self = .array
                case 1:
                    self = .builtin
                case 2:
                    self = .enumeration
                case 3:
                    self = .foreign
                default:
                    return nil
                }
            }
            
            public var uInt16Value: UInt16? {
                switch self {
                case .array:
                    return 0
                case .builtin:
                    return 1
                case .enumeration:
                    return 2
                case .foreign:
                    return 3
                }
            }
        }
        
        public let id: Int64 // the unique identifier
        public let swiftType: String // the Swift type of the basic type
        public let sqlType: String // the SQL type of the basic type
        public let basicGroup: BasicGroup // builtin, foreign reference, or enumeration
        
        public var debugDescription: String {
            let description = try! JsonEncoder.jsonString( self, pretty: true )
            return description
        }
        
        public init( id: Int64,
                     swiftType: String,
                     sqlType: String,
                     basicGroup: BasicGroup ) {
            self.id = id
            self.swiftType = swiftType
            self.sqlType = sqlType
            self.basicGroup = basicGroup
        }
        
        public func visualize() {
        }
    }
    
    /* This table information about attributes defined for the schema-tool. */
    public class SchemaAttribute : Encodable, Decodable, CustomDebugStringConvertible {
        public enum AttributeType : String, Codable {
            public typealias RawValue = String
            
            case required  // "attribute is required"
            case optional  // "attribute is optional"
            case array  // "attribute is an array"
            
            public init?( _ uInt16Value: UInt16? ) {
                switch uInt16Value {
                case 0:
                    self = .required
                case 1:
                    self = .optional
                case 2:
                    self = .array
                default:
                    return nil
                }
            }
            
            public var uInt16Value: UInt16? {
                switch self {
                case .required:
                    return 0
                case .optional:
                    return 1
                case .array:
                    return 2
                }
            }
        }
        
        public let id: Int64 // the unique identifier
        public let name: String // the name of the attribute in lower camelcase
        public let schemaTableId: Int64 // the attribute's table
        public let schemaBasicTypeId: Int64 // the basic type of the attribute
        public let attributeType: AttributeType // the attribute's type
        public let description: String // the description of the attribute
        public let isForeign: Bool // the attribute is a foreign reference
        public let foreignTableName: String? // the foreign table name referenced by this attribute
        public let isEnumeration: Bool // the attribute is an enumeration
        
        public var debugDescription: String {
            let description = try! JsonEncoder.jsonString( self, pretty: true )
            return description
        }
        
        public init?( id: Int64,
                     name: String,
                     schemaTableId: Int64,
                     schemaBasicTypeId: Int64,
                     attributeType: AttributeType,
                     description: String,
                     isForeign: Bool,
                     foreignTableName: String? = nil,
                     isEnumeration: Bool ) {
            self.id = id
            self.name = name
            self.schemaTableId = schemaTableId
            self.schemaBasicTypeId = schemaBasicTypeId
            self.attributeType = attributeType
            self.description = description
            self.isForeign = isForeign
            self.foreignTableName = foreignTableName
            self.isEnumeration = isEnumeration
        }
        
        public func visualize() {
            print( "schemaAttributeId_\(id) -> schemaTableId_\(String(describing: schemaTableId));" )
            print( "schemaAttributeId_\(id) -> schemaBasicTypeId_\(String(describing: schemaBasicTypeId));" )
        }
    }
    
    /* This table information about components defined for the schema-tool. */
    public class SchemaComponent : Encodable, Decodable, CustomDebugStringConvertible {
        public enum ComponentType : String, Codable {
            public typealias RawValue = String
            
            case enumerator  // "an enumerator type"
            case get  // "a get/delete one command"
            case select  // "a select/delete some command"
            case distinct  // "a distinct command"
            
            public init?( _ uInt16Value: UInt16? ) {
                switch uInt16Value {
                case 0:
                    self = .enumerator
                case 1:
                    self = .get
                case 2:
                    self = .select
                case 3:
                    self = .distinct
                default:
                    return nil
                }
            }
            
            public var uInt16Value: UInt16? {
                switch self {
                case .enumerator:
                    return 0
                case .get:
                    return 1
                case .select:
                    return 2
                case .distinct:
                    return 3
                }
            }
        }
        
        public let id: Int64 // the unique identifier
        public let componentType: ComponentType // the component's type
        public let schemaTableId: Int64 // the component's table
        
        public var debugDescription: String {
            let description = try! JsonEncoder.jsonString( self, pretty: true )
            return description
        }
        
        public init?( id: Int64,
                     componentType: ComponentType,
                     schemaTableId: Int64 ) {
            self.id = id
            self.componentType = componentType
            self.schemaTableId = schemaTableId
        }
        
        public func visualize() {
            print( "schemaComponentId_\(id) -> schemaTableId_\(String(describing: schemaTableId));" )
        }
    }
    
    /* This table information about mappings of attributes to components. */
    public class SchemaComponentMap : Encodable, Decodable, CustomDebugStringConvertible {
        
        public let id: Int64 // the unique identifier
        public let schemaComponentId: Int64 // the component
        public let schemaAttributeId: Int64 // the attribute
        
        public var debugDescription: String {
            let description = try! JsonEncoder.jsonString( self, pretty: true )
            return description
        }
        
        public init?( id: Int64,
                     schemaComponentId: Int64,
                     schemaAttributeId: Int64 ) {
            self.id = id
            self.schemaComponentId = schemaComponentId
            self.schemaAttributeId = schemaAttributeId
        }
        
        public func visualize() {
            print( "schemaComponentMapId_\(id) -> schemaComponentId_\(String(describing: schemaComponentId));" )
            print( "schemaComponentMapId_\(id) -> schemaAttributeId_\(String(describing: schemaAttributeId));" )
        }
    }
    
    /* This table information about distinct command defined for the schema-tool. */
    public class SchemaDistinct : Encodable, Decodable, CustomDebugStringConvertible {
        
        public let id: Int64 // the unique identifier
        public let name: String // the name of the distinct command in lower camelcase
        public let schemaComponentId: Int64 // the component
        
        public var debugDescription: String {
            let description = try! JsonEncoder.jsonString( self, pretty: true )
            return description
        }
        
        public init?( id: Int64,
                     name: String,
                     schemaComponentId: Int64 ) {
            self.id = id
            self.name = name
            self.schemaComponentId = schemaComponentId
        }
        
        public func visualize() {
            print( "schemaDistinctId_\(id) -> schemaComponentId_\(String(describing: schemaComponentId));" )
        }
    }
    
    /* This table information about enumerations defined for the schema-tool. */
    public class SchemaEnum : Encodable, Decodable, CustomDebugStringConvertible {
        
        public let id: Int64 // the unique identifier
        public let name: String // the name of the enum in lower camelcase
        public let schemaComponentId: Int64 // the component
        public let schemaTableId: Int64 // the enum's table
        
        public var debugDescription: String {
            let description = try! JsonEncoder.jsonString( self, pretty: true )
            return description
        }
        
        public init?( id: Int64,
                     name: String,
                     schemaComponentId: Int64,
                     schemaTableId: Int64 ) {
            self.id = id
            self.name = name
            self.schemaComponentId = schemaComponentId
            self.schemaTableId = schemaTableId
        }
        
        public func visualize() {
            print( "schemaEnumId_\(id) -> schemaComponentId_\(String(describing: schemaComponentId));" )
            print( "schemaEnumId_\(id) -> schemaTableId_\(String(describing: schemaTableId));" )
        }
    }
    
    /* This table information about enumeration values defined for the schema-tool. */
    public class SchemaEnumValue : Encodable, Decodable, CustomDebugStringConvertible {
        
        public let id: Int64 // the unique identifier
        public let value: String // the name of the enum's value
        public let description: String // the description of the enum's value
        public let schemaEnumId: Int64 // the value's enum
        
        public var debugDescription: String {
            let description = try! JsonEncoder.jsonString( self, pretty: true )
            return description
        }
        
        public init?( id: Int64,
                     value: String,
                     description: String,
                     schemaEnumId: Int64 ) {
            self.id = id
            self.value = value
            self.description = description
            self.schemaEnumId = schemaEnumId
        }
        
        public func visualize() {
            print( "schemaEnumValueId_\(id) -> schemaEnumId_\(String(describing: schemaEnumId));" )
        }
    }
    
    public class SchemaTableTable: SqliteTable {
        weak var tensorDslDatabase: TensorDslDatabase?
        
        public init?( tensorDslDatabase: TensorDslDatabase ) {
            self.tensorDslDatabase = tensorDslDatabase
            super.init( name: "schema_table", connection: tensorDslDatabase.connection )
        }
        
        public override func create() -> Bool {
            let sql = """
                CREATE TABLE IF NOT EXISTS schema_table (
                    id INTEGER,
                    name TEXT NOT NULL,
                    description TEXT NOT NULL,
                    
                    PRIMARY KEY ( id )
                );
                """
            
            // statement 0
            if let statement = prepare( sql: sql ) {
                if let _ = execute( statement: statement ) {
                    return true
                }
            }
            
            return false
        }
        
        public override func prepare() -> Bool {
            do {
                let sql = "DROP TABLE IF EXISTS schema_table ;"
                
                // statement 1
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    INSERT INTO schema_table (
                        name,
                        description
                    ) VALUES (
                        ?1,
                        ?2
                    );
                    """
                
                // statement 2
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT 
                        id,
                        name,
                        description
                    FROM schema_table ;
                    """
                
                // statement 3
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_table
                    WHERE
                        id = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 4
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    DELETE
                    FROM schema_table
                    WHERE
                        id = ?1
                    ;
                    """
                
                // statement 5
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_table
                    WHERE
                        name = ?1
                    ;
                    """
                
                // statement 6
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            return true
        }
        
        public func drop() -> Bool {
            let statement = statements[ 1 ]
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func insert( name: String,
                            description: String ) -> SchemaTable? {
            let statement = statements[ 2 ]
            
            guard statement.bind( 1, name ) else { return nil }
            guard statement.bind( 2, description ) else { return nil }
            
            if let _ = execute( statement: statement ) {
                return get( id: lastInsertId() )
            }
            
            return nil
        }
        
        public func select() -> [SchemaTable]? {
            let statement = statements[ 3 ]
            
            return execute( statement: statement )
        }
        
        public func get( id: Int64 ) -> SchemaTable? {
            let statement = statements[ 4 ]
            
            if !statement.bind( 1, id ) {
                return nil
            }
            
            if let schemaTable = execute( statement: statement ) {
                if schemaTable.count == 1 {
                    return schemaTable.first!
                }
            }
            
            return nil
        }
        
        public func delete( id: Int64 ) -> Bool {
            let statement = statements[ 5 ]
            
            guard statement.bind( 1, id ) else { return false }
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func select( name: String ) -> [SchemaTable]? {
            let statement = statements[ 6 ]
            
            guard statement.bind( 1, name ) else { return nil }
            
            return execute( statement: statement )
        }
        
        public func id( idStatement: SqliteStatement ) -> UInt64?  {
            if let id: UInt64 = idStatement.get( index: 0 ) {
                return id
            } else {
                return nil
            }
        }
        
        public func execute( idStatement: SqliteStatement ) -> [UInt64]? {
            var rows = [UInt64]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = idStatement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let id = id( idStatement: idStatement ) {
                        rows.append( id )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !idStatement.reset() {
                return nil
            }
            
            return rows
        }
        
        public func getSchemaTable( statement: SqliteStatement ) -> SchemaTable?  {
            guard let id: Int64 = statement.get( index: 0 ) else { return nil }
            guard let name: String = statement.get( index: 1 ) else { return nil }
            guard let description: String = statement.get( index: 2 ) else { return nil }
            
            let schemaTable = SchemaTable( id: id,
                                 name: name,
                                 description: description )
            return schemaTable
        }
        
        public func execute( statement: SqliteStatement ) -> [SchemaTable]? {
            var rows = [SchemaTable]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = statement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let schemaTable = getSchemaTable( statement: statement ) {
                        rows.append( schemaTable )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !statement.reset() {
                return nil
            }
            
            if stepResult == .error {
                return nil
            } else {
                return rows
            }
        }
    }
    
    public class SchemaBasicTypeTable: SqliteTable {
        weak var tensorDslDatabase: TensorDslDatabase?
        
        public init?( tensorDslDatabase: TensorDslDatabase ) {
            self.tensorDslDatabase = tensorDslDatabase
            super.init( name: "schema_basic_type", connection: tensorDslDatabase.connection )
        }
        
        public override func create() -> Bool {
            let sql = """
                CREATE TABLE IF NOT EXISTS schema_basic_type (
                    id INTEGER,
                    swift_type TEXT NOT NULL,
                    sql_type TEXT NOT NULL,
                    basic_group INTEGER NOT NULL,
                    
                    PRIMARY KEY ( id )
                );
                """
            
            // statement 0
            if let statement = prepare( sql: sql ) {
                if let _ = execute( statement: statement ) {
                    return true
                }
            }
            
            return false
        }
        
        public override func prepare() -> Bool {
            do {
                let sql = "DROP TABLE IF EXISTS schema_basic_type ;"
                
                // statement 1
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    INSERT INTO schema_basic_type (
                        swift_type,
                        sql_type,
                        basic_group
                    ) VALUES (
                        ?1,
                        ?2,
                        ?3
                    );
                    """
                
                // statement 2
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT 
                        id,
                        swift_type,
                        sql_type,
                        basic_group
                    FROM schema_basic_type ;
                    """
                
                // statement 3
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_basic_type
                    WHERE
                        id = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 4
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    DELETE
                    FROM schema_basic_type
                    WHERE
                        id = ?1
                    ;
                    """
                
                // statement 5
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_basic_type
                    WHERE
                        swift_type = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 6
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            return true
        }
        
        public func drop() -> Bool {
            let statement = statements[ 1 ]
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func insert( swiftType: String,
                            sqlType: String,
                            basicGroup: SchemaBasicType.BasicGroup ) -> SchemaBasicType? {
            let statement = statements[ 2 ]
            
            guard statement.bind( 1, swiftType ) else { return nil }
            guard statement.bind( 2, sqlType ) else { return nil }
            guard statement.bind( 3, basicGroup.uInt16Value ) else { return nil }
            
            if let _ = execute( statement: statement ) {
                return get( id: lastInsertId() )
            }
            
            return nil
        }
        
        public func select() -> [SchemaBasicType]? {
            let statement = statements[ 3 ]
            
            return execute( statement: statement )
        }
        
        public func get( id: Int64 ) -> SchemaBasicType? {
            let statement = statements[ 4 ]
            
            if !statement.bind( 1, id ) {
                return nil
            }
            
            if let schemaBasicType = execute( statement: statement ) {
                if schemaBasicType.count == 1 {
                    return schemaBasicType.first!
                }
            }
            
            return nil
        }
        
        public func delete( id: Int64 ) -> Bool {
            let statement = statements[ 5 ]
            
            guard statement.bind( 1, id ) else { return false }
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func get( swiftType: String ) -> SchemaBasicType? {
            let statement = statements[ 6 ]
            
            guard statement.bind( 1, swiftType ) else { return nil }
            
            if let schemaBasicType = execute( statement: statement ) {
                if schemaBasicType.count == 1 {
                    return schemaBasicType.first!
                }
            }
            
            return nil
        }
        
        public func id( idStatement: SqliteStatement ) -> UInt64?  {
            if let id: UInt64 = idStatement.get( index: 0 ) {
                return id
            } else {
                return nil
            }
        }
        
        public func execute( idStatement: SqliteStatement ) -> [UInt64]? {
            var rows = [UInt64]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = idStatement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let id = id( idStatement: idStatement ) {
                        rows.append( id )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !idStatement.reset() {
                return nil
            }
            
            return rows
        }
        
        public func getSchemaBasicType( statement: SqliteStatement ) -> SchemaBasicType?  {
            guard let id: Int64 = statement.get( index: 0 ) else { return nil }
            guard let swiftType: String = statement.get( index: 1 ) else { return nil }
            guard let sqlType: String = statement.get( index: 2 ) else { return nil }
            guard let basicGroupUInt16: UInt16 = statement.get( index: 3 ) else { return nil }
            guard let basicGroup = SchemaBasicType.BasicGroup( basicGroupUInt16 ) else { return nil }
            
            let schemaBasicType = SchemaBasicType( id: id,
                                 swiftType: swiftType,
                                 sqlType: sqlType,
                                 basicGroup: basicGroup )
            return schemaBasicType
        }
        
        public func execute( statement: SqliteStatement ) -> [SchemaBasicType]? {
            var rows = [SchemaBasicType]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = statement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let schemaBasicType = getSchemaBasicType( statement: statement ) {
                        rows.append( schemaBasicType )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !statement.reset() {
                return nil
            }
            
            if stepResult == .error {
                return nil
            } else {
                return rows
            }
        }
    }
    
    public class SchemaAttributeTable: SqliteTable {
        weak var tensorDslDatabase: TensorDslDatabase?
        
        public init?( tensorDslDatabase: TensorDslDatabase ) {
            self.tensorDslDatabase = tensorDslDatabase
            super.init( name: "schema_attribute", connection: tensorDslDatabase.connection )
        }
        
        public override func create() -> Bool {
            let sql = """
                CREATE TABLE IF NOT EXISTS schema_attribute (
                    id INTEGER,
                    name TEXT NOT NULL,
                    schema_table INTEGER NOT NULL,
                    schema_basic_type INTEGER NOT NULL,
                    attribute_type INTEGER NOT NULL,
                    description TEXT NOT NULL,
                    is_foreign INTEGER NOT NULL,
                    foreign_table_name TEXT,
                    is_enumeration INTEGER NOT NULL,
                    
                    PRIMARY KEY ( id )
                );
                """
            
            // statement 0
            if let statement = prepare( sql: sql ) {
                if let _ = execute( statement: statement ) {
                    return true
                }
            }
            
            return false
        }
        
        public override func prepare() -> Bool {
            do {
                let sql = "DROP TABLE IF EXISTS schema_attribute ;"
                
                // statement 1
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    INSERT INTO schema_attribute (
                        name,
                        schema_table,
                        schema_basic_type,
                        attribute_type,
                        description,
                        is_foreign,
                        foreign_table_name,
                        is_enumeration
                    ) VALUES (
                        ?1,
                        ?2,
                        ?3,
                        ?4,
                        ?5,
                        ?6,
                        ?7,
                        ?8
                    );
                    """
                
                // statement 2
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT 
                        id,
                        name,
                        schema_table,
                        schema_basic_type,
                        attribute_type,
                        description,
                        is_foreign,
                        foreign_table_name,
                        is_enumeration
                    FROM schema_attribute ;
                    """
                
                // statement 3
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_attribute
                    WHERE
                        id = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 4
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    DELETE
                    FROM schema_attribute
                    WHERE
                        id = ?1
                    ;
                    """
                
                // statement 5
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_attribute
                    WHERE
                        schema_table = ?1
                    ;
                    """
                
                // statement 6
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_attribute
                    WHERE
                        name = ?1
                        AND
                        schema_table = ?2
                    LIMIT 1
                    ;
                    """
                
                // statement 7
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            return true
        }
        
        public func drop() -> Bool {
            let statement = statements[ 1 ]
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func insert( name: String,
                            schemaTable: SchemaTable,
                            schemaBasicType: SchemaBasicType,
                            attributeType: SchemaAttribute.AttributeType,
                            description: String,
                            isForeign: Bool,
                            foreignTableName: String?,
                            isEnumeration: Bool ) -> SchemaAttribute? {
            return insert( name: name,
                            schemaTableId: schemaTable.id,
                            schemaBasicTypeId: schemaBasicType.id,
                            attributeType: attributeType,
                            description: description,
                            isForeign: isForeign,
                            foreignTableName: foreignTableName,
                            isEnumeration: isEnumeration )
        }
        
        public func insert( name: String,
                            schemaTableId: Int64,
                            schemaBasicTypeId: Int64,
                            attributeType: SchemaAttribute.AttributeType,
                            description: String,
                            isForeign: Bool,
                            foreignTableName: String?,
                            isEnumeration: Bool ) -> SchemaAttribute? {
            let statement = statements[ 2 ]
            
            guard statement.bind( 1, name ) else { return nil }
            guard statement.bind( 2, schemaTableId ) else { return nil }
            guard statement.bind( 3, schemaBasicTypeId ) else { return nil }
            guard statement.bind( 4, attributeType.uInt16Value ) else { return nil }
            guard statement.bind( 5, description ) else { return nil }
            guard statement.bind( 6, isForeign ) else { return nil }
            guard statement.bind( 7, foreignTableName ) else { return nil }
            guard statement.bind( 8, isEnumeration ) else { return nil }
            
            if let _ = execute( statement: statement ) {
                return get( id: lastInsertId() )
            }
            
            return nil
        }
        
        public func select() -> [SchemaAttribute]? {
            let statement = statements[ 3 ]
            
            return execute( statement: statement )
        }
        
        public func get( id: Int64 ) -> SchemaAttribute? {
            let statement = statements[ 4 ]
            
            if !statement.bind( 1, id ) {
                return nil
            }
            
            if let schemaAttribute = execute( statement: statement ) {
                if schemaAttribute.count == 1 {
                    return schemaAttribute.first!
                }
            }
            
            return nil
        }
        
        public func delete( id: Int64 ) -> Bool {
            let statement = statements[ 5 ]
            
            guard statement.bind( 1, id ) else { return false }
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func select( schemaTable: SchemaTable ) -> [SchemaAttribute]? {
            return select( schemaTableId: schemaTable.id )
        }
        
        public func select( schemaTableId: Int64 ) -> [SchemaAttribute]? {
            let statement = statements[ 6 ]
            
            guard statement.bind( 1, schemaTableId ) else { return nil }
            
            return execute( statement: statement )
        }
        
        public func get( name: String, schemaTable: SchemaTable ) -> SchemaAttribute? {
            return get( name: name, schemaTableId: schemaTable.id )
        }
        
        public func get( name: String, schemaTableId: Int64 ) -> SchemaAttribute? {
            let statement = statements[ 7 ]
            
            guard statement.bind( 1, name ) else { return nil }
            guard statement.bind( 2, schemaTableId ) else { return nil }
            
            if let schemaAttribute = execute( statement: statement ) {
                if schemaAttribute.count == 1 {
                    return schemaAttribute.first!
                }
            }
            
            return nil
        }
        
        public func id( idStatement: SqliteStatement ) -> UInt64?  {
            if let id: UInt64 = idStatement.get( index: 0 ) {
                return id
            } else {
                return nil
            }
        }
        
        public func execute( idStatement: SqliteStatement ) -> [UInt64]? {
            var rows = [UInt64]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = idStatement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let id = id( idStatement: idStatement ) {
                        rows.append( id )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !idStatement.reset() {
                return nil
            }
            
            return rows
        }
        
        public func getSchemaAttribute( statement: SqliteStatement ) -> SchemaAttribute?  {
            guard let id: Int64 = statement.get( index: 0 ) else { return nil }
            guard let name: String = statement.get( index: 1 ) else { return nil }
            guard let schemaTableId: Int64 = statement.get( index: 2 ) else { return nil }
            guard let schemaBasicTypeId: Int64 = statement.get( index: 3 ) else { return nil }
            guard let attributeTypeUInt16: UInt16 = statement.get( index: 4 ) else { return nil }
            guard let attributeType = SchemaAttribute.AttributeType( attributeTypeUInt16 ) else { return nil }
            guard let description: String = statement.get( index: 5 ) else { return nil }
            guard let isForeign: Bool = statement.get( index: 6 ) else { return nil }
            let foreignTableName: String? = statement.get( index: 7 )
            guard let isEnumeration: Bool = statement.get( index: 8 ) else { return nil }
            
            let schemaAttribute = SchemaAttribute( id: id,
                                 name: name,
                                 schemaTableId: schemaTableId,
                                 schemaBasicTypeId: schemaBasicTypeId,
                                 attributeType: attributeType,
                                 description: description,
                                 isForeign: isForeign,
                                 foreignTableName: foreignTableName,
                                 isEnumeration: isEnumeration )
            return schemaAttribute
        }
        
        public func execute( statement: SqliteStatement ) -> [SchemaAttribute]? {
            var rows = [SchemaAttribute]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = statement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let schemaAttribute = getSchemaAttribute( statement: statement ) {
                        rows.append( schemaAttribute )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !statement.reset() {
                return nil
            }
            
            if stepResult == .error {
                return nil
            } else {
                return rows
            }
        }
    }
    
    public class SchemaComponentTable: SqliteTable {
        weak var tensorDslDatabase: TensorDslDatabase?
        
        public init?( tensorDslDatabase: TensorDslDatabase ) {
            self.tensorDslDatabase = tensorDslDatabase
            super.init( name: "schema_component", connection: tensorDslDatabase.connection )
        }
        
        public override func create() -> Bool {
            let sql = """
                CREATE TABLE IF NOT EXISTS schema_component (
                    id INTEGER,
                    component_type INTEGER NOT NULL,
                    schema_table INTEGER NOT NULL,
                    
                    PRIMARY KEY ( id )
                );
                """
            
            // statement 0
            if let statement = prepare( sql: sql ) {
                if let _ = execute( statement: statement ) {
                    return true
                }
            }
            
            return false
        }
        
        public override func prepare() -> Bool {
            do {
                let sql = "DROP TABLE IF EXISTS schema_component ;"
                
                // statement 1
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    INSERT INTO schema_component (
                        component_type,
                        schema_table
                    ) VALUES (
                        ?1,
                        ?2
                    );
                    """
                
                // statement 2
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT 
                        id,
                        component_type,
                        schema_table
                    FROM schema_component ;
                    """
                
                // statement 3
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_component
                    WHERE
                        id = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 4
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    DELETE
                    FROM schema_component
                    WHERE
                        id = ?1
                    ;
                    """
                
                // statement 5
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_component
                    WHERE
                        schema_table = ?1
                    ;
                    """
                
                // statement 6
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            return true
        }
        
        public func drop() -> Bool {
            let statement = statements[ 1 ]
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func insert( componentType: SchemaComponent.ComponentType,
                            schemaTable: SchemaTable ) -> SchemaComponent? {
            return insert( componentType: componentType,
                            schemaTableId: schemaTable.id )
        }
        
        public func insert( componentType: SchemaComponent.ComponentType,
                            schemaTableId: Int64 ) -> SchemaComponent? {
            let statement = statements[ 2 ]
            
            guard statement.bind( 1, componentType.uInt16Value ) else { return nil }
            guard statement.bind( 2, schemaTableId ) else { return nil }
            
            if let _ = execute( statement: statement ) {
                return get( id: lastInsertId() )
            }
            
            return nil
        }
        
        public func select() -> [SchemaComponent]? {
            let statement = statements[ 3 ]
            
            return execute( statement: statement )
        }
        
        public func get( id: Int64 ) -> SchemaComponent? {
            let statement = statements[ 4 ]
            
            if !statement.bind( 1, id ) {
                return nil
            }
            
            if let schemaComponent = execute( statement: statement ) {
                if schemaComponent.count == 1 {
                    return schemaComponent.first!
                }
            }
            
            return nil
        }
        
        public func delete( id: Int64 ) -> Bool {
            let statement = statements[ 5 ]
            
            guard statement.bind( 1, id ) else { return false }
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func select( schemaTable: SchemaTable ) -> [SchemaComponent]? {
            return select( schemaTableId: schemaTable.id )
        }
        
        public func select( schemaTableId: Int64 ) -> [SchemaComponent]? {
            let statement = statements[ 6 ]
            
            guard statement.bind( 1, schemaTableId ) else { return nil }
            
            return execute( statement: statement )
        }
        
        public func id( idStatement: SqliteStatement ) -> UInt64?  {
            if let id: UInt64 = idStatement.get( index: 0 ) {
                return id
            } else {
                return nil
            }
        }
        
        public func execute( idStatement: SqliteStatement ) -> [UInt64]? {
            var rows = [UInt64]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = idStatement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let id = id( idStatement: idStatement ) {
                        rows.append( id )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !idStatement.reset() {
                return nil
            }
            
            return rows
        }
        
        public func getSchemaComponent( statement: SqliteStatement ) -> SchemaComponent?  {
            guard let id: Int64 = statement.get( index: 0 ) else { return nil }
            guard let componentTypeUInt16: UInt16 = statement.get( index: 1 ) else { return nil }
            guard let componentType = SchemaComponent.ComponentType( componentTypeUInt16 ) else { return nil }
            guard let schemaTableId: Int64 = statement.get( index: 2 ) else { return nil }
            
            let schemaComponent = SchemaComponent( id: id,
                                 componentType: componentType,
                                 schemaTableId: schemaTableId )
            return schemaComponent
        }
        
        public func execute( statement: SqliteStatement ) -> [SchemaComponent]? {
            var rows = [SchemaComponent]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = statement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let schemaComponent = getSchemaComponent( statement: statement ) {
                        rows.append( schemaComponent )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !statement.reset() {
                return nil
            }
            
            if stepResult == .error {
                return nil
            } else {
                return rows
            }
        }
    }
    
    public class SchemaComponentMapTable: SqliteTable {
        weak var tensorDslDatabase: TensorDslDatabase?
        
        public init?( tensorDslDatabase: TensorDslDatabase ) {
            self.tensorDslDatabase = tensorDslDatabase
            super.init( name: "schema_component_map", connection: tensorDslDatabase.connection )
        }
        
        public override func create() -> Bool {
            let sql = """
                CREATE TABLE IF NOT EXISTS schema_component_map (
                    id INTEGER,
                    schema_component INTEGER NOT NULL,
                    schema_attribute INTEGER NOT NULL,
                    
                    PRIMARY KEY ( id )
                );
                """
            
            // statement 0
            if let statement = prepare( sql: sql ) {
                if let _ = execute( statement: statement ) {
                    return true
                }
            }
            
            return false
        }
        
        public override func prepare() -> Bool {
            do {
                let sql = "DROP TABLE IF EXISTS schema_component_map ;"
                
                // statement 1
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    INSERT INTO schema_component_map (
                        schema_component,
                        schema_attribute
                    ) VALUES (
                        ?1,
                        ?2
                    );
                    """
                
                // statement 2
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT 
                        id,
                        schema_component,
                        schema_attribute
                    FROM schema_component_map ;
                    """
                
                // statement 3
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_component_map
                    WHERE
                        id = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 4
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    DELETE
                    FROM schema_component_map
                    WHERE
                        id = ?1
                    ;
                    """
                
                // statement 5
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_component_map
                    WHERE
                        schema_component = ?1
                    ;
                    """
                
                // statement 6
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            return true
        }
        
        public func drop() -> Bool {
            let statement = statements[ 1 ]
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func insert( schemaComponent: SchemaComponent,
                            schemaAttribute: SchemaAttribute ) -> SchemaComponentMap? {
            return insert( schemaComponentId: schemaComponent.id,
                            schemaAttributeId: schemaAttribute.id )
        }
        
        public func insert( schemaComponentId: Int64,
                            schemaAttributeId: Int64 ) -> SchemaComponentMap? {
            let statement = statements[ 2 ]
            
            guard statement.bind( 1, schemaComponentId ) else { return nil }
            guard statement.bind( 2, schemaAttributeId ) else { return nil }
            
            if let _ = execute( statement: statement ) {
                return get( id: lastInsertId() )
            }
            
            return nil
        }
        
        public func select() -> [SchemaComponentMap]? {
            let statement = statements[ 3 ]
            
            return execute( statement: statement )
        }
        
        public func get( id: Int64 ) -> SchemaComponentMap? {
            let statement = statements[ 4 ]
            
            if !statement.bind( 1, id ) {
                return nil
            }
            
            if let schemaComponentMap = execute( statement: statement ) {
                if schemaComponentMap.count == 1 {
                    return schemaComponentMap.first!
                }
            }
            
            return nil
        }
        
        public func delete( id: Int64 ) -> Bool {
            let statement = statements[ 5 ]
            
            guard statement.bind( 1, id ) else { return false }
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func select( schemaComponent: SchemaComponent ) -> [SchemaComponentMap]? {
            return select( schemaComponentId: schemaComponent.id )
        }
        
        public func select( schemaComponentId: Int64 ) -> [SchemaComponentMap]? {
            let statement = statements[ 6 ]
            
            guard statement.bind( 1, schemaComponentId ) else { return nil }
            
            return execute( statement: statement )
        }
        
        public func id( idStatement: SqliteStatement ) -> UInt64?  {
            if let id: UInt64 = idStatement.get( index: 0 ) {
                return id
            } else {
                return nil
            }
        }
        
        public func execute( idStatement: SqliteStatement ) -> [UInt64]? {
            var rows = [UInt64]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = idStatement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let id = id( idStatement: idStatement ) {
                        rows.append( id )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !idStatement.reset() {
                return nil
            }
            
            return rows
        }
        
        public func getSchemaComponentMap( statement: SqliteStatement ) -> SchemaComponentMap?  {
            guard let id: Int64 = statement.get( index: 0 ) else { return nil }
            guard let schemaComponentId: Int64 = statement.get( index: 1 ) else { return nil }
            guard let schemaAttributeId: Int64 = statement.get( index: 2 ) else { return nil }
            
            let schemaComponentMap = SchemaComponentMap( id: id,
                                 schemaComponentId: schemaComponentId,
                                 schemaAttributeId: schemaAttributeId )
            return schemaComponentMap
        }
        
        public func execute( statement: SqliteStatement ) -> [SchemaComponentMap]? {
            var rows = [SchemaComponentMap]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = statement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let schemaComponentMap = getSchemaComponentMap( statement: statement ) {
                        rows.append( schemaComponentMap )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !statement.reset() {
                return nil
            }
            
            if stepResult == .error {
                return nil
            } else {
                return rows
            }
        }
    }
    
    public class SchemaDistinctTable: SqliteTable {
        weak var tensorDslDatabase: TensorDslDatabase?
        
        public init?( tensorDslDatabase: TensorDslDatabase ) {
            self.tensorDslDatabase = tensorDslDatabase
            super.init( name: "schema_distinct", connection: tensorDslDatabase.connection )
        }
        
        public override func create() -> Bool {
            let sql = """
                CREATE TABLE IF NOT EXISTS schema_distinct (
                    id INTEGER,
                    name TEXT NOT NULL,
                    schema_component INTEGER NOT NULL,
                    
                    PRIMARY KEY ( id )
                );
                """
            
            // statement 0
            if let statement = prepare( sql: sql ) {
                if let _ = execute( statement: statement ) {
                    return true
                }
            }
            
            return false
        }
        
        public override func prepare() -> Bool {
            do {
                let sql = "DROP TABLE IF EXISTS schema_distinct ;"
                
                // statement 1
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    INSERT INTO schema_distinct (
                        name,
                        schema_component
                    ) VALUES (
                        ?1,
                        ?2
                    );
                    """
                
                // statement 2
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT 
                        id,
                        name,
                        schema_component
                    FROM schema_distinct ;
                    """
                
                // statement 3
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_distinct
                    WHERE
                        id = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 4
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    DELETE
                    FROM schema_distinct
                    WHERE
                        id = ?1
                    ;
                    """
                
                // statement 5
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_distinct
                    WHERE
                        schema_component = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 6
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            return true
        }
        
        public func drop() -> Bool {
            let statement = statements[ 1 ]
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func insert( name: String,
                            schemaComponent: SchemaComponent ) -> SchemaDistinct? {
            return insert( name: name,
                            schemaComponentId: schemaComponent.id )
        }
        
        public func insert( name: String,
                            schemaComponentId: Int64 ) -> SchemaDistinct? {
            let statement = statements[ 2 ]
            
            guard statement.bind( 1, name ) else { return nil }
            guard statement.bind( 2, schemaComponentId ) else { return nil }
            
            if let _ = execute( statement: statement ) {
                return get( id: lastInsertId() )
            }
            
            return nil
        }
        
        public func select() -> [SchemaDistinct]? {
            let statement = statements[ 3 ]
            
            return execute( statement: statement )
        }
        
        public func get( id: Int64 ) -> SchemaDistinct? {
            let statement = statements[ 4 ]
            
            if !statement.bind( 1, id ) {
                return nil
            }
            
            if let schemaDistinct = execute( statement: statement ) {
                if schemaDistinct.count == 1 {
                    return schemaDistinct.first!
                }
            }
            
            return nil
        }
        
        public func delete( id: Int64 ) -> Bool {
            let statement = statements[ 5 ]
            
            guard statement.bind( 1, id ) else { return false }
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func get( schemaComponent: SchemaComponent ) -> SchemaDistinct? {
            return get( schemaComponentId: schemaComponent.id )
        }
        
        public func get( schemaComponentId: Int64 ) -> SchemaDistinct? {
            let statement = statements[ 6 ]
            
            guard statement.bind( 1, schemaComponentId ) else { return nil }
            
            if let schemaDistinct = execute( statement: statement ) {
                if schemaDistinct.count == 1 {
                    return schemaDistinct.first!
                }
            }
            
            return nil
        }
        
        public func id( idStatement: SqliteStatement ) -> UInt64?  {
            if let id: UInt64 = idStatement.get( index: 0 ) {
                return id
            } else {
                return nil
            }
        }
        
        public func execute( idStatement: SqliteStatement ) -> [UInt64]? {
            var rows = [UInt64]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = idStatement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let id = id( idStatement: idStatement ) {
                        rows.append( id )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !idStatement.reset() {
                return nil
            }
            
            return rows
        }
        
        public func getSchemaDistinct( statement: SqliteStatement ) -> SchemaDistinct?  {
            guard let id: Int64 = statement.get( index: 0 ) else { return nil }
            guard let name: String = statement.get( index: 1 ) else { return nil }
            guard let schemaComponentId: Int64 = statement.get( index: 2 ) else { return nil }
            
            let schemaDistinct = SchemaDistinct( id: id,
                                 name: name,
                                 schemaComponentId: schemaComponentId )
            return schemaDistinct
        }
        
        public func execute( statement: SqliteStatement ) -> [SchemaDistinct]? {
            var rows = [SchemaDistinct]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = statement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let schemaDistinct = getSchemaDistinct( statement: statement ) {
                        rows.append( schemaDistinct )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !statement.reset() {
                return nil
            }
            
            if stepResult == .error {
                return nil
            } else {
                return rows
            }
        }
    }
    
    public class SchemaEnumTable: SqliteTable {
        weak var tensorDslDatabase: TensorDslDatabase?
        
        public init?( tensorDslDatabase: TensorDslDatabase ) {
            self.tensorDslDatabase = tensorDslDatabase
            super.init( name: "schema_enum", connection: tensorDslDatabase.connection )
        }
        
        public override func create() -> Bool {
            let sql = """
                CREATE TABLE IF NOT EXISTS schema_enum (
                    id INTEGER,
                    name TEXT NOT NULL,
                    schema_component INTEGER NOT NULL,
                    schema_table INTEGER NOT NULL,
                    
                    PRIMARY KEY ( id )
                );
                """
            
            // statement 0
            if let statement = prepare( sql: sql ) {
                if let _ = execute( statement: statement ) {
                    return true
                }
            }
            
            return false
        }
        
        public override func prepare() -> Bool {
            do {
                let sql = "DROP TABLE IF EXISTS schema_enum ;"
                
                // statement 1
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    INSERT INTO schema_enum (
                        name,
                        schema_component,
                        schema_table
                    ) VALUES (
                        ?1,
                        ?2,
                        ?3
                    );
                    """
                
                // statement 2
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT 
                        id,
                        name,
                        schema_component,
                        schema_table
                    FROM schema_enum ;
                    """
                
                // statement 3
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_enum
                    WHERE
                        id = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 4
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    DELETE
                    FROM schema_enum
                    WHERE
                        id = ?1
                    ;
                    """
                
                // statement 5
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_enum
                    WHERE
                        schema_component = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 6
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_enum
                    WHERE
                        name = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 7
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_enum
                    WHERE
                        schema_table = ?1
                    ;
                    """
                
                // statement 8
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            return true
        }
        
        public func drop() -> Bool {
            let statement = statements[ 1 ]
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func insert( name: String,
                            schemaComponent: SchemaComponent,
                            schemaTable: SchemaTable ) -> SchemaEnum? {
            return insert( name: name,
                            schemaComponentId: schemaComponent.id,
                            schemaTableId: schemaTable.id )
        }
        
        public func insert( name: String,
                            schemaComponentId: Int64,
                            schemaTableId: Int64 ) -> SchemaEnum? {
            let statement = statements[ 2 ]
            
            guard statement.bind( 1, name ) else { return nil }
            guard statement.bind( 2, schemaComponentId ) else { return nil }
            guard statement.bind( 3, schemaTableId ) else { return nil }
            
            if let _ = execute( statement: statement ) {
                return get( id: lastInsertId() )
            }
            
            return nil
        }
        
        public func select() -> [SchemaEnum]? {
            let statement = statements[ 3 ]
            
            return execute( statement: statement )
        }
        
        public func get( id: Int64 ) -> SchemaEnum? {
            let statement = statements[ 4 ]
            
            if !statement.bind( 1, id ) {
                return nil
            }
            
            if let schemaEnum = execute( statement: statement ) {
                if schemaEnum.count == 1 {
                    return schemaEnum.first!
                }
            }
            
            return nil
        }
        
        public func delete( id: Int64 ) -> Bool {
            let statement = statements[ 5 ]
            
            guard statement.bind( 1, id ) else { return false }
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func get( schemaComponent: SchemaComponent ) -> SchemaEnum? {
            return get( schemaComponentId: schemaComponent.id )
        }
        
        public func get( schemaComponentId: Int64 ) -> SchemaEnum? {
            let statement = statements[ 6 ]
            
            guard statement.bind( 1, schemaComponentId ) else { return nil }
            
            if let schemaEnum = execute( statement: statement ) {
                if schemaEnum.count == 1 {
                    return schemaEnum.first!
                }
            }
            
            return nil
        }
        
        public func get( name: String ) -> SchemaEnum? {
            let statement = statements[ 7 ]
            
            guard statement.bind( 1, name ) else { return nil }
            
            if let schemaEnum = execute( statement: statement ) {
                if schemaEnum.count == 1 {
                    return schemaEnum.first!
                }
            }
            
            return nil
        }
        
        public func select( schemaTable: SchemaTable ) -> [SchemaEnum]? {
            return select( schemaTableId: schemaTable.id )
        }
        
        public func select( schemaTableId: Int64 ) -> [SchemaEnum]? {
            let statement = statements[ 8 ]
            
            guard statement.bind( 1, schemaTableId ) else { return nil }
            
            return execute( statement: statement )
        }
        
        public func id( idStatement: SqliteStatement ) -> UInt64?  {
            if let id: UInt64 = idStatement.get( index: 0 ) {
                return id
            } else {
                return nil
            }
        }
        
        public func execute( idStatement: SqliteStatement ) -> [UInt64]? {
            var rows = [UInt64]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = idStatement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let id = id( idStatement: idStatement ) {
                        rows.append( id )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !idStatement.reset() {
                return nil
            }
            
            return rows
        }
        
        public func getSchemaEnum( statement: SqliteStatement ) -> SchemaEnum?  {
            guard let id: Int64 = statement.get( index: 0 ) else { return nil }
            guard let name: String = statement.get( index: 1 ) else { return nil }
            guard let schemaComponentId: Int64 = statement.get( index: 2 ) else { return nil }
            guard let schemaTableId: Int64 = statement.get( index: 3 ) else { return nil }
            
            let schemaEnum = SchemaEnum( id: id,
                                 name: name,
                                 schemaComponentId: schemaComponentId,
                                 schemaTableId: schemaTableId )
            return schemaEnum
        }
        
        public func execute( statement: SqliteStatement ) -> [SchemaEnum]? {
            var rows = [SchemaEnum]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = statement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let schemaEnum = getSchemaEnum( statement: statement ) {
                        rows.append( schemaEnum )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !statement.reset() {
                return nil
            }
            
            if stepResult == .error {
                return nil
            } else {
                return rows
            }
        }
    }
    
    public class SchemaEnumValueTable: SqliteTable {
        weak var tensorDslDatabase: TensorDslDatabase?
        
        public init?( tensorDslDatabase: TensorDslDatabase ) {
            self.tensorDslDatabase = tensorDslDatabase
            super.init( name: "schema_enum_value", connection: tensorDslDatabase.connection )
        }
        
        public override func create() -> Bool {
            let sql = """
                CREATE TABLE IF NOT EXISTS schema_enum_value (
                    id INTEGER,
                    value TEXT NOT NULL,
                    description TEXT NOT NULL,
                    schema_enum INTEGER NOT NULL,
                    
                    PRIMARY KEY ( id )
                );
                """
            
            // statement 0
            if let statement = prepare( sql: sql ) {
                if let _ = execute( statement: statement ) {
                    return true
                }
            }
            
            return false
        }
        
        public override func prepare() -> Bool {
            do {
                let sql = "DROP TABLE IF EXISTS schema_enum_value ;"
                
                // statement 1
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    INSERT INTO schema_enum_value (
                        value,
                        description,
                        schema_enum
                    ) VALUES (
                        ?1,
                        ?2,
                        ?3
                    );
                    """
                
                // statement 2
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT 
                        id,
                        value,
                        description,
                        schema_enum
                    FROM schema_enum_value ;
                    """
                
                // statement 3
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_enum_value
                    WHERE
                        id = ?1
                    LIMIT 1
                    ;
                    """
                
                // statement 4
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    DELETE
                    FROM schema_enum_value
                    WHERE
                        id = ?1
                    ;
                    """
                
                // statement 5
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_enum_value
                    WHERE
                        value = ?1
                        AND
                        schema_enum = ?2
                    ;
                    """
                
                // statement 6
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            do {
                let sql = """
                    SELECT *
                    FROM schema_enum_value
                    WHERE
                        schema_enum = ?1
                    ;
                    """
                
                // statement 7
                guard let _ = prepare( sql: sql ) else { return false }
            }
            
            return true
        }
        
        public func drop() -> Bool {
            let statement = statements[ 1 ]
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func insert( value: String,
                            description: String,
                            schemaEnum: SchemaEnum ) -> SchemaEnumValue? {
            return insert( value: value,
                            description: description,
                            schemaEnumId: schemaEnum.id )
        }
        
        public func insert( value: String,
                            description: String,
                            schemaEnumId: Int64 ) -> SchemaEnumValue? {
            let statement = statements[ 2 ]
            
            guard statement.bind( 1, value ) else { return nil }
            guard statement.bind( 2, description ) else { return nil }
            guard statement.bind( 3, schemaEnumId ) else { return nil }
            
            if let _ = execute( statement: statement ) {
                return get( id: lastInsertId() )
            }
            
            return nil
        }
        
        public func select() -> [SchemaEnumValue]? {
            let statement = statements[ 3 ]
            
            return execute( statement: statement )
        }
        
        public func get( id: Int64 ) -> SchemaEnumValue? {
            let statement = statements[ 4 ]
            
            if !statement.bind( 1, id ) {
                return nil
            }
            
            if let schemaEnumValue = execute( statement: statement ) {
                if schemaEnumValue.count == 1 {
                    return schemaEnumValue.first!
                }
            }
            
            return nil
        }
        
        public func delete( id: Int64 ) -> Bool {
            let statement = statements[ 5 ]
            
            guard statement.bind( 1, id ) else { return false }
            
            if let _ = execute( statement: statement ) {
                return true
            } else {
                return false
            }
        }
        
        public func select( value: String, schemaEnum: SchemaEnum ) -> [SchemaEnumValue]? {
            return select( value: value, schemaEnumId: schemaEnum.id )
        }
        
        public func select( value: String, schemaEnumId: Int64 ) -> [SchemaEnumValue]? {
            let statement = statements[ 6 ]
            
            guard statement.bind( 1, value ) else { return nil }
            guard statement.bind( 2, schemaEnumId ) else { return nil }
            
            return execute( statement: statement )
        }
        
        public func select( schemaEnum: SchemaEnum ) -> [SchemaEnumValue]? {
            return select( schemaEnumId: schemaEnum.id )
        }
        
        public func select( schemaEnumId: Int64 ) -> [SchemaEnumValue]? {
            let statement = statements[ 7 ]
            
            guard statement.bind( 1, schemaEnumId ) else { return nil }
            
            return execute( statement: statement )
        }
        
        public func id( idStatement: SqliteStatement ) -> UInt64?  {
            if let id: UInt64 = idStatement.get( index: 0 ) {
                return id
            } else {
                return nil
            }
        }
        
        public func execute( idStatement: SqliteStatement ) -> [UInt64]? {
            var rows = [UInt64]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = idStatement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let id = id( idStatement: idStatement ) {
                        rows.append( id )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !idStatement.reset() {
                return nil
            }
            
            return rows
        }
        
        public func getSchemaEnumValue( statement: SqliteStatement ) -> SchemaEnumValue?  {
            guard let id: Int64 = statement.get( index: 0 ) else { return nil }
            guard let value: String = statement.get( index: 1 ) else { return nil }
            guard let description: String = statement.get( index: 2 ) else { return nil }
            guard let schemaEnumId: Int64 = statement.get( index: 3 ) else { return nil }
            
            let schemaEnumValue = SchemaEnumValue( id: id,
                                 value: value,
                                 description: description,
                                 schemaEnumId: schemaEnumId )
            return schemaEnumValue
        }
        
        public func execute( statement: SqliteStatement ) -> [SchemaEnumValue]? {
            var rows = [SchemaEnumValue]()
            
            var stepResult: SqliteStatement.StepResult = .row
            while stepResult == .row {
                stepResult = statement.step()
                switch stepResult {
                case .done:
                    break
                case .row:
                    if let schemaEnumValue = getSchemaEnumValue( statement: statement ) {
                        rows.append( schemaEnumValue )
                    } else {
                        stepResult = .error
                    }
                case .busy:
                    stepResult = .row
                case .error:
                    break
                }
            }
            
            if !statement.reset() {
                return nil
            }
            
            if stepResult == .error {
                return nil
            } else {
                return rows
            }
        }
    }
    
    public let connection: SqliteConnection
    public weak var schemaTableTable: SchemaTableTable!
    public weak var schemaBasicTypeTable: SchemaBasicTypeTable!
    public weak var schemaAttributeTable: SchemaAttributeTable!
    public weak var schemaComponentTable: SchemaComponentTable!
    public weak var schemaComponentMapTable: SchemaComponentMapTable!
    public weak var schemaDistinctTable: SchemaDistinctTable!
    public weak var schemaEnumTable: SchemaEnumTable!
    public weak var schemaEnumValueTable: SchemaEnumValueTable!
    
    init?( filePath: FilePath? = nil ) {
        guard let connection = SqliteConnection.open( filePath: filePath ) else { return nil }
        self.connection = connection
        
        guard let schemaTableTable = SchemaTableTable( tensorDslDatabase: self ) else { return nil }
        self.schemaTableTable = schemaTableTable
        
        guard let schemaBasicTypeTable = SchemaBasicTypeTable( tensorDslDatabase: self ) else { return nil }
        self.schemaBasicTypeTable = schemaBasicTypeTable
        
        guard let schemaAttributeTable = SchemaAttributeTable( tensorDslDatabase: self ) else { return nil }
        self.schemaAttributeTable = schemaAttributeTable
        
        guard let schemaComponentTable = SchemaComponentTable( tensorDslDatabase: self ) else { return nil }
        self.schemaComponentTable = schemaComponentTable
        
        guard let schemaComponentMapTable = SchemaComponentMapTable( tensorDslDatabase: self ) else { return nil }
        self.schemaComponentMapTable = schemaComponentMapTable
        
        guard let schemaDistinctTable = SchemaDistinctTable( tensorDslDatabase: self ) else { return nil }
        self.schemaDistinctTable = schemaDistinctTable
        
        guard let schemaEnumTable = SchemaEnumTable( tensorDslDatabase: self ) else { return nil }
        self.schemaEnumTable = schemaEnumTable
        
        guard let schemaEnumValueTable = SchemaEnumValueTable( tensorDslDatabase: self ) else { return nil }
        self.schemaEnumValueTable = schemaEnumValueTable
        
        guard connection.add( table: schemaTableTable ) else { return nil }
        guard connection.add( table: schemaBasicTypeTable ) else { return nil }
        guard connection.add( table: schemaAttributeTable ) else { return nil }
        guard connection.add( table: schemaComponentTable ) else { return nil }
        guard connection.add( table: schemaComponentMapTable ) else { return nil }
        guard connection.add( table: schemaDistinctTable ) else { return nil }
        guard connection.add( table: schemaEnumTable ) else { return nil }
        guard connection.add( table: schemaEnumValueTable ) else { return nil }
    }
}
