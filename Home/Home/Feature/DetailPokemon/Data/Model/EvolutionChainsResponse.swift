import Foundation

public struct EvolutionChainsResponse: Codable {
    public let chain: Chain?
    public let id: Int?

    enum CodingKeys: String, CodingKey {
        case chain = "chain"
        case id = "id"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chain = try container.decodeWrapper(key: .chain, defaultValue: nil)
        self.id = try container.decodeWrapper(key: .id, defaultValue: 0)
    }
    
    public struct Chain: Codable {
        public let evolvesTo: [ChainEvolvesTo]?
        public let isBaby: Bool?
        public let species: Species?

        enum CodingKeys: String, CodingKey {
            case evolvesTo = "evolves_to"
            case isBaby = "is_baby"
            case species = "species"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.evolvesTo = try container.decodeWrapper(key: .evolvesTo, defaultValue: [])
            self.isBaby = try container.decodeWrapper(key: .isBaby, defaultValue: false)
            self.species = try container.decodeWrapper(key: .species, defaultValue: nil)
        }
        
        public struct ChainEvolvesTo: Codable {
            public let evolutionDetails: [EvolutionDetail]?
            public let evolvesTo: [EvolvesToEvolvesTo]?
            public let isBaby: Bool?
            public let species: Species?

            enum CodingKeys: String, CodingKey {
                case evolutionDetails = "evolution_details"
                case evolvesTo = "evolves_to"
                case isBaby = "is_baby"
                case species = "species"
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.evolutionDetails = try container.decodeWrapper(key: .evolutionDetails, defaultValue: [])
                self.evolvesTo = try container.decodeWrapper(key: .evolvesTo, defaultValue: [])
                self.isBaby = try container.decodeWrapper(key: .isBaby, defaultValue: false)
                self.species = try container.decodeWrapper(key: .species, defaultValue: nil)
            }
            
            public struct EvolutionDetail: Codable {
                public let minLevel: Int?
                public let needsOverworldRain: Bool?
                public let timeOfDay: String?
                public let trigger: Species?
                public let turnUpsideDown: Bool?

                enum CodingKeys: String, CodingKey {
                    case minLevel = "min_level"
                    case needsOverworldRain = "needs_overworld_rain"
                    case timeOfDay = "time_of_day"
                    case trigger = "trigger"
                    case turnUpsideDown = "turn_upside_down"
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    self.minLevel = try container.decodeWrapper(key: .minLevel, defaultValue: 0)
                    self.needsOverworldRain = try container.decodeWrapper(key: .needsOverworldRain, defaultValue: false)
                    self.timeOfDay = try container.decodeWrapper(key: .timeOfDay, defaultValue: "")
                    self.trigger = try container.decodeWrapper(key: .trigger, defaultValue: nil)
                    self.turnUpsideDown = try container.decodeWrapper(key: .turnUpsideDown, defaultValue: false)
                }
                
                public struct Species: Codable {
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
            
            public struct Species: Codable {
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
            
            public struct EvolvesToEvolvesTo: Codable {
                public let evolutionDetails: [EvolutionDetail]?
                public let isBaby: Bool?
                public let species: Species?

                enum CodingKeys: String, CodingKey {
                    case evolutionDetails = "evolution_details"
                    case isBaby = "is_baby"
                    case species = "species"
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    self.evolutionDetails = try container.decodeWrapper(key: .evolutionDetails, defaultValue: [])
                    self.isBaby = try container.decodeWrapper(key: .isBaby, defaultValue: false)
                    self.species = try container.decodeWrapper(key: .species, defaultValue: nil)
                }
                
                public struct EvolutionDetail: Codable {
                    public let minLevel: Int?
                    public let needsOverworldRain: Bool?
                    public let timeOfDay: String?
                    public let trigger: Species?
                    public let turnUpsideDown: Bool?

                    enum CodingKeys: String, CodingKey {
                        case minLevel = "min_level"
                        case needsOverworldRain = "needs_overworld_rain"
                        case timeOfDay = "time_of_day"
                        case trigger = "trigger"
                        case turnUpsideDown = "turn_upside_down"
                    }
                    
                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        self.minLevel = try container.decodeWrapper(key: .minLevel, defaultValue: 0)
                        self.needsOverworldRain = try container.decodeWrapper(key: .needsOverworldRain, defaultValue: false)
                        self.timeOfDay = try container.decodeWrapper(key: .timeOfDay, defaultValue: "")
                        self.trigger = try container.decodeWrapper(key: .trigger, defaultValue: nil)
                        self.turnUpsideDown = try container.decodeWrapper(key: .turnUpsideDown, defaultValue: false)
                    }
                    
                    public struct Species: Codable {
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
        }
        
        public struct Species: Codable {
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










