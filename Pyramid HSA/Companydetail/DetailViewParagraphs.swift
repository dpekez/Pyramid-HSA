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
        .font: UIFont.boldSystemFont(ofSize: 12)
    ]
    let contactHeaderStyle: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 12),
        .foregroundColor: PyramidColor.pyramidBlue
    ]
    let textStyle: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 12)
    ]
    
    var companyDetail: CompanyDetailRearranged!
    
    func createDetailLine(withHeader header: String, andDetail text: String) -> NSAttributedString {
        let returnString = NSMutableAttributedString(string: header, attributes: titleHeaderStyle)
        returnString.append(NSAttributedString(string: text + "\n", attributes: textStyle))
        return returnString
    }
    
    func buildDetailParagraph() -> NSMutableAttributedString {
        let detailSectionHeader = "Details\n"
        let adressTitle = "Adresse: "
        let branchTitle = "Branchen: "
        let productTitle = "Produkte: "
        let subsidiaryTitle = "Standorte: "
        let revenueTitle = "Umsatz: "
        let employeeCountTitle = "Mitarbeiterzahl: "
        let string = NSMutableAttributedString(string: detailSectionHeader, attributes: sectionHeaderStyle)
        
        string.append(createDetailLine(withHeader: adressTitle, andDetail:
            companyDetail.street + " in " +
            companyDetail.postalCode + " " +
            companyDetail.city))
        
        string.append(createDetailLine(withHeader: branchTitle, andDetail: companyDetail.branch))
        
        string.append(createDetailLine(withHeader: productTitle, andDetail: companyDetail.product))
        
        string.append(createDetailLine(withHeader: subsidiaryTitle, andDetail: companyDetail.subsidiary))
        
        string.append(createDetailLine(withHeader: revenueTitle, andDetail: revenueFormatter(companyDetail.revenue)))
        
        string.append(createDetailLine(withHeader: employeeCountTitle, andDetail: companyDetail.employeeCount))
        
        return string
    }
    
    func buildTrainingParagraph() -> NSMutableAttributedString {
        let trainingSectionHeader = "Training\n"
        let entryAsTitle = "Einstiegsmöglichkeiten: "
        let qualificationTitle = "Zusatzqualifikation: "
        let foreignCountryTitle = "Ausland: "
        let internshipTitle = "Praktika: "
        let internshipBenefitsTitle = "Praktika Vergütung: "
        let internshipInfoTitle = "Praktika Info: "
        let thesisTitle = "Bachelor-/ Master-Thesis: "
        let thesisBenefitTitle = "Thesis Vergütung: "
        let workingStudentTitle = "Werkstudent: "
        let workingStudentBenefitTitle = "Werkstudent Vergütung: "
        let workingStudentInfoTitle = "Werkstudent Info: "
        
        let string = NSMutableAttributedString(string: trainingSectionHeader, attributes: sectionHeaderStyle)
        
        string.append(createDetailLine(withHeader: entryAsTitle, andDetail: companyDetail.entryAs))
        
        string.append(createDetailLine(withHeader: qualificationTitle, andDetail: companyDetail.qualification))
        
        string.append(createDetailLine(withHeader: foreignCountryTitle, andDetail: companyDetail.foreignCountry))
        //✔️☑️
        
        string.append(NSAttributedString(string: internshipTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.internship + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: internshipBenefitsTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.internshipBenefit + "\n", attributes: textStyle))
        
        string.append(createDetailLine(withHeader: internshipInfoTitle, andDetail: companyDetail.internshipInfo))
        
        string.append(NSAttributedString(string: thesisTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.thesis + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: thesisBenefitTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.thesisBenefit + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: workingStudentTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.workingStudent + "\n", attributes: textStyle))
        
        string.append(NSAttributedString(string: workingStudentBenefitTitle, attributes: titleHeaderStyle))
        string.append(NSAttributedString(string: companyDetail.workingStudentBenefit + "\n", attributes: textStyle))
        
        string.append(createDetailLine(withHeader: workingStudentInfoTitle, andDetail: companyDetail.workingStudentInfo))
        
        return string
    }
    
    func buildContactParagraph() -> NSMutableAttributedString {
        let contactSectionHeader = "Ansprechpartner\n"
        
        let string = NSMutableAttributedString(string: contactSectionHeader, attributes: sectionHeaderStyle)
        
        string.append(NSAttributedString(string: "Hauptansprechpartner\n", attributes: contactHeaderStyle))
        string.append(contactBuilder(companyDetail.primaryContactDict))
        
        if contactIsAvailable(with: companyDetail.secondaryContactDict[.firstName]!) {
            string.append(NSAttributedString(string: "\nZweitansprechpartner\n", attributes: contactHeaderStyle))
            string.append(contactBuilder(companyDetail.secondaryContactDict))
        }
        
        return string
    }
}

extension DetailViewParagraphs {
    func revenueFormatter(_ revenue: Int) -> String {
        if revenue == 0 {
            return ""
        } else if revenue >= 1_000_000_000 {
            var i = Float(revenue)
            i = i / 1_000_000_000
            return "\(i)".replacingOccurrences(of: ".", with: ",") + " Mrd. Euro"
        } else if  revenue >= 1_000_000 {
            var i = Float(revenue)
            i = i / 1_000_000
            return "\(i)".replacingOccurrences(of: ".", with: ",") + " Mio. Euro"
        } else {
            return "\(revenue) Euro"
        }
    }
    
    func contactNameFormatter(_ details: [ContactDetails: String]) -> String {
        let prefix = details[.prefix]!
        let title = details[.title]!
        let firstName = details[.firstName]!
        let lastName = details[.lastName]!
        var outputString = String()
        
        // take 1 as threshold since DB is garbled with "-" strings
        if prefix.count > 1 {
            outputString.append("\(prefix) ")
        }
        
        if title.count > 1 {
            outputString.append("\(title) ")
        }
        
        if firstName.count > 1 {
            outputString.append("\(firstName) ")
        }
        
        if lastName.count > 1 {
            outputString.append("\(lastName)")
        }
        
        return outputString
    }
    
    func trainingFormatter() {
        
    }
}

extension DetailViewParagraphs {
    func contactIsAvailable(with firstName: String) -> Bool {
        return firstName.count > 1
    }
}

extension DetailViewParagraphs {
    func contactBuilder(_ details: [ContactDetails: String]) -> NSAttributedString {
        let personTitle = "Person: "
        let subdivisionTitle = "Position: "
        let phoneNumberTitle = "Telefon: "
        let mobileNumberTitle = "Mobil: "
        let faxNumberTitle = "Fax: "
        let mailTitle = "Mail: "
        let outputString = NSMutableAttributedString()
        
        outputString.append(createDetailLine(withHeader: personTitle, andDetail: contactNameFormatter(details)))
        
        if details[.subdivision]!.count > 1 {
            outputString.append(createDetailLine(withHeader: subdivisionTitle, andDetail: details[.subdivision]!))
        }
        
        if details[.phoneNumber]!.count > 1 {
            outputString.append(createDetailLine(withHeader: phoneNumberTitle, andDetail: details[.phoneNumber]!))
        }
        
        if details[.mobileNumber]!.count > 1 {
            outputString.append(createDetailLine(withHeader: mobileNumberTitle, andDetail: details[.mobileNumber]!))
        }
        
        if details[.faxNumber]!.count > 1 {
            outputString.append(createDetailLine(withHeader: faxNumberTitle, andDetail: details[.faxNumber]!))
        }
        
        if details[.mail]!.count > 1 {
            outputString.append(createDetailLine(withHeader: mailTitle, andDetail: details[.mail]!))
        }
        
        return outputString
    }
}
