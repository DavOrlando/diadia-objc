
/**
 * Classe Stanza - una stanza in un gioco di ruolo.
 * Una stanza e' un luogo fisico nel gioco.
 * E' collegata ad altre stanze attraverso delle uscite.
 * Ogni uscita e' associata ad una direzione.
 * @author Paolo Merialdo (a partire da un'idea di Michael Kolling e David J. Barnes)
 * @see Attrezzo
 * @version 0.1
 */

#import <Foundation/Foundation.h>
#import "Attrezzo.h"

@interface Stanza:NSObject

@property NSString *nome;
@property NSMutableArray *direzioni,*attrezzi,*stanzeAdiacenti;
@property int numeroAttrezzi, numeroStanzeAdiacenti;



-(Stanza *)initWithNome:(NSString *)nomeStanza;

-(void)impostaUnaStanzaAdiacente:(NSString *) direzione :(Stanza *)stanzaAdiacente;

-(Stanza *) getStanzaAdiacente:(NSString *) direzione;

-(NSMutableArray *) getAttrezzi;

-(BOOL) addAttrezzo:(Attrezzo *) attrezzo;

-(NSMutableString *) description;

-(BOOL) hasAttrezzo:(NSString *) nomeAttrezzo;

-(Attrezzo *) getAttrezzo:(NSString *) nomeAttrezzo;

-(BOOL) removeAttrezzo : (Attrezzo *) attrezzo;

-(NSMutableArray *) getDirezioni;

@end