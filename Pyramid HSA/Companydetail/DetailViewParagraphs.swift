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
        .font: UIFont.boldSystemFont(ofSize: 32),
        .foregroundColor: UIColor.pyramidBlue
    ]
    let titleHeaderStyle: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 12)
    ]
    let contactHeaderStyle: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 12),
        .foregroundColor: UIColor.pyramidBlue
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
        let foreignCountryTitle = "Ausland: "
        let revenueTitle = "Umsatz: "
        let employeeCountTitle = "Mitarbeiterzahl: "
        let string = NSMutableAttributedString(string: detailSectionHeader, attributes: sectionHeaderStyle)
        
        string.append(createDetailLine(withHeader: adressTitle, andDetail:
            companyDetail.street + " in " +
            companyDetail.postalCode + " " +
            companyDetail.city))
        
        if companyDetail.branch.count > 1 {
            string.append(createDetailLine(withHeader: branchTitle, andDetail: companyDetail.branch))
        }
        
        if companyDetail.product.count > 1 {
            string.append(createDetailLine(withHeader: productTitle, andDetail: companyDetail.product))
        }
        
        if companyDetail.subsidiary.count > 1 {
            string.append(createDetailLine(withHeader: subsidiaryTitle, andDetail: companyDetail.subsidiary))
        }
        
        if companyDetail.foreignCountry.count > 1 {
            string.append(createDetailLine(withHeader: foreignCountryTitle, andDetail: companyDetail.foreignCountry))
        }
        
        if companyDetail.revenue > 0 {
            string.append(createDetailLine(withHeader: revenueTitle, andDetail: revenueFormatter(companyDetail.revenue)))
        }
        
        if companyDetail.employeeCount.count > 1 {
            string.append(createDetailLine(withHeader: employeeCountTitle, andDetail: companyDetail.employeeCount))
        }
        
        return string
    }
    
    func buildTrainingParagraph() -> NSMutableAttributedString {
        let trainingSectionHeader = "Training\n"
        let entryAsTitle = "Einstiegsmöglichkeiten: "
        let qualificationTitle = "Zusatzqualifikation: "
        let internshipTitle = "\nPraktika: "
        let internshipBenefitsTitle = "Praktika Vergütung: "
        let internshipInfoTitle = "Praktika Info: "
        let thesisTitle = "\nBachelor-/ Master-Thesis: "
        let thesisBenefitTitle = "Thesis Vergütung: "
        let workingStudentTitle = "\nWerkstudent: "
        let workingStudentBenefitTitle = "Werkstudent Vergütung: "
        let workingStudentInfoTitle = "Werkstudent Info: "
        
        let string = NSMutableAttributedString(string: trainingSectionHeader, attributes: sectionHeaderStyle)
        
        if companyDetail.entryAs.count > 1 {
            string.append(createDetailLine(withHeader: entryAsTitle, andDetail: companyDetail.entryAs))
        }
        
        if companyDetail.qualification.count > 1 {
            string.append(createDetailLine(withHeader: qualificationTitle, andDetail: companyDetail.qualification))
        }
        
        string.append(createDetailLine(withHeader: internshipTitle, andDetail: trainingFormatter(companyDetail.internship)))
        
        string.append(createDetailLine(withHeader: internshipBenefitsTitle, andDetail: trainingFormatter(companyDetail.internshipBenefit)))
        
        if companyDetail.internshipInfo.count > 1 {
            string.append(createDetailLine(withHeader: internshipInfoTitle, andDetail: companyDetail.internshipInfo))
        }
        
        string.append(createDetailLine(withHeader: thesisTitle, andDetail: trainingFormatter(companyDetail.thesis)))
        
        string.append(createDetailLine(withHeader: thesisBenefitTitle, andDetail: trainingFormatter(companyDetail.thesisBenefit)))
        
        string.append(createDetailLine(withHeader: workingStudentTitle, andDetail: trainingFormatter(companyDetail.workingStudent)))
        
        string.append(createDetailLine(withHeader: workingStudentBenefitTitle, andDetail: trainingFormatter(companyDetail.workingStudentBenefit)))
        
        if companyDetail.workingStudentInfo.count > 1 {
            string.append(createDetailLine(withHeader: workingStudentInfoTitle, andDetail: companyDetail.workingStudentInfo))
        }
        return string
    }
    
    func buildContactParagraph() -> NSMutableAttributedString {
        let contactSectionHeader = "AnsprechpartnerIn\n"
        
        let string = NSMutableAttributedString(string: contactSectionHeader, attributes: sectionHeaderStyle)
        
        string.append(contactBuilder(companyDetail.primaryContactDict))
        
        if companyDetail.secondaryContactDict[.firstName]!.count > 1 {
            string.append(NSAttributedString(string: "\n", attributes: contactHeaderStyle))
            string.append(contactBuilder(companyDetail.secondaryContactDict))
        }
        
        return string
    }
}

extension DetailViewParagraphs {
    func revenueFormatter(_ revenue: Int) -> String {
        if revenue >= 1_000_000_000 {
            let i = revenue / 1_000_000 // just get 3 decimals, no rounding
            let f = Float(i) / 1_000    // get correct value for unit
            return "\(f)".replacingOccurrences(of: ".", with: ",") + " Mrd. Euro"
        } else if  revenue >= 1_000_000 {
            let i = revenue / 1_000
            let f = Float(i) / 1_000
            return "\(f)".replacingOccurrences(of: ".", with: ",") + " Mio. Euro"
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
    
    func trainingFormatter(_ detail: Int) -> String {
        if detail == 1 {
            return "✔️"
        } else {
            return "-"
        }
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
