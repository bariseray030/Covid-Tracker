//
//  CountryStatisticsFetchRequest.swift
//  CovidStatus
//
//  Created by baris on 15.05.2020.
//  Copyright © 2020 baris. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CountryStatisticsFetchRequest: ObservableObject {
    
    @Published var detailedCountryData: DetailedCountryData?
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "c5f0083e59msh91f6bf4fafb68c7p1e8d8fjsn3edf6cfc377d"
    ]
    
    init() { getStatsFor(countryName: "usa") }
    
    func getStatsFor(countryName: String){
        
        AF.request("https://covid-193.p.rapidapi.com/statistics?country=\(countryName)", headers: headers).responseJSON { response in
           
            let result = response.data
            
            if result != nil {
                let json = JSON(result!)
//                print(json)
//                print(json["response"][0]["country"])
                let country = json["response"][0]["country"].stringValue
                let deaths = json["response"][0]["deaths"]["total"].intValue
                let newDeaths = json["response"][0]["deaths"]["new"].intValue
                let tests = json["response"][0]["tests"]["total"].intValue
                let criticalCases = json["response"][0]["cases"]["critical"].intValue
                let totalCases = json["response"][0]["cases"]["total"].intValue
                let activeCases = json["response"][0]["cases"]["active"].intValue
                let newCases = json["response"][0]["cases"]["new"].intValue
                let recoveredCases = json["response"][0]["cases"]["recovered"].intValue

                self.detailedCountryData = DetailedCountryData(country: country, confirmedCases: totalCases, newCases: newCases, recoveredCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testsDone: tests)
                
            } else {

            }
        }
    }
    
}


