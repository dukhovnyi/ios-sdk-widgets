final class SurveyViewModel: ViewModel {
    typealias Survey = CoreSdkClient.Survey

    enum Event {
        case viewDidLoad
        case submit
        case cancel
    }

    enum Action {
        case setTitle(String)
        case addScaleQuestion(
            item: SurveyItem,
            scale: [Int],
            answer: ((Int) -> Void)
        )
        case addTextQuestion(
            item: SurveyItem,
            answer: ((String) -> Void)
        )
        case addBooleanQuestion(
            item: SurveyItem,
            answer: ((Bool) -> Void)
        )
    }

    enum DelegateEvent {}

    var action: ((Action) -> Void)?
    var delegate: ((DelegateEvent) -> Void)?

    private let survey: Survey
    private let engagementId: String
    private let environment: Environment

    private var questionsAndAnswers: [Survey.Question: Survey.Answer?] = [:] {
        didSet { print(questionsAndAnswers) } // TODO: remove
    }

    private var items: [SurveyItem] = []

    init(
        survey: CoreSdkClient.Survey,
        engagementId: String,
        environment: Environment
    ) {
        self.survey = survey
        self.engagementId = engagementId
        self.environment = environment
    }

    func event(_ event: Event) {
        switch event {
        case .viewDidLoad:
            viewDidLoad()

        case .submit:
            submit()

        case .cancel:
            cancel()
        }
    }

    private func viewDidLoad() {
        action?(.setTitle(survey.title))

        for question in survey.questions {
            switch question.type {
            case .text:
                addTextQuestion(question)

            case .scale:
                addScaleQuestion(question)

            case .boolean:
                addBooleanQuestion(question)

            case .singleChoice:
                addSingleChoiceQuestion(question)

            @unknown default:
                break
            }
        }
    }

    private func submit() {
        guard validateAnswers() else { return }

        let answers: [Survey.Answer] = items
            .compactMap({ $0.state.answer })

        environment.submitSurveyAnswer(answers, survey.id, engagementId) {
            switch $0 {
            case .success:
                print("success")

            case .failure(let error):
                print(error.reason, error.error)
            }
        }
    }

    private func cancel() {}

    private func validateAnswers() -> Bool {
        for var item in items {
            if item.question.required && item.state.answer == nil {
                item.state = .error
                return false
            }
        }

        return true
    }

    private func addTextQuestion(_ question: Survey.Question) {

    }

    private func addBooleanQuestion(_ question: Survey.Question) {

    }

    private func addSingleChoiceQuestion(_ question: Survey.Question) {

    }

    private func addScaleQuestion(_ question: Survey.Question) {
        let item = SurveyItem(question: question)
        let scale = [1, 2, 3, 4, 5]
        let answer: ((Int) -> Void) = { [weak self] answer in
            self?.questionsAndAnswers[question] = Survey.Answer(
                questionId: question.id,
                response: .int(answer)
            )
        }

        items.append(item)

        action?(
            .addScaleQuestion(
                item: item,
                scale: scale,
                answer: answer
            )
        )
    }
}

extension SurveyViewModel {
    struct Environment {
        var submitSurveyAnswer: CoreSdkClient.SubmitSurveyAnswer
    }
}

extension CoreSdkClient.Survey.Question: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension SurveyViewModel {
    struct SurveyItem {
        enum State {
            case normal
            case answered(Survey.Answer)
            case error
        }

        var state: State = .normal

        fileprivate let question: Survey.Question
    }
}

extension SurveyViewModel.SurveyItem.State {
    var answer: CoreSdkClient.Survey.Answer? {
        switch self {
        case .answered(let answer):
            return answer

        default:
            return nil
        }
    }
}
