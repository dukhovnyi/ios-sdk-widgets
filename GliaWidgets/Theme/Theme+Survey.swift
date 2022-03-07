extension Theme {
    var surveyStyle: SurveyStyle {
        SurveyStyle(
            dimmedBackgroundColor: color.baseDark.withAlphaComponent(0.4),
            backgroundColor: color.background,
            cornerRadius: 24.0,
            title: SurveyStyle.Title(
                font: font.header1,
                color: color.baseDark
            )
        )
    }
}
