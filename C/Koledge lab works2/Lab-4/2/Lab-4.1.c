#include<stdio.h>
struct stud{
	char lname[5], fname[5];
	int n, math, physics, inform;
	float midmark;};
intmain() {
	stud std;
	FILE *p;
	if ((p = fopen("student.dat", "w")) == NULL)
		printf("file does not exist");
	else{
		printf("enter number of string from 1 to 10, 0 - toend\n");
		scanf("%d", &std.n);
		while (std.n != 0){
			printf("enter lname, fname, math, physics, inform\n");
			scanf("%s %s %d %d %d", &std.lname, &std.fname, &std.math, &std.physics, &std.inform);
			std.midmark = (std.math + std.physics + std.inform) / 3;
			fseek(p, (std.n - 1)*sizeof(structstud), SEEK_SET);
			fwrite(&std, sizeof(structstud), 1, p);
			printf("enter next number\n");
			scanf("%d", &std.n);
		}
		fclose(p);	}
	if ((p = fopen("student.dat", "r")) == NULL)
		printf("file can't be opened");
	else{
		printf("students with midmark 4 or bigger\n");
		while (!feof(p)){
			f.read(&std, sizeof(struct stud), 1, p);
			if (std.midmark >= 4)
				printf("¹  %d\n", std.n);}
		rewind(p);
		printf("to see all information about student, select his number\n");
		while (!feof(p)){
			scanf("%d", &std.n);
			fseek(p, (std.n - 1)*sizeof(structstud), SEEK_SET);
			fread(&std, sizeof(structstud), 1, p);
			if (std.midmark >= 4)
				printf("%s %s %d %d %d %f\n", std.lname, std.fname, std.math, std.physics, std.inform, std.midmark);}
		fclose(p);
	}
	return 0;
}
