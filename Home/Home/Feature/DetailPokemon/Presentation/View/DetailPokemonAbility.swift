import Declayout
import Components

final class DetailPokemonAbility: UIView {
    
    private lazy var container = UIStackView.make {
        $0.axis = .vertical
        $0.top(to: self, Padding.double)
        $0.bottom(to: self)
        $0.horizontalPadding(to: self)   
    }
    
    private lazy var title = UILabel.make {
        $0.textAlignment = .center
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "Abilities"
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
                title
            ])
        ])
    }
}

