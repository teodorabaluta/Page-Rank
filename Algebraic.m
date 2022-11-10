function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
    
    % deschidere fisier
    file = fopen(nume,"r");
    % citire numar noduri
    numar_noduri = fscanf(file, "%d", 1);
    
    % formare matrice
    for i = 1 : numar_noduri
        node = fscanf(file, "%d", 1);
        index = fscanf(file,"%d",1);
        vecini = fscanf(file,"%d",index);
        flag = 0;
        
        for j = 1 : index
            if( node == vecini(j))
                flag = 1;
            end
        end
        
        for j= 1 : index
             if(flag == 0)
              matrix(vecini(j), node) = 1/index;
             else
              matrix(vecini(j), node) = 1/(index - 1);
             end     
        end
    end

    for i= 1 : numar_noduri
        matrix(i,i) = 0;
    end
    
    % se formeaza matricea P si matricea unitate
    n = numar_noduri; 
    P = zeros(n,1) + (1-d)/n;
    matricea_unitate = eye(n);
    
    % formam matricea R apeland functia PR_Inv
    PR = PR_Inv(matricea_unitate - d * matrix) * P;
    
    % setam output ul ca fiind vectorul PR calculat
    R = PR;
    
    % inchidem fisierul
    fclose(file);
end
