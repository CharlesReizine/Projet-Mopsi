%%Dernière modif : Thomas, 25/01/2015%%
%%Gérer la méthode Trouve_boite%%
%%La nouvelle méthode Trouve_boite renvoie le numero de this%%
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
        %Aucun intérêt à mettre element en argument, la méthode
        %Trouve_boite devrait simplement renvoyer le numéro de la boite
        %correspondante à l'element_boite considéré
%         function numero=Trouve_boite(element)
%             numero=best_bin(element.descripteur);
% 
%         end
    end
end
