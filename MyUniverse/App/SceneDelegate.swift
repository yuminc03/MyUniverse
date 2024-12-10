import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        // 1. scene 캡처
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 2. window scene을 가져오는 windowScene을 생성자를 사용해서 새로운 UIWindow를 생성
        let window = UIWindow(windowScene: windowScene)
        
        // 3. view 계층을 프로그래밍 방식으로 만들기
        let viewController = MyUniTabBarController()

        // 4. viewController로 window의 root view controller를 설정
        window.rootViewController = viewController
        
        // 5. window를 설정하고 makeKeyAndVisible()
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // scene이 시스템에 의해서 해제될 때 호출
        // scene이 background로 들어간 직후 또는 해당 session이 삭제될 때 발생함
        // 다음에 scene이 연결될 때 다시 생성될 수 있는 이 scene과 고나련된 모든 리소드 해제함
        // session이 반드시 삭제된 것은 아니므로 나중에 scene이 다시 연결될 수 있음(대신 application:didDiscardSceneSessions 참고)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // scene이 비활성화 상태에서 활성화 상태로 전환되었을 때 호출
        // scene이 비활성화 상태일 때 일시 중시되었거나 아직 시작되지 않은 작업을 다시 시작하려면 이 메서드 사용
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // scene이 활성화 상태에서 비활성화 상태로 전환될 때 호출
        // 일시적인 중단(예: 전화 수신)으로 인해 발생할 수 있음
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // scene이 background에서 foreground로 전환될 때 호출
        // background로 진입할 때 변경한 내용을 취소하려면 이 메서드를 사용
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // scene이 foreground에서 background로 전환될 때 호출
        // 이 메서드를 사용하면 데이터를 저장하고 공유 리소스를 해제하고 scene을 현재 상태로 복원할 수 있는 충분한 scene별 상태 정보를 저장할 수 있음
        // scene을 현재 상태로 복원할 수 있음
    }

}
