//
//  DetailViewParagraphs.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 05.02.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

class DetailViewParagraphs {
    let sectionHeaderStyle: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 36),
        .foregroundColor: PyramidColor.pyramidBlue
    ]
    let titleHeaderStyle: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 16)
    ]
    let textStyle: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 12)
    ]
    
    var companyDetail: CompanyDetailRearranged!
    
    func buildDetailParagraph() -> NSMutableAttributedString {
        let detailSectionHeader = "Details" + "\n"
        
        let branchTitle = "Branchen" + "\n"
        let productTitle = "Produkte" + "\n"
        let subsidiaryTitle = "Standorte" + "\n"
        let revenueTitle = "Umsatz" + "\n"
        let employeeCountTitle = "Mitarbeiterzahl" + "\n"

        let string = NSMutableAttributedString(string: detailSectionHeader, attributes: sectionHeaderStyle)
        
        string.append(NSAttributedString(string: branchTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.branch + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: productTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.product + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: subsidiaryTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.subsidiary + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: revenueTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.revenue + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: employeeCountTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.employeeCount + "\n", attributes: textStyle))
        
        return string
    }
    
    func buildTrainingParagraph() -> NSMutableAttributedString {
        let trainingSectionHeader = "Training" + "\n"
        
        let entryAsTitle = "Einstiegsmöglichkeiten" + "\n"
        let qualificationTitle = "Zusatzqualifikation" + "\n"
        let foreignCountryTitle = "Ausland" + "\n"
        let internshipTitle = "Praktika" + "\n"
        let internshipBenefitsTitle = "Praktika Vergütung" + "\n"
        let internshipInfoTitle = "Praktika Info" + "\n"
        let thesisTitle = "Bachelor-/ Master-Thesis" + "\n"
        let thesisBenefitTitle = "Thesis Vergütung" + "\n"
        let workingStudentTitle = "Werkstudent" + "\n"
        let workingStudentBenefitTitle = "Werkstudent Vergütung" + "\n"
        let workingStudentInfoTitle = "Werkstudent Info" + "\n"
        
        let string = NSMutableAttributedString(string: trainingSectionHeader, attributes: sectionHeaderStyle)
        
        string.append(NSAttributedString(string: entryAsTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.entryAs + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: qualificationTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.qualification + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: foreignCountryTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.foreignCountry + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: internshipTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.internship + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: internshipBenefitsTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.internshipBenefit + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: internshipInfoTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.internshipInfo + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: thesisTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.thesis + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: thesisBenefitTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.thesisBenefit + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: workingStudentTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.workingStudent + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: workingStudentBenefitTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.internshipBenefit + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: workingStudentInfoTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.workingStudentInfo + "\n", attributes: textStyle))
        
        return string
    }
    
    func buildContactParagraph() -> NSMutableAttributedString {
        let contactSectionHeader = "Kontakt" + "\n"
        
        let homepageTitle = "Homepage" + "\n"
        let adressTitle = "Adresse" + "\n"
        let personTitle = "Person" + "\n"
        let subdivisionTitle = "Bereich" + "\n"
        let officeTitle = "Posten" + "\n"
        let responsibilityTitle = "Zuständig für" + "\n"
        let phoneNumberTitle = "Telefon" + "\n"
        let mobileNumberTitle = "Mobil" + "\n"
        let faxNumberTitle = "Fax" + "\n"
        let mailTitle = "Mail" + "\n"
        
        let string = NSMutableAttributedString(string: contactSectionHeader, attributes: sectionHeaderStyle)
        
        string.append(NSAttributedString(string: homepageTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.homepage + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: adressTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string:
            companyDetail.street + " in " +
            companyDetail.postalCode + " " +
            companyDetail.city + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: personTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string:
            companyDetail.primaryContactDict[.prefix]! +
            companyDetail.primaryContactDict[.title]! +
            companyDetail.primaryContactDict[.firstName]! +
            companyDetail.primaryContactDict[.lastName]! + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: subdivisionTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.primaryContactDict[.subdivision]! + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: officeTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.primaryContactDict[.office]! + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: responsibilityTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.primaryContactDict[.responsibility]! + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: phoneNumberTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.primaryContactDict[.phoneNumber]! + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: mobileNumberTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.primaryContactDict[.mobileNumber]! + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: faxNumberTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.primaryContactDict[.faxNumber]! + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: mailTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.primaryContactDict[.mail]! + "\n", attributes: textStyle))
        
        return string
    }
    
}
