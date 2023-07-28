//
//  UIViewController.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/11/23.
//

import UIKit

extension UIViewController {
    func cleanCountryData(data: [Country], completion: @escaping () -> Void) -> [Country] {
        var cleanedData: [Country] = []
        for country in data {
            //  -------  Americas  -------
            if country.name == "Anguilla"
                || country.name == "Antarctica"
                || country.name == "Aruba"
                || country.name == "Bermuda"
                || country.name == "Bonaire, Sint Eustatius and Saba"
                || country.name == "Bouvet Island"
                || country.name == "Cayman Islands"
                || country.name == "Curaçao"
                || country.name == "Puerto Rico"
                || country.name == "Falkland Islands (Malvinas)"
                || country.name == "French Guiana"
                || country.name == "Greenland"
                || country.name == "Guadeloupe"
                || country.name == "Heard Island and McDonald Islands"
                || country.name == "Martinique"
                || country.name == "Montserrat"
                || country.name == "Saint Barthélemy"
                || country.name == "Saint Martin (French part)"
                || country.name == "Saint Pierre and Miquelon"
                || country.name == "Sint Maarten (Dutch part)"
                || country.name == "South Georgia and the South Sandwich Islands"
                || country.name == "Turks and Caicos Islands"
                || country.name == "United States Minor Outlying Islands"
                || country.name == "Virgin Islands (British)"
                || country.name == "Virgin Islands (U.S.)" {
//                Do nothing, do not add
            } else if country.name == "Antigua and Barbuda" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Bahamas" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Barbados" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Belize" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Canada" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Costa Rica" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Cuba" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Dominica" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Dominican Republic" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "El Salvador" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Grenada" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Guatemala" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Haiti" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Honduras" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Jamaica" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Mexico" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Nicaragua" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Panama" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Saint Kitts and Nevis" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Saint Lucia" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Saint Vincent and the Grenadines" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Trinidad and Tobago" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "United States of America" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "North America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            }
            //  -------  South America  -------
             else if country.name == "Argentina" {
                 cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Brazil" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Bolivia (Plurinational State of)" {
                cleanedData.append(Country(name: "Bolivia", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Chile" {
                    cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Colombia" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Ecuador" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Guyana" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            }else if country.name == "Paraguay" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            }else if country.name == "Peru" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Suriname" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Uruguay" {
                cleanedData.append(Country(name: country.name, alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Venezuela (Bolivarian Republic of)" {
                cleanedData.append(Country(name: "Venezuela", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            }
            //  -------  Europe  -------
            else if country.name == "Faroe Islands"
                        || country.name == "Gibraltar"
                        || country.name == "Guernsey"
                        || country.name == "Isle of Man"
                        || country.name == "Jersey"
                        || country.name == "Svalbard and Jan Mayen"
                        || country.name == "Åland Islands" {
//                Do nothing, do not add
            } else if country.name == "Macedonia (the former Yugoslav Republic of)" {
                cleanedData.append(Country(name: "North Macedonia", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Russian Federation" {
                cleanedData.append(Country(name: "Russia", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Republic of Kosovo" {
                cleanedData.append(Country(name: "Kosovo", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "United Kingdom of Great Britain and Northern Ireland" {
                cleanedData.append(Country(name: "United Kingdom", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Moldova (Republic of)" {
                cleanedData.append(Country(name: "Moldova", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Holy See" {
                cleanedData.append(Country(name: "Vatican City", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            }
            //  -------  Asia  -------
            else if country.name == "Hong Kong"
                        || country.name == "Macao"{
//                Do nothing, do not add
            } else if country.name == "Brunei Darussalam" {
                cleanedData.append(Country(name: "Brunei", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Iran (Islamic Republic of)" {
                cleanedData.append(Country(name: "Iran", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Korea (Democratic People\'s Republic of)" {
                cleanedData.append(Country(name: "North Korea", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Korea (Republic of)" {
                cleanedData.append(Country(name: "South Korea", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Lao People\'s Democratic Republic" {
                cleanedData.append(Country(name: "Laos", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Palestine, State of" {
                cleanedData.append(Country(name: "Palestine", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Syrian Arab Republic" {
                cleanedData.append(Country(name: "Syria", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Viet Nam" {
                cleanedData.append(Country(name: "Vietnam", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            }
            //  -------  Africa -------
            else if country.name == "British Indian Ocean Territory"
                        || country.name == "French Southern Territories"
                        || country.name == "Mayotte"
                        || country.name == "Réunion"
                        || country.name == "Saint Helena, Ascension and Tristan da Cunha"
                        || country.name == "Western Sahara"{
            } else if country.name == "Congo (Democratic Republic of the)" {
                cleanedData.append(Country(name: "Democratic Republic of the Congo", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Swaziland" {
                cleanedData.append(Country(name: "Eswatini", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else if country.name == "Tanzania, United Republic of" {
                cleanedData.append(Country(name: "Tanzania", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            }
            //  -------  Oceania -------
            else if country.name == "American Samoa"
                        || country.name == "Christmas Island"
                        || country.name == "Cocos (Keeling) Islands"
                        || country.name == "Cook Islands"
                        || country.name == "French Polynesia"
                        || country.name == "Guam"
                        || country.name == "New Caledonia"
                        || country.name == "Niue"
                        || country.name == "Norfolk Island"
                        || country.name == "Northern Mariana Islands"
                        || country.name == "Pitcairn"
                        || country.name == "Tokelau"
                        || country.name == "Wallis and Futuna"{
//                Do nothing, do not add
            } else if country.name == "Micronesia (Federated States of)" {
                cleanedData.append(Country(name: "Micronesia", alpha3Code: country.alpha3Code, capital: country.capital, region: "South America", population: country.population, flags: country.flags, currencies: country.currencies, languages: country.languages))
            } else {
                cleanedData.append(country)
            }
        }
        completion()
        return cleanedData
    }
}
