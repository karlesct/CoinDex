//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class MainViewController: UIViewController {

    // MARK: - IBoutlets

    @IBOutlet weak var tutorialButton: UIButton! {
        didSet {
            self.tutorialButton.setTitle("Open Tutorial",
                                         for: .normal)

            self.tutorialButton.addTarget(self,
                                          action: #selector(self.tutorialButtonAction),
                                          for: .touchUpInside)
        }
    }

    @IBOutlet weak var chatButton: UIButton! {
        didSet {
            self.chatButton.setTitle("Open Chat",
                                     for: .normal)

            self.chatButton.addTarget(self,
                                      action: #selector(self.chatButtonAction),
                                      for: .touchUpInside)
        }
    }

    @IBOutlet weak var formButton: UIButton! {
        didSet {
            self.formButton.setTitle("Open form",
                                     for: .normal)

            self.formButton.addTarget(self,
                                      action: #selector(self.formButtonAction),
                                      for: .touchUpInside)
        }
    }

    @IBOutlet weak var tabBarButton: UIButton!{
        didSet {
            self.tabBarButton.setTitle("Open tabBar",
                                       for: .normal)
            self.tabBarButton.addTarget(self,
                                        action: #selector(self.tabBarButtonAction),
                                        for: .touchUpInside)
        }
    }


    @IBOutlet weak var tAndCButton: UIButton! {
        didSet {
            self.tAndCButton.setTitle("Open TandC",
                                      for: .normal)
            self.tAndCButton.addTarget(self,
                                       action: #selector(self.tAndCButtonAction),
                                       for: .touchUpInside)
        }
    }
    @IBOutlet weak var mediaPickerButton: UIButton! {
        didSet {
            self.mediaPickerButton.setTitle("Open mediaPicker",
                                            for: .normal)
            self.mediaPickerButton.addTarget(self,
                                             action: #selector(self.mediaPickerButtonAction),
                                             for: .touchUpInside)
        }
    }

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            self.loginButton.setTitle("Open login",
                                      for: .normal)
            self.loginButton.addTarget(self,
                                       action: #selector(self.loginButtonAction),
                                       for: .touchUpInside)
        }
    }

    @IBOutlet weak var fuelButton: UIButton! {
        didSet {
            self.fuelButton.setTitle("Open fuel main",
                                      for: .normal)
            self.fuelButton.addTarget(self,
                                       action: #selector(self.fuelButtonAction),
                                       for: .touchUpInside)
        }
    }
    //    var imagePicker: ImagePicker {
    //        let mediaPicker = ImagePicker(presentationController: self,
    //                                      delegate: self)
    //        return mediaPicker
    //    }

    private lazy var imagePicker: ImagePicker = {
        let imagePicker = ImagePicker()
        imagePicker.delegate = self
        return imagePicker
    }()

    // MARK: - Properties

    var viewModel: MainViewModelProtocol?
    var navigator: MainNavigator?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let configAPI = ConfigLoader.parseFile().API
        else { return }
        print(configAPI)
        //        let baseURL = configAPI.Scheme + configAPI.Host + configAPI.Path

        //        let test = test()
        //        let request = PingRequest(baseURL: baseURL)
        //        let request = CoinsListRequest(baseURL: baseURL)
        //        let request = FinancePlatformsRequest(baseURL: baseURL)
        //        let request = GlobalGlobalRequest(baseURL: baseURL)
        //        let request = GlobalDecentralizedFinanceDefiRequest(baseURL: baseURL)
        //        let request = TrendingRequest(baseURL: baseURL)
        //        let request = ExchangeRateRequest(baseURL: baseURL)
        //        let request = AssetPlatformsRequest(baseURL: baseURL)
        //        let request = CategoriesListRequest(baseURL: baseURL)
        //        let request = CategoriesRequest(baseURL: baseURL)
        //        let request = EventsCountriesRequest(baseURL: baseURL)
        //        let request = EventTypesRequest(baseURL: baseURL)
        //        let request = EventsRequest(baseURL: baseURL)
        //        let request = CompaniesRequest(baseURL: baseURL)
        //        let request = StatusUpdateRequest(baseURL: baseURL)
        //        let request = DerivativesRequest(baseURL: baseURL)
        //        let request = DerivativesExchangesRequest(baseURL: baseURL)
        //        let request = DerivativesExchangesListRequest(baseURL: baseURL)
        //        let request = DerivativesExchangeDataRequest(baseURL: baseURL)
        //        let request = IndexesRequest(baseURL: baseURL)
        //        let request = IndexesListRequest(baseURL: baseURL)
        //        let request = FinanceProductsRequest(baseURL: baseURL)
        //        let request = SimpleSupportedVsCurrenciesRequest(baseURL: baseURL)
        //        let request = ExchangesRequest(baseURL: baseURL)
        //        let request = ExchangesListRequest(baseURL: baseURL)
        //        let request = ExchangesIdRequest(baseURL: baseURL)
        //        let request = ExchangesIdVolumeChartRequest(baseURL: baseURL)
        //        let request = CoinsMarketsRequest(baseURL: baseURL)
        //        let request = CoinsIdRequest(baseURL: baseURL)

        //        test.fetch(request: request)
    }


    // MARK: - Methods

    
}

// MARK: - Button actions

extension MainViewController {

    @objc func tutorialButtonAction() {
        let assembler = TutorialAssembler()
        let viewController = assembler.viewController()
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController,
                     animated: true,
                     completion: nil)
    }

    @objc func chatButtonAction() {
        let assembler = ChatAssembler()
        let viewController = assembler.viewController()
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController,
                     animated: true,
                     completion: nil)
    }

    @objc func formButtonAction() {
        let assembler = ChatAssembler()
        let viewController = assembler.viewController()
        viewController.modalPresentationStyle = .overFullScreen

        let module = FormDemoModule()
        self.present(module.view,
                     animated: true,
                     completion: nil)
    }

    @objc func tabBarButtonAction() {
        let assembler = TabBarAssembler()
        let viewController = assembler.viewController()
        viewController.modalPresentationStyle = .overFullScreen

        self.present(viewController,
                     animated: true,
                     completion: nil)
    }

    @objc func tAndCButtonAction() {
        //        let assembler = TAndCAssembler(stringURL: "https://apple.com")
        let assembler = CountryPickerAssembler()
        let viewController = assembler.viewController()
        viewController.modalPresentationStyle = .overFullScreen

        self.present(viewController,
                     animated: true,
                     completion: nil)
    }

    @objc func mediaPickerButtonAction() {

        if #available(iOS 14.5, *) {
            PermissionsProvider.request(permission: .tracking) { result in
                NSLog("PermissionsProvider result: \(result)")
            }
        }
        //imagePicker.photoGalleryAsscessRequest()
    }

    @objc func loginButtonAction() {
        ///        let assembler = LoginAssembler(navigationController: self.navigationController)
        //        let viewController = assembler.viewController()
        //
        //        self.navigationController?.pushViewController(viewController,
        //                                                      animated: true)
        //        guard let item: AlertTitleView = .instantiateFromNib() else {
        //            return
        //        }
                
                let viewController = CustomAlert()
                
        let customAlert = CustomAlert
            .Builder()
            .with(titleLabel: UILabel
                .Builder()
                .with(text: "Test")
                .with(font: .boldSystemFont(ofSize: 16))
                .build())
            .with(bodyLabel: UILabel
                .Builder()
                .with(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .with(numberOfLines: 0)
                .build())
            .with(button: UIButton
                .Builder()
                .with(text: "Accept")
                .build())
            .with(button: UIButton
                .Builder()
                .with(text: "Cancelar")
                .build())
            .build()
                
                
        customAlert.modalPresentationStyle = .overFullScreen
                self.navigationController?.present(customAlert, animated: false)

    }

    @objc func fuelButtonAction() {
        let assembler = FuelMapAssembler(navigationController: self.navigationController)
        let viewController = assembler.viewController()

        self.navigationController?.pushViewController(viewController,
                                                      animated: true)
    }

}

extension MainViewController: ImagePickerDelegate {

    func imagePicker(_ imagePicker: ImagePicker,
                     didSelect image: UIImage) {
        NSLog("Image: \(image)")
        imagePicker.dismiss()
    }

    func cancelButtonDidClick(on imageView: ImagePicker) {
        imagePicker.dismiss()
    }
    
    func imagePicker(_ imagePicker: ImagePicker,
                     grantedAccess: Bool,
                     to sourceType: UIImagePickerController.SourceType) {
        guard grantedAccess else { return }
        imagePicker.present(parent: self, sourceType: sourceType)
    }
}


class test {

    func fetch<T: DataRequest>(request: T) {
        DefaultNetworkService().request(request) { /*[weak self]*/ result in
            switch result {
            case .success(let model):
                NSLog("login url: \(model)")
            case .failure(let error):
                NSLog("login url: \(error)")
            }
        }
    }
}
