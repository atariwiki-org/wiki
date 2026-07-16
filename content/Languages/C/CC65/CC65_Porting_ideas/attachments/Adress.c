# include <stdio.h>
# include <conio.h>
# include <string.h>
# include <stdlib.h>

static struct adressbook
{
	char name[10];
	char surname[12];
	char adress[50];
	char webpage[50];
	char email[50];
	char phone[20];
	char mphone[20];
};

// prototypes

void In(void);
void Out(void);
void Remove(void);
void Print(void);
int  Length(void);
void Statistics(void);
void Help(void);
void Person(void);

# define StructLength sizeof(struct adressbook);

// global variables

static struct adressbook s[270];

// main function

void main()
{
	char select[125];
	FILE *fin;

	if ((fin = fopen("Adress.dat", "rb")) != NULL)
	{
		fclose(fin);
		while (1)
		{
			clrscr();
			printf("ADRESS BOOK v1.0\nAuthor: Gasper Rajsek, July 2001\n\n1 - Add person to database\n2 - Print person to screen\n3 - Remove person from database\n4 - Print person to printer\n5 - Statistics\n6 - Instructions\n7 - Exit\n\nSelect: ");
			scanf("%s", &select);
			if ((select[0] == '1') && (select[1] == '\0'))
			{
				In();
			}
			else if ((select[0] == '2') && (select[1] == '\0'))
			{
				Out();
			}
			else if ((select[0] == '3') && (select[1] == '\0'))
			{
				Remove();
			}
			else if ((select[0] == '4') && (select[1] == '\0'))
			{
				Print();
			}
			else if ((select[0] == '5') && (select[1] == '\0'))
			{
				Statistics();
			}
			else if ((select[0] == '6') && (select[1] == '\0'))
			{
				if ((fin = fopen("Help.dat", "rb")) != NULL)
				{
					Help();
				}
				else
				{
					do
					{
						clrscr();
						printf("Can not open file Help.dat!");
						printf("\n\nHelp\n");
						printf("\n1. If the file Help.dat is missing or it is corrupted, then send me an email to    this adress \"programer_@hotmail.com\" and you will get a new copy of this        file.");
						printf("\n\nPress key \"RETURN\" to continue.");
					} while (getch() != 13);
				}
			}
			else if ((select[0] == '7') && (select[1] == '\0'))
			{
				break;
			}
			else
			{
				do
				{
					clrscr();
					printf("Wrong selection.\n\nPress key \"RETURN\" for another try.");
				} while (getch() != 13);
			}
		}
	}
	else
	{
		do
		{
			clrscr();
			printf("Can not open file Adress.dat!\n");
			printf("\nHelp\n");
			printf("\n1. If the file Adress.dat is missing then you should create it and it's size       must be equal to 0.");
			printf("\n2. If the file Adress.dat exist and program can not open it then you should        delete it and create it again and it's size must be equal to 0.");
			printf("\n\nPress key \"RETURN\" to exit to system.");
		} while (getch() != 13);
	}
	fclose(fin);
}

void In()
{
	int NPerson, i, j, number, counter;
	FILE *fin;
	char tName[10], tSurname[12];

	do
	{
		clrscr();
		counter = 0;
		NPerson = 0;
		NPerson = Length() / StructLength;
		printf("SUBSCRIBE PERSON INTO DATABASE");
		Person();
		printf("\n\nHow many persons will you subscribe (\"0\" to exit to menu)? ");
		scanf("%d", &number);
		gets(0); // prevents jump over name
		for (i=1; i<=number; i++)
		{
			printf("\n-------------------------------- Person No.: %3d -------------------------------", NPerson+i);
			printf("Enter name: ");
			gets(s[i].name);
			printf("Enter surname: ");
			gets(s[i].surname);
			// save name and surname in two temporary variables
			sscanf(s[i].name, "%s", tName);
			sscanf(s[i].surname, "%s", tSurname);
			// checking name and surname in database
			fin = fopen("Adress.dat", "rb");
			for (j=1; j<=NPerson; j++)
			{
				fread(&s[j], sizeof(s[j]), 1, fin);
				if ((strcmp(s[j].name, tName) == 0) && (strcmp(s[j].surname, tSurname) == 0))
				{
					counter = 1;
				}
			}
			fclose(fin);
			// end of checking
			if (counter == 1) printf("\nPerson \"%s %s\" is already subscribed in database.\n", tName, tSurname);
			if (counter != 1)
			{
				// temp variables are now s[i].name and s[i].surname
				sscanf(tName, "%s", s[i].name);
				sscanf(tSurname, "%s", s[i].surname);
				printf("Enter home adress: ");
				gets(s[i].adress);
				printf("Enter home page adress: ");
				gets(s[i].webpage);
				printf("Enter e-mail: ");
				gets(s[i].email);
				printf("Enter home phone: ");
				gets(s[i].phone);
				printf("Enter mobile phone: ");
				gets(s[i].mphone);
				printf("--------------------------------------------------------------------------------");
				fin = fopen("Adress.dat", "ab");
				fwrite(&s[i], sizeof(s[i]), 1, fin);
				fclose(fin);
			}
		}
		if (number != 0)
		{
			printf("\nPress any key to continue.");
			getch();
		}
	} while (number != 0); fcloseall();
}

void Out()
{
	char fName[10], fSurname[12];
	int counter, NPerson, i;
	FILE *fin;

	gets(0);  // prevents jump over name
	do
	{
		clrscr();
		counter = 0;
		NPerson = 0;
		NPerson = Length() / StructLength;
		if (NPerson == 0)
		{
			do
			{
				counter = 1;
				clrscr();
				printf("Database is empty.\n\nPress key \"RETURN\" to exit to menu.");
			} while (getch() != 13); break;
		}
		if (counter != 1)
		{
			printf("PRINTING PERSON TO SCREEN");
			Person();
			printf("\n\nEnter name (\"0\" to exit to menu): ");
			gets(fName);
			if (strcmp(fName, "0") == 0) counter = 2;
			if (counter != 2)
			{
				printf("Enter surname (\"0\" to exit to menu): ");
				gets(fSurname);
				if (strcmp(fSurname, "0") == 0) counter = 3;
				if (counter != 3)
				{
					fin = fopen("Adress.dat", "rb");
					for(i=1; i<=NPerson; i++)
					{
						fread(&s[i], sizeof(s[i]), 1, fin);
						if ((strcmp(s[i].name, fName) == 0) && (strcmp(s[i].surname, fSurname) == 0))
						{
							counter = 4;
							printf("\n\n--------------------------------------------------------------------------------");
							printf("Name and surname: %s %s", s[i].name, s[i].surname);
							printf("\nHome adress:      %s", s[i].adress);
							printf("\nHome page adress: %s", s[i].webpage);
							printf("\nE-mail:           %s", s[i].email);
							printf("\nHome phone:       %s", s[i].phone);
							printf("\nMobile phone:     %s", s[i].mphone);
							printf("\n--------------------------------------------------------------------------------\n");
						}
					}
					if (counter != 4) { printf("\nPerson \"%s %s\" is not subscribed in database.\n", fName, fSurname); }
					fclose(fin);
				}
			}
		}
		if ((strcmp(fName, "0") != 0) && (strcmp(fSurname, "0") != 0))
		{
			printf("\nPress any key to continue.");
			getch();
		}
	} while ((strcmp(fName, "0") != 0) && (strcmp(fSurname, "0") != 0));
}

void Remove()
{
	char rName[10], rSurname[12];
	int counter, NPerson, i;
	FILE *fin;

	gets(0);  // prevents jump over name
	do
	{
		clrscr();
		counter = 0;
		NPerson = 0;
		NPerson = Length() / StructLength;
		if (NPerson == 0)
		{
			do
			{
				counter = 1;
				clrscr();
				printf("Database is empty.\n\nPress key \"RETURN\" to exit to menu.");
			} while (getch() != 13); break;
		}
		if (counter != 1)
		{
			printf("REMOVING PERSON FROM DATABASE");
			Person();
			printf("\n\nEnter name (\"0\" to exit to menu): ");
			gets(rName);
			if (strcmp(rName, "0") == 0) counter = 2;
			if	(counter != 2)
			{
				printf("Enter surname (\"0\" to exit to menu): ");
				gets(rSurname);
				if (strcmp(rSurname, "0") == 0) counter = 3;
				if (counter != 3)
				{
					fin = fopen("Adress.dat", "w+b");
					for(i=1; i<=NPerson; i++)
					{
						fread(&s[i], sizeof(s[i]), 1, fin);
						if ((strcmp(s[i].name, rName) == 0) && (strcmp(s[i].surname, rSurname) == 0))
						{
							counter = 4;
							printf("\nPerson \"%s %s\" is removed from database.\n", rName, rSurname);
						}
						else
						{
							fwrite(&s[i], sizeof(s[i]), 1, fin);
						}
					}
					if (counter != 4) printf("\nPerson \"%s %s\" is not subscribed in database.\n", rName, rSurname);
					fclose(fin);
				}
			}
		}
		if ((strcmp(rName, "0") != 0) && (strcmp(rSurname, "0") != 0))
		{
			printf("\nPress any key to continue.");
			getch();
		}
	} while ((strcmp(rName, "0") != 0) && (strcmp(rSurname, "0") != 0));
}

void Print()
{
	char fName[10], fSurname[12];
	int counter, NPerson, i;
	FILE *fin;

	gets(0);  // prevents jump over name
	do
	{
		clrscr();
		counter = 0;
		NPerson = 0;
		NPerson = Length() / StructLength;
		if (NPerson == 0)
		{
			do
			{
				counter = 1;
				clrscr();
				printf("Database is empty.\n\nPress key \"RETURN\" to exit to menu.");
			} while (getch() != 13); break;
		}
		if (counter != 1)
		{
			printf("PRINTING PERSON TO PRINTER");
			Person();
			printf("\n\nEnter name (\"0\" to exit to menu): ");
			gets(fName);
			if (strcmp(fName, "0") == 0) counter = 2;
			if (counter != 2)
			{
				printf("Enter surname (\"0\" to exit to menu): ");
				gets(fSurname);
				if (strcmp(fSurname, "0") == 0) counter = 3;
				if (counter != 3)
				{
					fin = fopen("Adress.dat", "rb");
					for(i=1; i<=NPerson; i++)
					{
						fread(&s[i], sizeof(s[i]), 1, fin);
						if ((strcmp(s[i].name, fName) == 0) && (strcmp(s[i].surname, fSurname) == 0))
						{
							counter = 4;
							fprintf(stdprn, "\n\r\n\r--------------------------------------------------------------------------------\n\r");
							fprintf(stdprn, "\n\rName and surname: %s %s\n\r", s[i].name, s[i].surname);
							fprintf(stdprn, "\n\rHome adress:      %s\n\r", s[i].adress);
							fprintf(stdprn, "\n\rHome page adress: %s\n\r", s[i].webpage);
							fprintf(stdprn, "\n\rE-mail:           %s\n\r", s[i].email);
							fprintf(stdprn, "\n\rHome phone:       %s\n\r", s[i].phone);
							fprintf(stdprn, "\n\rMobile phone:     %s\n\r", s[i].mphone);
							fprintf(stdprn, "\n\r-------------------------------------------------------------------------------\n\r\n\r");
						}
					}
					if (counter != 4) { printf("\nPerson \"%s %s\" is not subscribed in database.\n", fName, fSurname); }
					fclose(fin);
				}
			}
		}
		if ((strcmp(fName, "0") != 0) && (strcmp(fSurname, "0") != 0))
		{
			printf("\nPress any key to continue.");
			getch();
		}
	} while ((strcmp(fName, "0") != 0) && (strcmp(fSurname, "0") != 0));
}

int Length()
{
	int size=0;
	FILE *fin;

	fin = fopen("Adress.dat", "rb");

	while ((fscanf(fin, "%c")) != EOF)
	{
		size++;
	}
	fclose(fin);
	return size;
}

void Statistics()
{
	int NPerson;

	do
	{
		NPerson = 0;
		NPerson = Length() / StructLength;
		clrscr();
		printf("STATISTICS OF DATABASE");
		printf("\n\nNumber of persons in database is %d.", NPerson);
		printf("\nSize of database is %d bytes.", Length());
		printf("\n\nPress key \"RETURN\" to exit to menu.");
	} while (getch() != 13);
}

void Help()
{
	unsigned char c;
	int i;
	FILE *fin;

	do
	{
		clrscr();
		fin = fopen("Help.dat", "r");

		while (!feof(fin))
		{
			c = fgetc(fin);
			for (i=0; i<=26; i++)
			{
				if (c == 97 + i)
				{
					c = 32 + i;
				}
				else if (c == 32 + i)
				{
					c = 97 + i;
				}
				else if (c == 65 + i)
				{
					c = 130 + i;
				}
				else if (c == 130 + i)
				{
					c = 65 + i;
				}
			}
			printf("%c", c);
		}
		printf("\n			Press key \"RETURN\" to exit to menu.");
		fclose(fin);
	} while (getch() != 13);
}

void Person()
{
	int i, NPerson;
	FILE *fin;

	NPerson = 0;
	NPerson = Length() / StructLength;
	fin = fopen("Adress.dat", "rb");

	printf("\n\nSubscribed persons are:\n");
	if (NPerson == 0) printf("\nDatabase is empty.");
	for (i=1; i<=NPerson; i++)
	{
		fread(&s[i], sizeof(s[i]), 1, fin);
		printf("\n%s %s", s[i].name, s[i].surname);
	}
	fclose(fin);
}