//
//  LoanApplication.swift
//  hackday-2018-blockchain-loan-application
//
//  Created by Rick Pearce on 6/13/18.
//  Copyright © 2018 Rick Pearce. All rights reserved.
//

import Foundation

struct ApplicationData: Codable {
    
    struct CustomerData: Codable {
        var emailAddress: String?
        var firstName: String?
        var lastName: String?
        var middleName: String?
        var city: String?
        var state: String?
        var streetAddress: String?
        var zipCode: String?
        var dateOfBirth: String?
        var driverLicenseExpirationDate: String?
        var driverLicenseIssuingDate: String?
        var driverLicenseNumber: String?
        var ssn: String?
        var contactNumber: String?
    }

    struct LoanData: Codable {
        var loanAmount: String?
        var loanApplicationDate: String?
        var loanNumber: String?
        var loanStatus: String?
        var loanTerms: String?
        var loanType: String?
        var additionalNotes: String?
        var approvedAmount: String?
        var generatedUserPIN: String?
        var lastUpdate: String?
        var purchasedVehicle: String?
        var vendor: String?
    }

    struct VehicleData: Codable {
        var condition: String?
        var make: String?
        var model: String?
        var price: String?
        var vin: String?
        var year: String?
    }

    struct QuoteData: Codable {
        var annualnsurancePremium: String?
        var coverageDetails: String?
        var monthlyInsurancePremium: String?
        var promotion: String?
    }


}
