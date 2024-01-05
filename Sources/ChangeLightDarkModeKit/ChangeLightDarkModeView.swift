//
//  ChangeLightDarkModeView.swift
//  LightDarkModeKit-Master
//
//  Created by Mark Perryman on 1/5/24.
//

import SwiftUI

/// A view that should be used in a form most likely a settings view. This view shows the user in a set of options to switch the app from light or dark mode. There is a default to let the system control this
///
/// The following example shows a ChangeLightDarkModeView with providing a tint color for the toggle. You do not need to provide padding if you put this into a Form view. Otherwise specifiy some padding.
///
/// 	Form {
///			ChangeLightDarkModeView(toggleTintColor: .purple)
///		}
///
/// 	VStack {
///			ChangeLightDarkModeView(toggleTintColor: .purple)
///				.padding(2.5)
///		}
public struct ChangeLightDarkModeView: View {
	// MARK: - User Defaults
	@AppStorage(StorageKeys.useSystemAppearance.rawValue) var useSystemAppearance = true

	// MARK: - State
	@StateObject var lightDarkManager = LightAndDarkThemeManager()
	
	var toggleTintColor: Color
	
	/// Only one paramenter. It defaults to .blue if you don't specify a color
	/// - Parameter toggleTintColor: A SwiftUI Color
	public init(toggleTintColor: Color = .blue) {
		self.toggleTintColor = toggleTintColor
	}
	
    public var body: some View {
		Section {
			VStack(alignment: .leading) {
				HStack(alignment: .center, spacing: 10) {
					Spacer()
					
					Button(action: {
						withAnimation {
							lightDarkManager.colorScheme = .light
						}
						
						changeUseSystemToggle()
					}, label: {
						VStack(alignment: .center) {
							Image(LAC.device.userInterfaceIdiom == .phone ? "Phone Light" : "Pad Light", bundle: .module)
								.resizable()
								.frame(
									width: LAC.device.userInterfaceIdiom == .pad ? 150 : 55,
									height: LAC.device.userInterfaceIdiom == .pad ? 200 : 110
								)
								.cornerRadius(6)
								.overlay(
									RoundedRectangle(cornerRadius: 6)
										.stroke(lightDarkManager.colorScheme == .light ? Color.accentColor : .gray, lineWidth: 3)
								)
							
							Text("Light")
								.font(LAC.device.userInterfaceIdiom == .pad ? .body : .caption)
								.fontWeight(.semibold)
								.foregroundStyle(lightDarkManager.colorScheme == .light ? Color.accentColor : .gray)
								.padding(5)
							
							ZStack {
								Image(systemName: SFImage.circle.rawValue)
								
								if lightDarkManager.colorScheme == .light {
									withAnimation {
										Image(systemName: SFImage.checkmarkCircleFill.rawValue)
									}
								}
							}
							.font(.title3)
							.foregroundColor(lightDarkManager.colorScheme == .light ? Color.accentColor : .gray)
							.padding(.horizontal)
							.padding(.bottom)
						}
					})
					.buttonStyle(.plain)
					
					Spacer()
					
					Button(action: {
						withAnimation {
							lightDarkManager.colorScheme = .dark
						}
						
						changeUseSystemToggle()
					}, label: {
						VStack(alignment: .center) {
							Image(LAC.device.userInterfaceIdiom == .phone ? "Phone Dark" : "Pad Dark", bundle: .module)
								.resizable()
								.frame(
									width: LAC.device.userInterfaceIdiom == .pad ? 150 : 55,
									height: LAC.device.userInterfaceIdiom == .pad ? 200 : 110
								)
								.cornerRadius(6)
								.overlay(
									RoundedRectangle(cornerRadius: 6)
										.stroke(lightDarkManager.colorScheme == .dark ? Color.accentColor : .gray, lineWidth: 3)
								)
							
							Text("Dark")
								.font(LAC.device.userInterfaceIdiom == .pad ? .body : .caption)
								.fontWeight(.semibold)
								.foregroundStyle(lightDarkManager.colorScheme == .light ? Color.accentColor : .gray)
								.padding(5)

							ZStack {
								Image(systemName: SFImage.circle.rawValue)
								
								if lightDarkManager.colorScheme == .dark {
									withAnimation {
										Image(systemName: SFImage.checkmarkCircleFill.rawValue)
									}
								}
							}
							.font(.title3)
							.foregroundColor(lightDarkManager.colorScheme == .dark ? Color.accentColor : .gray)
							.padding(.horizontal)
							.padding(.bottom)
						}
					})
					.buttonStyle(.plain)
					
					Spacer()
				}
				
				Divider()
				
				Toggle(isOn: $useSystemAppearance, label: {
					Text("Use System Appearance")
						.font(LAC.device.userInterfaceIdiom == .pad ? .body : .callout)
						.fontWeight(.regular)
						.foregroundStyle(.primary)
				})
				.onChange(of: useSystemAppearance) {
					switch useSystemAppearance {
					case true:
						withAnimation {
							lightDarkManager.colorScheme = .unspecified
						}
					case false:
						break
					}
				}
				.tint(toggleTintColor)
			}
		} header: {
			HStack {
				Text(LocalizedText.appearanceSectionHeader)
					.font(AppFonts.headerTitle)
					.fontWeight(.medium)
					.foregroundStyle(.secondary)
					.textCase(.uppercase)
				Spacer()
			}
		} footer: {
			Text(LocalizedText.appearanceSectionFooter)
				.font(AppFonts.footerInfo)
				.fontWeight(.regular)
				.foregroundStyle(.secondary)
		}
	}
	
	private func changeUseSystemToggle() {
		if lightDarkManager.colorScheme == .light || lightDarkManager.colorScheme == .dark {
			useSystemAppearance = false
		}
	}

}

#Preview {
	ChangeLightDarkModeView(toggleTintColor: .purple)
}
