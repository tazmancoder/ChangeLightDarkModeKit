//
//  LightAndDarkThemeManager.swift
//  LightDarkModeKit-Master
//
//  Created by Mark Perryman on 1/5/24.
//

import SwiftUI

public class LightAndDarkThemeManager: ObservableObject {
	@AppStorage(StorageKeys.lightAndDarkScheme.rawValue) var colorScheme: LightAndDarkScheme = .unspecified {
		didSet {
			applyColorScheme()
		}
	}
	
	func applyColorScheme() {
		keyWindow?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: colorScheme.rawValue)!
	}
	
	var keyWindow: UIWindow? {
		guard let scene = UIApplication.shared.connectedScenes.first,
			  let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
			  let window = windowSceneDelegate.window else {
			return nil
		}
		return window
	}
}
