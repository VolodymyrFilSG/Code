/**
 * decolor.c
 *
 * getting 2 x Bmp files.
 * hiding 2 into 1
 */
	   
#include <stdio.h>
#include <stdlib.h>
#include "bmp.h"

void decToBin(int x, char* ret);

int main(int argc, char* argv[])
{
	// ensure proper usage
	if (argc != 3)
    {
        printf("Usage: ./decolor infile outfile\n");
        return 1;
    }

    // remember filenames
    char* infile = argv[1];
    char* outfile = argv[2];

    // open input file 
    FILE* inptr = fopen(infile, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", infile);
        return 2;
    }

    // open output file
    FILE* outptr = fopen(outfile, "w");
    if (outptr == NULL)
    {
        fclose(inptr);
        fprintf(stderr, "Could not create %s.\n", outfile);
        return 3;
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
		fclose(outptr);
		fclose(inptr);
		fprintf(stderr, "Unsupported file format.\n");
		return 4;
	}

	// write outfile's BITMAPFILEHEADER
	fwrite(&bf, sizeof(BITMAPFILEHEADER), 1, outptr);

	// write outfile's BITMAPINFOHEADER
	fwrite(&bi, sizeof(BITMAPINFOHEADER), 1, outptr);

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
			char *binNormRed = malloc(sizeof(char) * 8);
			char *binNormBlue = malloc(sizeof(char) * 8);
			char *binNormGreen = malloc(sizeof(char) * 8);

			// read RGB triple from infiles
			fread(&triple, sizeof(RGBTRIPLE), 1, inptr);
			
			decToBin(triple.rgbtRed, binNormRed);
			decToBin(triple.rgbtGreen, binNormGreen);
			decToBin(triple.rgbtBlue, binNormBlue);

			if (binNormRed[7] == 0 || binNormGreen[7] == 0 || binNormBlue[7] == 0){
				triple.rgbtRed = 0;
				triple.rgbtGreen = 0;
				triple.rgbtBlue = 0;
			} else {
				triple.rgbtRed = 255;
				triple.rgbtGreen = 255;
				triple.rgbtBlue = 255;
			}
			
			// write RGB triple to outfile
			fwrite(&triple, sizeof(RGBTRIPLE), 1, outptr);
		}

		// skip over padding, if any
		fseek(inptr, padding, SEEK_CUR);

		// then add it back
		for (int k = 0; k < padding; k++)
		{
			fputc(0x00, outptr);
		}
	}	
		// close infile
		fclose(inptr);

		// close outfile
		fclose(outptr);

	return 0;
}

void decToBin(int x, char* ret) {
	int bit = 1;
	for (int i = 7; i >= 0; --i) {
		ret[i] = (x & bit) ? '1' : '0';
		bit <<= 1;
	}
}