import Text.Show.Functions()

data Persona = Persona {
    nombre          :: String,
    edad            :: Int,
    sueños          :: [Sueño],
    felicidonios    :: Int,
    habilidades     :: [String]
} deriving (Show)

type Sueño = Persona -> Persona
type Ciudades = [String]
type Fuente = Sueño
type Criterio = ((Persona,Fuente)->(Persona,Fuente) -> (Persona,Fuente))

ciudades :: Ciudades
ciudades = ["Buenos Aires","Madrid", "Iguazu"]

franco :: Persona
franco = Persona { nombre = "Ariel", edad = 26, sueños = [recibirseDeCarrera "diseñoDeInteriores", viajarACiudades ["Paris"]] ,felicidonios = 5000, habilidades = ["Ser buena persona"]}

franco2 :: Persona
franco2 = Persona { nombre = "Ariela", edad = 23, sueños = [ todoSigueIgual], felicidonios = 50, habilidades = ["Ser buena persona"]}

comparacionDeFelicidonios :: (Int -> Int) -> (Int -> Int) -> (Int -> Int) -> Persona -> Int
comparacionDeFelicidonios funcion1 funcion2 funcion3 unaPersona
                        |felicidonios unaPersona > 100 = funcion1 (felicidonios unaPersona)
                        |felicidonios unaPersona <= 100 && felicidonios unaPersona > 50 = funcion2 ((length.sueños) unaPersona)
                        |otherwise  = funcion3 2

coeficienteDeSatisfaccion :: Persona -> Int
coeficienteDeSatisfaccion unaPersona = comparacionDeFelicidonios (* edad unaPersona) (* felicidonios unaPersona) (div (felicidonios unaPersona)) unaPersona

gradoDeAmbicion :: Persona -> Int
gradoDeAmbicion unaPersona = comparacionDeFelicidonios (* (length.sueños) unaPersona) (* edad unaPersona) (* (length.sueños) unaPersona) unaPersona

tieneNombreLargo :: Persona -> Bool
tieneNombreLargo = (>10).length.nombre

esPersonaSuertuda :: Persona -> Bool
esPersonaSuertuda = even.(*3).coeficienteDeSatisfaccion

tieneNombreLindo :: Persona -> Bool
tieneNombreLindo = (=='a').last.nombre

{--Recibirse de una carrera, esto le da 1000 felicidonios por cada letra de la carrera y le agrega la carrera 
como habilidad. Ej: "arquitectura" le suma 12000 felicidonios.
--}

recibirseDeCarrera :: String -> Sueño
recibirseDeCarrera unaCarrera unaPersona = unaPersona {felicidonios = felicidonios unaPersona + multiplicarPor 1000  unaCarrera,
                                                        habilidades = habilidades unaPersona ++ [unaCarrera]}


{--Viajar a una lista de ciudades, suma 100 felicidonios por cada ciudad que visita, en el interín pasa 
un año (la persona tendrá un año más luego de viajar).
--}

modificarFelicidoniosSegun :: (Int -> Int) -> Persona -> Persona
modificarFelicidoniosSegun funcion unaPersona = unaPersona{felicidonios = funcion (felicidonios unaPersona)}

multiplicarPor :: Int -> [a] -> Int
multiplicarPor valor = (*valor).length

viajarACiudades :: Ciudades -> Sueño
viajarACiudades unasCiudades unaPersona =  modificarFelicidoniosSegun (+ multiplicarPor 100 unasCiudades) unaPersona{edad = edad unaPersona + 1}

{--
Enamorarse de otra persona, por lo que suma los felicidonios que esta persona tenga. El sueño no es bidireccional, que X se enamore de Y no implica lo mismo para Y.
--}
enamorarseDePersona :: Persona -> Sueño
enamorarseDePersona unaPersona otraPersona = modificarFelicidoniosSegun (+ felicidonios otraPersona) unaPersona
{--
Para los conformistas, el sueño “que todo siga igual”,  el cual mantiene a la persona sin cambios.
--}

todoSigueIgual :: Sueño
todoSigueIgual = id

{--
Combo perfecto: se recibe de la carrera de "Medicina", viaja a "Berazategui" y "París"
y como bonus extra suma 100 felicidonios por el combo. Definirlo únicamente con funciones existentes.
--}

comboPerfecto :: Sueño
comboPerfecto = viajarACiudades ["Berazategui", "Paris"] . recibirseDeCarrera "Medicina" . modificarFelicidoniosSegun (+100)

--------------------------------------------------------ENTREGA 2---------------------------------------------------
--Punto 4
--La fuente minimalista le cumple el primer sueño a la persona, y lo quita de la lista de sueños de esa persona.

cumplirSueñoEnesimo :: Int -> Fuente
cumplirSueñoEnesimo numeroSueño unaPersona= (last.take numeroSueño) (sueños unaPersona) unaPersona

fuenteMinimalista :: Fuente
fuenteMinimalista unaPersona = cumplirSueñoEnesimo 1 unaPersona{sueños= (tail . sueños) unaPersona}

--La fuente copada le cumple todos los sueños a la persona. La persona debe quedarse sin sueños.
fuenteCopada :: Fuente
fuenteCopada unaPersona = (aplicarTodosLosSueños unaPersona){sueños= []}

aplicarTodosLosSueños :: Persona -> Persona
aplicarTodosLosSueños unaPersona = foldl1 (.) (sueños unaPersona) unaPersona

--La fuente a pedido le cumple el enésimo sueǹo a una persona, pero no lo quita de la lista de sueños.
fuenteAPedido :: Int -> Fuente
fuenteAPedido = cumplirSueñoEnesimo

--Modelar la fuente sorda: como no entiende bien qué sueño tiene que cumplir no le cumple ninguno. 
--Incluir el o los casos de prueba que sean necesarios.

fuenteSorda :: Fuente
fuenteSorda = todoSigueIgual

--Personas
martina :: Persona
martina = Persona { nombre = "Martina", edad = 26, sueños = [todoSigueIgual,comboPerfecto],felicidonios = 500, habilidades = ["Ser buena persona"]}

mateo :: Persona
mateo = Persona { nombre = "Mateo", edad = 26, sueños = [] ,felicidonios = 0, habilidades = ["Ser buena persona"]}

agustin :: Persona
agustin = Persona { nombre = "Agustin", edad = 26, sueños = [todoSigueIgual] ,felicidonios = 100, habilidades = ["Ser buena persona"]}

santi :: Persona
santi = Persona { nombre = "Santi", edad = 26, sueños = sueñoEterno ,felicidonios = 100, habilidades = ["Ser buena persona"]}

--Punto 5
--Dada una lista de fuentes y una persona, saber cuál es la fuente "ganadora" en base a un criterio.

fuentes :: [Fuente]
fuentes = [fuenteMinimalista, fuenteSorda ]


mapFuente :: Persona -> [Fuente] -> [Persona]
mapFuente unaPersona = map (pasarPorLaFuente unaPersona)

tuplasDeJugadorConFuentes :: Persona -> [Fuente] -> [(Persona,Fuente)]

tuplasDeJugadorConFuentes unaPersona listaDeFuentes = zip (mapFuente unaPersona listaDeFuentes) listaDeFuentes --Lista del tipo (Persona,<function>)


retornarFuenteSegunMasFelicidonios :: Criterio
retornarFuenteSegunMasFelicidonios  tupla1 tupla2
    | (felicidonios . fst $ tupla1) > (felicidonios . fst $ tupla2) = tupla1
    | otherwise = tupla2

retornarFuenteSegunMenosFelicidonios :: Criterio
retornarFuenteSegunMenosFelicidonios  tupla1 tupla2
    | (felicidonios . fst $ tupla1) < (felicidonios . fst $ tupla2) = tupla1
    | otherwise = tupla2
retornarFuenteSegunMasHabilidades :: Criterio
retornarFuenteSegunMasHabilidades  tupla1 tupla2
    | (habilidades . fst $ tupla1) > (habilidades . fst $ tupla2) = tupla1
    | otherwise = tupla2


fuenteGanadora :: Criterio ->[(Persona,Fuente)] -> (Persona,Fuente)
fuenteGanadora = foldl1


pasarPorLaFuente :: Persona -> Fuente -> Persona
pasarPorLaFuente unaPersona fuente = fuente unaPersona

--Punto 6
--Saber qué sueños son valiosos para una persona, son aquellos que al cumplirlos la persona queda con más de 100 felicidonios. 
esSueñoTipo ::  (Int -> Bool) -> Persona -> Sueño -> Bool
esSueñoTipo funcion unaPersona sueño = funcion.felicidonios.sueño $ unaPersona

sueñosValiosos :: Persona -> [Sueño]
sueñosValiosos unaPersona = filter (esSueñoTipo (>100) unaPersona).sueños $ unaPersona

--Saber si algún sueño de una persona es raro, que es el que lo deja  con la misma cantidad de felicidonios tras cumplirlo.
haySueñoRaro :: Persona -> Bool
haySueñoRaro unaPersona = any (esSueñoTipo (==felicidonios unaPersona) unaPersona). sueños $ unaPersona

--Dada una lista de personas, poder conocer la felicidad total de ese grupo si cumplen todos sus sueños. Tip: aprovecharse de alguna de las fuentes definidas anteriormente.
felicidadTotal :: [Persona] -> Int
felicidadTotal = sum.map (felicidonios.aplicarTodosLosSueños)

--Punto 7

sueñoEterno :: [Sueño]
sueñoEterno = repeat (viajarACiudades ["Berazategui", "Paris"])

--Modelamos la persona santi, la cual esta en un sueño eterno donde constantemente sueñan lo mismo infinitamente. Se dieron los siguientes casos:

--A)Fuente Minimalista, Sorda y A Pedido : Al aplicar estas fuentes a santi, se realiza la funcion exitosamente gracias a lazy evaluation, pero al devolver la persona nunca 
--termina de crear su lista de sueños.

--B)Fuente Copada: Al aplicar esta fuente a santi, la consola se queda evaluando y nunca retorna el valor de la funcion; esto es porque usamos aplicarTodosLosSueños, 
--donde mediante un foldl1, componemos todos los sueños de dicha persona, lo cual efectivamente no se puede terminar de hacer con una lista infinita de sueños. 