//
//  Labirinto.m
//  diadia
//
//  Created by Davide Orlando on 04/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import "Labirinto.h"

@implementation Labirinto

-(void) initLabirinto{
    Stanza *atrio = [self stanzaIniziale];
    Stanza *biblioteca = [self stanzaVincente];
    
    Attrezzo *lanterna = [[Attrezzo alloc]initWithNome:@"lanterna" andWithPeso:3];
    
    Attrezzo *osso= [[Attrezzo alloc]initWithNome:@"osso" andWithPeso:1];
    
    Stanza *aulaN11 = [[Stanza alloc] initWithNome:@"Aula N11"];
    Stanza *aulaN10 = [[Stanza alloc]initWithNome:@"Aula N10"];
    Stanza *laboratorio = [[Stanza alloc]initWithNome:@"Laboratorio"];
    
    [atrio impostaUnaStanzaAdiacente:@"nord" :biblioteca ];
    [atrio impostaUnaStanzaAdiacente:@"est" :aulaN11 ];
    [atrio impostaUnaStanzaAdiacente:@"sud" :aulaN10 ];
    [atrio impostaUnaStanzaAdiacente:@"ovest" :laboratorio ];
    
    [aulaN11 impostaUnaStanzaAdiacente:@"est" :laboratorio];
    [aulaN11 impostaUnaStanzaAdiacente:@"ovest" :atrio];
    [aulaN10 impostaUnaStanzaAdiacente:@"nord" :atrio];
    [aulaN10 impostaUnaStanzaAdiacente:@"est" :aulaN11];
    [aulaN10 impostaUnaStanzaAdiacente:@"ovest" :laboratorio];
    [laboratorio impostaUnaStanzaAdiacente:@"est" :atrio];
    [laboratorio impostaUnaStanzaAdiacente:@"ovest" :aulaN11];
    
    [biblioteca impostaUnaStanzaAdiacente:@"sud" :atrio];
    
    [aulaN10 addAttrezzo:lanterna];
    [atrio addAttrezzo:osso];
    
}


-(Labirinto *)initWithStanzaIniziale: (Stanza *) stanzaInizialeLabirinto andWithStanzaVincente:(Stanza *) stanzaVincenteLabirinto{
    [self setStanzaIniziale:stanzaInizialeLabirinto];
    [self setStanzaVincente:stanzaVincenteLabirinto];
    [self initLabirinto];
    return self;
}
@end
