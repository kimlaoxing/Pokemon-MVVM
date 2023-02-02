import Declayout
import Components

final class ListPokemonTableViewCell: UITableViewCell {
    
    private lazy var containerView = UIStackView.make {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.horizontalPadding(to: contentView, Padding.double)
        $0.verticalPadding(to: contentView, Padding.reguler)
    }
    
    private lazy var hStack = UIStackView.make {
        $0.axis = .horizontal
        $0.spacing = Padding.half
    }
    
    private lazy var backgroundImage = UIImageView.make {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.dimension(40)
    }
    
    private lazy var title = UILabel.make {
        $0.numberOfLines = 1
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textAlignment = .left
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subViews()
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func subViews() {
        contentView.addSubviews([
            containerView.addArrangedSubviews([
                hStack.addArrangedSubviews([
                    backgroundImage,
                    title
                ])
            ])
        ])
    }
    
    func setContent(with list: DetailPokemonResult) {
        self.title.text = list.name
        self.backgroundImage.loadImage(url: list.image, placeholder: UIImage())
    }
}
