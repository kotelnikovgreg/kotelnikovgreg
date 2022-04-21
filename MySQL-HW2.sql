-- Практическое задание по теме “Управление БД”

-- 1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
-- Пользуюсь MacBook, прописывал в терминале
[mysql]
user=root 
password=
-- Спустя несколько всплывших проблем удалось осуществлять авторизацию без пароля, гуглил - забыл записать

-- 2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
CREATE DATABASE example; -- создаю базу
USE example; -- Выбираю базу для работы 
CREATE TABLE IF NOT EXISTS users ( 										-- Создаю таблицу, выполняю проверку на наличие
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,	-- Числовой тип, не отрицательный, не пустой, ключ, автоматическая задача id
	name VARCHAR(255) NOT NULL UNIQUE										-- Строковый тип 255 символов
);
exit	-- Выход из базы

-- 3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
CREATE DATABASE sample; -- Создаю базу
mysqldump -u root -p example > example.sql -- Выгружаю дамп
mysql -u root -p sample < example.sql -- Заливаю в sample
-- Проверку результата выполняю в DBeaver или
SHOW DATABASES;
DESCRIBE sample.users;

-- 4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
mysqldump mysql -u root -p help_keyword --where='TRUE LIMIT 100' > help_keyword.sql