import Foundation
import Alamofire
import Components

protocol DetailPkemonRemoteDataSourceProtocol: AnyObject {
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void)
    func getListAbility(with url: String, completion: @escaping (Result<AbilityResponse ,Error>) -> Void)
}

final class DetailPokemonRemoteDataSource: NSObject {
    private override init () {}
    
    static let sharedInstance: DetailPokemonRemoteDataSource = DetailPokemonRemoteDataSource()
}

extension DetailPokemonRemoteDataSource: DetailPkemonRemoteDataSourceProtocol {
    func getDetailPokemon(with url: String, completion: @escaping (Result<DetailPokemonResponse, Error>) -> Void) {
        let endpoint = url
        AF.request(endpoint,
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
        AF.request(endpoint,
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
}
