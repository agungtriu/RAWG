//
//  Util.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 13/08/21.
//

import SwiftUI

func convertDateFormat(inputDate: String) -> String {
    var date = ""
    if inputDate.isEmpty {
        date = "TBA"
    } else {
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd"
        let oldDate = olDateFormatter.date(from: inputDate)
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "dd MMM yyyy"
        date = convertDateFormatter.string(from: oldDate!)
    }
    return date
}
