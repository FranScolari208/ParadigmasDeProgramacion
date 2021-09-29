import Text.Show.Functions()

{--Carolina y Manuel son participantes del juego y tienen las siguientes características:

Su nombre.
Una cantidad de dinero.
Su táctica de juego.
Sus propiedades compradas, de las cuales sabemos su nombre y su precio.
Sus acciones a lo largo del juego.

Cada participante comienza con $500, ninguna propiedad a su nombre y con la acción
 pasarPorElBanco, ya que es lo primero que hacen. Además, cada participante tiene su
  propio estilo: 
*La táctica infalible de Carolina es ser una “Accionista” y, por esa razón,
 también tiene la acción pagarAAccionistas. 
*Manuel es un “Oferente singular” y su acción inicial, además de la del banco, es enojarse.

--}

data Persona = Persona {
    nombre          :: String,
    dinero          :: Int,
    tactica         :: String,
    propiedades     :: [Propiedad],
    acciones        :: [Accion]  
} deriving (Show)

type Accion = Persona -> Persona

data Propiedad = UnaPropiedad {
    nombrePropiedad :: String,
    precioPropiedad :: Int
} deriving (Show)

carolina :: Persona
carolina = Persona{nombre = "Carolina", dinero = 500, tactica = "Accionista", propiedades = [], acciones = [pasarPorElBanco, pagarAAccionistas]}

manuel :: Persona
manuel = Persona{nombre = "Manuel", dinero = 500, tactica = "Oferente singular", propiedades = [], acciones = [pasarPorElBanco, enojarse]}

casa :: Propiedad
casa = UnaPropiedad{nombrePropiedad = "Casa", precioPropiedad = 700 }

--Las acciones que puede realizar a lo largo del juego cada participante son:

--pasarPorElBanco: aumenta el dinero del jugador en $40 y cambia su táctica a “Comprador compulsivo”.

pasarPorElBanco :: Accion
pasarPorElBanco unaPersona = (cambioDeTactica "Comprador Compulsivo").(mapCantidadDeDinero (+40)) $ unaPersona

cambioDeTactica :: String -> Accion
cambioDeTactica unaTactica unaPersona = unaPersona{tactica = unaTactica}

mapCantidadDeDinero :: (Int -> Int) -> Accion
mapCantidadDeDinero funcion unaPersona = unaPersona {dinero = funcion.dinero $ unaPersona}
--enojarse: suma $50 y agrega gritar a sus acciones.

enojarse :: Accion
enojarse unaPersona = (agregarAccion gritar).(mapCantidadDeDinero (+50)) $ unaPersona

agregarAccion :: Accion -> Accion
agregarAccion unaAccion unaPersona = unaPersona {acciones = (unaAccion :). acciones $ unaPersona}

--gritar: agrega “AHHHH” al principio de su nombre.
gritar :: Accion
gritar unaPersona = unaPersona{nombre = "AHHHH" ++ nombre unaPersona}

{--
subastar: al momento de una subasta solo quienes tengan como tácticas “Oferente singular” o “Accionista” 
podrán ganar la propiedad. Ganar implica restar el precio de la propiedad de su dinero y sumar la nueva 
adquisición a sus propiedades. 
--}
agregarPropiedad :: Propiedad -> Accion
agregarPropiedad unaPropiedad unaPersona = unaPersona {propiedades = (unaPropiedad :). propiedades $ unaPersona}

comprarPropiedad :: Propiedad -> Accion
comprarPropiedad unaPropiedad unaPersona =  mapCantidadDeDinero (subtract . precioPropiedad $ unaPropiedad) . agregarPropiedad unaPropiedad $ unaPersona
--                                                               funcion     (- valor de la propiedad)

puedeGanar :: String -> Bool
puedeGanar "Oferente singular" = True
puedeGanar "Accionista"        = True
puedeGanar _                   = False

subastar :: Propiedad -> Accion
subastar unaPropiedad unaPersona 
                    |puedeGanar.tactica $ unaPersona = comprarPropiedad unaPropiedad unaPersona
                    |otherwise                         = unaPersona

--cobrarAlquileres: suma $10 por cada propiedad barata y $20 por cada propiedad cara obtenida. Las propiedades 
--baratas son aquellas cuyo precio es menor a $150.
esPropiedadBarata :: Propiedad -> Bool
esPropiedadBarata unaPropiedad = (>150).precioPropiedad $ unaPropiedad

alquileres :: Propiedad -> Int
alquileres unaPropiedad
            |esPropiedadBarata unaPropiedad = 10
            |otherwise                      = 20

dineroDeAlquileres :: Persona -> Int
dineroDeAlquileres unaPersona = sum.map alquileres.propiedades $ unaPersona

cobrarAlquileres :: Accion
cobrarAlquileres unaPersona = mapCantidadDeDinero ((+).dineroDeAlquileres $ unaPersona) unaPersona

--pagarAAccionistas: resta $100 para todos los casos excepto que la táctica sea “Accionista”, en ese caso suma $200.

pagarAAccionistas :: Accion
pagarAAccionistas unaPersona
                |esAccionista unaPersona = mapCantidadDeDinero (+200) unaPersona
                |otherwise                = mapCantidadDeDinero (subtract 100) unaPersona

esAccionista :: Persona -> Bool
esAccionista unaPersona = tactica unaPersona == "Accionista"

--hacerBerrinchePor: cuando una persona hace un berrinche por una propiedad se le suman $10 y se la hace gritar, 
--la persona sigue haciendo berrinche hasta que llegue a comprar la propiedad que quiere.

hacerBerrinchePor :: Propiedad -> Accion
hacerBerrinchePor unaPropiedad unaPersona 
                        |noPuedePagar unaPropiedad unaPersona = hacerBerrinchePor unaPropiedad ((gritar.(mapCantidadDeDinero (+10))) unaPersona)  
                        |otherwise                            = comprarPropiedad unaPropiedad unaPersona

noPuedePagar :: Propiedad -> Persona -> Bool
noPuedePagar unaPropiedad unaPersona = precioPropiedad unaPropiedad > dinero unaPersona

--modelar la función últimaRonda, que dado un participante retorna una acción equivalente a todas sus acciones. 

ultimaRonda :: Accion
ultimaRonda unaPersona = accionesUnaPersona unaPersona $ unaPersona

accionesUnaPersona :: Persona -> Accion
accionesUnaPersona unaPersona = foldl1 (.) (acciones unaPersona)

--Hacer una función juegoFinal la cual toma dos participantes y devuelve al ganador.

juegoFinal :: Persona -> Persona -> Persona
juegoFinal unaPersona otraPersona
            |dineroAlFinalizar unaPersona > dineroAlFinalizar otraPersona = ultimaRonda unaPersona
            |otherwise                                                    = ultimaRonda otraPersona

dineroAlFinalizar :: Persona -> Int
dineroAlFinalizar unaPersona = dinero.ultimaRonda $ unaPersona