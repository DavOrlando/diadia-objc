//
//  Stanza.m
//  diadia
//
//  Created by Davide Orlando on 03/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import "Stanza.h"
@implementation Stanza

const int NUMERO_MASSIMO_DIREZIONI = 4;
const int NUMERO_MASSIMO_ATTREZZI = 10;


/**
 * Crea una stanza. Non ci sono stanze adiacenti, non ci sono attrezzi.
 * @param nome il nome della stanza
 */

-(Stanza *)initWithNome:(NSString *)nomeStanza{
    [self setNome:nomeStanza];
    [self setNumeroAttrezzi:0];
    [self setNumeroStanzeAdiacenti:0];
    self.direzioni = [[NSMutableArray alloc]initWithCapacity:NUMERO_MASSIMO_DIREZIONI];
    self.stanzeAdiacenti = [[NSMutableArray alloc]initWithCapacity:NUMERO_MASSIMO_DIREZIONI];
    self.attrezzi = [[NSMutableArray alloc]initWithCapacity:NUMERO_MASSIMO_ATTREZZI];
    for(int i=0;i<10;i++) {
        self.attrezzi[i] = [[Attrezzo alloc]init];
    }
    for(int i = 0;i<4;i++){
        self.stanzeAdiacenti[i] = [[Stanza alloc]init];
        self.direzioni[i] = [[NSString alloc]init];
    }
    return self;
}

/**
 * Imposta una stanza adiacente.
 *
 * @param direzione direzione in cui sara' posta la stanza adiacente.
 * @param stanza stanza adiacente nella direzione indicata dal primo parametro.
 */

-(void)impostaUnaStanzaAdiacente:(NSString *) direzione :(Stanza *)stanzaAdiacente{
    BOOL aggiornato = false;
    for(int i=0;i<[self.direzioni count];i++)
        if([direzione compare:self.direzioni[i]]==0){
            self.stanzeAdiacenti[i] = stanzaAdiacente;
            aggiornato = true;
        }
    if (!aggiornato) {
        if(self.numeroStanzeAdiacenti<NUMERO_MASSIMO_DIREZIONI){
            self.direzioni[self.numeroStanzeAdiacenti] = direzione;
            self.stanzeAdiacenti[self.numeroStanzeAdiacenti] = stanzaAdiacente;
            self.numeroStanzeAdiacenti++;
        }
    }
}


/**
 * Restituisce la stanza adiacente nella direzione specificata
 * @param direzione
 */

-(Stanza *) getStanzaAdiacente:(NSString *) direzione{
    Stanza *stanza = NULL;
    for(int i = 0;i<self.numeroStanzeAdiacenti;i++){
        if ([self.direzioni[i] compare:direzione]==0) {
            stanza = self.stanzeAdiacenti[i];
        }
    }
    return stanza;
}

/**
 * Restituisce la collezione di attrezzi presenti nella stanza.
 * @return la collezione di attrezzi nella stanza.
 */
-(NSMutableArray *) getAttrezzi{
    return self.attrezzi;
}



/**
 * Mette un attrezzo nella stanza.
 * @param attrezzo l'attrezzo da mettere nella stanza.
 * @return true se riesce ad aggiungere l'attrezzo, false atrimenti.
 */

-(BOOL) addAttrezzo:(Attrezzo *) attrezzo{
    if (self.numeroAttrezzi<NUMERO_MASSIMO_ATTREZZI) {
        self.attrezzi[self.numeroAttrezzi] = attrezzo;
        self.numeroAttrezzi++;
        return true;
    }
    else return false;
}


/**
	* Restituisce una rappresentazione stringa di questa stanza,
	* stampadone la descrizione, le uscite e gli eventuali attrezzi contenuti
	* @return la rappresentazione stringa
	*/
-(NSMutableString *) description{
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendString:@"\n"];
    [s appendString:self.nome];
    [s appendString:@"\nUscite: "];
    for (int i =0; i<[self.direzioni count]; i++) {
        if(self.direzioni[i]!=NULL){
            [s appendString:@" "];
        [s appendString:self.direzioni[i]];
        }
    }
    [s appendString:@"\nAttrezzi nella stanza: "];
    for(int i =0;i<self.numeroAttrezzi;i++){
        [s appendString:[self.attrezzi[i] description]];
        [s appendString:@" "];
    }
    return s;
}


/**
	* Controlla se un attrezzo esiste nella stanza (uguaglianza sul nome).
	* @return true se l'attrezzo esiste nella stanza, false altrimenti.
	*/
-(BOOL) hasAttrezzo:(NSString *)nomeAttrezzo{
    BOOL trovato = false;
    for (int i=0; i<self.numeroAttrezzi; i++) {
        if([[self.attrezzi[i] nome] isEqualToString:nomeAttrezzo])
            trovato = true;
    }
    return trovato;
}

/**
 * Restituisce l'attrezzo nomeAttrezzo se presente nella stanza.
 * @param nomeAttrezzo
 * @return l'attrezzo presente nella stanza.
 * 		   null se l'attrezzo non e' presente.
 */
-(Attrezzo *) getAttrezzo:(NSString *)nomeAttrezzo{
    Attrezzo *attrezzoCercato;
    for (int i= 0; i<self.numeroAttrezzi; i++) {
        if([[self.attrezzi[i] nome]isEqualToString:nomeAttrezzo])
            attrezzoCercato = self.attrezzi[i];
    }
    return attrezzoCercato;
}

/**
 * Rimuove un attrezzo dalla stanza (ricerca in base al nome).
 * @param nomeAttrezzo
 * @return true se l'attrezzo e' stato rimosso, false altrimenti
 */
-(BOOL) removeAttrezzo : (Attrezzo *) attrezzo{
    BOOL rimosso = false;
    for(int i=0;i<self.numeroAttrezzi;i++){
        if([self.attrezzi[i] isEqualTo:attrezzo])
            self.attrezzi[i]=self.attrezzi[self.numeroAttrezzi-1];
        self.attrezzi[self.numeroAttrezzi-1] = [[Attrezzo alloc]init];
        self.numeroAttrezzi--;
        rimosso = true;
    }
        return rimosso;
}


-(NSMutableArray *) getDirezioni{
    NSMutableArray *direzioni= [[NSMutableArray alloc]initWithCapacity:self.numeroStanzeAdiacenti];
    for (int i=0; i<self.numeroStanzeAdiacenti; i++) {
        direzioni[i] = self.direzioni[i];
    }
    return direzioni;
}
    
@end
