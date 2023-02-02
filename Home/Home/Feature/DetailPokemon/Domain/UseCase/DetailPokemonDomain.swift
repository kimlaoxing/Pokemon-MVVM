import Foundation

protocol DetailPokemonUseCaseProtocol {
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void)
    func getListAbility(with url: String, completion: @escaping (Result<AbilityResponse ,Error>) -> Void)
    func getListEvolutionChain(with url: String, completion: @escaping (Result<EvolutionChainsResponse, Error>) -> Void)
    func getDetailPokemonSpecies(with id: Int, completion: @escaping(Result<DetailPokemonSpecies, Error>) -> Void)
    func getDetailPokemonWithName(with name: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void)
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
    
    func getListEvolutionChain(with url: String, completion: @escaping (Result<EvolutionChainsResponse, Error>) -> Void) {
        self.repository.getListEvolutionChain(with: url) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    func getDetailPokemonSpecies(with id: Int, completion: @escaping(Result<DetailPokemonSpecies, Error>) -> Void) {
        self.repository.getDetailPokemonSpecies(with: id) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    func getDetailPokemonWithName(with name: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void) {
        self.repository.getDetailPokemonWithName(with: name) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
}
