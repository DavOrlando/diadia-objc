/**
 *  Classe principale di diadia, un semplice gioco di ruolo ambientato al dia.
 *  Per giocare crea un'istanza di questa classe e invoca il letodo gioca
 *
 *  Questa e' la classe principale crea e istanzia tutte le altre
 *
 * @author  Paolo Merialdo (da un'idea di Michael Kolling and David J. Barnes) *
 * @version 0.1
 */

#import "Diadia.h"
@implementation Diadia

const NSString* MESSAGGIO_BENVENUTO= @"Ti trovi nell'Universita', ma oggi e' diversa dal solito...\nMeglio andare al piu' presto in biblioteca a studiare. Ma dov'e'?\nI locali sono popolati da strani personaggi, alcuni amici, altri... chissa!\nCi sono attrezzi che potrebbero servirti nell'impresa:\npuoi raccoglierli, usarli, posarli quando ti sembrano inutili\no regalarli se pensi che possano ingraziarti qualcuno.\n\nPer conoscere le istruzioni usa il comando 'aiuto'.";

NSString *elencoComandi[3] = {@"fine",@"aiuto",@"vai"};

-(void) initWithPartitaSemplice{
    Partita *partita = [[Partita alloc] initWithCfuIniziali];
    [self setPartita:partita];
}

-(void) gioca{
    [self initWithPartitaSemplice];
    char inputUtente[50];
    NSString *istruzione;
    printf("%s \n%s",[MESSAGGIO_BENVENUTO UTF8String],[[[[self partita] stanzaCorrente] description] UTF8String]);
    do{
        fgets(inputUtente, 50, stdin);
        int numberChar = strlen(inputUtente);
        NSString *stringaLeggere = [[NSString alloc]initWithBytes:inputUtente length:numberChar encoding:NSUTF8StringEncoding];
        istruzione = [stringaLeggere substringToIndex:numberChar-1];
    }
    while(![self processaIstruzione:istruzione]);
    
}



-(BOOL)processaIstruzione:(NSString *) istruzione{
    Comando *comandoDaEseguire = [[Comando alloc]initWithIstruzione:istruzione];
    if ([[comandoDaEseguire nome] isEqualToString:@"fine"]) {
        [self fine];
        return true;
    }
    else if ([[comandoDaEseguire nome]isEqualToString:@"vai"]) {
        [self vai:[comandoDaEseguire parametro]];
    }
    else if([[comandoDaEseguire nome] isEqualToString:@"aiuto"]){
        [self aiuto];
    }
    else if([[comandoDaEseguire nome]isEqualToString:@"prendi"]){
        [self prendi:[comandoDaEseguire parametro]];
    }
    else if([[comandoDaEseguire nome]isEqualToString:@"posa"]){
        [self posa:[comandoDaEseguire parametro]];
    }
    else NSLog(@"Comando sconosciuto!");
    if ([[self partita] vinta]) {
        NSLog(@"Hai vinto!");
        return true;
    }
    else return false;
}

-(void) prendi:(NSString *) nomeAttrezzo{
    Attrezzo *a = [[[self partita] stanzaCorrente]getAttrezzo:nomeAttrezzo];
    if (a==NULL) {
        NSLog(@"Attrezzo non presente.Cosa vuoi prendere dalla stanza?");
        return;
    }
    [[[self partita] stanzaCorrente]removeAttrezzo:a];
    [[[[self partita] giocatore] borsa]addAttrezzo:a];
    NSLog([[[[self partita]giocatore]borsa]description]);
}

-(void) vai:(NSString *) direzione{
    if (direzione==NULL) {
        NSLog(@"Dove vuoi andare?");
    }
    else{
        Stanza *prossimaStanza = [[Stanza alloc]init];
        prossimaStanza = [[[self partita] stanzaCorrente] getStanzaAdiacente:direzione];
        if (prossimaStanza==NULL) {
            NSLog(@"Direzione inesistente!");
        }
        else{
            [[self partita] setStanzaCorrente:prossimaStanza];
            int cfu = [[self partita] cfu] -1;
            [[self partita] setCfu:cfu];
        }
    }
    NSLog([[[self partita] stanzaCorrente] description]);
    
}

-(void) posa: (NSString *) nomeAttrezzo{
    Attrezzo *a = [[[[self partita]giocatore]borsa]getAttrezzo:nomeAttrezzo];
    if(a!= NULL){
        [[[self partita]stanzaCorrente]addAttrezzo:a];
        [[[[self partita]giocatore]borsa]removeAttrezzo:nomeAttrezzo];
        NSLog([[[self partita]stanzaCorrente]description]);
    }
    else NSLog(@"Oggetto non presente nella borsa");
}


-(void) fine{
    NSLog(@"Grazie di aver giocato!");
}


-(void)aiuto{
    for(int i =0;i<3;i++)
        NSLog(@"%@",elencoComandi[i]);
}


@end
