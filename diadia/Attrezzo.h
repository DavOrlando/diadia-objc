
/**
 * Una semplice classe che modella un attrezzo.
 * Gli attrezzi possono trovarsi all'interno delle stanze
 * del labirinto.
 * Ogni attrezzo ha un nome ed un peso.
 *
 * @author  Paolo Merialdo
 * @see Stanza
 * @version 0.1
 *
 */

#import <Foundation/Foundation.h>

@interface Attrezzo : NSObject

@property NSString *nome;
@property int peso;

/**
 * Crea un attrezzo
 * @param nome il nome che identifica l'attrezzo
 * @param peso il peso dell'attrezzo
 */
-(Attrezzo *)initWithNome:(NSString *) nomeAttrezzo andWithPeso: (int) pesoAttrezzo;

/**
	* Restituisce una rappresentazione stringa di questo attrezzo
	* @return la rappresentazione stringa
	*/
-(NSString *)description;

@end
