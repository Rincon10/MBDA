from sys import stdin
import random


print('el nombre de la tabla y los atributos como muestra mockaroo desde <insert> hasta <(>, lugar donde esta el atributo para guardarlo ')
nom=stdin.readline().strip()
print('ponga la posicion del atributo que se pone como foranea en la otra tabla')
pos = int(stdin.readline().strip())
lis = [  ]
def main():
    print('ingrese los 1000 datos de la tabla nom')
    line = stdin.readline().strip()
    while line:
        line = line.replace(nom,'')
        line = line.split(',')
        lis.append(line[pos].replace(');',''))
        line = stdin.readline().strip()
main()
##
##def main1():
##    print('ingrese los 1000 datos de la tabla nom')
##    line = stdin.readline().strip()
##    while line:
##        line = line.replace(nom,'')
##        line = line.split(',')
##        line[pos] = line[pos].replace("'",'')
##        lis.append(line[pos].replace(');',''))
##        line = stdin.readline().strip()
##
####main1()
##lon = len( lis )
##
##'''Validar correo CK'''
##aa = []
##print('ingrese los datos de la tabla donde va a insertar los atributos guardados')
##line = stdin.readline().strip()
##while line:
##    if line.count('.')>1:
##        pos=line.index('.')
##        line=line[:pos]+line[pos+1:]
##    print(line)
##    line = stdin.readline().strip()
##print(len(aa))

'''Validar numeros repetidos PK's'''
print(lis)
aa = []
print('ingrese los datos de la tabla donde va a insertar los atributos guardados')
line = stdin.readline().strip()
cont=1
while line:
    for el in lis:
        if el in line and el not in aa:
            if cont==1:
                print()
                print()
                print()
                cont+=1
            print(line)
            aa.append(el)
    line = stdin.readline().strip()
print(len(aa))



##cont=1
##line = input()
##while line:
##    pal=line[-4:]
##    if 'O' in pal:
##        line=line.replace(pal,"'O');")
##    if 'S' in pal:
##        line=line.replace(pal,"'S');")
##    if 'N' in pal:
##        line=line.replace(pal,"'N');")
##    if 'E' in pal:
##        line=line.replace(pal,"'E');")
##    if cont==1:
##        print()
##        print()
##        cont+=1
##    print(line)
##    line=input()
    
