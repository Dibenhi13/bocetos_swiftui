//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    @State var mostrar_agregar_serie: Bool = false
    
    var body: some View { //DEUDA TECNICA
        if controlador.estado_actual_de_ka_aplicacion == .mostrando_series{
            MenuPrincipalSeries()
        }
        else{
            AgregarSerie()
        }
    }
}


#Preview {
    ContentView()
        .environment(VistaModeloBasico())
}
