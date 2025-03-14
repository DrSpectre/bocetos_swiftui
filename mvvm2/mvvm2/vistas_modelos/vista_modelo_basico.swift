//
//  VistaModeloBAsico.swift
//  mvvm2
//
//  Created by Jadzia Gallegos on 14/03/25.
//
import Foundation

@Observable
class VistaModeloBasico{
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie() -> Void{
        print("HOla mundo desde el controlador")
        series_registradas.append(InformacionSerie(nombre: "prueba", tipo: "prueba", fecha_estreno: 2017, sinopsis: "Aqui va una sinopsis muy larga", caratula: "imagen_fake_1"))
    }
}
