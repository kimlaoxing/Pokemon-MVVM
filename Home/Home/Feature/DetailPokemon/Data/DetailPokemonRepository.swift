import Foundation

protocol DetailPokemonRepositoryProtocol {
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void)
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
}
