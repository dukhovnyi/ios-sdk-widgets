final class SurveyViewModel: ViewModel {
    enum Event {
        case viewDidLoad
    }

    enum Action {
        case setTitle(String)
    }

    enum DelegateEvent {}

    var action: ((Action) -> Void)?
    var delegate: ((DelegateEvent) -> Void)?

    private let survey: CoreSdkClient.Survey

    init(survey: CoreSdkClient.Survey) {
        self.survey = survey
    }

    func event(_ event: Event) {
        switch event {
        case .viewDidLoad:
            viewDidLoad()
        }
    }

    private func viewDidLoad() {
        action?(.setTitle(survey.title))
    }
}
