//
//  aqui_guardan_modelos.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

struct Temporada: Identifiable{
    var id = UUID()
    var nombre: String
    var cantidad_capitulos: Int
    var imagen: String = ""
}

struct Plataforma: Identifiable{
    var id = UUID()
    var nombre: String
    var imagen: String
}

struct InformacionSerie: Identifiable{
    var id = UUID()
    
    var nombre: String
    var tipo: String
    
    var plataformas: [Plataforma] = []
    
    var fecha_estreno: Int
    var sinopsis: String
    
    var temporadas: [Temporada] = []
    var caratula: String
    
}

