
viveEnMansion(tiaAgatha).
viveEnMansion(mayordomo).
viveEnMansion(charles).

odiaA(tiaAgatha, Persona):-
    viveEnMansion(Persona),
    Persona \= mayordomo.

odiaA(mayordomo, Persona):-
    odiaA(tiaAgatha, Persona).

odiaA(charles, Persona):-
    viveEnMansion(Persona),
    not(odiaA(tiaAgatha, Persona)).

esMasRico(Persona, tiaAgatha):-
    not(odiaA(mayordomo, Persona)),
    viveEnMansion(Persona).

quienMata(Asesino, Victima):-
    odiaA(Asesino, Victima),
    not(esMasRico(Asesino, Victima)),
    viveEnMansion(Asesino).

% 1)
% ?- quienMata(Asesino, tiaAgatha).
% Asesino = tiaAgatha ;
% false.

% 2)
%- Si existe alguien que odie a milhouse.
%    ?- odiaA(Persona, milhouse).
%    false.

%- A quién odia charles.
%    ?- odiaA(charles, Persona).
%    Persona = mayordomo ;
%    false.

%- El nombre de quien odia a tía Ágatha.
%    ?- odiaA(Persona, tiaAgatha).
%    Persona = tiaAgatha ;
%    Persona = mayordomo ;
%    false.

%- Todos los odiadores y sus odiados.
%-   ?- odiaA(Odiador, Odiado).
%    Odiador = Odiado, Odiado = tiaAgatha ;
%    Odiador = tiaAgatha,
%    Odiado = charles ;
%    Odiador = mayordomo,
%    Odiado = tiaAgatha ;
%    Odiador = mayordomo,
%    Odiado = charles ;
%    Odiador = charles,
%    Odiado = mayordomo ;
%    false.

%- Si es cierto que el mayordomo odia a alguien.
%    ?- odiaA(mayordomo,_).
%    true 