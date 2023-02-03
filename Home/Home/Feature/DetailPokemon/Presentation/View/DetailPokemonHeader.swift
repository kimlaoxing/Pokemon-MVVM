import Foundation
import Components
import Declayout
import UIKit

final class DetailPokemonHeader: UIView {
    
    private lazy var container = UIStackView.make {
        $0.axis = .vertical
        $0.edges(to: self)
    }
    
    private lazy var imagePokemon = UIImageView.make {
        $0.clipsToBounds = true
        $0.height(200)
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .systemBlue
    }
    
    private lazy var roundedContainer = UIView.make {
        $0.backgroundColor = .systemBlue
    }
    
    private lazy var roundedStack = UIStackView.make {
        $0.backgroundColor = .white
        $0.roundCorners([.topLeft, .topRight], radius: 15)
        $0.top(to: roundedContainer, Padding.reguler)
        $0.bottom(to: roundedContainer)
        $0.horizontalPadding(to: roundedContainer)
        $0.axis = .vertical
        $0.spacing = Padding.half
    }
    
    
    private lazy var namePokemon = UILabel.make {
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.numberOfLines = 1
        $0.textColor = .black
    }
    
    private lazy var elementLabel = RoundedButton.make {
        $0.horizontalPadding(to: roundedStack, Padding.double * 6)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        subViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func subViews() {
        backgroundColor = .white
        addSubviews([
            container.addArrangedSubviews([
                imagePokemon,
                roundedContainer.addSubviews([
                    roundedStack.addArrangedSubviews([
                        namePokemon,
                        elementLabel
                    ])
                ])
            ])
        ])
    }
    
    func setContent(with data: DetailPokemonResponse) {
        self.imagePokemon.loadImage(url: data.sprites?.other?.officialArtwork?.frontDefault ?? "", placeholder: UIImage())
        self.namePokemon.text = data.name?.capitalizedSentence
        self.elementLabel.setContent(with: data.types?.first?.type?.name?.capitalizedSentence ?? "-")
    }
}
