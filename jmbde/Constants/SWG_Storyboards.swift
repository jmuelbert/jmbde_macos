// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation
import Cocoa

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> NSStoryboard {
    return NSStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }

  static func initialController() -> Any {
    guard let controller = storyboard().instantiateInitialController()
    else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return controller
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func controller() -> Any {
    return Self.storyboard().instantiateController(withIdentifier: self.rawValue)
  }
  static func controller(identifier: Self) -> Any {
    return identifier.controller()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension NSWindowController {
  func performSegue<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

extension NSViewController {
  func performSegue<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

enum StoryboardScene {
  enum EmployeeTableViewController: String, StoryboardSceneType {
    static let storyboardName = "EmployeeTableViewController"

    case employeeTableViewControllerScene = "EmployeeTableViewController"
    static func instantiateEmployeeTableViewController() -> jmbde.EmployeeTableViewController {
      guard let vc = StoryboardScene.EmployeeTableViewController.employeeTableViewControllerScene.controller() as? jmbde.EmployeeTableViewController
      else {
        fatalError("ViewController 'EmployeeTableViewController' is not of the expected class jmbde.EmployeeTableViewController.")
      }
      return vc
    }
  }
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    case detailViewControllerScene = "DetailViewController"
    static func instantiateDetailViewController() -> jmbde.DetailViewController {
      guard let vc = StoryboardScene.Main.detailViewControllerScene.controller() as? jmbde.DetailViewController
      else {
        fatalError("ViewController 'DetailViewController' is not of the expected class jmbde.DetailViewController.")
      }
      return vc
    }

    case employeeTableViewControllerScene = "EmployeeTableViewController"
    static func instantiateEmployeeTableViewController() -> NSControllerPlaceholder {
      guard let vc = StoryboardScene.Main.employeeTableViewControllerScene.controller() as? NSControllerPlaceholder
      else {
        fatalError("ViewController 'EmployeeTableViewController' is not of the expected class NSControllerPlaceholder.")
      }
      return vc
    }

    case masterViewControllerScene = "MasterViewController"
    static func instantiateMasterViewController() -> jmbde.MasterViewController {
      guard let vc = StoryboardScene.Main.masterViewControllerScene.controller() as? jmbde.MasterViewController
      else {
        fatalError("ViewController 'MasterViewController' is not of the expected class jmbde.MasterViewController.")
      }
      return vc
    }
  }
}

enum StoryboardSegue {
  enum EmployeeTableViewController: String, StoryboardSegueType {
    case employeeAddSeque = "EmployeeAddSeque"
  }
}

private final class BundleToken {}
