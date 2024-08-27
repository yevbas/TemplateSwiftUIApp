
# Intro
This project was created as template for my apps, but you can feel free to use this on your own.
# What's done?
Project contains of already prepared common flows
1. Biometry/ Passcode Entry
2. Main (Initial screen for your app)
3. Paywall (RevenueCat integration)
4. Settings
# Steps to go
- Download ZIP file
- Add you git repository and make first commit
- Rename project
- Add your bundle identifier
- **Develop App**
- Configure **RevenueCat** project and insert you API Key into *Info.plist*
- Configure **GoogleCrashlytic** project and initiate first *fatalError* in code

> [!IMPORTANT]
> This is not final version of your app, remove blocks of code or entire screen if you don't need it

# Architecture
1. **Screen+Configuration** - Strings, Images, Constants for flow
```
struct Screen {
    var strings = Strings()
    var images = Images()
    var constants = Constants()
}

extension Screen {
    struct Strings {
        var title = "Screen Title"
    }
}

extension Screen {
    struct Images {}
}

extension Screen {
    struct Constants {}
}
```
> [!WARNING]
> Before build your app be sure you've injected screen configuration using *Resolver*
3. **ScreenViewModel**
```
final class ScreenViewModel: ObservableObject {
    private weak var coordinator: ScreenCoordinator

    init(coordinator: ScreenCoordinator) {
        self.coordinator = coordinator
    }
}
```
4. **ScreenView** (SwiftUI)
```
struct ScreenView: View {
    @Injected private var configuration: Screen
    @StateObject private var viewModel: ScreenViewModel

    init(coordinator: ScreenCoordinator) {
        self._viewModel = .init(initialValue: .init(coordinator: coordinator))
    }

    var body: some View {
        Text(configuration.strings.title)
    }
}
```
5. **ScreenHostingController** - Hosting controllers are boxes for SwiftUI views, which includes navigation item setup.
```
final class ScreenHostingController: HostingController<ScreenView> {
    @LazyInjected private var configuration: Screen

    init(coordinator: ScreenCoordinator) {
        super.init(rootView: ScreenView(coordinator: Coordinator))
    }

    override func setupNavigationBar() {
        navigationItem.title = configuration.strings.title
    }
}
```
5. **Screen+Coordinator**
```
final class ScreenCoordinator: Coordinator {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = ScreenHostingController(coordinator: self)

        navigationController?.pushViewController(viewController, animated: true)
    }
}
```
