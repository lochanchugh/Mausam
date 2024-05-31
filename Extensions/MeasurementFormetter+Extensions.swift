//
//  MeasurementFormetter+Extensions.swift
//  Mausam
//
//  Created by Lochan on 22/04/24.
//

import Foundation

extension MeasurementFormatter {

    static func temperature(value: Double) -> String {
        
        let numberFormatter = NumberFormatter ()
        numberFormatter.maximumFractionDigits = 0
        
        let formatter = MeasurementFormatter ( )
        formatter.numberFormatter = numberFormatter
        
        let temp = Measurement (value: value, unit: UnitTemperature.kelvin)
        
        return formatter.string( from: temp)
        
    }
}
