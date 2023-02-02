import Foundation

public struct DetailPokemonSpecies: Codable {
    //    public let baseHappiness: Int?
    //    public let captureRate: Int?
    //    public let color: Color?
    //    public let eggGroups: [Color]?
    public let evolutionChain: EvolutionChain?
    public let flavorTextEntries: [FlavorTextEntry]?
    //    public let formsSwitchable: Bool?
    //    public let genderRate: Int?
    //    public let genera: [Genus]?
    //    public let generation: Color?
    //    public let growthRate: Color?
    //    public let habitat: Color?
    //    public let hasGenderDifferences: Bool?
    //    public let hatchCounter: Int?
    //    public let id: Int?
    //    public let isBaby: Bool?
    //    public let isLegendary: Bool?
    //    public let isMythical: Bool?
    //    public let name: String?
    //    public let names: [Name]?
    //    public let order: Int?
    //    public let palParkEncounters: [PalParkEncounter]?
    //    public let pokedexNumbers: [PokedexNumber]?
    //    public let shape: Color?
    //    public let varieties: [Variety]?
    
    enum CodingKeys: String, CodingKey {
        //        case baseHappiness = "base_happiness"
        //        case captureRate = "capture_rate"
        //        case color = "color"
        //        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case flavorTextEntries = "flavor_text_entries"
        //        case formsSwitchable = "forms_switchable"
        //        case genderRate = "gender_rate"
        //        case genera = "genera"
        //        case generation = "generation"
        //        case growthRate = "growth_rate"
        //        case habitat = "habitat"
        //        case hasGenderDifferences = "has_gender_differences"
        //        case hatchCounter = "hatch_counter"
        //        case id = "id"
        //        case isBaby = "is_baby"
        //        case isLegendary = "is_legendary"
        //        case isMythical = "is_mythical"
        //        case name = "name"
        //        case names = "names"
        //        case order = "order"
        //        case palParkEncounters = "pal_park_encounters"
        //        case pokedexNumbers = "pokedex_numbers"
        //        case shape = "shape"
        //        case varieties = "varieties"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //        self.baseHappiness = try container.decodeWrapper(key: .baseHappiness, defaultValue: 0)
        //        self.captureRate = try container.decodeWrapper(key: .captureRate, defaultValue: 0)
        //        self.color = try container.decodeWrapper(key: .color, defaultValue: nil)
        //        self.eggGroups = try container.decodeWrapper(key: .color, defaultValue: [])
        self.evolutionChain = try container.decodeWrapper(key: .evolutionChain, defaultValue: nil)
        self.flavorTextEntries = try container.decodeWrapper(key: .flavorTextEntries, defaultValue: [])
        //        self.formsSwitchable = try container.decodeWrapper(key: .formsSwitchable, defaultValue: false)
        //        self.genderRate = try container.decodeWrapper(key: .genderRate, defaultValue: 0)
        //        self.genera = try container.decodeWrapper(key: .genera, defaultValue: [])
        //        self.generation = try container.decodeWrapper(key: .generation, defaultValue: nil)
        //        self.growthRate = try container.decodeWrapper(key: .growthRate, defaultValue: nil)
        //        self.habitat = try container.decodeWrapper(key: .habitat, defaultValue: nil)
        //        self.hasGenderDifferences = try container.decodeWrapper(key: .hasGenderDifferences, defaultValue: false)
        //        self.hatchCounter = try container.decodeWrapper(key: .hatchCounter, defaultValue: 0)
        //        self.id = try container.decodeWrapper(key: .id, defaultValue: 0)
        //        self.isBaby = try container.decodeWrapper(key: .isBaby, defaultValue: false)
        //        self.isLegendary = try container.decodeWrapper(key: .isLegendary, defaultValue: false)
        //        self.isMythical = try container.decodeWrapper(key: .isMythical, defaultValue: false)
        //        self.name = try container.decodeWrapper(key: .name, defaultValue: "")
        //        self.names = try container.decodeWrapper(key: .names, defaultValue: [])
        //        self.order = try container.decodeWrapper(key: .order, defaultValue: 0)
        //        self.palParkEncounters = try container.decodeWrapper(key: .palParkEncounters, defaultValue: [])
        //        self.pokedexNumbers = try container.decodeWrapper(key: .pokedexNumbers, defaultValue: [])
        //        self.shape = try container.decodeWrapper(key: .shape, defaultValue: nil)
        //        self.varieties = try container.decodeWrapper(key: .varieties, defaultValue: [])
    }
    
    
    //    public struct Color: Codable {
    //        public let name: String?
    //        public let url: String?
    //
    //        enum CodingKeys: String, CodingKey {
    //            case name = "name"
    //            case url = "url"
    //        }
    //
    //        public init(from decoder: Decoder) throws {
    //            let container = try decoder.container(keyedBy: CodingKeys.self)
    //            self.name = try container.decodeWrapper(key: .name, defaultValue: "")
    //            self.url = try container.decodeWrapper(key: .url, defaultValue: "")
    //        }
    //    }
    
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
    
    //    public struct Genus: Codable {
    //        public let genus: String?
    //        public let language: Color?
    //
    //        enum CodingKeys: String, CodingKey {
    //            case genus = "genus"
    //            case language = "language"
    //        }
    //
    //        public init(from decoder: Decoder) throws {
    //            let container = try decoder.container(keyedBy: CodingKeys.self)
    //            self.genus = try container.decodeWrapper(key: .genus, defaultValue: "")
    //            self.language = try container.decodeWrapper(key: .language, defaultValue: nil)
    //        }
    //    }
    //
    //    public struct Name: Codable {
    //        public let language: Color?
    //        public let name: String?
    //
    //        enum CodingKeys: String, CodingKey {
    //            case language = "language"
    //            case name = "name"
    //        }
    //
    //        public init(from decoder: Decoder) throws {
    //            let container = try decoder.container(keyedBy: CodingKeys.self)
    //            self.language = try container.decodeWrapper(key: .language, defaultValue: nil)
    //            self.name = try container.decodeWrapper(key: .name, defaultValue: "")
    //        }
    //
    //        public struct Color: Codable {
    //            public let name: String?
    //            public let url: String?
    //
    //            enum CodingKeys: String, CodingKey {
    //                case name = "name"
    //                case url = "url"
    //            }
    //
    //            public init(from decoder: Decoder) throws {
    //                let container = try decoder.container(keyedBy: CodingKeys.self)
    //                self.name = try container.decodeWrapper(key: .name, defaultValue: "")
    //                self.url = try container.decodeWrapper(key: .url, defaultValue: "")
    //            }
    //        }
    //    }
    //
    //    public struct PalParkEncounter: Codable {
    //        public let area: Color?
    //        public let baseScore: Int?
    //        public let rate: Int?
    //
    //        enum CodingKeys: String, CodingKey {
    //            case area = "area"
    //            case baseScore = "base_score"
    //            case rate = "rate"
    //        }
    //
    //        public init(from decoder: Decoder) throws {
    //            let container = try decoder.container(keyedBy: CodingKeys.self)
    //            self.area = try container.decodeWrapper(key: .area, defaultValue: nil)
    //            self.baseScore = try container.decodeWrapper(key: .baseScore, defaultValue: 0)
    //            self.rate = try container.decodeWrapper(key: .rate, defaultValue: 0)
    //        }
    //
    //        public struct Color: Codable {
    //            public let name: String?
    //            public let url: String?
    //
    //            enum CodingKeys: String, CodingKey {
    //                case name = "name"
    //                case url = "url"
    //            }
    //
    //            public init(from decoder: Decoder) throws {
    //                let container = try decoder.container(keyedBy: CodingKeys.self)
    //                self.name = try container.decodeWrapper(key: .name, defaultValue: "")
    //                self.url = try container.decodeWrapper(key: .url, defaultValue: "")
    //            }
    //        }
    //    }
    //
    //    public struct PokedexNumber: Codable {
    //        public let entryNumber: Int?
    //        public let pokedex: Color?
    //
    //        enum CodingKeys: String, CodingKey {
    //            case entryNumber = "entry_number"
    //            case pokedex = "pokedex"
    //        }
    //
    //        public init(from decoder: Decoder) throws {
    //            let container = try decoder.container(keyedBy: CodingKeys.self)
    //            self.entryNumber = try container.decodeWrapper(key: .entryNumber, defaultValue: 0)
    //            self.pokedex = try container.decodeWrapper(key: .pokedex, defaultValue: nil)
    //        }
    //
    //        public struct Color: Codable {
    //            public let name: String?
    //            public let url: String?
    //
    //            enum CodingKeys: String, CodingKey {
    //                case name = "name"
    //                case url = "url"
    //            }
    //
    //            public init(from decoder: Decoder) throws {
    //                let container = try decoder.container(keyedBy: CodingKeys.self)
    //                self.name = try container.decodeWrapper(key: .name, defaultValue: "")
    //                self.url = try container.decodeWrapper(key: .url, defaultValue: "")
    //            }
    //        }
    //    }
    //
    //    public struct Variety: Codable {
    //        public let isDefault: Bool?
    //        public let pokemon: Color?
    //
    //        enum CodingKeys: String, CodingKey {
    //            case isDefault = "is_default"
    //            case pokemon = "pokemon"
    //        }
    //
    //        public init(from decoder: Decoder) throws {
    //            let container = try decoder.container(keyedBy: CodingKeys.self)
    //            self.isDefault = try container.decodeWrapper(key: .isDefault, defaultValue: false)
    //            self.pokemon = try container.decodeWrapper(key: .pokemon, defaultValue: nil)
    //        }
    //
    //        public struct Color: Codable {
    //            public let name: String?
    //            public let url: String?
    //
    //            enum CodingKeys: String, CodingKey {
    //                case name = "name"
    //                case url = "url"
    //            }
    //
    //            public init(from decoder: Decoder) throws {
    //                let container = try decoder.container(keyedBy: CodingKeys.self)
    //                self.name = try container.decodeWrapper(key: .name, defaultValue: "")
    //                self.url = try container.decodeWrapper(key: .url, defaultValue: "")
    //            }
    //        }
    //    }
}
