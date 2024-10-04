% Директиви для уникнення повідомлень про непослідовне розміщення предикатів
:- discontiguous is_a/2.
:- discontiguous part_of/2.
:- discontiguous has_property/2.
:- discontiguous eats/2.
:- discontiguous lives_in/2.

% is_a факти (родо-видові зв'язки)
is_a(dog, mammal).
is_a(cat, mammal).
is_a(tiger, mammal).
is_a(lion, mammal).
is_a(mammal, animal).
is_a(bird, animal).
is_a(eagle, bird).
is_a(penguin, bird).
is_a(reptile, animal).
is_a(snake, reptile).
is_a(crocodile, reptile).
is_a(fish, animal).
is_a(shark, fish).
is_a(salmon, fish).

% Мульти-наслідування
is_a(dog, domestic_animal).
is_a(cat, domestic_animal).

% Факти про domestic_animal
has_property(domestic_animal, friendly).
has_property(domestic_animal, social).

% part_of факти (частина-ціле)
part_of(leg, dog).
part_of(tail, dog).
part_of(whiskers, cat).
part_of(claws, cat).
part_of(wing, eagle).
part_of(beak, penguin).
part_of(fins, shark).
part_of(scales, snake).
part_of(teeth, crocodile).
part_of(gills, salmon).

% Нові зв'язки
eats(dog, meat).
eats(cat, fish).
eats(eagle, small_animals).
eats(penguin, fish).

% Властивості (has_property)
has_property(mammal, warm_blooded).
has_property(bird, warm_blooded).
has_property(reptile, cold_blooded).
has_property(fish, cold_blooded).

% Місця проживання
lives_in(dog, house).
lives_in(cat, house).
lives_in(eagle, tree).
lives_in(penguin, sea).

% Правило для транзитивності родо-видових зв'язків
is_a(X, Z) :- is_a(X, Y), is_a(Y, Z).

% Правило для транзитивності частина-ціле
part_of(X, Z) :- part_of(X, Y), part_of(Y, Z).

% Правило для спадкування властивостей
has_property(X, P) :- is_a(X, Y), has_property(Y, P).


% Заборона наслідування: 
% Забороняємо, щоб частини успадковували властивості через is_a
not_part_of(X, Y) :-part_of(X, Y), is_a(Y, animal).

% Потенційно нескінченне виведення
is_a(X, Y) :- is_a(X, Z), is_a(Z, Y).

% Приклади запитів
% is_a(dog, animal).
% is_a(X, mammal).
% part_of(leg, dog).
% has_property(dog, warm_blooded).
% has_property(cat, friendly).
% eats(cat, X).
% lives_in(eagle, Place).
