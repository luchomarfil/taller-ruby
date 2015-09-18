#1
def ordenar_arreglo(arr)
    arr.sort  
end

#2
def ordenar(*valores)
    valores.sort
end

p ordenar(14,3,2,3,43,2,64,2)

#3
entrada = [10, 9, 1, 2, 3, 5, 7, 8]
# Dada `entrada', invocar a #ordenar utilizando sus valores para ordenarlos
p ordenar(*entrada)

#4

