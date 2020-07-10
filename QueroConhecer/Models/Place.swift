//
//  Place.swift
//  QueroConhecer
//
//  Created by Rafaela on 06/07/20.
//  Copyright © 2020 Rafaela. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct Place: Codable {
    let name: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let address: String
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D (latitude: latitude, longitude: longitude)
    }
    
    static func getFormattedAddress (with placemark: CLPlacemark) -> String {
        var address = ""
        if let street = placemark.thoroughfare {
            address += street //rua
        }
        if let number = placemark.subThoroughfare {
            address += " \(number)" //numero
        }
        if let subLocality = placemark.subLocality {
            address += ", \(subLocality)" //bairro
        }
        if let city = placemark.locality {
            address += "\n\(city)" //cidade
        }
        if let state = placemark.administrativeArea {
            address += " - \(state)" //estado
        }
        if let postalCode = placemark.postalCode {
            address += "\nCEP: \(postalCode)" //cep
        }
        if let country = placemark.country {
            address += "\n\(country)" //país
        }
        return address
    }
}

extension Place: Equatable {
    static func ==(lhs: Place, rhs: Place) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
