//
//  String+Extensions.swift
//  RuntimeLanguageChange
//
//  Created by Emre Dogan on 09/02/2023.
//

import Foundation

extension String {
	func localized(to language: String? = nil, comment: String = "") -> String {
		// Check that you got a valid string
		if let language = language {
			// Find the bundle file for the relevant language
			let path = Bundle.main.path(forResource: language, ofType: "lproj")
			guard let path = path, let bundle = Bundle(path: path) else {
				assertionFailure("language passed that doesn't exist in the app!")
				return NSLocalizedString(self, comment: comment)
			}
			// Deliver the relevant string for the language
			return NSLocalizedString(self, bundle: bundle, comment: comment)
		} else {
			// If no string passed as language, deliver the default string
			return NSLocalizedString(self, comment: comment)
		}
	}
}
