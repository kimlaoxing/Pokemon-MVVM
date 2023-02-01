import Foundation

final class DetailPokemonInjection: NSObject {
    private func provideRepository() -> DetailPokemonRepositoryProtocol {
        let remote: DetailPokemonRemoteDataSource = DetailPokemonRemoteDataSource.sharedInstance
        return DetailPokemonRepository.sharedInstance(remote)
    }
    
    func provideBase() -> DetailPokemonUseCaseProtocol {
        let repository = provideRepository()
        return DetailPokemonInteractor(repository: repository)
    }
}
