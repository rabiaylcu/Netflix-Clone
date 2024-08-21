//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Rabia Yolcu on 21.08.2024.
//

import Foundation

extension String{
    func capitalizeFirstLetter () -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
