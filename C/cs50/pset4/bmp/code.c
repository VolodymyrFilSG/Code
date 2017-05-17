/**
 * decolor.c
 *
 * getting 2bmp.
 * hiding 2 into 1
 */
       
#include <stdio.h>
#include <stdlib.h>
#include "bmp.h"



void decToBin(int number, char binary[8], int pointer)
{
	// on start pointer must be 8
    if (number) {
        decToBin(number >> 1, binary, pointer -= 1);
        binary[pointer] = ((number & 1) ? '1': '0');
        printf("number %d binary %s pointer %d\n", number, binary, pointer);
    }
}

int main(int argc, char* argv[])
{
    // ensure proper usage
    if (argc != 4)
    {
        printf("Usage: ./decolor infile file_to_hide outfile\n");
        return 1;
    }

    // remember filenames
    char* infile = argv[1];
    char* tohidep = argv[2];
    char* outfile = argv[3];

    // open input file 
    FILE* inptr = fopen(infile, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", infile);
        return 2;
    }

	// open file to hide
    FILE* tohide = fopen(tohidep, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", tohidep);
        return 3;
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

    // read to_hide_file's BITMAPFILEHEADER and BITMAPINFOHEADER
/*    BITMAPFILEHEADER bf;
    fread(&bf, sizeof(BITMAPFILEHEADER), 1, tohide);

    BITMAPINFOHEADER bi;
    fread(&bi, sizeof(BITMAPINFOHEADER), 1, tohide);*/


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
            RGBTRIPLE tripletoh;
            char *binNormRed = malloc(sizeof(char) * 8);
            char *binNormBlue = malloc(sizeof(char) * 8);
            char *binNormGreen = malloc(sizeof(char) * 8);
            char *binHideRed = malloc(sizeof(char) * 8);
            char *binHideBlue = malloc(sizeof(char) * 8);
            char *binHideGreen = malloc(sizeof(char) * 8);
            
            // read RGB triple from infiles
            fread(&tripletoh, sizeof(RGBTRIPLE), 1, tohide);
            fread(&triple, sizeof(RGBTRIPLE), 1, inptr);
            // triple.rgbtRed, triple.rgbtBlue,triple.rgbtGreen
			
            decToBin(triple.rgbtRed, binNormRed, 8);
            decToBin(tripletoh.rgbtRed, binHideRed, 8);
            decToBin(triple.rgbtGreen, binNormGreen, 8);
            decToBin(tripletoh.rgbtGreen, binHideGreen, 8);
            decToBin(triple.rgbtBlue, binNormBlue, 8);
            decToBin(tripletoh.rgbtBlue, binHideBlue, 8);

            binNormRed[7] = binHideRed[0];
            binNormRed[8] = binHideRed[1];
            binNormGreen[7] = binHideGreen[0];
            binNormGreen[8] = binHideGreen[1];
            binNormBlue[7] = binHideBlue[0];
            binNormBlue[8] = binHideBlue[1];

            printf("row %d, px %d\n", i, j);
            printf("red   old %s new %s\n", binNormRed, binHideRed);
            printf("green old %s new %s\n", binNormGreen, binHideGreen);
            printf("blue  old %s new %s\n\n", binNormBlue, binHideBlue);
            triple.rgbtRed = strtol(binNormRed, NULL, 2);
			triple.rgbtGreen = strtol(binNormGreen, NULL, 2);
			triple.rgbtBlue = strtol(binNormBlue, NULL, 2);

            // write RGB triple to outfile
            fwrite(&triple, sizeof(RGBTRIPLE), 1, outptr);
        }

        // skip over padding, if any
        fseek(inptr, padding, SEEK_CUR);

        // then add it back (to demonstrate how)
        for (int k = 0; k < padding; k++)
        {
            fputc(0x00, outptr);
        }
    }

    // close infile
    fclose(inptr);

    // close outfile
    fclose(outptr);

    fclose(tohide);
    // that's all folks
    return 0;
}
