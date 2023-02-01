import Foundation
import Declayout
import RxSwift
import UIKit
import Components

final class DetailPokemonViewController: UIViewController {
    
    var viewModel: DetailPokemonViewModel?
    let bag = DisposeBag()
    
    private lazy var scrollView = ScrollViewContainer.make {
        $0.edges(to: view)
    }
    
    private lazy var header = DetailPokemonHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        bind()
        subViews()
    }
    
    private func bind() {
        self.viewModel?.detailPokemon.subscribe(onNext: { [weak self] data in
            guard let self = self, let data = data else { return }
            self.header.setContent(with: data)
        }).disposed(by: bag)
    }
    
    private func subViews() {
        view.addSubviews([
            scrollView.addArrangedSubViews([
                header
            ])
        ])
    }
}
