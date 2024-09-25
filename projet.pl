

%% Le dictionnaire (adpaté d'un sujet en Programmation fonctionnelle de Claire Lefèvre).

%% Un dictionnaire est un arbre de constructeur (ie. symbole de fonction) dic/3 de premier argument, un caractère,
 de deuxième argument, un booléen qui indique si le chemin depuis la racine est un mot du dictionnaire ou non, et un troisième argument, une liste de dictionnaires. 
%% Par exemple, le dictionnaire ci-dessous représente l'ensemble de mots «a», «an», «bac» et «bar».
%% Les mots sont lus depuis la racine jusqu'au noeuds étiquetés par un booléen true
. Les noeuds étiquetés par un booléen false ne peuvent pas terminer un mot. Par exemple,
 «b» et «ba» ne sont pas des mots dans l'arbre. Par convention, la racine de l'arbre sera toujours étiquetée par le caractère '*'.

un_dico(dic('*', false, [
		dic('a', true, [
			dic('n', true, [])]),
		dic('b', false, [
			dic('a', false, [
				dic('c', true, []),
				dic('r', true, [])])]),
		dic('c', true, [])])).

%% 1. Définir le prédicat cherche/2 qui est tel que cherche(Mot, Dico) est vrai si la chaîne de caractères Mot est dans 
le dictionnaire Dico.
%% On utilisera le prédicat string_chars/2 
qui est tel que string_chars(String, Chars) est vrai si Chars est la liste des caractères de 
la chaîne de caractères String (http://www.swi-prolog.org/pldoc/man?predicate=string_chars/2).

%% Exemples :
%% ?- un_dico(Dico), cherche("an", Dico).
%% Dico = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[])])])]) ;
%% ;
%% false.
%% ?- un_dico(Dico), cherche("ba", Dico).
%% false.

%% 2. Définir le prédicat tous_les_mots/2 qui est tel que tous_les_mots(Dico, Liste_Mots) est vrai si la liste Liste_Mots est la liste de tous les mots du dictionnaire.

%% Exemple :
%% ?- un_dico(Dico), tous_les_mots(Dico, L).
%% Dico = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[])])])]),
%% L = ["a","an","bac","bar"] ;
%% ;
%% false.

%% 3. Définir le prédicat inserer/3 qui est tel que inserer(String, Dico, Dico_) est vrai si le dictionnaire Dico_ est le résultat de l'insertion de la chaîne de caractères String dans le dictionnaire Dico.

%% Exemple :
%% ?- un_dico(Dico), inserer("baie", Dico, Dico_).
%% Dico = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[])])])]),
%% Dico_ = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[]),dic(i,false,[dic(e,true,[])])])])]) ;
%% ;
%% false.

%% 4. Définir le prédicat suppimer_v1/3 qui est tel que supprimer_v1(String, Dico, Dico_) est vrai si le dictionnaire Dico_ est le résultat de la suppresion de la chaîne de caractère String dans le dictionnaire Dico simplement en modifiant les étiquettes booléennes.

%% Exemple :
%%  ?- un_dico(Dico), inserer("baie", Dico, Dico_), supprimer_v1("bar", Dico_, Dico__).
%% Dico = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[])])])]),
%% Dico_ = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[]),dic(i,false,[dic(e,true,[])])])])]),
%% Dico__ = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,false,[]),dic(i,false,[dic(e,true,[])])])])]) ;
%% ;
%% false.

%% 5. Définir le prédicat suppimer_v2/3 qui est tel que supprimer_v2(String, Dico, Dico_) est vrai si le dictionnaire Dico_ est le résultat de la suppresion de la chaîne de caractère String dans le dictionnaire Dico en éliminant les noeuds qui ne permettent plus de former des mots.

%% ?- un_dico(Dico), inserer("baie", Dico, Dico_), supprimer_v2("bar", Dico_, Dico__).
%% Dico = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[])])])]),
%% Dico_ = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[]),dic(i,false,[dic(e,true,[])])])])]),
%% Dico__ = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(i,false,[dic(e,true,[])])])])]) ;
%% ;
%% false.

%% 6. Définir le prédicat coq_a_l_ane/4 qui est tel que coq_a_l_ane(String1, String2, Dico, Sequence) permet de passer de la chaîne de départ String1 à une chaîne de caractère String2 (qui appartiennent tous deux au dictionnaire) en changeant une lettre à la fois, de telle sorte que tous les mots intermédiaires formant Sequence appartiennent aussi au dictionnaire.

%% ?- un_dico(Dico), inserer("baie", Dico, Dico_), inserer("brie", Dico_, Dico__), inserer("rive", Dico__, Dico___), coq_a_l_ane("baie", "rive", Dico___, Sequence).
%% Dico = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[])])])]),
%% Dico_ = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[]),dic(i,false,[dic(e,true,[])])])])]),
%% Dico__ = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[]),dic(i,false,[dic(e,true,[])])]),dic(r,false,[dic(i,false,[dic(e,true,[])])])])]),
%% Dico___ = dic(*,false,[dic(a,true,[dic(n,true,[])]),dic(b,false,[dic(a,false,[dic(c,true,[]),dic(r,true,[]),dic(i,false,[dic(e,true,[])])]),dic(r,false,[dic(i,false,[dic(e,true,[])])])]),dic(r,false,[dic(i,false,[dic(v,false,[dic(e,true,[])])])])]),
%% Sequence = ["baie","brie","rive"] ;
%% ;
%% false.


%% Une directive pour modifier la sortie standard
:- set_prolog_flag(answer_write_options, [quoted(true), portray(true), max_depth(100), attributes(portray)]). 
