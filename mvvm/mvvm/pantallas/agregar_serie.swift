//
//  agregar_serie.swift
//  mvvm
//
//  Created by alumno on 3/19/25.
//

import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_la_serie: String = ""
    @State var plataformas: [Plataforma] = [
        Plataforma(nombre: "Hulu", icono: "Icono plus")
    ]
    
    @State var indicar_problemas: Bool = false
    
    var body: some View {
        Text("Hello, World!")
        TextField("El nombre de la serie", text: $nombre_de_la_serie)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie. NO tiene nombre")
        }
        
        TextField("El tipo de la serie", text: $tipo_de_la_serie)
        
        Spacer()
        Text("Plataformas")
        
        ScrollView{
            HStack{
                ForEach(plataformas){ plataforma in
                    Text(plataforma.nombre)
                    
                }
            }
        }
        
        Button("Agregar plataforma"){
            print("Agregar una plataforma, falta implementar")
        }
        
        Button("Agregar serie"){
            print("Agregando serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie, plataformas: plataformas, fecha_estreno: 1, sinopsis: "Aleatorio", caratula: "Foto lol")
            
            indicar_problemas = !controlador.agregar_serie(serie: serie_nueva)
        }
    }
}

/*
 var nombre: String
 var tipo: String
 
 var plataformas: [Plataforma] = []
 
 var fecha_estreno: Int
 var sinopsis: String
 
 var temporadas: [Temporada] = []
 var caratula: String
 */

#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
