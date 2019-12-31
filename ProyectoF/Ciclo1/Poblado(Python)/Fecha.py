from sys import stdin
import random


print('el nombre de la tabla y los atributos como muestra mockaroo desde <insert> hasta <(>, lugar donde esta el atributo para guardarlo ')
nom=stdin.readline().strip()
print('ponga la posicion del atributo que se pone como foranea en la otra tabla')
pos = int(stdin.readline().strip())
lis = [  ]

 ###este para todas las cadenas
def main():
    print('ingrese los 1000 datos de la tabla nom')
    line = stdin.readline().strip()
    while line:
        line = line.replace(nom,'')
        line = line.replace(');','')
        line = line.split(',')
        lis.append(line[pos])
        line = stdin.readline().strip()

main()

lon = len( lis )

'''Validar numeros repetidos PK's'''
aa = []
print('ingrese los datos de la tabla donde va a insertar los atributos guardados')
line = stdin.readline().strip()
cont=1
print(lis)
val = 0
while line:
    val +=1
    if cont==1:
        print()
        print()
        print()
        cont+=1
    print(line.replace("':'",'TO_DATE('+lis[val]+",'MM/DD/YYYY')"))
#            print(line.replace(el,'TO_DATE('+el+",'MM/DD/YYYY')"))
    
    line = stdin.readline().strip()
print(len(aa))
