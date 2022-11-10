function [R1 R2] = PageRank(nume, d, eps)
    
    % deschidem fisierul de intrare
    file_input = fopen(nume,"r");
    % citim nunmarul de noduri
    n = fscanf(file_input,"%d", 1);
    
    % citim matricea pentru a ajunge la val1 si val2
    for i = 1 : n
        node = fscanf(file_input, "%d", 1);
        index = fscanf(file_input,"%d",1);
        vecini = fscanf(file_input,"%d",index);
    end
    
    val1 = fscanf(file_input, "%f", 1);
    val2 = fscanf(file_input, "%f", 1);
    
    s1 = nume ;
    s2 = ".out" ;
    s = strcat(s1,s2);
    % cream fisierul de iesire
    file_output = fopen(s,'w');
    
    % aflam R1 si R2, vectorii PR cu functiile anterioare
    R1 = Iterative(nume,d,eps);
    R2 = Algebraic(nume,d);
    
    % afisam nr de noduri, vectorul PR1 si vectorul PR2
    fprintf(file_output,"%d\n\n",n);
    fprintf(file_output,"%f\n",R1);
    fprintf(file_output,'\n');
    fprintf(file_output,"%f\n",R2);
    fprintf(file_output,'\n');
    
    % folosim functia Bubblesort, unde X = vectorul sortat, Y = vectorul de noduri
    % se foloseste R2 ( algoritmul algebraic, dupa cum mentioneaza cerinta ) .

    [X , Y] = Bubblesort(R2);
    
    % afisare
    for i = 1 : n
    fprintf(file_output, "%d %d %f\n", i, Y(i), Apartenenta(X(i), val1, val2));
    end

    % inchidem fisierele
    fclose(file_input);
    fclose(file_output);
end
