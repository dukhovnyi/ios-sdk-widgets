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
        viewModel.action = { [weak view] action in
            switch action {
            case .setTitle(let title):
                view?.title = title
            }
        }
    }
}
