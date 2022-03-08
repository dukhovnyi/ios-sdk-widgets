import UIKit

// TODO: docs
public class SurveyStyle {
    public var title: TitleStyle
    public var questions: QuestionStyle
    public var buttons: ButtonsStyle
    public var dimmedBackgroundColor: UIColor
    public var backgroundColor: UIColor
    public var cornerRadius: CGFloat

    public init(
        dimmedBackgroundColor: UIColor,
        backgroundColor: UIColor,
        cornerRadius: CGFloat,
        title: TitleStyle,
        questions: QuestionStyle,
        buttons: ButtonsStyle
    ) {
        self.dimmedBackgroundColor = dimmedBackgroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.title = title
        self.questions = questions
        self.buttons = buttons
    }
}

extension SurveyStyle {
    public class TitleStyle {
        public var font: UIFont
        public var color: UIColor

        public init(
            font: UIFont,
            color: UIColor
        ) {
            self.font = font
            self.color = color
        }
    }
}

extension SurveyStyle {
    public class ButtonsStyle {
        public var submit: ActionButtonStyle
        public var cancel: ActionButtonStyle

        public init(
            submit: ActionButtonStyle,
            cancel: ActionButtonStyle
        ) {
            self.submit = submit
            self.cancel = cancel
        }
    }
}

extension SurveyStyle {
    public class QuestionStyle {
        public var scaleQuestionStyle: ScaleStyle
        public var yesNoQuestionStyle: YesNoStyle
        public var singleChoiceQuestionStyle: SingleChoiceStyle
        public var openTextQuestionStyle: OpenTextStyle

        public init(
            scaleQuestionStyle: ScaleStyle,
            yesNoQuestionStyle: YesNoStyle,
            singleChoiceQuestionStyle: SingleChoiceStyle,
            openTextQuestionStyle: OpenTextStyle
        ) {
            self.scaleQuestionStyle = scaleQuestionStyle
            self.yesNoQuestionStyle = yesNoQuestionStyle
            self.singleChoiceQuestionStyle = singleChoiceQuestionStyle
            self.openTextQuestionStyle = openTextQuestionStyle
        }
    }
}

extension SurveyStyle.QuestionStyle {
    public class ScaleStyle {
        public var normalStyle: ItemStyle
        public var selectedStyle: ItemStyle
        public var errorStyle: ItemStyle

        public init(
            normalStyle: ItemStyle,
            selectedStyle: ItemStyle,
            errorStyle: ItemStyle
        ) {
            self.normalStyle = normalStyle
            self.selectedStyle = selectedStyle
            self.errorStyle = errorStyle
        }
    }

    public class YesNoStyle {
        public var normalStyle: ItemStyle
        public var selectedStyle: ItemStyle
        public var errorStyle: ItemStyle

        public init(
            normalStyle: ItemStyle,
            selectedStyle: ItemStyle,
            errorStyle: ItemStyle
        ) {
            self.normalStyle = normalStyle
            self.selectedStyle = selectedStyle
            self.errorStyle = errorStyle
        }
    }

    public class SingleChoiceStyle {
        public init() {}
    }

    public class OpenTextStyle {
        public init() {}
    }

    public class ErrorStyle {
        public var color: UIColor
        public var labelFont: UIFont
        public var requiredFieldText: String

        public init(
            color: UIColor,
            labelFont: UIFont,
            requiredFieldText: String
        ) {
            self.color = color
            self.labelFont = labelFont
            self.requiredFieldText = requiredFieldText
        }
    }
}

extension SurveyStyle.QuestionStyle.YesNoStyle {
    public class ItemStyle {
        public var backgroundColor: UIColor
        public var borderColor: UIColor
        public var textColor: UIColor
        public var textFont: UIFont

        public init(
            backgroundColor: UIColor,
            borderColor: UIColor,
            textColor: UIColor,
            textFont: UIFont
        ) {
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
            self.textColor = textColor
            self.textFont = textFont
        }
    }
}

extension SurveyStyle.QuestionStyle.ScaleStyle {
    public class ItemStyle {
        public var backgroundColor: UIColor
        public var borderColor: UIColor
        public var textColor: UIColor
        public var textFont: UIFont

        public init(
            backgroundColor: UIColor,
            borderColor: UIColor,
            textColor: UIColor,
            textFont: UIFont
        ) {
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
            self.textColor = textColor
            self.textFont = textFont
        }
    }
}
