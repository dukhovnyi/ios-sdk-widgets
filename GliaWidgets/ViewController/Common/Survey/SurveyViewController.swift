import UIKit

final class SurveyViewController: ViewController {
    private let viewModel: SurveyViewModel
    private let viewFactory: ViewFactory

    init(
        viewModel: SurveyViewModel,
        viewFactory: ViewFactory
    ) {
        self.viewModel = viewModel
        self.viewFactory = viewFactory

        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = .fullScreen
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let view = viewFactory.makeSurveyView()
        self.view = view

        bind(view: view, viewModel: viewModel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.event(.viewDidLoad)
    }

    private func bind(view: SurveyView, viewModel: SurveyViewModel) {
        view.buttonsView.onCancel = { [weak viewModel] in
            viewModel?.event(.cancel)
        }

        view.buttonsView.onSubmit = { [weak viewModel] in
            viewModel?.event(.submit)
        }

        viewModel.action = { [weak view] action in
            switch action {
            case .setTitle(let title):
                view?.titleView.title = title

            case .addScaleQuestion(
                let item,
                let scale,
                let answer
            ): break

            case .addTextQuestion(
                let item,
                let answer
            ): break

            case .addBooleanQuestion(
                let item,
                let answer
            ): break
            }
        }
    }
}
