#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std;

//prototypes
void BuildDeck( int deck[], const int size );
void PrintDeck( int deck[], const int size );
void PrintCard( int card );
void Deal( int deck[], int play[][3] );

int main(void){

/* declare and initialize variables */
int column = 0, i = 0;

/* Declare a 52 element array of integers to be used as the deck of cards */
int deck[52] = {0};
   BuildDeck(deck,52);
   PrintDeck(deck, 52);
   
   /* Declare a 7 by 3 array to receive the cards dealt to play the trick */
int play[7][3] = {0};
Deal(deck,play);
   
}


void BuildDeck( int deck[], const int size)
{
  int used[52] = {0};
  int card = 0, i = 0;

  /* Generate cards until the deck is full of integers */
  while(i < size)
    {
		/* generate a random number between 0 and 51 */
		card= rand() %52;
		
		/* Check the used array at the position of the card.  
		   If 0, add the card and set the used location to 1.  If 1, generate another number */
		if(used[card] == 0){
			used[card] = 1;
			deck[i]= card;
			i++;
		}
    }
	return;
}

void PrintDeck( int deck[], const int size )
{
	int i;

	/* Print out each card in the deck */
	for(int card=0;card<52;card++){
		PrintCard(deck[card]);
	}
	
	
	
}
void PrintCard( int card )
{
	int rank = 0;
	int suit = 0;
	
	rank = card % 13;
	suit = card / 13;

	// Determine the rank of the card and print it out i.e. Queen
	switch(rank){
		case 0 :
			cout<<"King ";
			break;
		case 1:
			cout<<"Ace ";
			break;
		case 11:
			cout<<"Jack ";
			break;
		case 12:
			cout<<"Queen ";
			break;
		default:
			cout<<setw(5)<<rank;
	}
	
	
	// Determine the suit of the card and print it out i.e. of Clubs
	switch(suit){
		case 0:
			cout<<"of Clubs";
			break;
		case 1:
			cout<<"of Spades";
			break;
		case 2:
			cout<<"of Hearts";
			break;
		case 3:
			cout<<"of Diamonds";
			break;
	}
	
	
	return;
}
void Deal( int deck[], int play[][3] )
{
	int row = 0, col = 0, card = 0;
	
	

	/* deal cards by passing addresses of cardvalues from
	   the deck array to the play array                   */
	cout << endl;
	cout << "   Column 0           Column 1           Column 2"<<endl;
	cout << "======================================================="
		 << endl;
	for(row = 0; row<7;row++){
		for(col = 0; col<3;col++){
			play[row][col] = deck[card];
			PrintCard(play[row][col]);
			card++;
		}
		cout<<endl;
	}
	
	
	
	return;
}

