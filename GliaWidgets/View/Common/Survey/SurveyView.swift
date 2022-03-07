import UIKit
import PureLayout

final class SurveyView: UIView {
    var title: String? {
        didSet {
            titleView.title = title
        }
    }

    private let style: SurveyStyle
    private let contentView = UIView()
    private let contentStackView = UIStackView()
    private let questionsScrollView = UIScrollView()

    private lazy var questionsView: SurveyQuestionsView = {
        SurveyQuestionsView()
    }()

    private lazy var buttonsView: SurveyButtonsView = {
        SurveyButtonsView()
    }()

    private lazy var titleView: SurveyTitleView = {
        SurveyTitleView(style: style.title)
    }()

    init(style: SurveyStyle) {
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
        backgroundColor = style.dimmedBackgroundColor

        contentView.backgroundColor = style.backgroundColor
        contentView.layer.cornerRadius = style.cornerRadius
        contentView.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]

        contentStackView.axis = .vertical
    }

    private func layout() {
        addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        contentView.autoPinEdge(
            toSuperviewSafeArea: .top,
            withInset: 60,
            relation: .greaterThanOrEqual
        )

        contentView.addSubview(contentStackView)
        contentStackView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        contentStackView.autoPinEdge(toSuperviewSafeArea: .bottom)

        contentStackView.addArrangedSubviews([
            titleView,
            questionsScrollView,
            buttonsView
        ])

        questionsScrollView.addSubview(questionsView)
        questionsView.autoPinEdgesToSuperviewEdges()
        questionsView.autoMatch(.width, to: .width, of: questionsScrollView)
    }
}
