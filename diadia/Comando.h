/**
 * Questa classe modella un comando.
 * Un comando consiste al piu' di due parole:
 * il nome del comando ed un parametro
 * su cui si applica il comando.
 * (Ad es. alla riga digitata dall'utente "vai nord"
 *  corrisponde un comando di nome "vai" e parametro "nord").
 *
 * @author  Paolo Merialdo (da un'idea di Michael Kolling and David J. Barnes) *
 * @version 0.1
 */



#import <Foundation/Foundation.h>

@interface Comando : NSObject

@property NSString *nome, *parametro;

-(Comando *)initWithIstruzione: (NSString *) istruzione;

-(BOOL) sconosciuto;

@end
