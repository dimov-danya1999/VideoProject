//
//  Extenssions.swift
//  Kino Project
//
//  Created by mac on 27.06.2022.
//

import Foundation

extension String {
    func go() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
