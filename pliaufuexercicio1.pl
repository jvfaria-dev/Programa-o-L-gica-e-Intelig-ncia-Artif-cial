resolve(S) :-
    S = busstop(_,_,_,_,_),
    
    % A mulher de Verde está entre a Márcia e a mulher que gosta de Frango, nessa ordem.
    esta_entre(M1,M2,M3,S),
    camiseta(M1,verde),
    nome(M2,marcia),
    comida(M3,frango),
    
    % A mulher que gosta de Chá está exatamente à esquerda de quem vai pegar o ônibus 3333-C.
    exatamente_a_esquerda(M4,M5,S),
    bebida(M4,cha),
    onibus(M5,"3333-C"),
    
    % Cecília está em algum lugar entre quem vai pegar o ônibus 1111-A e a Paola, nessa ordem.
    esta_entre(M6,M7,M8,S),
    nome(M6,cecilia),
    onibus(M7,"1111-A"),
    nome(M8,paola),
    
    % Na quarta posição está a mulher que vai ao Cinema.
    quarta_posicao(M9,S),
    destino(M9,cinema),
    
    % Quem está esperando o ônibus 4444-D está em algum lugar à direita da mulher da camiseta Branca.
    exatamente_a_direita(M10,M11,S),
    camiseta(M10,branca),
    onibus(M11,"4444-D"),
    
    % Em uma das pontas está a mulher que gosta de Vinho.
    uma_das_pontas(M12,S),
    bebida(M12,vinho),
    
    % Quem vai à Livraria está em algum lugar entre quem gosta de Sopa e quem vai ao Museu, nessa ordem.
    esta_entre(M13,M14,M15,S),
    destino(M13,livraria),
    comida(M14,sopa),
    destino(M15,museu),
    
    % A mulher da camiseta Amarela está na primeira posição.
    camiseta(M16,amarela),
    primeira_posicao(M16,S),
    
    % Isabela está exatamente à esquerda de quem gosta de Suco.
    exatamente_a_esquerda(M17,M18,S),
    nome(M17,isabela),
    bebida(M18,suco),
    
    % Quem está esperando pelo ônibus 2222-B está em algum lugar entre a Isabela e quem está esperando pelo ônibus 5555-E, nessa ordem.
    esta_entre(M19,M20,M21,S),
    onibus(M19,"2222-B"),
    nome(M20,isabela),
    onibus(M21,"5555-E"),
    
    % Em uma das pontas está a mulher que gosta de Macarrão.
    uma_das_pontas(M22,S),
    comida(M22,macarrao),
    
    % Quem gosta de Café está ao lado de quem vai ao Parque.
    ao_lado(M23,M24,S),
    bebida(M23,cafe),
    destino(M24,parque),
    
    % Quem gosta de Pizza está em algum lugar entre quem vai à Livraria e quem gosta de Frango, nessa ordem.
    esta_entre(M25,M26,M27,S),
    comida(M25,pizza),
    destino(M26,livraria),
    comida(M27,frango),
    
    % A mulher que vai ao Teatro está ao lado da mulher que gosta de Peixe.
    ao_lado(M28,M29,S),
    destino(M28,teatro),
    comida(M29,peixe),
    
    % A mulher que vai ao Teatro está ao lado da mulher que gosta de Peixe.
    exatamente_a_esquerda(M30,M31,S),
    camiseta(M30,vermelho),
    comida(M31,frango),
    
    % Quem vai ao Museu está em algum lugar entre quem gosta de Sopa e quem está de Branco, nessa ordem.
    esta_entre(M32,M33,M34,S),
    destino(M32,museu),
    comida(M33,sopa),
    camiseta(M34,branca),
    
	% A mulher de Azul está em uma das pontas.
    uma_das_pontas(M35,S),
    camiseta(M35,azul),
    
    % A mulher que gosta de Suco está na terceira posição.
    terceira_posicao(M36,S),
    bebida(M36,suco),
    
    % Quem gosta de Suco está em algum lugar entre quem gosta de Sopa e a Cecília, nessa ordem.
    esta_entre(M37,M38,M39,S),
    bebida(M37,suco),
    comida(M38,sopa),
    nome(M39,cecilia),

	% Fechamento
    alguma_mulher(M40,S),
    nome(M40,vitoria),
    alguma_mulher(M41,S),
    bebida(M41,agua).

camiseta(mulher(C,_,_,_,_,_),C).
nome(mulher(_,N,_,_,_,_),N).
comida(mulher(_,_,C,_,_,_),C).
bebida(mulher(_,_,_,B,_,_),B).
onibus(mulher(_,_,_,_,O,_),O).
destino(mulher(_,_,_,_,_,D),D).

primeira_posicao(X,busstop(X,_,_,_,_)).
terceira_posicao(X,busstop(_,_,X,_,_)).
quarta_posicao(X,busstop(_,_,_,X,_)).

exatamente_a_direita(X,Y,busstop(Y,X,_,_,_)).
exatamente_a_direita(X,Y,busstop(_,Y,X,_,_)).
exatamente_a_direita(X,Y,busstop(_,_,Y,X,_)).
exatamente_a_direita(X,Y,busstop(_,_,_,Y,X)).

exatamente_a_esquerda(X,Y,S) :-
    exatamente_a_direita(Y,X,S).

esta_entre(M,I,F,busstop(I,M,F,_,_)).
esta_entre(M,I,F,busstop(I,M,_,F,_)).
esta_entre(M,I,F,busstop(I,M,_,_,F)).
esta_entre(M,I,F,busstop(I,_,M,F,_)).
esta_entre(M,I,F,busstop(I,_,M,F,_)).
esta_entre(M,I,F,busstop(I,_,M,_,F)).
esta_entre(M,I,F,busstop(I,_,_,M,F)).
esta_entre(M,I,F,busstop(_,I,M,F,_)).
esta_entre(M,I,F,busstop(_,I,M,_,F)).
esta_entre(M,I,F,busstop(_,I,_,M,F)).
esta_entre(M,I,F,busstop(_,_,I,M,F)).

uma_das_pontas(X,busstop(X,_,_,_,_)).
uma_das_pontas(X,busstop(_,_,_,_,X)).

ao_lado(X,Y,S) :-
    exatamente_a_esquerda(X,Y,S);
    exatamente_a_esquerda(Y,X,S).

alguma_mulher(X,busstop(X,_,_,_,_)).
alguma_mulher(X,busstop(_,X,_,_,_)).
alguma_mulher(X,busstop(_,_,X,_,_)).
alguma_mulher(X,busstop(_,_,_,X,_)).
alguma_mulher(X,busstop(_,_,_,_,X)).
















        
        
        
        
        