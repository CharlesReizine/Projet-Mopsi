%%Derni�re modif : Thomas, 25/01/2015%%
%%G�rer la m�thode Trouve_boite%%
%%La nouvelle m�thode Trouve_boite renvoie le numero de this%%
classdef element_boite <handle
    properties
        numero_image;
        descripteur;
    end
    methods
        function element = element_boite(numero,descript)
            element.numero_image = numero;
            element.descripteur = descript;
        end
        function numero = Trouve_boite(self)
            numero = best_bin(self.descripteur);
        end
        %Aucun int�r�t � mettre element en argument, la m�thode
        %Trouve_boite devrait simplement renvoyer le num�ro de la boite
        %correspondante � l'element_boite consid�r�
%         function numero=Trouve_boite(element)
%             numero=best_bin(element.descripteur);
% 
%         end
    end
end
