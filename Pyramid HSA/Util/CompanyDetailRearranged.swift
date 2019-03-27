//
//  CompanyDetailRearranged.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 11.02.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import Foundation

struct CompanyDetailRearranged {
    let id: Int
    let name: String
    let street: String
    let postalCode: String
    let city: String
    let homepage: String
    var interestDict = Dictionary<PyramidFaculty, Int>()
    let branch: String
    let product: String
    let subsidiary: String
    let revenue: String
    let employeeCount: String
    let entryAs: String
    let qualification: String
    let foreignCountry: String
    let internship: String
    let internshipBenefit: String
    let internshipInfo: String
    let thesis: String
    let thesisBenefit: String
    let workingStudent: String
    let workingStudentBenefit: String
    let workingStudentInfo: String
    var primaryContactDict = Dictionary<ContactDetails, String>()
    var secondaryContactDict = Dictionary<ContactDetails, String>()
    let room: String
    let standNumber: String
}

extension CompanyDetailRearranged {
    init(from intermediate: CompanyDetail) {
        id = Int(intermediate.id)!
        name = intermediate.name
        street = intermediate.street
        postalCode = intermediate.postalCode
        city = intermediate.city
        homepage = intermediate.homepage
        interestDict[.architecture] = Int(intermediate.interestA)!
        interestDict[.electricalEngineering] = Int(intermediate.interestE)!
        interestDict[.design] = Int(intermediate.interestD)!
        interestDict[.computerScience] = Int(intermediate.interestCS)!
        interestDict[.mechanicalEngineering] = Int(intermediate.interestM)!
        interestDict[.businessAdministration] = Int(intermediate.interestEco)!
        branch =  intermediate.branch
        product = intermediate.product
        subsidiary = intermediate.subsidiary
        revenue = intermediate.revenue
        employeeCount = intermediate.employeeCount
        entryAs = intermediate.entryAs
        qualification = intermediate.qualification
        foreignCountry = intermediate.foreignCountry
        internship = intermediate.internship
        internshipBenefit = intermediate.internshipBenefit
        internshipInfo = intermediate.internshipInfo
        thesis = intermediate.thesis
        thesisBenefit = intermediate.thesisBenefit
        workingStudent = intermediate.workingStudent
        workingStudentBenefit = intermediate.workingStudentBenefit
        workingStudentInfo = intermediate.workingStudentInfo
        primaryContactDict[.prefix] = intermediate.primaryContactPrefix
        primaryContactDict[.title] = intermediate.primaryContactTitle
        primaryContactDict[.firstName] = intermediate.primaryContactFirstName
        primaryContactDict[.lastName] = intermediate.primaryContactLastName
        primaryContactDict[.subdivision] = intermediate.primaryContactSubdivision
        primaryContactDict[.office] = intermediate.primaryContactOffice
        primaryContactDict[.responsibility] = intermediate.primaryContactResponsibility
        primaryContactDict[.phoneNumber] = intermediate.primaryContactPhoneNumber
        primaryContactDict[.mobileNumber] = intermediate.primaryContactMobileNumber
        primaryContactDict[.faxNumber] = intermediate.primaryContactFaxNumber
        primaryContactDict[.mail] = intermediate.secondaryContactMail
        secondaryContactDict[.prefix] = intermediate.secondaryContactPrefix
        secondaryContactDict[.title] = intermediate.secondaryContactTitle
        secondaryContactDict[.firstName] = intermediate.secondaryContactFirstName
        secondaryContactDict[.lastName] = intermediate.secondaryContactLastName
        secondaryContactDict[.subdivision] = intermediate.secondaryContactSubdivision
        secondaryContactDict[.office] = intermediate.secondaryContactOffice
        secondaryContactDict[.responsibility] = intermediate.secondaryContactResponsibility
        secondaryContactDict[.phoneNumber] = intermediate.secondaryContactPhoneNumber
        secondaryContactDict[.mobileNumber] = intermediate.secondaryContactMobileNumber
        secondaryContactDict[.faxNumber] = intermediate.secondaryContactFaxNumber
        secondaryContactDict[.mail] = intermediate.secondaryContactMail
        room = intermediate.room
        standNumber = intermediate.standNumber
    }
}

enum ContactDetails {
    case prefix
    case title
    case firstName
    case lastName
    case subdivision
    case office
    case responsibility
    case phoneNumber
    case mobileNumber
    case faxNumber
    case mail
}
