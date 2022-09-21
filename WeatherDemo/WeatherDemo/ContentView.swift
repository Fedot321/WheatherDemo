//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Macbook Pro on 16.09.2022.
//

import SwiftUI


struct ContentView: View {
    
    @State private var tab = false
    
    @ObservedObject var modelKharkov = TempViewModelKharkov()
    
    @ObservedObject var modelOdessa = TempViewModelOdessa()
    
    @ObservedObject var modelZp = TempViewModelZp()
    
    @ObservedObject var modelKyiev = TempViewModelKyiv()
    
    var body: some View {
        
        VStack {
            VStack{
                HStack(spacing: 100){
                    
                    Text(" \(Image(systemName: "arrowtriangle.down.fill"))Запорожье")
                        .font(.largeTitle)
                    
                    Button(action: {
                        self.tab.toggle()
                    }) {
                        Image(systemName: "equal.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }.sheet(isPresented: $tab) {
                        Views()
                    }
                }
                HStack{
                    
                    Image(systemName: "cloud.sun")
                    
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 100)
                        .padding()
                    VStack{
                        Text(modelZp.currentWeather.main?.temp != nil ?
                             " \(Image(systemName: "thermometer.sun")) \(Int((modelZp.currentWeather.main?.temp!)!)) ºC"
                             : " ")
                        .font(.title)
                        Text(modelZp.currentWeather.wind?.speed != nil ?
                             "\(Image(systemName: "wind"))   \(Int((modelZp.currentWeather.wind?.speed!)!)) m/s"
                             : " ")
                        .font(.title)
                        Text(modelZp.currentWeather.clouds?.all != nil ?
                             "\(Image(systemName: "cloud"))   \(Int((modelZp.currentWeather.clouds?.all!)!)) %"
                             : " ")
                        .font(.title)
                    }
                }
                
            }
            Spacer()
            
            Divider()
                .background(.black)
            VStack{
                HStack{
                    List{
                        
                        Text ("Київ")
                            .font(.largeTitle)
                        Text(modelKyiev.currentWeather.main?.temp != nil ?
                             " \(Image(systemName: "thermometer.sun")) \(Int((modelKyiev.currentWeather.main?.temp!)!)) ºC"
                             : " ")
                            Text(modelKyiev.currentWeather.clouds?.all != nil ?
                                 "\(Image(systemName: "cloud"))   \(Int((modelKyiev.currentWeather.clouds?.all!)!)) %"
                                 : " ")
                       
                        
                        Text("Одесса")
                            .font(.largeTitle)
                        Text(modelOdessa.currentWeather.main?.temp != nil ?
                             " \(Image(systemName: "thermometer.sun")) \(Int((modelOdessa.currentWeather.main?.temp!)!)) ºC"
                             : " ")
                            Text(modelOdessa.currentWeather.clouds?.all != nil ?
                                 "\(Image(systemName: "cloud"))   \(Int((modelOdessa.currentWeather.clouds?.all!)!)) %"
                                 : " ")
                            
                            Text("Харків")
                                .font(.largeTitle)
                            Text(modelOdessa.currentWeather.main?.temp != nil ?
                                 " \(Image(systemName: "thermometer.sun")) \(Int((modelKharkov.currentWeather.main?.temp!)!)) ºC"
                                 : " ")
                            Text(modelKharkov.currentWeather.clouds?.all != nil ?
                                 "\(Image(systemName: "cloud"))   \(Int((modelKharkov.currentWeather.clouds?.all!)!)) %"
                                 : " ")
                
                       
                    } .font(.largeTitle)
                    
                    
                }
                
            }
            
            
        }
    }
}
            


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
