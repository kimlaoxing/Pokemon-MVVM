import Declayout
import Components
import UIKit

final class DetailPokemonSpiritesView: UIView {
    
    private lazy var container = UIStackView.make {
         $0.axis = .vertical
         $0.top(to: self)
         $0.horizontalPadding(to: self)
         $0.bottom(to: self, Padding.double)
         $0.spacing = Padding.reguler
         $0.backgroundColor = .white
         $0.roundCorners([.bottomLeft, .bottomRight], radius: 15)
     }
    
    private lazy var title = UILabel.make {
        $0.textAlignment = .center
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "Spirites"
    }
    
    private lazy var iconHStack = UIStackView.make {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private lazy var normalStack = UIStackView.make {
        $0.axis = .vertical
    }
    
    private lazy var shinyStack = UIStackView.make {
        $0.axis = .vertical
    }
    
    private lazy var normallSpiriteLabel = UILabel.make {
        $0.textAlignment = .center
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "Normal"
    }
    
    private lazy var shinySpiriteLabel = UILabel.make {
        $0.textAlignment = .center
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "Shiny"
    }
    
    private lazy var normalImageSpirites = UIImageView.make {
        $0.clipsToBounds = true
        $0.height(100)
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var shinyImageSpirites = UIImageView.make {
        $0.clipsToBounds = true
        $0.height(100)
        $0.contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        subViews()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func subViews() {
        addSubviews([
            container.addArrangedSubviews([
                title,
                iconHStack.addArrangedSubviews([
                    normalStack.addArrangedSubviews([
                        normallSpiriteLabel,
                        normalImageSpirites
                    ]),
                    shinyStack.addArrangedSubviews([
                        shinySpiriteLabel,
                        shinyImageSpirites
                    ]),
                ])
            ])
        ])
    }
    
    func setContent(with response: DetailPokemonResponse) {
        normalImageSpirites.loadImage(url: response.sprites?.frontDefault, placeholder: UIImage())
        shinyImageSpirites.loadImage(url: response.sprites?.frontShiny, placeholder: UIImage())
    }
}

