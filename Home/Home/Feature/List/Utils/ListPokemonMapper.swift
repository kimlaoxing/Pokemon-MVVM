import Foundation

final class ListPokemonMapper {
    static func listPokemonMapper(result: [ListPokemonResponse.Result]) -> [ListPokemonResult] {
        return result.map { data in
            return ListPokemonResult(
                name: data.name ?? "",
                url: data.url ?? ""
            )
        }
    }
    
    static func DetailPokemonMapper(officialArtworkonse: OfficialArtwork,
                                    response: DetailPokemonResponse) -> DetailPokemonResult {
        let data: DetailPokemonResult = DetailPokemonResult(
            id: response.id ?? 0,
            image: officialArtworkonse.frontDefault ?? "",
            name: response.name ?? ""
        )
        return data
    }
}
