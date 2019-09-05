//
//  ViewController.swift
//  UI_pickerview
//
//  Created by COE-030 on 04/09/19.
//  Copyright © 2019 COe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate , UIPickerViewDataSource
{
    var Countrylist = [Countryclass]()
    var Statelist = [Stateclass]()
    var Citylist = [Cityclass]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0
        {
            return Countrylist.count
        }
        else if component == 1
        {
            return selectedstate.count
        }
        else if component == 2
        {
            return selectedcity.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == 0
        {
            return Countrylist[row].countryName
        }
        else if component == 1
        {
            return selectedstate[row].StateName
        }
        else if component == 2
        {
            return selectedcity[row].CityName
        }
        return ""
    }
    var selectedstate = [Stateclass]()
    var selectedcity = [Cityclass]()
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0
        {
            selectedstate = Statelist.filter({ (stateobj) -> Bool in
                if stateobj.CountryReference == Countrylist[row].countryId
                {
                    return true
                }
                return false
            })
            pickerView.reloadComponent(1)
        }
        else if component == 1
        {
            selectedcity = Citylist.filter({ (cityobj) -> Bool in
                if cityobj.StateReference == Statelist[row].StateId
                {
                    return true
                }
                return false
            })
            pickerView.reloadComponent(2)
        }
    }

        override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var country = Countryclass()
        country.countryId = 1
        country.countryName = "India"
        Countrylist.append(country)
        
        country.countryId = 2
        country.countryName = "USA"
        Countrylist.append(country)
        
        country.countryId = 3
        country.countryName = "Australlia"
        Countrylist.append(country)
        
        //states
        var state = Stateclass()
        state.StateId = 1
        state.StateName = "Gujrat"
        state.CountryReference = 1
        Statelist.append(state)
        
        state.StateId = 1
        state.StateName = "Delhi"
        state.CountryReference = 1
        Statelist.append(state)
        
        state.StateId = 2
        state.StateName = "losangles"
        state.CountryReference = 2
        Statelist.append(state)
        
        state.StateId = 3
        state.StateName = "melbourne"
        state.CountryReference = 3
        Statelist.append(state)
        
        //city
        var city = Cityclass()
        city.CityId = 1
        city.CityName = "Himmatnagar"
        city.StateReference = 1
        Citylist.append(city)
        
        city.CityId = 2
        city.CityName = "Atlanta"
        city.StateReference = 2
        Citylist.append(city)
        
        city.CityId = 3
        city.CityName = "L.A."
        city.StateReference = 3
        Citylist.append(city)
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

