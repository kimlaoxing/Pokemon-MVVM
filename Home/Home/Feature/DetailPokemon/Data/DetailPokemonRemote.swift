import Foundation
import Alamofire
import Components

protocol DetailPkemonRemoteDataSourceProtocol: AnyObject {
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void)
    func getListAbility(with url: String, completion: @escaping (Result<AbilityResponse ,Error>) -> Void)
    func getListEvolutionChain(with url: String, completion: @escaping (Result<EvolutionChainsResponse, Error>) -> Void)
    func getDetailPokemonSpecies(with id: Int, completion: @escaping(Result<DetailPokemonSpecies, Error>) -> Void)
    func getDetailPokemonWithName(with name: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void)
}

final class DetailPokemonRemoteDataSource: NSObject {
    private override init () {}
    
    static let sharedInstance: DetailPokemonRemoteDataSource = DetailPokemonRemoteDataSource()
}

extension DetailPokemonRemoteDataSource: DetailPkemonRemoteDataSourceProtocol {
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void) {
        let endpoint = url
        AF.request(
            endpoint,
            method: .get,
            encoding: URLEncoding.queryString
        )
            .validate(statusCode: 200..<300)
            .responseDecodable(of: DetailPokemonResponse.self) { data in
                switch data.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func getDetailPokemonWithName(with name: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void) {
        let endpoint = "\(APIService.basePath)pokemon/\(name)/"
        print("requested is \(endpoint)")
        AF.request(
            endpoint,
            method: .get,
            encoding: URLEncoding.queryString
        )
            .validate(statusCode: 200..<300)
            .responseDecodable(of: DetailPokemonResponse.self) { data in
                switch data.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func getListAbility(with url: String, completion: @escaping (Result<AbilityResponse ,Error>) -> Void) {
        let endpoint = url
        AF.request(
            endpoint,
            method: .get,
            encoding: URLEncoding.queryString
        )
            .validate(statusCode: 200..<300)
            .responseDecodable(of: AbilityResponse.self) { data in
                switch data.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func getListEvolutionChain(with url: String, completion: @escaping (Result<EvolutionChainsResponse, Error>) -> Void) {
        let endpoint = url
        print("url \(endpoint)")
        AF.request(
            endpoint,
            method: .get,
            encoding: URLEncoding.queryString
        )
            .validate(statusCode: 200..<300)
            .responseDecodable(of: EvolutionChainsResponse.self) { data in
                switch data.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func getDetailPokemonSpecies(with id: Int, completion: @escaping(Result<DetailPokemonSpecies, Error>) -> Void) {
        let endpoint = "\(APIService.basePath)pokemon-species/\(id)"
        AF.request(
            endpoint,
            method: .get,
            encoding: JSONEncoding.default
        )
            .responseDecodable(of: DetailPokemonSpecies.self) { data in
                switch data.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
