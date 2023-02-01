import Declayout
import UIKit

final class DetailPokemonAbility: UIView {
    
    private lazy var container = UIStackView.make {
        $0.axis = .vertical
        $0.edges(to: self)
        $0.backgroundColor = .white
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

