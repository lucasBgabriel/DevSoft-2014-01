#ordena

def ordena a
  i=0
  j=0
  while i < a.size
    j=0
    while j < a.size
      if(a[i] < a[j])
        aux = a[i]
        a[i] = a[j]
        a[j] = aux
      end
      j += 1
    end
    i += 1
  end 
end

def ordena_by_ruby a
  a.sort!
end

numeros = [20, 0, 50, 30, 34, 33, 35, 22, 1]

ordena(numeros)
puts "\nNumeros ordenados por um bubbleSort que eu fiz\n"
print numeros

numeros = [20, 0, 50, 30, 34, 33, 35, 22, 1]

ordena_by_ruby(numeros)
puts "\n\nNumeros ordenados pela funcao sort\n"
print numeros