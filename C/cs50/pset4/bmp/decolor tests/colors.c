/**
 * decolor.c
 *
 * getting 2 x Bmp files.
 * hiding 2 into 1
 */
	   
#include <stdio.h>
#include <stdlib.h>
#include "bmp.h"
#include <cs50.h>

void decToBin(int x, char ret[9]);

int main(int argc, char* argv[])
{
	// ensure proper usage
	if (argc != 2)
    {
        printf("Usage: ./decolor infile\n");
        return 1;
    }

    // remember filenames
    char* infile = argv[1];

    // open input file 
    FILE* inptr = fopen(infile, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", infile);
        return 2;
    }

	// read infile's BITMAPFILEHEADER
	BITMAPFILEHEADER bf;
	fread(&bf, sizeof(BITMAPFILEHEADER), 1, inptr);

	// read infile's BITMAPINFOHEADER
	BITMAPINFOHEADER bi;
	fread(&bi, sizeof(BITMAPINFOHEADER), 1, inptr);


	// ensure infile is (likely) a 24-bit uncompressed BMP 4.0
	if (bf.bfType != 0x4d42 || bf.bfOffBits != 54 || bi.biSize != 40 || 
		bi.biBitCount != 24 || bi.biCompression != 0)
	{
		fclose(inptr);
		fprintf(stderr, "Unsupported file format.\n");
		return 4;
	}

	// determine padding for scanlines
	int padding =  (4 - (bi.biWidth * sizeof(RGBTRIPLE)) % 4) % 4;


	// iterate over infile's scanlines
	for (int i = 0, biHeight = abs(bi.biHeight); i < biHeight; i++)
	{
		// iterate over pixels in scanline
		for (int j = 0; j < bi.biWidth; j++)
		{
			// temporary storage
			RGBTRIPLE triple;
			char *binNormRed = malloc(sizeof(char) * 9);
			char *binNormBlue = malloc(sizeof(char) * 9);
			char *binNormGreen = malloc(sizeof(char) * 9);

			// read RGB triple from infiles
			fread(&triple, sizeof(RGBTRIPLE), 1, inptr);
			
			decToBin(triple.rgbtRed, binNormRed);
			decToBin(triple.rgbtGreen, binNormGreen);
			decToBin(triple.rgbtBlue, binNormBlue);
			if (i > 300){
			printf("row %d pixel %d\n", i, j);
		  	printf("original red   bin %s original red   dec %d original red   hex %x\n", binNormRed, triple.rgbtRed, triple.rgbtRed);
		  	printf("original green bin %s original green dec %d original green hex %x\n", binNormGreen, triple.rgbtGreen, triple.rgbtGreen);
		  	printf("original blue  bin %s original blue  dec %d original blue  hex %x\n\n", binNormBlue, triple.rgbtBlue, triple.rgbtBlue);
		  }
		}
		// skip over padding, if any
		fseek(inptr, padding, SEEK_CUR);

	}

	fclose(inptr);

	return 0;
}

void decToBin(int x, char ret[9]) {
	int bit = 1;
	for (int i = 7; i >= 0; --i) {
		ret[i] = (x & bit) ? '1' : '0';
		bit <<= 1;
	}
}