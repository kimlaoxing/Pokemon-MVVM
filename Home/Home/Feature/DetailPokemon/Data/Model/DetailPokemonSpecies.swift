import Foundation

public struct DetailPokemonSpecies: Codable {
    public let captureRate: Int?
    public let eggGroups: [Color]?
    public let evolutionChain: EvolutionChain?
    public let flavorTextEntries: [FlavorTextEntry]?
    public let genderRate: Int?
    public let generation: Color?
    public let habitat: Color?
    public let hatchCounter: Int?

    enum CodingKeys: String, CodingKey {
        case captureRate = "capture_rate"
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case flavorTextEntries = "flavor_text_entries"
        case genderRate = "gender_rate"
        case generation = "generation"
        case habitat = "habitat"
        case hatchCounter = "hatch_counter"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.captureRate = try container.decodeWrapper(key: .captureRate, defaultValue: 0)
        self.eggGroups = try container.decodeWrapper(key: .eggGroups, defaultValue: [])
        self.evolutionChain = try container.decodeWrapper(key: .evolutionChain, defaultValue: nil)
        self.flavorTextEntries = try container.decodeWrapper(key: .flavorTextEntries, defaultValue: [])
        self.genderRate = try container.decodeWrapper(key: .genderRate, defaultValue: 0)
        self.generation = try container.decodeWrapper(key: .generation, defaultValue: nil)
        self.habitat = try container.decodeWrapper(key: .habitat, defaultValue: nil)
        self.hatchCounter = try container.decodeWrapper(key: .hatchCounter, defaultValue: 0)
    }
    
    public struct Color: Codable {
        public let name: String?
        public let url: String?
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case url = "url"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decodeWrapper(key: .name, defaultValue: "")
            self.url = try container.decodeWrapper(key: .url, defaultValue: "")
        }
    }
    
    public struct EvolutionChain: Codable {
        public let url: String?
        
        enum CodingKeys: String, CodingKey {
            case url = "url"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.url = try container.decodeWrapper(key: .url, defaultValue: "")
        }
    }
    
    public struct FlavorTextEntry: Codable {
        public let flavorText: String?
        public let language: Color?
        public let version: Color?
        
        enum CodingKeys: String, CodingKey {
            case flavorText = "flavor_text"
            case language = "language"
            case version = "version"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.flavorText = try container.decodeWrapper(key: .flavorText, defaultValue: "")
            self.language = try container.decodeWrapper(key: .language, defaultValue: nil)
            self.version = try container.decodeWrapper(key: .version, defaultValue: nil)
        }
        
        public struct Color: Codable {
            public let name: String?
            public let url: String?
            
            enum CodingKeys: String, CodingKey {
                case name = "name"
                case url = "url"
            }
            
            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.name = try container.decodeWrapper(key: .name, defaultValue: "")
                self.url = try container.decodeWrapper(key: .url, defaultValue: "")
            }
        }
    }
}
