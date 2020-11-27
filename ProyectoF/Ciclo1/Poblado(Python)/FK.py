from sys import stdin
import random


print('el nombre de la tabla y los atributos como muestra mockaroo desde <insert> hasta <(>, lugar donde esta el atributo para guardarlo ')
nom=stdin.readline().strip()
print('ponga la posicion del atributo que se pone como foranea en la otra tabla')
pos = int(stdin.readline().strip())
lis = [  ]
liss = [ ]
def main():
    print('ingrese los 1000 datos de la tabla',nom)
    line = stdin.readline().strip()
    while line:
        line = line.replace(nom,'')
        line = line.split(',')
        lis.append(line[pos])
        liss.append(line[pos+1])
        line = stdin.readline().strip()

main()
lon = len( lis )
cont = 0
print('ingrese los datos de la tabla donde va a insertar los atributos guardados')
line = stdin.readline().strip()
while line :
    line = line.replace(lis[cont], 'TO_DATE('+lis[cont]+",'MM/DD/YYYY')")
    line = line.replace(liss[cont]+');', 'TO_DATE('+liss[cont]+",'MM/DD/YYYY'));")
    cont+=1
    print(line)
    line = stdin.readline().strip()
    
