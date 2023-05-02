
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(void)
{
	uint32_t *regmap = (uint32_t *) 0x70000000;

	// Initialize A and B
	size_t A;
	size_t B;

	A = rand();
	B = rand();

	//////////////////////////////////////////////////////////////////////
	regmap[0] = A;
	regmap[1] = B;
	regmap[2] = 0;
	size_t r  = regmap[0];
	if(r == (A & B)){
		printf("%2zu AND %2zu = %3zu \n", A, B, r);
	}
	else{
		printf("\nERR1");
	}

	regmap[2] = 1;
	r  = regmap[0];
	if(r == (A | B)){
		printf("%2zu OR %2zu = %3zu \n", A, B, r);
	}
	else{
		printf("\nERR2");
	}

	regmap[2] = 2;
	r  = regmap[0];
	if(r == (A ^ B)){
		printf("%2zu XOR %2zu = %3zu \n", A, B, r);
	}
	else{
		printf("\nERR3");
	}

	regmap[2] = 3;
	r  = regmap[0];
	if(r == ~(A|B)){
		printf("%2zu NOR %2zu = %3zu \n", A, B, r);
	}
	else{
		printf("\nERR4");
	}
////////////////////////////////////////////////////////////////////////////////////

	//LSL
	printf("\nLSL\n");
	A = 0xFEDCBA98;
	regmap[0] = A;
	regmap[2] = 12;
	for (size_t i = 0; i < 32; i++) {
		regmap[3] = i;
		size_t r  = regmap[0];
		if(r == A << i){
			printf("%2zu logic << %2zu = %3zu \n", A, i, r, (r == A<<i));
		}
		else{
			printf("/n ERR5");
		}
	}

	// ASL
	printf("\nASL\n");
	regmap[2] = 13;
	for (size_t i = 0; i <= 31; i++) {
		regmap[3] = i;
		size_t r  = regmap[0];
		if((r == (signed int)A<<i)){
			printf("%2zd arithmetic << %2zu = %3zd \n", A, i, r);
		}
		else{
			printf("/nERR6");
		}
	}

	// LSR
	printf("\nLSR\n");
	regmap[2] = 14;
	for (size_t i = 0; i <= 31; i++) {
		regmap[3] = i;
		size_t r  = regmap[0];
		if((r == A>>i)){
			printf("%2zu logical >> %2zu = %3zu \n", A, i, r);
		}
		else{
			printf("\nERR7");
		}
	}

	// ASR
	printf("\nASR\n");
	regmap[2] = 15;
	for (size_t i = 0; i <= 31; i++) {
		regmap[3] = i;
		size_t r  = regmap[0];
		if(r == (signed int)A>>i){
			printf("%2zd arithmetic >> %2zu = %3zd \n", A, i, r);
		}
		else{
			printf("\nERR8");
		}
	}

//////////////////////////////////////////////////////////////////////////////////////////


	// Signed
	printf("\nSigned Comp\n");
	regmap[2] = 10;
	r  = regmap[0];
	if(r == ((signed int)A < (signed int)B)){
		printf("%2zd less than %2zd == %3zu \n", A, B, r);
	}
	else{
		printf("ERR9\n");
	}

	// Unsigned
	printf("\nUnsigned Comp\n");
	regmap[2] = 11;
	r  = regmap[0];
	if(r == (A < B)){
			printf("%2zd less than %2zd == %3zu \n", A, B, r);
	}
	else{
		printf("\nERR10");
	}


	/////////////////////////////////////////////////////////////////////////////////////////////

	// Signed add
	printf("\nSigned add\n");
	regmap[2] = 4;
	r  = regmap[0];
	if((signed int)r == ((signed int)A + (signed int)B)){
		printf("%2zd + %2zd == %3zd \n", A, B, r);
	}
	else{
		printf("\nERR11");
	}

	// Unsigned addition
	printf("\nUnsigned add\n");
	regmap[2] = 5;
	r  = regmap[0];
	if(r == (A + B)){
		printf("%2zu + %2zu == %3zu \n", A, B, r);
	}
	else{
		printf("\nERR12");
	}

	// Signed sub
	printf("\nSigned sub\n");
	regmap[2] = 6;
	r  = regmap[0];
	if((signed int)r == ((signed int)A - (signed int)B)){
		printf("%2zd - %2zd == %3zd \n", A, B, r);
	}
	else{
		printf("\nERR13");
	}

	// Unsigned sub
	printf("\nUnsigned sub\n");
	regmap[2] = 7;
	r  = regmap[0];
	if (r == A -B){
		printf("%2zu - %2zu == %3zu \n", A, B, r);
	}
	else{
		printf("\nERR14");
	}

	return 0;
}

