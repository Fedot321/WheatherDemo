//
//  ViewModel.swift
//  WeatherDemo
//
//  Created by Macbook Pro on 18.09.2022.
//

import Foundation
import Combine

final class TempViewModelKyiv: ObservableObject {
    
    @Published var Kyiv : String = "Kyiv"
    
    @Published var currentWeather = WeatherDetail.placeholder
    
    init() {
        
        $Kyiv
              .debounce (for: 0.3, scheduler: RunLoop.main)
              .removeDuplicates()
              .flatMap { (city:String) -> AnyPublisher < WeatherDetail, Never > in
                  WeatherAPI.shared.fetchWeather(for: city)
              }
              .assign(to: \.currentWeather , on: self)
              .store (in: &self.cancellableSet)
    }
        
    private var cancellableSet: Set<AnyCancellable> = []
}

final class TempViewModelZp: ObservableObject {
    
    @Published var zp : String = "Запорожье"
    
    @Published var currentWeather = WeatherDetail.placeholder
    
    init() {
        
        $zp
            .debounce (for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { (city:String) -> AnyPublisher < WeatherDetail, Never > in
                WeatherAPI.shared.fetchWeather(for: city)
            }
            .assign(to: \.currentWeather , on: self)
            .store (in: &self.cancellableSet)
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
}

final class TempViewModelOdessa: ObservableObject {
    
    @Published var Odessa : String = "Одесса"
    
    @Published var currentWeather = WeatherDetail.placeholder
    
    init() {
        
        $Odessa
              .debounce (for: 0.3, scheduler: RunLoop.main)
              .removeDuplicates()
              .flatMap { (city:String) -> AnyPublisher < WeatherDetail, Never > in
                  WeatherAPI.shared.fetchWeather(for: city)
              }
              .assign(to: \.currentWeather , on: self)
              .store (in: &self.cancellableSet)
    }
        
    private var cancellableSet: Set<AnyCancellable> = []
}

final class TempViewModelKharkov: ObservableObject {
    
    @Published var Kharkov : String = "Харьков"
    
    @Published var currentWeather = WeatherDetail.placeholder
    
    init() {
        
        $Kharkov
              .debounce (for: 0.3, scheduler: RunLoop.main)
              .removeDuplicates()
              .flatMap { (city:String) -> AnyPublisher < WeatherDetail, Never > in
                  WeatherAPI.shared.fetchWeather(for: city)
              }
              .assign(to: \.currentWeather , on: self)
              .store (in: &self.cancellableSet)
    }
        
    private var cancellableSet: Set<AnyCancellable> = []
}

final class TempViewModelbol: ObservableObject {
    
    @Published var bol : String = "Лондон"
    
    @Published var currentWeather = WeatherDetail.placeholder
    
    init() {
        
        $bol
              .debounce (for: 0.3, scheduler: RunLoop.main)
              .removeDuplicates()
              .flatMap { (city:String) -> AnyPublisher < WeatherDetail, Never > in
                  WeatherAPI.shared.fetchWeather(for: city)
              }
              .assign(to: \.currentWeather , on: self)
              .store (in: &self.cancellableSet)
    }
        
    private var cancellableSet: Set<AnyCancellable> = []
}
