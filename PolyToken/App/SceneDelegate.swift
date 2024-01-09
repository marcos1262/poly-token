import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let presenter = TokenizerPresenter(adapter: TokenizerAdapter())
        let controller = TokenizerViewController(presenter: presenter)
        presenter.controller = controller

        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.prefersLargeTitles = true

        window = UIWindow(windowScene: scene)
        window?.backgroundColor = .systemBackground
        window?.tintColor = .systemIndigo
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

