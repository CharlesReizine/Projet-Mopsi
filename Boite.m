%%Dernière modif : Thomas, 25/01/2015 %%
%%Classe opérationnelle%%
classdef Boite <handle
    properties
        cardinal;
        etiquette;
        elements;
    end
    methods
        function box = Boite(etiquette)
            box.etiquette = etiquette;
            box.cardinal = 0;
            box.elements=[];
        end
        function self = ajout(self,element)%on ajoute un element_boite dans la boite
            self.elements = [self.elements, element];
            self.cardinal=self.cardinal+1;
        end
    end
end

            