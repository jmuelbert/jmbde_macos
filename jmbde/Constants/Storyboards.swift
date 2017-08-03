// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation
import UIKit

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: NSBundle(forClass: BundleToken.self))
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType where S.RawValue == String>(segue: S, sender: AnyObject? = nil) {
    performSegueWithIdentifier(segue.rawValue, sender: sender)
  }
}

enum StoryboardScene {
  enum EmployeeTableViewController: String, StoryboardSceneType {
    static let storyboardName = "EmployeeTableViewController"

    case EmployeeTableViewControllerScene = "EmployeeTableViewController"
    static func instantiateEmployeeTableViewController() -> jmbde.EmployeeTableViewController {
      guard let vc = StoryboardScene.EmployeeTableViewController.EmployeeTableViewControllerScene.viewController() as? jmbde.EmployeeTableViewController
      else {
        fatalError("ViewController 'EmployeeTableViewController' is not of the expected class jmbde.EmployeeTableViewController.")
      }
      return vc
    }
  }
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    static func initialViewController() -> UIWindowController {
      guard let vc = storyboard().instantiateInitialViewController() as? UIWindowController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case DetailViewControllerScene = "DetailViewController"
    static func instantiateDetailViewController() -> jmbde.DetailViewController {
      guard let vc = StoryboardScene.Main.DetailViewControllerScene.viewController() as? jmbde.DetailViewController
      else {
        fatalError("ViewController 'DetailViewController' is not of the expected class jmbde.DetailViewController.")
      }
      return vc
    }

    case MasterViewControllerScene = "MasterViewController"
    static func instantiateMasterViewController() -> jmbde.MasterViewController {
      guard let vc = StoryboardScene.Main.MasterViewControllerScene.viewController() as? jmbde.MasterViewController
      else {
        fatalError("ViewController 'MasterViewController' is not of the expected class jmbde.MasterViewController.")
      }
      return vc
    }
  }
}

enum StoryboardSegue {
}

private final class BundleToken {}
