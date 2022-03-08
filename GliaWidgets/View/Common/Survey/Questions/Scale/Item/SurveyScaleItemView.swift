import UIKit
import PureLayout

final class SurveyScaleItemView: UIView {
    enum State {
        case normal
        case selected
        case error
    }

    var state: State = .normal {
        didSet { apply(itemStyle: style(for: state)) }
    }

    private let style: SurveyStyle.QuestionStyle.ScaleStyle
    private let label = UILabel()

    init(style: SurveyStyle.QuestionStyle.ScaleStyle) {
        self.style = style

        super.init(frame: .zero)

        setup()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        layer.borderWidth = 1
        layer.cornerRadius = 4

        apply(itemStyle: style.normalStyle)
    }

    private func layout() {
        addSubview(label)
        label.autoPinEdgesToSuperviewEdges(with: .uniform(16))
    }

    private func style(
        for state: State
    ) -> SurveyStyle.QuestionStyle.ScaleStyle.ItemStyle {
        switch state {
        case .normal:
            return style.normalStyle

        case .selected:
            return style.selectedStyle

        case .error:
            return style.errorStyle
        }
    }

    private func apply(
        itemStyle: SurveyStyle.QuestionStyle.ScaleStyle.ItemStyle
    ) {
        backgroundColor = itemStyle.backgroundColor
        layer.borderColor = itemStyle.borderColor.cgColor
        label.textColor = itemStyle.textColor
        label.font = itemStyle.textFont
    }
}
