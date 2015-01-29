%%Dernière modif : Thomas, 26/01/2015%%
%%Ajout de tri_boite_utiles%%
classdef Ensemble <handle
    properties
        Ensemble_boites;%Tableau de cells qui contiennent chacun des element_boites
        Liste_boites_utiles;
        cardinal_boites;%vecteur de taille Ensemble_boite contenant le cardinal de chaque cell
        cardinal;
    end
    methods
        function conteneur = Ensemble()
            conteneur.Ensemble_boites=cell(2^16,1);
            conteneur.Liste_boites_utiles=zeros(1000,1);
            conteneur.cardinal_boites=zeros(2^16,1);
            conteneur.cardinal=0;
        end
        function ajoute_element_ensemble(conteneur,element)%on ajoute un element_boite dans la boite
            numero=element.Trouve_boite();
            conteneur.Ensemble_boites{numero}=[conteneur.Ensemble_boites{numero} element];
            conteneur.cardinal_boites(numero)=conteneur.cardinal_boites(numero) + 1;
        end
        
        function Ajoute_image_Ensemble(conteneur,Irgb,numero)
            conteneur.cardinal=conteneur.cardinal+1;
            %get_luminance demande un type double
            I=get_luminance(Irgb);
            %l'autre demande un type single , on ne prend pas de risque en theorie
            I=single(I);
            % get luminance
            [F,D]=vl_sift(I);
            [H, W]=size(D);
            for i=1:W % On considère chacun des descripteurs de l'image
                descript=D(:,i); 
                
                Nouvel_element=element_boite(numero,descript); % on crée l'élement correspondant
                conteneur.ajoute_element_ensemble(Nouvel_element); % on le place dans l'ensemble
            end
        end
        function  tri_boites_utiles(conteneur)
            [tri, ordre] = sort(conteneur.cardinal_boites,'ascend');
            i=1;
            while tri(i)==0%%Les premiers éléments peuvent être de cardinal nul
                i=i+1;
            end
            conteneur.Liste_boites_utiles = ordre(i:(i+1000));%On obtient la liste des boites caractéristiques
        end
        function liste_image = trouve_image_correspondante(conteneur,Irgb)
                        %get_luminance demande un type double
            I=get_luminance(Irgb);
            %l'autre demande un type single , on ne prend pas de risque en theorie
            I=single(I);
            % get luminance
            [F,D]=vl_sift(I);
            [H, W]=size(D);
            Images_correspondantes=zeros(conteneur.cardinal,1);
            for i=1:W % On considère chacun des descripteurs de l'image
                descript=D(:,i);
                numero = best_bin(descript);
                if sum(ismember(conteneur.Liste_boites_utiles,numero))>0%Si le numero du descripteur est dans Liste_boites_utiles
                    bonne_boite = conteneur.Ensemble_boites{numero};
                    %liste_numero_images = [bonne_boite.numero];
                   [u n] = size(bonne_boite);
                    for i=1:n
                        element=bonne_boite(i);
                        descripteur_boite=element.descripteur;
                        difference=[descripteur_boite-descript];
                        %empecher que ça soit compté plusieurs fois 
                        Images_correspondantes(element.numero_image)=Images_correspondantes(element.numero_image)+1;
                       
                        
                    end
                end
            end
            [correspondante order] = sort(Images_correspondantes,'descend');
            liste_image = order(1:5);         
    end
    end
end

            