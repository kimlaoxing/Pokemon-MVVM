import Foundation

public struct AbilityResponse: Codable {
    public let effectEntries: [EffectEntry]?
    public let flavorTextEntries: [FlavorTextEntry]?
    public let generation: Generation?
    public let id: Int?
    public let isMainSeries: Bool?
    public let name: String?
    public let names: [Name]?
    public let pokemon: [Pokemon]?

    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case generation = "generation"
        case id = "id"
        case isMainSeries = "is_main_series"
        case name = "name"
        case names = "names"
        case pokemon = "pokemon"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.effectEntries = try container.decodeWrapper(key: .effectEntries, defaultValue: [])
        self.flavorTextEntries = try container.decodeWrapper(key: .flavorTextEntries, defaultValue: [])
        self.generation = try container.decodeWrapper(key: .generation, defaultValue: nil)
        self.id = try container.decodeWrapper(key: .id, defaultValue: 0)
        self.isMainSeries = try container.decodeWrapper(key: .isMainSeries, defaultValue: false)
        self.name = try container.decodeWrapper(key: .name, defaultValue: "")
        self.names = try container.decodeWrapper(key: .names, defaultValue: [])
        self.pokemon = try container.decodeWrapper(key: .pokemon, defaultValue: [])
    }
}

public struct EffectEntry: Codable {
    public let effect: String?
    public let language: Generation?
    public let shortEffect: String?

    enum CodingKeys: String, CodingKey {
        case effect = "effect"
        case language = "language"
        case shortEffect = "short_effect"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.effect = try container.decodeWrapper(key: .effect, defaultValue: "")
        self.language = try container.decodeWrapper(key: .language, defaultValue: nil)
        self.shortEffect = try container.decodeWrapper(key: .shortEffect, defaultValue: "")
    }
}

public struct Generation: Codable {
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

public struct FlavorTextEntry: Codable {
    public let flavorText: String?
    public let language: Generation?
    public let versionGroup: Generation?

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language = "language"
        case versionGroup = "version_group"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.flavorText = try container.decodeWrapper(key: .flavorText, defaultValue: "")
        self.language = try container.decodeWrapper(key: .language, defaultValue: nil)
        self.versionGroup = try container.decodeWrapper(key: .versionGroup, defaultValue: nil)
    }
}

public struct Name: Codable {
    public let language: Generation?
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case language = "language"
        case name = "name"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.language = try container.decodeWrapper(key: .language, defaultValue: nil)
        self.name = try container.decodeWrapper(key: .name, defaultValue: "")
    }
}

public struct Pokemon: Codable {
    public let isHidden: Bool?
    public let pokemon: Generation?
    public let slot: Int?

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case pokemon = "pokemon"
        case slot = "slot"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isHidden = try container.decodeWrapper(key: .isHidden, defaultValue: false)
        self.pokemon = try container.decodeWrapper(key: .pokemon, defaultValue: nil)
        self.slot = try container.decodeWrapper(key: .slot, defaultValue: 0)
    }
}
