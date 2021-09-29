%TP Lógico - Grupo 2
%Punto 1 - Candidatos y partidos
esCandidato(frank,rojo).
esCandidato(claire,rojo).
esCandidato(garrett,azul).
esCandidato(jackie,amarillo).
esCandidato(linda,azul).
esCandidato(catherine,rojo).
esCandidato(heather,amarillo).
esCandidato(seth,amarillo).

edadCandidato(frank, 50).
edadCandidato(claire,52).
edadCandidato(garett, 64).
edadCandidato(peter,26).
edadCandidato(jackie, 38).
edadCandidato(linda,30).
edadCandidato(catherine, 59).
edadCandidato(heather,52).

sePostulaEn(azul,buenosAires).
sePostulaEn(azul,chaco).
sePostulaEn(azul,tierraDelFuego).
sePostulaEn(azul,sanLuis).
sePostulaEn(azul,neuquen).
sePostulaEn(amarillo,chaco).
sePostulaEn(amarillo,formosa).
sePostulaEn(amarillo,tucuman).
sePostulaEn(amarillo,salta).
sePostulaEn(amarillo,santaCruz).
sePostulaEn(amarillo,laPampa).
sePostulaEn(amarillo,corrientes).
sePostulaEn(amarillo,misiones).
sePostulaEn(amarillo,buenosAires).
sePostulaEn(rojo,buenosAires).
sePostulaEn(rojo,santaFe).
sePostulaEn(rojo,cordoba).
sePostulaEn(rojo,chubut).
sePostulaEn(rojo,tierraDelFuego).
sePostulaEn(rojo,sanLuis).

cantidadHabitantes(buenosAires, 15355000).
cantidadHabitantes(chaco, 1143201).
cantidadHabitantes(tierraDelFuego, 160720).
cantidadHabitantes(sanLuis, 489255).
cantidadHabitantes(neuquen, 637913).
cantidadHabitantes(santaFe, 3397532).
cantidadHabitantes(cordoba, 3567654).
cantidadHabitantes(chubut, 577466).
cantidadHabitantes(formosa, 527895).
cantidadHabitantes(tucuman, 1687305).
cantidadHabitantes(salta, 1333365).
cantidadHabitantes(santacruz, 273964).
cantidadHabitantes(laPampa, 349299).
cantidadHabitantes(corrientes, 992595).
cantidadHabitantes(misiones, 1189446).

%No aclaramos que Peter no es candidato del Partido Amarillo ni que el Partido Rojo no se presenta en Formosa por Principio del Universo Cerrado.

%Punto2 - Provincia picante
esPicante(Provincia):-
    sePostulaEn(Partido,Provincia),
    sePostulaEn(OtroPartido,Provincia),
    Partido \= OtroPartido,
    cantidadHabitantes(Provincia,Habitantes),
    Habitantes>1000000.

%Punto3 - PASO
intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

leGanaA(Candidato, OtroCandidato, Provincia):-
    candidatoRepresentaA(Candidato, Partido, Provincia),
    esCandidato(OtroCandidato, OtroPartido),
    condicionDeVictoria(Partido, OtroPartido, Provincia),
    Candidato\=OtroCandidato.

candidatoRepresentaA(Candidato,Partido,Provincia):-
    esCandidato(Candidato, Partido),
    sePostulaEn(Partido, Provincia).

condicionDeVictoria(Partido, Partido, _).

condicionDeVictoria(Partido, OtroPartido, Provincia):-
    not(sePostulaEn(OtroPartido, Provincia)),
    Partido \= OtroPartido.

condicionDeVictoria(Partido,OtroPartido,Provincia):-
    sePostulaEn(OtroPartido, Provincia),
    quienGana(Provincia, Partido, OtroPartido).

quienGana(Provincia, Partido, OtroPartido):-
    intencionDeVotoEn(Provincia, Partido, UnPorcentaje),
    intencionDeVotoEn(Provincia, OtroPartido, OtroPorcentaje),
    UnPorcentaje > OtroPorcentaje.

%Punto 4 - El gran candidato
elGranCandidato(Candidato):-
    esCandidato(Candidato, Partido),
    forall(sePostulaEn(Partido, Provincia), partidoGanaSiempreEnProvincia(Partido, Provincia)), % Para toda provincia en el que partido se presente, el partido gana siempre
    esElCandidatoMasJoven(Candidato, Partido).

partidoGanaSiempreEnProvincia(Partido, Provincia):-
    forall(sePostulaOtroPartido(Partido, OtroPartido, Provincia), quienGana(Provincia, Partido, OtroPartido)). % para todo partido que se presente en la provincia, ver quien gana. Si el partido gana siempre ==> True

sePostulaOtroPartido(Partido, OtroPartido, Provincia) :- % chequea que los partidos sean distintos
    sePostulaEn(OtroPartido, Provincia),
    Partido \= OtroPartido.

esElCandidatoMasJoven(Candidato, Partido):-
    forall(esCandidato(OtroCandidato, Partido), elCandidatoEsMasJoven(Candidato, OtroCandidato)).%Para todo candidato del partido, el candidato original es mas joven

elCandidatoEsMasJoven(Candidato, OtroCandidato):- % compara edades de ambos candidatos
    edadCandidato(Candidato, EdadCandidato),
    edadCandidato(OtroCandidato, EdadOtroCandidato),
    EdadCandidato =< EdadOtroCandidato.

%Haciendo una consulta existencial de la siguiente forma: "elGranCandidato(Candidato).", podemos consultar quienes son gran candidato, y la unica respuesta que obtenemos es Frank.
%Podemos realizar esta consulta gracias al principio del Universo Cerrado y la inversibilidad del predicado de elGranCandidato.

%Punto 5 - Malas consultoras

ajusteConsultora(Partido,Provincia,VotosVerdaderos):-
    intencionDeVotoEn(Provincia,Partido,Porcentaje),
    votosAjustados(Partido,Provincia,Porcentaje,VotosVerdaderos).
    
votosAjustados(Partido,Provincia,Porcentaje,VotosVerdaderos):-
    partidoGanaSiempreEnProvincia(Partido,Provincia),
    VotosVerdaderos is Porcentaje - 20.

votosAjustados(Partido,Provincia,Porcentaje,VotosVerdaderos):-
    not(partidoGanaSiempreEnProvincia(Partido,Provincia)),
    VotosVerdaderos is Porcentaje + 5.
    
%Si ahora quisiéramos evaluar todos los predicados con los valores reales de votos,
%deberiamos cambiar todas las instancias de "intencionDeVotoEn" por "ajusteConsultora"(sin contar la base de datos de intencion de votos), 
%asi los predicados estarian usando "VotosVerdaderos" en vez de "PorcentajePartido".
%Serían un total de 5 predicados a cambiar.

%Punto 6 - Promesas de campaña
promete(azul, construir([edilicio(hospital, 1000),edilicio(jardin, 100), edilicio(escuela, 5)])).
promete(amarillo, construir([edilicio(hospital, 100), edilicio(universidad, 1), edilicio(comisaria, 200)])).
promete(rojo, nuevosPuestosDeTrabajo(800000)).
promete(amarillo, nuevosPuestosDeTrabajo(10000)).
promete(azul, inflacion(2, 4)).
promete(amarillo, inflacion(1, 15)).
promete(rojo, inflacion(10, 30)).

%Punto 7 - Ajustes de boca de urna
%influenciaDePromesas(promesa, variacion).
influenciaDePromesas(Promesa, Variacion):-
    promete(_, Promesa),
    variarVotosPorPromesa(Promesa, Variacion).

variarVotosPorPromesa(inflacion(CotaInferior, CotaSuperior), Variacion):-
    Variacion is -((CotaSuperior + CotaInferior)/ 2).

variarVotosPorPromesa(nuevosPuestosDeTrabajo(Cantidad), 3):-
    Cantidad > 50000.

variarVotosPorPromesa(nuevosPuestosDeTrabajo(Cantidad), 0):-
    Cantidad < 50000.

variarVotosPorPromesa(construir(Construcciones), Variacion):-
    sumarVotosPorConstruccion(Construcciones, Variacion).

sumarVotosPorConstruccion(Construcciones, VariacionTotal):-
    findall(Variacion, (member(TipoDeConstruccion, Construcciones), tipoDeConstruccion(TipoDeConstruccion, Variacion)), ListaDeVariaciones),
    sum_list(ListaDeVariaciones, VariacionTotal).

tipoDeConstruccion(edilicio(hospital, _), 2).

tipoDeConstruccion(edilicio(jardin, Cantidad), Variacion):-
    Variacion is Cantidad * 0.1.

tipoDeConstruccion(edilicio(escuela, Cantidad), Variacion):-
    Variacion is Cantidad * 0.1.

tipoDeConstruccion(edilicio(comisaria, 200), 2).

tipoDeConstruccion(edilicio(comisaria, Cantidad), 0):-
    Cantidad \= 200.

tipoDeConstruccion(edilicio(universidad, _), 0).

tipoDeConstruccion(edilicio(TipoEdilicio, _), -1):-
    TipoEdilicio \= hospital,
    TipoEdilicio \= escuela,
    TipoEdilicio \= comisaria,
    TipoEdilicio \= jardin,
    TipoEdilicio \= universidad.

%Punto 8 - Nuevos votos
promedioDeCrecimiento(Partido,CrecimientoTotal):-
    findall(Crecimiento,crecimientoPorPromesa(Partido,Crecimiento),ListaCrecimientos),
    sumlist(ListaCrecimientos,CrecimientoTotal).

crecimientoPorPromesa(Partido,Crecimiento):-
    promete(Partido,Promesa),
    influenciaDePromesas(Promesa, Crecimiento).

