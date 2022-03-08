import UIKit

final class SurveyQuestionView: UIView {
    private let titleLabel = UILabel()
    private let stackView = UIStackView()
    private let errorLabel = UILabel()

    init() {
        super.init(frame: .zero)

        setup()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {}
    private func layout() {}
}
