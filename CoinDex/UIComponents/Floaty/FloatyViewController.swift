//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

/**
 Floaty dependent on UIWindow.
 */
open class FloatyViewController: UIViewController {
  public let floaty = Floaty()
  var statusBarStyle: UIStatusBarStyle = .default
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(floaty)
  }
  
  override open var preferredStatusBarStyle: UIStatusBarStyle {
    get {
      return statusBarStyle
    }
  }
}
