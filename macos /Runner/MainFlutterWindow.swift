import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
    
  override func awakeFromNib() {
    
      let flutterViewController = FlutterViewController.init()
      
      //Add these code to your MainFlutterWindow.swift file
      flutterViewController.backgroundColor = .clear
    
  
      
      let visualEffectView = NSVisualEffectView()
       visualEffectView.material = .hudWindow
       visualEffectView.blendingMode = .behindWindow
       visualEffectView.state = .active
       visualEffectView.isEmphasized = true

      flutterViewController.view.addSubview(visualEffectView, positioned: .below, relativeTo: flutterViewController.view)
       visualEffectView.translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([
        visualEffectView.topAnchor.constraint(equalTo: flutterViewController.view.topAnchor),
        visualEffectView.bottomAnchor.constraint(equalTo: flutterViewController.view.bottomAnchor),
        visualEffectView.leadingAnchor.constraint(equalTo: flutterViewController.view.leadingAnchor),
        visualEffectView.trailingAnchor.constraint(equalTo:flutterViewController.view.trailingAnchor),
       ])

      let windowFrame = self.frame
      self.contentViewController = flutterViewController
      self.setFrame(windowFrame, display: true)
      RegisterGeneratedPlugins(registry: flutterViewController)
      
   
    super.awakeFromNib()
  }
  
   override public func order(_ place: NSWindow.OrderingMode, relativeTo otherWin: Int) {
      super.order(place, relativeTo: otherWin)
   }
}
