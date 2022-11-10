function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
	
	%se calculeaza diferenta celor doua valori citite
	dif = (val2 - val1); 
    	
	%se calculeaza a si b astfel incat functia sa fie continua
    	a = 1 / dif;
    	b = -val1 / dif;
    	
	%rezolvarea sistemului
    	if x < val1
        	y = 0;
    	end

    	if x >= val1 && x <= val2
        	y = a * x + b;
    	end
    
    	if x >= val2
        	y = 1;
	end
end
