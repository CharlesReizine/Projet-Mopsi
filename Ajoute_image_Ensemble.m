%%Dernière modif : Thomas, 25/01/2015%%
%%Vérifier si une fonction Matlab peut ne pas avoir de valeur de retour%%
function Ajoute_image_Ensemble(path,numero)

Irgb = double(imread(path)); % On recupère l'image
%get_luminance demande un type double
I=get_luminance(Irgb);
%l'autre demande un type single , on ne prend pas de risque en theorie
I=single(I);
% get luminance
[F,D]=vl_sift(I);
[H, W]=size(D);
for i=1:W
    descript=D(:,i);
    Nouvel_element = element_boite(numero,descript);
end
end
    