//
//  ContentView.swift
//  RuntimeLanguageChange
//
//  Created by Emre Dogan on 09/02/2023.
//

import SwiftUI

enum Language: String {
	case en = "en"
	case tr = "tr"
	
	mutating func toggle() {
		self = self == .en ? .tr : .en
	}
}

struct ContentView: View {
	@State private var helloText = "hello-string"
	@State private var descText = "description-string"
	@State private var languageButtonTitle = "change-lang"
	@State private var language: Language = .en
	
    var body: some View {
		VStack(spacing: 10) {
			Text(helloText.localized(to: language.rawValue))
				.font(.title.bold())
			Text(descText.localized(to: language.rawValue))
				.font(.body)
			Button(languageButtonTitle.localized(to: language.rawValue)) {
				DispatchQueue.main.async {
					language.toggle()
				}
			}
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
				.environment(\.locale, Locale.init(identifier: "en"))
			ContentView()
				.environment(\.locale, Locale.init(identifier: "tr"))
		}
    }
}
