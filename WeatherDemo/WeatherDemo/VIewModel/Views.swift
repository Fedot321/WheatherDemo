//
//  Views.swift
//  WeatherDemo
//
//  Created by Macbook Pro on 18.09.2022.
//

import SwiftUI

struct Views: View {
  
    @ObservedObject var modelbol = TempViewModelbol()
    
    var body: some View {
        VStack{
        VStack(alignment: .leading){
            Text("Wheather App")
                .foregroundColor(.white)
                .font(.largeTitle)
            
            TextField("Місто", text: $modelbol.bol)
                .autocapitalization(.words)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(
                    RoundedRectangle(cornerRadius: 10,style: .continuous))
                .accentColor(.blue)
            VStack{
            Text(modelbol.currentWeather.main?.temp != nil ?
                 " \(Image(systemName: "thermometer.sun")) \(Int((modelbol.currentWeather.main?.temp!)!)) ºC"
                 : " ")
            
                Text(modelbol.currentWeather.wind?.speed != nil ?
                     "\(Image(systemName: "wind"))   \(Int((modelbol.currentWeather.wind?.speed!)!)) m/s"
                     : " ")
                
                Text(modelbol.currentWeather.clouds?.all != nil ?
                     "\(Image(systemName: "cloud"))   \(Int((modelbol.currentWeather.clouds?.all!)!)) %"
                     : " ")
               
            }
            .foregroundColor(.white)
            Spacer()
        }
        .font(.largeTitle)
            .padding()
        }.background(Image("f"))
    }
}

struct Views_Previews: PreviewProvider {
    static var previews: some View {
        Views()
    }
}
