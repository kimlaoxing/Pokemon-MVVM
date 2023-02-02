import Declayout
import Components
import UIKit

final class DetailPokemonCaptureView: UIView {
    
    private lazy var container = UIStackView.make {
        $0.axis = .vertical
        $0.spacing = Padding.reguler
        $0.horizontalPadding(to: self, Padding.double)
        $0.verticalPadding(to: self, Padding.reguler)
    }
    
    private lazy var componentsStack = UIStackView.make {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
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
    
    private lazy var habitsSection = BreedingAndCaptureComponents()
    private lazy var generationSection = BreedingAndCaptureComponents()
    private lazy var captureRateSection = BreedingAndCaptureComponents()
    
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
                    habitsSection,
                    leftSeparator,
                    generationSection,
                    rightSeparator,
                    captureRateSection
                ])
            ])
        ])
    }
    
    func setContent(with response: DetailPokemonSpecies) {
        self.titleLabel.text = "Capture"
        habitsSection.setContent(with: "Habits",
                                 descriptionTop: response.habitat?.name ?? "",
                                 descriptionLow: "")
        generationSection.setContent(with: "Generation",
                                     descriptionTop: response.generation?.name ?? "",
                                     descriptionLow: "")
        captureRateSection.setContent(with: "Capture Rate",
                                      descriptionTop: "\(response.captureRate ?? 0)",
                                      descriptionLow: "")
    }
}
