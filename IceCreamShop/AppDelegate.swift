import UIKit
import PickFlavor

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions
    launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = createRootViewController()
    window?.makeKeyAndVisible()

    return true
  }
   
  func createRootViewController() -> UIViewController {
     
    let bundleNames = ["PickFlavor_PickFlavor"]
    var storyboard: UIStoryboard?
          bundleNames.forEach { (bundleName) in
              guard
                  let bundleURL = Bundle.main.url(forResource: bundleName, withExtension: "bundle"),
                  let bundle = Bundle(url: bundleURL) else {
                  preconditionFailure()
              }
              storyboard = UIStoryboard(name: "Main", bundle: bundle)
          }
 
    return storyboard?.instantiateInitialViewController() ?? UIViewController()
  }
}
