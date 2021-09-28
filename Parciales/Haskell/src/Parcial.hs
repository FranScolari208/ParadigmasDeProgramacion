import Text.Show.Functions()

--Modelar a los peleadores, de los cuales se conocen sus puntos de vida, su resistencia y el conjunto de los ataques que conoce.

data Peleador = Peleador{
    puntosDeVida :: Int,
    resistencia :: Int,
    conjuntoAtaques :: [Ataque]
}deriving(Show)

type Ataque = Peleador -> Peleador

mapPuntosDeVida ::(Int -> Int) -> Peleador -> Peleador
mapPuntosDeVida unaFuncion unPeleador = unPeleador{puntosDeVida = unaFuncion.puntosDeVida $ unPeleador}

mapConjuntoAtaques :: ([Ataque] -> [Ataque]) -> Peleador -> Peleador
mapConjuntoAtaques unaFuncion unPeleador = unPeleador{conjuntoAtaques = unaFuncion.conjuntoAtaques $ unPeleador}

--Me modelo para hacer pruebas

franco :: Peleador
franco = Peleador{puntosDeVida = 0, resistencia = 5, conjuntoAtaques = [toqueDeLaMuerte, patada "Nuca"]}

--estaMuerto: Un peleador está muerto si su vida es menor a 1.
estaMuerto :: Peleador -> Bool
estaMuerto unPeleador = (<1) . puntosDeVida $ unPeleador

--esHabil: Un peleador es hábil cuando conoce más de 10 ataques.
esHabil :: Peleador -> Bool
esHabil unPeleador = (>10) . length . conjuntoAtaques $ unPeleador

--golpe: Reduce la vida del peleador oponente en una cantidad igual a la intensidad del golpe dividido la resistencia del oponente
golpe :: Int -> Ataque
golpe unaIntensidad unPeleador = mapPuntosDeVida (perderVidaPorGolpe unaIntensidad unPeleador) $ unPeleador

perderVidaPorGolpe :: Int -> Peleador -> (Int -> Int)
perderVidaPorGolpe unaIntensidad unPeleador = subtract . div unaIntensidad $ resistencia unPeleador

--toqueDeLaMuerte: El toque de la muerte hace que el oponente pierda toda su vida.
toqueDeLaMuerte :: Ataque
toqueDeLaMuerte unPeleador = mapPuntosDeVida (const 0) $ unPeleador

--patada: Las patadas causan distintos efectos dependiendo en qué parte del cuerpo el oponente las reciba:

patada :: String -> Ataque
patada "Pecho"  unPeleador   = pegarPatadaEnElPecho unPeleador
patada "Carita" unPeleador   = pegarPatadaEnLaCarita unPeleador
patada "Nuca"   unPeleador   = pegarPatadaEnLaNuca unPeleador
patada   _      unPeleador   = unPeleador

pegarPatadaEnElPecho :: Ataque
pegarPatadaEnElPecho unPeleador
 | estaMuerto unPeleador = mapPuntosDeVida (+1) $ unPeleador
 | otherwise             = mapPuntosDeVida (subtract 10) $ unPeleador

pegarPatadaEnLaCarita :: Ataque
pegarPatadaEnLaCarita unPeleador = mapPuntosDeVida ((subtract . div (puntosDeVida unPeleador)) 2)  $ unPeleador

pegarPatadaEnLaNuca :: Ataque
pegarPatadaEnLaNuca unPeleador = mapConjuntoAtaques (drop 1) $ unPeleador

--Crear a Bruce Lee, un peleador con 200 de vida y 25 de resistencia que tiene entre sus ataques el toque de la muerte,
--un golpe de intensidad 500 y un ataque más que consiste en una secuencia de tres patadas a la carita.

bruceLee :: Peleador
bruceLee = Peleador{puntosDeVida = 200, resistencia = 25, conjuntoAtaques = [toqueDeLaMuerte, golpe 500, patada "Carita" . patada "Carita" . patada "Carita"]}

--terrible: un ataque es terrible para un conjunto de enemigos si, luego de realizarlo contra todos ellos, quedan vivos menos de la mitad.
terrible :: Ataque -> [Peleador] -> Bool
terrible unAtaque unosOponentes = quedanVivosMenosDeLaMitad unosOponentes . sobrevivenAlAtaque . atacarOponentes unAtaque $ unosOponentes

quedanVivosMenosDeLaMitad :: [Peleador] -> [Peleador] -> Bool
quedanVivosMenosDeLaMitad oponentesOriginales oponentesSobrevivientes = div (length oponentesOriginales) 2 > length oponentesSobrevivientes

sobrevivenAlAtaque :: [Peleador] -> [Peleador]
sobrevivenAlAtaque unosSobrevivientes = filter oponenteVivo $ unosSobrevivientes

oponenteVivo :: Peleador -> Bool
oponenteVivo unPeleador = not.estaMuerto $ unPeleador

atacarOponentes :: Ataque -> [Peleador] -> [Peleador]
atacarOponentes unAtaque unosPeleadores = map unAtaque unosPeleadores

--peligroso: un peleador es peligroso para un conjunto de enemigos si todos sus ataque son terribles
--para los miembros del conjunto que son hábiles.

peligroso :: Peleador -> [Peleador] -> Bool
peligroso unPeleador unosOponentes = todosSusAtaquesSonTerribles unPeleador . oponentesHabiles $ unosOponentes

oponentesHabiles :: [Peleador] -> [Peleador]
oponentesHabiles unosOponentes = filter esHabil $ unosOponentes

--aca quiero ver si todos los ataques del peleador son terribles para todos los oponentes habiles

todosSusAtaquesSonTerribles :: Peleador -> [Peleador] -> Bool
todosSusAtaquesSonTerribles unPeleador oponentesHabiles = all (flip terrible oponentesHabiles) . conjuntoAtaques $ unPeleador

--mejorAtaque: dados un peleador y un enemigo, el mejor ataque del peleador contra ese enemigo es el ataque del primero
--que deja con menos vida al segundo

--No llego por tiempo pero lo que pense es que el peleador ataque al oponente y en el caso de que en algun ataque los puntos de vida sean 0 ese es su mejor ataque
mejorAtaque :: Peleador -> Peleador -> (Ataque)
mejorAtaque unPeleador unOponente =

--invencible: un peleador es invencible para un conjunto de enemigos si, luego de recibir el mejor ataque de cada uno de ellos, 
--sigue teniendo la misma vida que antes de ser atacado. (No importa el orden en que se apliquen los ataques).

invencible :: Peleador -> [Peleador] -> Bool
invencible unPeleador unosOponentes = sigueTeniendoLaMismaVida unPeleador . todosLosOponentesAtacan unPeleador $ unosOponentes

sigueTeniendoLaMismaVida :: Peleador -> Peleador -> Bool
sigueTeniendoLaMismaVida peleadorOriginal peleadorAtacado = puntosDeVida peleadorOriginal == puntosDeVida peleadorAtacado

--Aplico al peleador los mejores ataques de sus oponentes
todosLosOponentesAtacan :: Peleador -> [Peleador] -> Peleador
todosLosOponentesAtacan unPeleador unosOponentes = foldr aplicarMejorAtaque unPeleador unosOponentes

--En esta funcion hago la logica de aplicarle el mejor ataque del oponente al peleador
aplicarMejorAtaque :: Peleador -> Peleador -> Peleador
aplicarMejorAtaque unPeleador unOponente = mejorAtaque unOponente unPeleador $ unPeleador

