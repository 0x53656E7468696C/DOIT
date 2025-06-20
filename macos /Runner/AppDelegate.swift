import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

    override func applicationDidFinishLaunching(_ notification: Notification) {
        guard let window = NSApplication.shared.windows.first,
              let flutterVC = window.contentViewController as? FlutterViewController
        else {
          super.applicationDidFinishLaunching(notification)
          return
        }

        // Your window styling, blur accessory, etc...
        window.styleMask.insert(.fullSizeContentView)
        window.titlebarAppearsTransparent = true
        window.titleVisibility = .hidden
        window.isMovableByWindowBackground = true
        window.isOpaque = false
        window.backgroundColor = .clear

        // Register plugins on the Flutter VC
        RegisterGeneratedPlugins(registry: flutterVC)


        super.applicationDidFinishLaunching(notification)
      }

}
