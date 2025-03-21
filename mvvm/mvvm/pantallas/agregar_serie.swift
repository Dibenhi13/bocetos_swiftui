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
    @State var plataformas_agregadas: [Plataforma] = []
    
    @State var nombre_plataforma: String = ""
    @State var imagen_plataforma: String = ""
    @State var plataforma_seleccionada: Plataforma? = nil
    
    @State var indicar_problemas: Bool = false
    @State var mostrar_agregar_plataformas: Bool = false
    
    var body: some View {
        Text("Hello, World!")
        
        TextField("El nombre de la serie", text: $nombre_de_la_serie)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie. NO tiene nombre")
        }
        
        TextField("El tipo de la serie", text: $tipo_de_la_serie)
        
        Spacer()
        Text("Plataformas")
        
        ScrollView(.horizontal){
            HStack{
                ForEach(plataformas_agregadas){plataforma in
                    Text(plataforma.nombre).onTapGesture {
                        plataforma_seleccionada = plataforma
                    }
                    
                }
            }
        }.sheet(isPresented: $mostrar_agregar_plataformas){
            Text("Agrega una plataforma")
            
            TextField("Nombre de la plataforma", text: $nombre_plataforma)
            TextField("indica la imagen", text: $imagen_plataforma)
            
            ScrollView(){
                VStack{
                    ForEach(plataformas) { plataforma in
                        /*@START_MENU_TOKEN@*/Text(plataforma.nombre)/*@END_MENU_TOKEN@*/
                    }
                }
            }
            
            Button("Agregar plataforma"){
                if let plataforma = plataforma_seleccionada{
                    plataformas_agregadas.append(plataforma)
                    mostrar_agregar_plataformas.toggle()
                }
                
                if !nombre_plataforma.isEmpty && imagen_plataforma.isEmpty{
                    let plataforma_nueva = Plataforma(nombre: nombre_plataforma, imagen: imagen_plataforma)
                    
                    plataformas_agregadas.append(plataforma_nueva)
                    
                    nombre_plataforma = ""
                    imagen_plataforma = ""
                    
                    mostrar_agregar_plataformas.toggle()
                }
            }
        }
        
        Spacer()
        
        Button("Agregar plataforma"){
            mostrar_agregar_plataformas = true
        }
        
        Spacer()
        
        Button("Agregar serie"){
            print("Agregando serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie, plataformas: plataformas, fecha_estreno: 1, sinopsis: "Aleatorio", caratula: "Foto lol")
            
            indicar_problemas = !controlador.agregar_serie(serie: serie_nueva)
            
        }
        Spacer()
        Spacer()
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
