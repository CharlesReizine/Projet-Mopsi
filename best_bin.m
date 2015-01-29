function etiquette=best_bin(descripteur)
    
etiquette=1; % 1 et pas 0 vu que les tableaux commencent à 1  ..
  
    valeur_moyenne=sum(descripteur)/16;
    for i=1:16
        if sum(descripteur(1+8*(i-1)):(8+8*(i-1)))<valeur_moyenne
            etiquette=etiquette+0;
        else
            etiquette=etiquette+2^(i-1);
        end
    end
end
