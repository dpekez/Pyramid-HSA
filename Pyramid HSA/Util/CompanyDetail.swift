//
//  CompanyDetail.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 27.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

struct CompanyDetail: Decodable {
    let id: String
    let name: String
    let street: String
    let postalCode: String
    let city: String
    let homepage: String
    let interestA: String
    let interestE: String
    let interestD: String
    let interestCS: String
    let interestM: String
    let interestEco: String
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
    let primaryContactPrefix: String
    let primaryContactTitle: String
    let primaryContactFirstName: String
    let primaryContactLastName: String
    let primaryContactSubdivision: String
    let primaryContactPhoneNumber: String
    let primaryContactMobileNumber: String
    let primaryContactFaxNumber: String
    let primaryContactMail: String
    let secondaryContactPrefix: String
    let secondaryContactTitle: String
    let secondaryContactFirstName: String
    let secondaryContactLastName: String
    let secondaryContactSubdivision: String
    let secondaryContactPhoneNumber: String
    let secondaryContactMobileNumber: String
    let secondaryContactFaxNumber: String
    let secondaryContactMail: String
    let room: String
    let standNumber: String
}

extension CompanyDetail {
    private enum CodingKeys: String, CodingKey {
        case id =                             "id"
        case name =                           "firmenname"
        case street =                         "strasse"
        case postalCode =                     "plz"
        case city =                           "ort"
        case homepage =                       "homepage"
        case interestA =                      "interesse_ab"
        case interestE =                      "interesse_e"
        case interestD =                      "interesse_g"
        case interestCS =                     "interesse_i"
        case interestM =                      "interesse_mv"
        case interestEco =                    "interesse_w"
        case branch =                         "branche"
        case product =                        "produkte"
        case subsidiary =                     "standorte"
        case revenue =                        "umsatz"
        case employeeCount =                  "mitarbeiter"
        case entryAs =                        "einstieg"
        case qualification =                  "zusatzqualifikationen"
        case foreignCountry =                 "ausland"
        case internship =                     "praktika"
        case internshipBenefit =              "praktika_geld"
        case internshipInfo =                 "praktika_kommentar"
        case thesis =                         "thesis"
        case thesisBenefit =                  "thesis_geld"
        case workingStudent =                 "werkstudent"
        case workingStudentBenefit =          "werkstudent_geld"
        case workingStudentInfo =             "werkstudent_kommentar"
        case primaryContactPrefix =           "ansprechpartner_1_anrede"
        case primaryContactTitle =            "ansprechpartner_1_titel"
        case primaryContactFirstName =        "ansprechpartner_1_vorname"
        case primaryContactLastName =         "ansprechpartner_1_nachname"
        case primaryContactSubdivision =      "ansprechpartner_1_posten"
        case primaryContactPhoneNumber =      "ansprechpartner_1_telefon"
        case primaryContactMobileNumber =     "ansprechpartner_1_mobil"
        case primaryContactFaxNumber =        "ansprechpartner_1_fax"
        case primaryContactMail =             "ansprechpartner_1_email"
        case secondaryContactPrefix =         "ansprechpartner_2_anrede"
        case secondaryContactTitle =          "ansprechpartner_2_titel"
        case secondaryContactFirstName =      "ansprechpartner_2_vorname"
        case secondaryContactLastName =       "ansprechpartner_2_nachname"
        case secondaryContactSubdivision =    "ansprechpartner_2_posten"
        case secondaryContactPhoneNumber =    "ansprechpartner_2_telefon"
        case secondaryContactMobileNumber =   "ansprechpartner_2_mobil"
        case secondaryContactFaxNumber =      "ansprechpartner_2_fax"
        case secondaryContactMail =           "ansprechpartner_2_email"
        case room =                           "raum"
        case standNumber =                    "standplatz"
    }
}
