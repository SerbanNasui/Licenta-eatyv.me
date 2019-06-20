# eatyv.me
Pentru a instala Ruby on Rails respectati pasii de pe urmatorul site: https://gorails.com/setup/ubuntu/18.04

Ruby version 2.4.2

Rails veresion 5.0.2

Pentru baza de date, setati PostgreSQL.

In terminal setati ruta proiectului si rulati: bundle install

Configurati baza de date astfel: /config/database.yml, copiati continutul din database.example.yml si adaugati in baza de date hostul, username-ul si parola.

Pentru crearea bazei de date rulati in terminal: rake db:create

Pentru initializarea bazei de date rulati rake db:migrate

Pentru popularea bazei de date cu utilizatori rulati: rake db:seed