//
//  MapKit+Layout.swift
//  Remix
//
//  Created by Nick Lockwood on 10/05/2017.
//  Copyright © 2017 Dan Cutting. All rights reserved.
//

import Layout
import MapKit

extension MKMapView {

    open override class var expressionTypes: [String: RuntimeType] {
        var types = super.expressionTypes
        types["region"] = RuntimeType(MKCoordinateRegion.self)
        return types
    }

    open override func setValue(_ value: Any, forExpression name: String) throws {
        switch name {
        case "region":
            region = value as! MKCoordinateRegion
        default:
            try super.setValue(value, forExpression: name)
        }
    }
}
