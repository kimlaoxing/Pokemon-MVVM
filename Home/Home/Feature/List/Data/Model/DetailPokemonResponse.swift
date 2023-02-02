import Foundation
import Components

public struct DetailPokemonResponse: Codable {
    public let abilities: [Ability]?
    public let baseExperience: Int?
    public let forms: [Species]?
    public let gameIndices: [GameIndex]?
    public let height: Int?
    public let id: Int?
    public let isDefault: Bool?
    public let locationAreaEncounters: String?
    public let moves: [Move]?
    public let name: String?
    public let order: Int?
    public let species: Species?
    public let sprites: Sprites?
    public let stats: [Stat]?
    public let types: [TypeElement]?
    public let weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities = "abilities"
        case baseExperience = "base_experience"
        case forms = "forms"
        case gameIndices = "game_indices"
        case height = "height"
        case id = "id"
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves = "moves"
        case name = "name"
        case order = "order"
        case species = "species"
        case sprites = "sprites"
        case stats = "stats"
        case types = "types"
        case weight = "weight"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.abilities = try container.decodeWrapper(key: .abilities, defaultValue: [])
        self.baseExperience = try container.decodeWrapper(key: .baseExperience, defaultValue: 0)
        self.forms = try container.decodeWrapper(key: .forms, defaultValue: [])
        self.gameIndices = try container.decodeWrapper(key: .gameIndices, defaultValue: [])
        self.height = try container.decodeWrapper(key: .height, defaultValue: 0)
        self.id = try container.decodeWrapper(key: .id, defaultValue: 0)
        self.isDefault = try container.decodeWrapper(key: .isDefault, defaultValue: false)
        self.locationAreaEncounters = try container.decodeWrapper(key: .locationAreaEncounters, defaultValue: "")
        self.moves = try container.decodeWrapper(key: .moves, defaultValue: [])
        self.name = try container.decodeWrapper(key: .name, defaultValue: "")
        self.order = try container.decodeWrapper(key: .order, defaultValue: 0)
        self.species = try container.decodeWrapper(key: .species, defaultValue: nil)
        self.sprites = try container.decodeWrapper(key: .sprites, defaultValue: nil)
        self.stats = try container.decodeWrapper(key: .stats, defaultValue: [])
        self.types = try container.decodeWrapper(key: .types, defaultValue: [])
        self.weight = try container.decodeWrapper(key: .weight, defaultValue: 0)
    }
}

public struct Ability: Codable {
    public let ability: Species?
    public let isHidden: Bool?
    public let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability = "ability"
        case isHidden = "is_hidden"
        case slot = "slot"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ability = try container.decodeWrapper(key: .ability, defaultValue: nil)
        self.isHidden = try container.decodeWrapper(key: .isHidden, defaultValue: false)
        self.slot = try container.decodeWrapper(key: .slot, defaultValue: 0)
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

public struct GameIndex: Codable {
    public let gameIndex: Int?
    public let version: Species?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version = "version"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gameIndex = try container.decodeWrapper(key: .gameIndex, defaultValue: 0)
        self.version = try container.decodeWrapper(key: .version, defaultValue: nil)
    }
}

public struct Move: Codable {
    public let move: Species?
    public let versionGroupDetails: [VersionGroupDetail]?

    enum CodingKeys: String, CodingKey {
        case move = "move"
        case versionGroupDetails = "version_group_details"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.move = try container.decodeWrapper(key: .move, defaultValue: nil)
        self.versionGroupDetails = try container.decodeWrapper(key: .versionGroupDetails, defaultValue: [])
    }
}

public struct VersionGroupDetail: Codable {
    public let levelLearnedAt: Int?
    public let moveLearnMethod: Species?
    public let versionGroup: Species?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.levelLearnedAt = try container.decodeWrapper(key: .levelLearnedAt, defaultValue: 0)
        self.moveLearnMethod = try container.decodeWrapper(key: .moveLearnMethod, defaultValue: nil)
        self.versionGroup = try container.decodeWrapper(key: .versionGroup, defaultValue: nil)
    }
}

public struct Sprites: Codable {
    public let backDefault: String?
    public let backShiny: String?
    public let frontDefault: String?
    public let frontShiny: String?
    public let other: Other?
    public let versions: Versions?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case other = "other"
        case versions = "versions"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backDefault = try container.decodeWrapper(key: .backDefault, defaultValue: "")
        self.backShiny = try container.decodeWrapper(key: .backShiny, defaultValue: "")
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontShiny = try container.decodeWrapper(key: .frontShiny, defaultValue: "")
        self.other = try container.decodeWrapper(key: .other, defaultValue: nil)
        self.versions = try container.decodeWrapper(key: .versions, defaultValue: nil)
    }
}

public struct Other: Codable {
    public let dreamWorld: DreamWorld?
    public let home: Home?
    public let officialArtwork: OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home = "home"
        case officialArtwork = "official-artwork"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dreamWorld = try container.decodeWrapper(key: .dreamWorld, defaultValue: nil)
        self.home = try container.decodeWrapper(key: .home, defaultValue: nil)
        self.officialArtwork = try container.decodeWrapper(key: .officialArtwork, defaultValue: nil)
    }
}

public struct DreamWorld: Codable {
    public let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
    }
}

public struct Home: Codable {
    public let frontDefault: String?
    public let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontShiny = try container.decodeWrapper(key: .frontShiny, defaultValue: "")
    }
}

public struct OfficialArtwork: Codable {
    public let frontDefault: String?
    public let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontShiny = try container.decodeWrapper(key: .frontShiny, defaultValue: "")
    }
}

public struct Versions: Codable {
    public let generationI: GenerationI?
    public let generationIi: GenerationIi?
    public let generationIii: GenerationIii?
    public let generationIv: GenerationIv?
    public let generationV: GenerationV?
    public let generationVi: GenerationVi?
    public let generationVii: GenerationVii?
    public let generationViii: GenerationViii?

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.generationI = try container.decodeWrapper(key: .generationI, defaultValue: nil)
        self.generationIi = try container.decodeWrapper(key: .generationIi, defaultValue: nil)
        self.generationIii = try container.decodeWrapper(key: .generationIii, defaultValue: nil)
        self.generationIv = try container.decodeWrapper(key: .generationIv, defaultValue: nil)
        self.generationV = try container.decodeWrapper(key: .generationV, defaultValue: nil)
        self.generationVi = try container.decodeWrapper(key: .generationVi, defaultValue: nil)
        self.generationVii = try container.decodeWrapper(key: .generationVii, defaultValue: nil)
        self.generationViii = try container.decodeWrapper(key: .generationViii, defaultValue: nil)
    }
}

public struct GenerationI: Codable {
    public let redBlue: RedBlue?
    public let yellow: RedBlue?

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow = "yellow"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.redBlue = try container.decodeWrapper(key: .redBlue, defaultValue: nil)
        self.yellow = try container.decodeWrapper(key: .yellow, defaultValue: nil)
    }
}

public struct RedBlue: Codable {
    public let backDefault: String?
    public let backGray: String?
    public let backTransparent: String?
    public let frontDefault: String?
    public let frontGray: String?
    public let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backDefault = try container.decodeWrapper(key: .backDefault, defaultValue: "")
        self.backGray = try container.decodeWrapper(key: .backGray, defaultValue: "")
        self.backTransparent = try container.decodeWrapper(key: .backTransparent, defaultValue: "")
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontGray = try container.decodeWrapper(key: .frontGray, defaultValue: "")
        self.frontTransparent = try container.decodeWrapper(key: .frontTransparent, defaultValue: "")
    }
}

public struct GenerationIi: Codable {
    public let crystal: Crystal?
    public let gold: Gold?
    public let silver: Gold?

    enum CodingKeys: String, CodingKey {
        case crystal = "crystal"
        case gold = "gold"
        case silver = "silver"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.crystal = try container.decodeWrapper(key: .crystal, defaultValue: nil)
        self.gold = try container.decodeWrapper(key: .gold, defaultValue: nil)
        self.silver = try container.decodeWrapper(key: .silver, defaultValue: nil)
    }
}

public struct Crystal: Codable {
    public let backDefault: String?
    public let backShiny: String?
    public let backShinyTransparent: String?
    public let backTransparent: String?
    public let frontDefault: String?
    public let frontShiny: String?
    public let frontShinyTransparent: String?
    public let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backDefault = try container.decodeWrapper(key: .backDefault, defaultValue: "")
        self.backShiny = try container.decodeWrapper(key: .backShiny, defaultValue: "")
        self.backShinyTransparent = try container.decodeWrapper(key: .backShinyTransparent, defaultValue: "")
        self.backTransparent = try container.decodeWrapper(key: .backTransparent, defaultValue: "")
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontShiny = try container.decodeWrapper(key: .frontShiny, defaultValue: "")
        self.frontShinyTransparent = try container.decodeWrapper(key: .frontShinyTransparent, defaultValue: "")
        self.frontTransparent = try container.decodeWrapper(key: .frontTransparent, defaultValue: "")
    }
}

public struct Gold: Codable {
    public let backDefault: String?
    public let backShiny: String?
    public let frontDefault: String?
    public let frontShiny: String?
    public let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backDefault = try container.decodeWrapper(key: .backDefault, defaultValue: "")
        self.backShiny = try container.decodeWrapper(key: .backShiny, defaultValue: "")
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontShiny = try container.decodeWrapper(key: .frontShiny, defaultValue: "")
        self.frontTransparent = try container.decodeWrapper(key: .frontTransparent, defaultValue: "")
    }
}

public struct GenerationIii: Codable {
    public let emerald: OfficialArtwork?
    public let fireredLeafgreen: FireredLeafgreen?
    public let rubySapphire: FireredLeafgreen?

    enum CodingKeys: String, CodingKey {
        case emerald = "emerald"
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.emerald = try container.decodeWrapper(key: .emerald, defaultValue: nil)
        self.fireredLeafgreen = try container.decodeWrapper(key: .fireredLeafgreen, defaultValue: nil)
        self.rubySapphire = try container.decodeWrapper(key: .rubySapphire, defaultValue: nil)
    }
}

public struct FireredLeafgreen: Codable {
    public let backDefault: String?
    public let backShiny: String?
    public let frontDefault: String?
    public let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backDefault = try container.decodeWrapper(key: .backDefault, defaultValue: "")
        self.backShiny = try container.decodeWrapper(key: .backShiny, defaultValue: "")
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontShiny = try container.decodeWrapper(key: .frontShiny, defaultValue: "")
    }
}

public struct GenerationIv: Codable {
    public let diamondPearl: DiamondPearl?
    public let heartgoldSoulsilver: DiamondPearl?
    public let platinum: DiamondPearl?

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum = "platinum"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.diamondPearl = try container.decodeWrapper(key: .diamondPearl, defaultValue: nil)
        self.heartgoldSoulsilver = try container.decodeWrapper(key: .heartgoldSoulsilver, defaultValue: nil)
        self.platinum = try container.decodeWrapper(key: .platinum, defaultValue: nil)
    }
}

public struct DiamondPearl: Codable {
    public let backDefault: String?
    public let backShiny: String?
    public let frontDefault: String?
    public let frontShiny: String?


    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"

    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backDefault = try container.decodeWrapper(key: .backDefault, defaultValue: "")
        self.backShiny = try container.decodeWrapper(key: .backShiny, defaultValue: "")
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontShiny = try container.decodeWrapper(key: .frontShiny, defaultValue: "")
    }
}

public struct GenerationV: Codable {
    public let blackWhite: BlackWhite?

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.blackWhite = try container.decodeWrapper(key: .blackWhite, defaultValue: nil)
    }
}

public struct BlackWhite: Codable {
    public let animated: Animated?
    public let backDefault: String?
    public let backShiny: String?
    public let frontDefault: String?
    public let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case animated = "animated"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.animated = try container.decodeWrapper(key: .animated, defaultValue: nil)
        self.backDefault = try container.decodeWrapper(key: .backDefault, defaultValue: "")
        self.backShiny = try container.decodeWrapper(key: .backShiny, defaultValue: "")
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontShiny = try container.decodeWrapper(key: .frontShiny, defaultValue: "")
    }
}

public struct Animated: Codable {
    public let backDefault: String?
    public let backShiny: String?
    public let frontDefault: String?
    public let frontShiny: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backDefault = try container.decodeWrapper(key: .backDefault, defaultValue: "")
        self.backShiny = try container.decodeWrapper(key: .backShiny, defaultValue: "")
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
        self.frontShiny = try container.decodeWrapper(key: .frontShiny, defaultValue: "")
    }
}

public struct GenerationVi: Codable {
    public let omegarubyAlphasapphire: Home?
    public let xY: Home?

    enum CodingKeys: String, CodingKey {
        case omegarubyAlphasapphire = "omegaruby-alphasapphire"
        case xY = "x-y"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.omegarubyAlphasapphire = try container.decodeWrapper(key: .omegarubyAlphasapphire, defaultValue: nil)
        self.xY = try container.decodeWrapper(key: .xY, defaultValue: nil)
    }
}

public struct GenerationVii: Codable {
    public let icons: Icons?
    public let ultraSunUltraMoon: Home?

    enum CodingKeys: String, CodingKey {
        case icons = "icons"
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icons = try container.decodeWrapper(key: .icons, defaultValue: nil)
        self.ultraSunUltraMoon = try container.decodeWrapper(key: .ultraSunUltraMoon, defaultValue: nil)
    }
}

public struct Icons: Codable {
    public let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefault = try container.decodeWrapper(key: .frontDefault, defaultValue: "")
    }
}

public struct GenerationViii: Codable {
    public let icons: Icons?

    enum CodingKeys: String, CodingKey {
        case icons = "icons"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icons = try container.decodeWrapper(key: .icons, defaultValue: nil)
    }
}

public struct Stat: Codable {
    public let baseStat: Int?
    public let effort: Int?
    public let stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.baseStat = try container.decodeWrapper(key: .baseStat, defaultValue: 0)
        self.effort = try container.decodeWrapper(key: .effort, defaultValue: 0)
        self.stat = try container.decodeWrapper(key: .stat, defaultValue: nil)
    }
}

public struct TypeElement: Codable {
    public let slot: Int?
    public let type: Species?

    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.slot = try container.decodeWrapper(key: .slot, defaultValue: 0)
        self.type = try container.decodeWrapper(key: .type, defaultValue: nil)
    }
}
