import Declayout
import UIKit
import Foundation
import Components

final class DetailPokemonStatus: UIView {
    
    private lazy var container = UIStackView.make {
        $0.axis = .vertical
        $0.spacing = Padding.half
        $0.edges(to: self, Padding.reguler)
    }
    
    private lazy var hpBar = StatusBar()
    private lazy var atkBar = StatusBar()
    private lazy var defBar = StatusBar()
    private lazy var specialAtkBar = StatusBar()
    private lazy var specialDefBar = StatusBar()
    private lazy var speedBar = StatusBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        subViews()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func subViews() {
        container.addArrangedSubviews([
            hpBar,
            atkBar,
            defBar,
            specialDefBar,
            specialDefBar,
            speedBar
        ])
    }
    
    func setContent(with data: DetailPokemonResponse) {
        hpBar.setContent(with: data.stats?[0].stat?.name ?? "",
                             numberStat: "\(data.stats?[0].baseStat ?? 0)",
                             statusBar: data.stats?[0].baseStat ?? 0)
        atkBar.setContent(with: data.stats?[1].stat?.name ?? "",
                             numberStat: "\(data.stats?[1].baseStat ?? 0)",
                             statusBar: data.stats?[1].baseStat ?? 0)
        defBar.setContent(with: data.stats?[2].stat?.name ?? "",
                             numberStat: "\(data.stats?[2].baseStat ?? 0)",
                             statusBar: data.stats?[2].baseStat ?? 0)
        specialAtkBar.setContent(with: data.stats?[3].stat?.name ?? "",
                             numberStat: "\(data.stats?[3].baseStat ?? 0)",
                             statusBar: data.stats?[3].baseStat ?? 0)
        specialDefBar.setContent(with: data.stats?[4].stat?.name ?? "",
                             numberStat: "\(data.stats?[4].baseStat ?? 0)",
                             statusBar: data.stats?[4].baseStat ?? 0)
        speedBar.setContent(with: data.stats?[5].stat?.name ?? "",
                             numberStat: "\(data.stats?[5].baseStat ?? 0)",
                             statusBar: data.stats?[5].baseStat ?? 0)
    }
    
}
