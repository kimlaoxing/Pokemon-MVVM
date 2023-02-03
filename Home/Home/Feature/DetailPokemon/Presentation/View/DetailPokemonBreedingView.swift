import Declayout
import Components
import UIKit

final class DetailPokemonBreedingView: UIView {
    
    private lazy var container = UIStackView.make {
        $0.axis = .vertical
        $0.spacing = Padding.reguler
        $0.verticalPadding(to: self, Padding.reguler)
        $0.horizontalPadding(to: self, Padding.double * 2)
    }
    
    private lazy var componentsStack = UIStackView.make {
        $0.axis = .horizontal
        $0.distribution = .equalCentering
        $0.alignment = .fill
    }
    
    private lazy var leftSeparator = UIView.make {
        $0.width(1)
        $0.tintColor = .systemGray3
        $0.backgroundColor = .systemGray3
    }
    
    private lazy var rightSeparator = UIView.make {
        $0.width(1)
        $0.tintColor = .systemGray3
        $0.backgroundColor = .systemGray3
    }
    
    private lazy var titleLabel = UILabel.make {
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    private lazy var eggGroupSection = BreedingAndCaptureComponents()
    private lazy var hatchTimeSection = BreedingAndCaptureComponents()
    private lazy var gendreSection = BreedingAndCaptureComponents()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        subViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func subViews() {
        addSubviews([
            container.addArrangedSubviews([
                titleLabel,
                componentsStack.addArrangedSubviews([
                    eggGroupSection,
                    leftSeparator,
                    hatchTimeSection,
                    rightSeparator,
                    gendreSection
                ])
            ])
        ])
    }
    
    func setContent(with response: DetailPokemonSpecies) {
        self.titleLabel.text = "Breeding"
        if response.eggGroups?.count ?? 0 >= 2 {
            eggGroupSection.setContent(with: "Egg Group",
                                       descriptionTop: response.eggGroups?.first?.name ?? "",
                                       descriptionLow: response.eggGroups?[1].name ?? "")
        } else {
            eggGroupSection.setContent(with: "Egg Group",
                                       descriptionTop: response.eggGroups?.first?.name ?? "",
                                       descriptionLow: "")
        }
        
        hatchTimeSection.setContent(with: "Hatch Time", descriptionTop: "\(response.hatchCounter ?? 0) Cycle", descriptionLow: "")
        gendreSection.setContent(with: "Gender Rate", descriptionTop: "\(response.genderRate ?? 0) / 10", descriptionLow: "")
    }
}
