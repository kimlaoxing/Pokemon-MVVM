import Foundation

protocol ListPokemonUseCaseProtocol {
    func getListPokemon(with limit: Int, completion: @escaping (Result<[ListPokemonResult], Error>) -> Void)
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResult, Error>) -> Void)
}

class ListPokemonInteractor: ListPokemonUseCaseProtocol {

    private let repository: ListPokemonRepositoryProtocol
    
    required init(repository: ListPokemonRepositoryProtocol) {
        self.repository = repository
    }
    
    func getListPokemon(with limit: Int, completion: @escaping (Result<[ListPokemonResult], Error>) -> Void) {
        self.repository.getListPokemon(with: limit) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResult, Error>) -> Void) {
        self.repository.getDetailPokemon(with: url) { data in
            switch data {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
}
