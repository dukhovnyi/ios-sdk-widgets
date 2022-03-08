extension Theme {
    var surveyStyle: SurveyStyle {
        let cancelAction = ActionButtonStyle(
            title: L10n.Survey.Action.cancel,
            titleFont: font.buttonLabel,
            titleColor: color.baseLight,
            backgroundColor: color.systemNegative
        )

        let submitAction = ActionButtonStyle(
            title: L10n.Survey.Action.submit,
            titleFont: font.buttonLabel,
            titleColor: color.baseLight,
            backgroundColor: color.primary
        )

        return SurveyStyle(
            dimmedBackgroundColor: color.baseDark.withAlphaComponent(0.4),
            backgroundColor: color.background,
            cornerRadius: 24.0,
            title: SurveyStyle.TitleStyle(
                font: font.header1,
                color: color.baseDark
            ),
            questions: SurveyStyle.QuestionStyle(
                scaleQuestionStyle: scaleQuestionStyle,
                yesNoQuestionStyle: yesNoQuestionStyle,
                singleChoiceQuestionStyle: .init(),
                openTextQuestionStyle: .init()
            ),
            buttons: SurveyStyle.ButtonsStyle(
                submit: submitAction,
                cancel: cancelAction
            )
        )
    }

    fileprivate var scaleQuestionStyle: SurveyStyle.QuestionStyle.ScaleStyle {
        let normalStyle = SurveyStyle.QuestionStyle.ScaleStyle.ItemStyle(
            backgroundColor: color.background,
            borderColor: color.baseShade,
            textColor: color.baseDark,
            textFont: font.bodyText
        )

        let selectedStyle = SurveyStyle.QuestionStyle.ScaleStyle.ItemStyle(
            backgroundColor: color.primary,
            borderColor: color.primary,
            textColor: color.baseLight,
            textFont: font.bodyText
        )

        let errorStyle = SurveyStyle.QuestionStyle.ScaleStyle.ItemStyle(
            backgroundColor: color.background,
            borderColor: color.systemNegative,
            textColor: color.baseDark,
            textFont: font.bodyText
        )

        return .init(
            normalStyle: normalStyle,
            selectedStyle: selectedStyle,
            errorStyle: errorStyle
        )
    }

    fileprivate var yesNoQuestionStyle: SurveyStyle.QuestionStyle.YesNoStyle {
        let normalStyle = SurveyStyle.QuestionStyle.YesNoStyle.ItemStyle(
            backgroundColor: color.background,
            borderColor: color.baseShade,
            textColor: color.baseDark,
            textFont: font.bodyText
        )

        let selectedStyle = SurveyStyle.QuestionStyle.YesNoStyle.ItemStyle(
            backgroundColor: color.primary,
            borderColor: color.primary,
            textColor: color.baseLight,
            textFont: font.bodyText
        )

        let errorStyle = SurveyStyle.QuestionStyle.YesNoStyle.ItemStyle(
            backgroundColor: color.background,
            borderColor: color.systemNegative,
            textColor: color.baseDark,
            textFont: font.bodyText
        )

        return .init(
            normalStyle: normalStyle,
            selectedStyle: selectedStyle,
            errorStyle: errorStyle
        )
    }
}
