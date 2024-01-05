//
//  AppWide.swift
//  LightDarkModeKit-Master
//
//  Created by Mark Perryman on 1/5/24.
//

import SwiftUI
import DeviceKit

/// A set of keys that are used with AppStorage. These can only be used in
/// iOS 16 and above
public enum StorageKeys: String {
	case useSystemAppearance
	case lightAndDarkScheme
}

public enum LightAndDarkScheme: Int {
	case unspecified, light, dark
}

public enum LAC {
	static let device = Device.current
}


public enum SFImage: String {
	case checkmarkCircleFill = "checkmark.circle.fill"
	case circle = "circle"
}

public enum LocalizedText {
	static let lightMode = String(localized: "Light", table: "LocalizedText+Strings", comment: "Choice for user to allow light mode.")
	static let darkMode = String(localized: "Dark", table: "LocalizedText+Strings", comment: "Choice for user to allow dark mode.")
	
	static let appearanceSectionHeader = String(localized: "Appearance", table: "LocalizedText+Strings", comment: "Bullet list item about a feature the app has.")

	static let appearanceSectionFooter = String(localized: "Choose from one of the options above, either Light or Dark mode. You can allow the system to choose, this will set light and dark mode automatically for you based on your devices system settings. This is default.", table: "LocalizedText+Strings", comment: "Bullet list item about a feature the app has.")

}

public enum AppFonts {
	static let headerTitle: Font = LAC.device.isPad ? .subheadline : .footnote
	static let footerInfo: Font = LAC.device.isPad ? .caption : .caption2
}
