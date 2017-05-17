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

BYTE split(BYTE valueI);
RGBTRIPLE getCryptPix(RGBTRIPLE original);
int main(int argc, char const *argv[])
{
	if (argc != 3)
    {
        printf("Usage: ./code infile outfile\n");
        return 1;
    }

    const char* inFile = argv[1];
    const char* outFile = argv[2];

    FILE* inptr = fopen(inFile, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", inFile);
        return 2;
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
			fread(&tripleOriginal, sizeof(RGBTRIPLE), 1, inptr);

			tripleOriginal = getCryptPix(tripleOriginal);
			fwrite(&tripleOriginal, sizeof(RGBTRIPLE), 1, outptr);
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

RGBTRIPLE getCryptPix(RGBTRIPLE original){
	RGBTRIPLE output;
	output.rgbtBlue = split(original.rgbtBlue);
	output.rgbtGreen = split(original.rgbtGreen);
	output.rgbtRed = split(original.rgbtRed);	
	return output;
}

BYTE split(BYTE valueI){
	union toBiteArray temp;
	temp._byte = valueI;
	union toBiteArray out0;

	out0._byte = 0x00;
	out0.bits.b7 = temp.bits.b1;
	out0.bits.b8 = temp.bits.b2;
	return out0._byte;
}



int* toBinaryStr(BYTE value)
{
	union toBiteArray temp;
	temp._byte = value;
	int ret[8];
	ret[0] = temp.bits.b1;
	ret[1] = temp.bits.b2;
	ret[2] = temp.bits.b3;
	ret[3] = temp.bits.b4;
	ret[4] = temp.bits.b5;
	ret[5] = temp.bits.b6;
	ret[6] = temp.bits.b7;
	ret[7] = temp.bits.b8;
	return &ret;
}

