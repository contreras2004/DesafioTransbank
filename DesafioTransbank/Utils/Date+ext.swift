//
//  Date+ext.swift
//  DesafioTransbank
//
//  Created by Matías Contreras on 01-09-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Foundation

public extension Date {

    func simpleFormattedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }

    func simpleFormattedDayWithMonthAndYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_CL_POSIX")
        dateFormatter.dateFormat = "d 'de' MMMM',' yyyy"
        return dateFormatter.string(from: self)
    }
}
