User@PC ~
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/User/.ssh/id_rsa):
/home/User/.ssh/id_rsa already exists.
Overwrite (y/n)? y
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/User/.ssh/id_rsa
Your public key has been saved in /home/User/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:udUzfPd7TFvW9RtnAuAmw30qZtQNgcHetfTlTKFaYPk User@PC
The key's randomart image is:
+---[RSA 3072]----+
|       ..o.+.  ..|
|        o +.+ . o|
|       o = *.= = |
|        *.*oBE. +|
|       .S+.+=.. =|
|        +o.  +.oX|
|       o..     *B|
|               o+|
|               ..|
+----[SHA256]-----+

User@PC ~
$ cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCg9URyHANiVjenccH/RFaKXGjiOftToBXe7tGWlVq9G7raVPGy/msGBhEhOS03spd0ywR3JWPxhLqt0o1PRYJwgKZqFeLF/Ad9gDEPoka3INO+dBoEtNu7KUv+SpBFEYjr6QlC6aWvPZzkemcF/YUp+cnJtlVejw3mABxGmkgOuTeNbq0u1+w3Mw23D8KRdjocNC8R4nC33DZQlRKi+/XKIO59x7BXrlKQAPr5T124c/gVbY/k3Z0UG2opDyDRfJHg8KKbI0cIkblWb/idNZ/FydaQeYZMKmPRkoR2RgBRPHoGOVjFE1HB3bbjBP746615B/5nDJObN9JNiCOrmfNZaS54/1p4K5nFlmS3kkZuISKP2RtAw3utvX3TdWYSk7W/XKTKWLKWW9L9Pq10nxf78RE5LkKzSjAT9HygDVUsRdzUupK1TPYxtCkz9h8FVBpN00ev/3iIIoLdXyPamgWx/rIDP/Bb5faAcSg+6+JVLsIASY6Zos5mQtUHzgFfS8E= User@PC

User@PC ~
$ ssh 01393982-1916-47b7-8933-9b2f39a40337@serverhub.praktikum-services.ru -p 4554
morty@f1dc76c871ca:~$ psql -U morty -d scooter_rent
Password for user morty:
psql (11.18 (Debian 11.18-0+deb10u1))
Type "help" for help.

# вывела список логинов курьеров с количеством их заказов в статусе «В доставке» (поле inDelivery = true).
scooter_rent=# SELECT "Couriers".login, COUNT ("Orders"."courierId") FROM "Couriers" LEFT OUTER JOIN "Orders" ON "Couriers".id = "Orders"."courierId" WHERE "Orders"."inDelivery" = true GROUP BY "Couriers".login;
 login | count
-------+-------
 Anna  |     8
(1 row)

# вывела все трекеры заказов и их статусы
scooter_rent=# SELECT track, CASE WHEN finished = true THEN 2 WHEN cancelled = true THEN -1 WHEN "inDelivery" = true THEN 1 ELSE 0 END FROM "Orders";
 track  | case
--------+------
 835759 |    0
 897252 |    0
 382491 |   -1
 794895 |    1
 794895 |    1
 609527 |    1
 609527 |    1
 268558 |    1
 268558 |    1
 787547 |    1
 787547 |    1
(11 rows)
