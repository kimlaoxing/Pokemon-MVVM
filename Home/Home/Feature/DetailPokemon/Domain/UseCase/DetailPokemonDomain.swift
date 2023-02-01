import Foundation

protocol DetailPokemonUseCaseProtocol {
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void)
    func getListAbility(with url: String, completion: @escaping (Result<AbilityResponse ,Error>) -> Void)
}

class DetailPokemonInteractor: DetailPokemonUseCaseProtocol {
    
    private let repository: DetailPokemonRepositoryProtocol
    
    required init(repository: DetailPokemonRepositoryProtocol) {
        self.repository = repository
    }
    
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void) {
        self.repository.getDetailPokemon(with: url) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    func getListAbility(with url: String, completion: @escaping (Result<AbilityResponse, Error>) -> Void) {
        self.repository.getListAbility(with: url) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
}
