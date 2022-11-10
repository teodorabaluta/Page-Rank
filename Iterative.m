function R = Iterative(nume, d, eps)
    fid = 0;
    while fid < 1
        %se deschide un fisier cu numele citit de la tastatura
        nume = input ("Deschide fisier: ", "s"); 
        fid = fopen(nume, 'r'); %modul citire
        if fid == -1
            disp("Fisierul nu exista"); %daca fisierul nu exista se va afisa mesajul
        end
    end
    n = fscanf(fid, "%d", 1); %se citeste primul nr, adica nr de noduri
    A = zeros(n, n); %matrice default
    for i = 1 : n
        vecini = fscanf(fid, "%d", 1); %citim primul nr dar il avem deja stocat in i
        vecini = fscanf(fid, "%d", 1); %asa ca trecem la al doilea ce reprezinta nr de vecini
        for j = 1 : vecini
            x = fscanf(fid, "%d", 1); %se citeste fiecare nod adiacent lui i
            A(i, x) = 1; %pt fiecare din aceste noduri punem 1 in matrice
        end
    end

    val1 = fscanf(fid, "%f", 1); %citire val1
    val2 = fscanf(fid, "%f", 1); %citire val2