import UIKit
import GliaWidgets

private struct Section {
    let title: String
    let cells: [SettingsCell]
}

class SettingsViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private var sections = [Section]()
    private var authorizationMethodCell: SettingsSegmentedCell!
    private var appTokenCell: SettingsTextCell!
    private var siteApiKeyIdCell: SettingsTextCell!
    private var siteApiKeySecretCell: SettingsTextCell!
    private var siteCell: SettingsTextCell!
    private var queueIDCell: SettingsTextCell!
    private var bubbleFeatureCell: SettingsSwitchCell!
    private var primaryColorCell: SettingsColorCell!
    private var secondaryColorCell: SettingsColorCell!
    private var baseNormalColorCell: SettingsColorCell!
    private var baseLightColorCell: SettingsColorCell!
    private var baseDarkColorCell: SettingsColorCell!
    private var baseShadeColorCell: SettingsColorCell!
    private var backgroundColorCell: SettingsColorCell!
    private var systemNegativeColorCell: SettingsColorCell!
    private var header1FontCell: SettingsFontCell!
    private var header2FontCell: SettingsFontCell!
    private var header3FontCell: SettingsFontCell!
    private var bodyTextFontCell: SettingsFontCell!
    private var subtitleFontCell: SettingsFontCell!
    private var mediumSubtitleFontCell: SettingsFontCell!
    private var captionFontCell: SettingsFontCell!
    private var buttonLabelFontCell: SettingsFontCell!

    private var configurationSection = Section(
        title: "Glia configuration",
        cells: []
    )

    var theme: Theme = Theme()
    var conf: Configuration { loadConf() }
    var queueID: String { loadQueueID() }
    var features: Features { loadFeatures() }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .white

        let doneItem = UIBarButtonItem(title: "Done",
                                       style: .done,
                                       target: self,
                                       action: #selector(doneTapped))
        navigationItem.rightBarButtonItem = doneItem

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50

        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewSafeArea()

        createCells()
        updateConfigurationSection()
    }

    // swiftlint:disable function_body_length
    private func createCells() {
        authorizationMethodCell = SettingsSegmentedCell(
            title: "Site authorization method",
            items: "app-token", "site-api-key"
        )
        authorizationMethodCell.segmentedControl.addTarget(
            self,
            action: #selector(authMethodDidChange(sender:)),
            for: .valueChanged
        )
        switch conf.authorizationMethod {
        case .appToken:
            authorizationMethodCell.segmentedControl.selectedSegmentIndex = 0
        case .siteApiKey:
            authorizationMethodCell.segmentedControl.selectedSegmentIndex = 1
        }
        appTokenCell = SettingsTextCell(
            title: "App token:",
            text: conf.appToken
        )
        siteApiKeyIdCell = SettingsTextCell(
            title: "Identifier:",
            text: conf.siteApiKeyId
        )
        siteApiKeySecretCell = SettingsTextCell(
            title: "Secret:",
            text: conf.siteApiKeySecret
        )
        siteCell = SettingsTextCell(
            title: "Site:",
            text: conf.site
        )
        queueIDCell = SettingsTextCell(
            title: "Queue ID:",
            text: queueID
        )

        bubbleFeatureCell = SettingsSwitchCell(
            title: "Present \"Bubble\" overlay in engagement time",
            isOn: features ~= .bubbleView
        )
        let featuresSection = Section(
            title: "Features",
            cells: [bubbleFeatureCell]
        )

        primaryColorCell = SettingsColorCell(title: "Primary:",
                                             color: theme.color.primary)
        secondaryColorCell = SettingsColorCell(title: "Secondary:",
                                               color: theme.color.secondary)
        baseNormalColorCell = SettingsColorCell(title: "Base normal:",
                                                color: theme.color.baseNormal)
        baseLightColorCell = SettingsColorCell(title: "Base light:",
                                               color: theme.color.baseLight)
        baseDarkColorCell = SettingsColorCell(title: "Base dark:",
                                              color: theme.color.baseDark)
        baseShadeColorCell = SettingsColorCell(title: "Base shade:",
                                               color: theme.color.baseShade)
        backgroundColorCell = SettingsColorCell(title: "Background:",
                                                color: theme.color.background)
        systemNegativeColorCell = SettingsColorCell(title: "System negative:",
                                                    color: theme.color.systemNegative)
        var colorCells = [SettingsCell]()
        colorCells.append(primaryColorCell)
        colorCells.append(secondaryColorCell)
        colorCells.append(baseNormalColorCell)
        colorCells.append(baseLightColorCell)
        colorCells.append(baseDarkColorCell)
        colorCells.append(baseShadeColorCell)
        colorCells.append(backgroundColorCell)
        colorCells.append(systemNegativeColorCell)

        let colorSection = Section(title: "Theme colors (RRGGBB Alpha)",
                                   cells: colorCells)

        header1FontCell = SettingsFontCell(title: "Header1",
                                           defaultFont: theme.font.header1)
        header2FontCell = SettingsFontCell(title: "Header2",
                                           defaultFont: theme.font.header2)
        header3FontCell = SettingsFontCell(title: "Header3",
                                           defaultFont: theme.font.header3)
        bodyTextFontCell = SettingsFontCell(title: "Body text",
                                            defaultFont: theme.font.bodyText)
        subtitleFontCell = SettingsFontCell(title: "Subtitle",
                                            defaultFont: theme.font.subtitle)
        mediumSubtitleFontCell = SettingsFontCell(title: "Medium subtitle",
                                                  defaultFont: theme.font.mediumSubtitle)
        captionFontCell = SettingsFontCell(title: "Caption",
                                            defaultFont: theme.font.caption)
        buttonLabelFontCell = SettingsFontCell(title: "Button label",
                                               defaultFont: theme.font.buttonLabel)
        var fontCells = [SettingsCell]()
        fontCells.append(header1FontCell)
        fontCells.append(header2FontCell)
        fontCells.append(header3FontCell)
        fontCells.append(bodyTextFontCell)
        fontCells.append(subtitleFontCell)
        fontCells.append(mediumSubtitleFontCell)
        fontCells.append(captionFontCell)
        fontCells.append(buttonLabelFontCell)

        let fontSection = Section(title: "Fonts",
                                  cells: fontCells)

        sections.append(configurationSection)
        sections.append(featuresSection)
        sections.append(colorSection)
        sections.append(fontSection)

        tableView.reloadData()
    }

    @objc
    func authMethodDidChange(sender: UISegmentedControl) {
        updateConfigurationSection()
        tableView.reloadData()
    }

    private func updateConfigurationSection() {
        var cells = [SettingsCell]()
        cells.append(authorizationMethodCell)
        switch authorizationMethodCell.segmentedControl.selectedSegmentIndex {
        case 0:
            cells.append(appTokenCell)
        case 1:
            cells.append(siteApiKeyIdCell)
            cells.append(siteApiKeySecretCell)
        default:
            break
        }
        cells.append(siteCell)
        cells.append(queueIDCell)
        configurationSection = Section(
            title: "Glia configuration",
            cells: cells
        )
        sections[0] = configurationSection
    }

    private func loadConf() -> Configuration {
        let authorizationMethod = UserDefaults.standard.integer(forKey: "conf.authorizationMethod")
        let appToken = UserDefaults.standard.string(forKey: "conf.appToken") ?? ""
        let siteApiKeyId = UserDefaults.standard.string(forKey: "conf.siteApiKeyId") ?? ""
        let siteApiKeySecret = UserDefaults.standard.string(forKey: "conf.siteApiKeySecret") ?? ""
        let site = UserDefaults.standard.string(forKey: "conf.site") ?? ""
        return Configuration(
            authorizationMethod: authorizationMethod == 0 ? .appToken(appToken) : .siteApiKey(id: siteApiKeyId, secret: siteApiKeySecret),
            environment: .beta,
            site: site
        )
    }

    private func loadQueueID() -> String {
        let queueID = UserDefaults.standard.string(forKey: "conf.queueID") ?? ""
        return queueID
    }

    private func loadFeatures() -> Features {
        guard let savedValue = UserDefaults.standard.value(forKey: "conf.features") as? Int else {
            return .all
        }
        return Features(rawValue: savedValue)
    }

    private func saveConf() {
        UserDefaults.standard.setValue(
            authorizationMethodCell.segmentedControl.selectedSegmentIndex,
            forKey: "conf.authorizationMethod"
        )
        UserDefaults.standard.setValue(appTokenCell.textField.text ?? "", forKey: "conf.appToken")
        UserDefaults.standard.setValue(siteApiKeyIdCell.textField.text ?? "", forKey: "conf.siteApiKeyId")
        UserDefaults.standard.setValue(siteApiKeySecretCell.textField.text ?? "", forKey: "conf.siteApiKeySecret")
        UserDefaults.standard.setValue(siteCell.textField.text ?? "", forKey: "conf.site")
        UserDefaults.standard.setValue(queueIDCell.textField.text ?? "", forKey: "conf.queueID")

        var features = Features.all
        if !bubbleFeatureCell.switcher.isOn {
            features.remove(.bubbleView)
        }
        UserDefaults.standard.setValue(features.rawValue, forKey: "conf.features")
    }

    private func makeConf() -> Configuration {
        return Configuration(appToken: appTokenCell.textField.text ?? "",
                             environment: .europe,
                             site: siteCell.textField.text ?? "")
    }

    private func makeTheme() -> Theme {
        let color = ThemeColor(primary: primaryColorCell.color,
                               secondary: secondaryColorCell.color,
                               baseNormal: baseNormalColorCell.color,
                               baseLight: baseLightColorCell.color,
                               baseDark: baseDarkColorCell.color,
                               baseShade: baseShadeColorCell.color,
                               background: backgroundColorCell.color,
                               systemNegative: systemNegativeColorCell.color)
        let font = ThemeFont(header1: header1FontCell.selectedFont,
                             header2: header2FontCell.selectedFont,
                             header3: header3FontCell.selectedFont,
                             bodyText: bodyTextFontCell.selectedFont,
                             subtitle: subtitleFontCell.selectedFont,
                             mediumSubtitle: mediumSubtitleFontCell.selectedFont,
                             caption: captionFontCell.selectedFont,
                             buttonLabel: buttonLabelFontCell.selectedFont)

        let colorStyle: ThemeColorStyle = .custom(color)
        let fontStyle: ThemeFontStyle = .custom(font)

        return Theme(colorStyle: colorStyle,
                     fontStyle: fontStyle)
    }

    @objc private func doneTapped() {
        saveConf()
        theme = makeTheme()
        dismiss(animated: true, completion: nil)
    }
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section].cells[indexPath.row]
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}

extension SettingsViewController: UITableViewDelegate {}

private extension Configuration {

    var siteApiKeyId: String {
        switch authorizationMethod {
        case .siteApiKey(let id, _):
            return id
        default:
            return ""
        }
    }

    var siteApiKeySecret: String {
        switch authorizationMethod {
        case .siteApiKey(_, let secret):
            return secret
        default:
            return ""
        }
    }
}
