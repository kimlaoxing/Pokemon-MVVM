import Declayout
import Components

final class DetailPokemonEvolutionCell: UITableViewCell {
    
    private lazy var container = UIStackView.make {
        $0.axis = .horizontal
        $0.distribution = .equalCentering
        $0.edges(to: contentView, Padding.double)
    }
    
    private lazy var leftStack = UIStackView.make {
        $0.axis = .vertical
    }
    
    private lazy var arrowStack = UIStackView.make {
        $0.axis = .vertical
    }
    
    private lazy var rightStack = UIStackView.make {
        $0.axis = .vertical
    }
    
    private lazy var leftTitle = UILabel.make {
        $0.textAlignment = .center
        $0.textColor = .systemGray3
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private lazy var leftImage = UIImageView.make {
        $0.clipsToBounds = true
        $0.height(50)
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var rightTitle = UILabel.make {
        $0.textAlignment = .center
        $0.textColor = .systemGray3
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private lazy var rightImage = UIImageView.make {
        $0.clipsToBounds = true
        $0.height(50)
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var arrowImage = UIImageView.make {
        $0.clipsToBounds = true
        $0.image = UIImage(systemName: "arrow.right")
        $0.image?.withTintColor(.systemGray3)
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var minimumLevelLabel = UILabel.make {
        $0.textAlignment = .center
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subViews()
        contentView.backgroundColor = .white
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func subViews() {
        contentView.addSubviews([
            container.addArrangedSubviews([
                leftStack.addArrangedSubviews([
                    leftTitle,
                    leftImage
                ]),
                arrowStack.addArrangedSubviews([
                    minimumLevelLabel,
                    arrowImage
                ]),
                rightStack.addArrangedSubviews([
                    rightTitle,
                    rightImage
                ])
            ])
        ])
    }
    
    func setContent(with firstEvolve: EvolutionChainsResponse, indexPath: IndexPath, image: [String]) {
        switch indexPath.row {
        case 0:
            self.leftTitle.text = firstEvolve.chain?.species?.name ?? ""
            self.rightTitle.text = firstEvolve.chain?.evolvesTo?[0].species?.name ?? ""
            self.minimumLevelLabel.text = "Lv.\(firstEvolve.chain?.evolvesTo?[0].evolutionDetails?[0].minLevel ?? 0)"
            if image.count >= 2 {
                self.leftImage.loadImage(url: image[0], placeholder: UIImage())
                self.rightImage.loadImage(url: image[1], placeholder: UIImage())
            }
        case 1:
            self.leftTitle.text = firstEvolve.chain?.evolvesTo?[0].species?.name ?? ""
            self.rightTitle.text = firstEvolve.chain?.evolvesTo?[0].evolvesTo?[0].species?.name ?? ""
            self.minimumLevelLabel.text = "Lv.\(firstEvolve.chain?.evolvesTo?[0].evolvesTo?[0].evolutionDetails?[0].minLevel ?? 0)"
            self.leftImage.loadImage(url: image[1], placeholder: UIImage())
            
            if image.count >= 3 {
                self.rightImage.loadImage(url: image[2], placeholder: UIImage())
            }
        default:
            break
        }
       
    }
}
