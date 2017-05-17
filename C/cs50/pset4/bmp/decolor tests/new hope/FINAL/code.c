#include "bmp.h"
#include <stdio.h>


union toBiteArray;
struct bits;

union toBiteArray
{
	BYTE _byte;
	struct
	{
		unsigned b1:1;
		unsigned b2:1;
		unsigned b3:1;
		unsigned b4:1;
		unsigned b5:1;
		unsigned b6:1;
		unsigned b7:1;
		unsigned b8:1;
	}bits;
};

BYTE split(BYTE valueI, BYTE valueO);
RGBTRIPLE getCryptPix(RGBTRIPLE original, RGBTRIPLE crypte);
int main(int argc, char const *argv[])
{
	if (argc != 4)
    {
        printf("Usage: ./code infile file_to_hide outfile\n");
        return 1;
    }

    const char* inFile = argv[1];
    const char* fileToHide = argv[2];
    const char* outFile = argv[3];

    FILE* inptr = fopen(inFile, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", inFile);
        return 2;
    }

    FILE* toHidePtr = fopen(fileToHide, "r");
    if (toHidePtr == NULL)
    {
        printf("Could not open %s.\n", fileToHide);
        return 3;
    }

    FILE* outptr = fopen(outFile, "w");
    if (outptr == NULL)
    {
        fclose(inptr);
        fprintf(stderr, "Could not create %s.\n", outFile);
        return 3;
    }
	
	// read infile's BITMAPFILEHEADER
	BITMAPFILEHEADER bf;
	fread(&bf, sizeof(BITMAPFILEHEADER), 1, inptr);

	// read infile's BITMAPINFOHEADER
	BITMAPINFOHEADER bi;
	fread(&bi, sizeof(BITMAPINFOHEADER), 1, inptr);

	int padding =  (4 - (bi.biWidth * sizeof(RGBTRIPLE)) % 4) % 4;

	if (bf.bfType != 0x4d42 || bf.bfOffBits != 54 || bi.biSize != 40 || 
		bi.biBitCount != 24 || bi.biCompression != 0)
	{
		fclose(outptr);
		fclose(inptr);
		fprintf(stderr, "Unsupported file format.\n");
		return 4;
	}

	fwrite(&bf, sizeof(BITMAPFILEHEADER), 1, outptr);

	fwrite(&bi, sizeof(BITMAPINFOHEADER), 1, outptr);
	
	for(int i = 0; i <= bi.biWidth; i++){
		for(int j = 0; j <= bi.biHeight; j++){
			RGBTRIPLE tripleOriginal;
			RGBTRIPLE tripleToCrypt;
			fread(&tripleOriginal, sizeof(RGBTRIPLE), 1, inptr);
			fread(&tripleToCrypt, sizeof(RGBTRIPLE), 1, toHidePtr);
			tripleToCrypt = getCryptPix(tripleOriginal, tripleToCrypt);
			fwrite(&tripleToCrypt, sizeof(RGBTRIPLE), 1, outptr);
		}
	}

	// skip over padding, if any
	fseek(inptr, padding, SEEK_CUR);

	// then add it back
	for (int k = 0; k < padding; k++){
		fputc(0x00, outptr);
	}	

	return 0;
}

RGBTRIPLE getCryptPix(RGBTRIPLE original, RGBTRIPLE crypte){
	RGBTRIPLE output;
	output = original;
	output.rgbtBlue = split(crypte.rgbtBlue, original.rgbtBlue);
	output.rgbtGreen = split(crypte.rgbtGreen, original.rgbtGreen);
	output.rgbtRed = split(crypte.rgbtRed, original.rgbtRed);	
	return output;
}

BYTE split(BYTE valueI, BYTE valueO){
	union toBiteArray temp;
	temp._byte = valueI;
	if(valueI < 64)	{
		temp.bits.b1 = 0;
		temp.bits.b2 = 0;
	}
	else if(valueI < 128){
		temp.bits.b1 = 0;
		temp.bits.b2 = 1;
	}
	else if(valueI < 192){
		temp.bits.b1 = 1;
		temp.bits.b2 = 0;
	}
	else {
		temp.bits.b1 = 1;
		temp.bits.b2 = 1;
	}
	union toBiteArray out0;
	out0._byte = valueO;
	out0.bits.b1 = temp.bits.b1;
	out0.bits.b2 = temp.bits.b2;
	return out0._byte;
}