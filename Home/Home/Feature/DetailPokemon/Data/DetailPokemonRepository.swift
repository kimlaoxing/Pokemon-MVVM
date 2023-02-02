import Foundation

protocol DetailPokemonRepositoryProtocol {
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void)
    func getListAbility(with url: String, completion: @escaping (Result<AbilityResponse ,Error>) -> Void)
    func getListEvolutionChain(with url: String, completion: @escaping (Result<EvolutionChainsResponse, Error>) -> Void)
    func getDetailPokemonSpecies(with id: Int, completion: @escaping(Result<DetailPokemonSpecies, Error>) -> Void)
    func getDetailPokemonWithName(with name: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void)
}

final class DetailPokemonRepository: NSObject {
    typealias DetailPokemonInstance = (DetailPokemonRemoteDataSource) -> DetailPokemonRepository
    
    fileprivate let remote: DetailPokemonRemoteDataSource
    
    private init(remote: DetailPokemonRemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: DetailPokemonInstance = { remoteRepo in
        return DetailPokemonRepository(remote: remoteRepo)
    }
}

extension DetailPokemonRepository: DetailPokemonRepositoryProtocol {
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void) {
        self.remote.getDetailPokemon(with: url) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    func getListAbility(with url: String, completion: @escaping (Result<AbilityResponse ,Error>) -> Void) {
        self.remote.getListAbility(with: url) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    func getListEvolutionChain(with url: String, completion: @escaping (Result<EvolutionChainsResponse, Error>) -> Void) {
        self.remote.getListEvolutionChain(with: url) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    func getDetailPokemonSpecies(with id: Int, completion: @escaping(Result<DetailPokemonSpecies, Error>) -> Void) {
        self.remote.getDetailPokemonSpecies(with: id) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    func getDetailPokemonWithName(with name: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void) {
        self.remote.getDetailPokemonWithName(with: name) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
}
