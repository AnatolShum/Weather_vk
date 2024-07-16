//
//  Localized.swift
//  Weather_vk
//
//  Created by Anatolii Shumov on 16.07.2024.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
