-- Create database
CREATE DATABASE Trivial;

-- Create table 

-- Create table Users
CREATE TABLE users
(
	id_user MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nick VARCHAR(20) NOT NULL UNIQUE KEY,
	pass CHAR(40) NOT NULL,
	email VARCHAR(60) NOT NULL UNIQUE KEY
);

-- Create table Quiz
CREATE TABLE quizzes
(
	id_quiz MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(25) NOT NULL UNIQUE KEY,
	description VARCHAR(250) NOT NULL,
	theme VARCHAR(25) NOT NULL
);

-- Create table Questions and Answers
CREATE TABLE questions
(
	id_question MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	description VARCHAR(250) NOT NULL,
	id_quiz MEDIUMINT(8) UNSIGNED NOT NULL,
	CONSTRAINT FK_quiz FOREIGN KEY (id_quiz) REFERENCES quizzes(id_quiz)
);

CREATE TABLE answers
(
	id_answer MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	description VARCHAR(250) NOT NULL,
	value TINYINT(1) NOT NULL,
	id_question MEDIUMINT(8) UNSIGNED NOT NULL,
	CONSTRAINT FK_question FOREIGN KEY (id_question) REFERENCES questions(id_question)
);

CREATE TABLE statistics (
	id_stat MEDIUMINT(8) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
  id_user MEDIUMINT(8) UNSIGNED NOT NULL,
  id_quiz MEDIUMINT(8) UNSIGNED NOT NULL,
  average DECIMAL(5,4) UNSIGNED NOT NULL,
  date DATETIME NOT NULL DEFAULT NOW(),
  CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES users(id_user),
  CONSTRAINT fk_id_quiz FOREIGN KEY (id_quiz) REFERENCES quizzes(id_quiz)
);

-- Inserts

-- Users
INSERT INTO users (nick,pass,email) VALUES
("root",SHA1("root"),"root@trivial.com"),
("test",SHA1("test"),"test@test.com"),
("paco",SHA1("paco"),"paco@paco.com"),
("pepe",SHA1("pepe"),"pepe@pepe.com"),
("manolo",SHA1("manolo"),"manolo@manolo.com"),
("alba",SHA1("alba"),"alba@alba.com");
-- Quizzes
INSERT INTO quizzes (id_quiz, title, description, theme) VALUES
(1, "Videogames quiz","This quiz has different questions about videogames of all types of genres. Are you ready for the challenge?","Videogames"),
(2, "Memes quiz","This quiz has various questions about general memes. REEEEEEE","Memes"),
(3, "Christmas quiz","Do you think you know enough of christmas to get all answers correct?","Cultural"),
(4, "General movies quiz","A quiz about movies... I do not think you will even get 7 right.","Movies"),
(5, "General knoledge quiz","Well, the title says it all.","Cultural"),
(6, "General knoledge quiz 2","As the first one but better.","Cultural");
-- Questions
-- Videogames
-- 1
INSERT INTO questions(id_question, description, id_quiz) VALUES 
(1, "Which of those videogames came out first on the market?", 1),
(2, "What relation have Mario and Wario?", 1),
(3, "Which of those films does not have a videogame?", 1),
(4, "Which business developed the game 'Crash Bandicoot' for PSOne?", 1),
(5, "Which company created Steam?", 1),
(6, "In which game appears the character 'Phara'?", 1),
(7, "In which game appears the city 'Balamb Town'?", 1),
(8, "Which are the three initial Pokemons in the second generation?", 1),
(9, "Which is the highest level in Rocket League?", 1),
(10, "In what year came out Counter Strike?", 1),
(11,"Smile, Sweet, Sister, Sadistic, Suprise, ...",2),
(12,"Somebody ...",2),
(13,"|, |l, ||, |_",2),
(14,"To Be Fair, You Have To Have a Very High IQ to Understand ...",2),
(15,"Take off your jacket",2),
(16,"Sayori",2),
(17,"When I say go, be ready to throw... Go!",2),
(18,"I'll have two number 9s, ...",2),
(19,"Who created Rudolph the Red Nose Reindeer?",3),
(20,"What is the opening line of *The Christmas Song* by Nat King Cole?",3),
(21,"Which town, beginning with letter N, was Jesus raised as a child?",3),
(22,"What is the time difference between Lapland, Finland and London, UK in December?",3),
(23,"Can you name two of the three song titles of the 1990s UK Christmas Number Ones by the Spice Girls?",3),
(24,"Who is the Patron Saint of Children?",3),
(25,"According to the Christmas carol, which king last looked out on the feast of Stephen?",3),
(26,"Who plays Juliet in the Love Actually movie?",3),
(27,"Which famous Christmas poem was written by Clement Clark Moore?",3),
(28,"What is the name of the fictional town in How the Grinch Stole Christmas?",3),
(29,"Which street cat rose to fame in 2016 with the release of a movie based on the real life story of a homeless man called James Bowen?",4),
(30,"The Wolf of Wall Street movie is based on the true story of which former American stock broker?",4),
(31,"What type of fish is Dory from the 2003 movie *Finding Nemo*?",4),
(32,"The 33 movie is based on a true story about 33 men trapped in an underground mine in which country?",4),
(33,"Which 2016 movie is based on a Roman soldiers search for Jesus missing body following his resurrection?",4),
(34,"What was the first fully animated feature film released by Walt Disney?",4),
(35,"Who directed the horror film *Alien*?",4),
(36,"What name does Pete give to the dragon in the 2016 movie *Pete Dragon*?",4),
(37,"Which aviators famously said, *I feel the need - the need for speed*?",4),
(38,"In which film series do Marlon Brando and Al Pacino star as leaders of a New York mafia family?",4),
(39,"When referring to a USB port, what do the letter USB stand for?",5),
(40,"During which century did Blackbeard become famous for seafaring?",5),
(41,"Amphibians are invertebrates?",5),
(42,"The Ring of Fire is located in the basin of which ocean?",5),
(43,"Which celebration is less commonly known as *the eve of All Saints Day*?",5),
(44,"What sport is the Keirin event associated with?",5),
(45,"Khartoum is the capital of which country?",5),
(46,"The digestive system delivers nutrients to cells via what?",5),
(47,"What is the time difference between London, UK and Sydney, Australia?",5),
(48,"What is a cosmonaut?",5),
(49,"Who was the first recorded European to reach the east coast of Australia?",6),
(50,"Which sea does the River Rhine empty into?",6),
(51,"By what name was Duke William of Normandy commonly known as?",6),
(52,"Buzz Aldrin's mother's maiden name was Moon?",6),
(53,"Which Shakespearean play features a character called Lysander?",6),
(54,"What is the largest species of penguin?",6),
(55,"What is the chemical symbol for magnesium on the periodic table?",6),
(56,"Who invented the first full scale working railway steam locomotive?",6),
(57,"What sports form an Olympic triathlon?",6),
(58,"The Bridal Veil Falls, American Falls and Canadian Horseshow make up what?",6);

INSERT INTO answers(id_answer, description, value, id_question) VALUES
(1, "Tetris.",0,1),
(2, "Pong.",0,1),
(3, "Nought and Crosses.",1,1),
(4,"They are friends.",1,2),
(5,"They are a couple.",0,2),
(6,"Enemies.",0,2),
(7,"Matrix.",0,3),
(8,"Easy Rider.",1,3),
(9,"Star Wars: The Phantom Menace.",0,3),
(10,"Bandai.",0,4),
(11,"Square Enix.",0,4),
(12,"Naughty Dog.",1,4),
(13,"Sony.",0,5),
(14,"Valve.",1,5),
(15,"Blitzzard.",0,5),
(16,"League Of Legends.",0,6),
(17,"League Of Angels",0,6),
(18,"Overwatch.",1,6),
(19,"Final Fantasy VII.",0,7),
(20,"Dragon Quest IV.",0,7),
(21,"Final Fantasy VIII.",1,7),
(22,"Chikorita, Charmander and Totodile.",0,8),
(23,"Chikorita, Cyndaquil and Totodile.",1,8),
(24,"Chikorita, Cyndaquil and Squirtle.",0,8),
(25,"Rocketeer.",1,9),
(26,"King of the rockets.",0,9),
(27,"God of the rockets.",0,9),
(28,"1999.",1,10),
(29,"2000.",0,10),
(30,"2004.",0,10),
(31,"Service",1,11),
(32,"Spicy",0,11),
(33,"Super",0,11),
(34,"is here!",0,12),
(35,"likes you",0,12),
(36,"once told me",1,12),
(37,"get straight",0,13),
(38,"is this a loss reference?",1,13),
(39,"is this a jojos reference?",0,13),
(40,"Stranger Things",0,14),
(41,"Rick and Morty",1,14),
(42,"Evangelion",0,14),
(43,"Man is no hot",1,15),
(44,"But... here?",0,15),
(45,"What the fuck",0,15),
(46,"Hang there",1,16),
(47,"I love you",0,16),
(48,"B...Bakka! >///<",0,16),
(49,"Okay, now lets punch it.",0,17),
(50,"Just follow my moves, and sneak around.",0,17),
(51,"Throw it on him not me! Uhg, lets try something else.",1,17),
(52,"a number 9 large, a number 2 with extra dip, a number 3, two number 45s, one with cheese, and a large soda.",0,18),
(53,"a number 9 large, a number 6 with extra dip, a number 7, two number 45s, one with cheese, and a large soda.",1,18),
(54,"a number 9 large, a number 4 with extra dip, a number 5, two number 45s, one with cheese, and a large soda.",0,18);

INSERT INTO answers(description, value, id_question) VALUES
("Santa",0,19),
("Alexander of Lincoln",0,19),
("Robert L. May",1,19),
("Chestnuts roasting on an open fire",1,20),
("Lets enjoy chistmas together",0,20),
("Today is a good day to die",0,20),
("Nothingam",0,21),
("Narnia",0,21),
("Nazareth",1,21),
("2 hours (Finland is 2 hours ahead of the UK)",1,22),
("3 hours (Finland is 3 hours ahead of the UK)",0,22),
("5 hours (Finland is 5 hours ahead of the UK)",0,22),
("2 Become 1, Too Much, Goodbye",1,23),
("Christmas Is Here, Happy Holidays, Lets Eat",0,23),
("Chistmas Is Here, The Snowman, Playing With Snowballs",0,23),
("Santa Claus",0,24),
("Saint Nicholas",1,24),
("The Devil",0,24),
("Wenceslas",1,25),
("Viking town",0,25),
("France",0,25),
("Natalie Portman",0,26),
("Keira Knightley",1,26),
("Emma Stone",0,26),
("Twas the night before Christmas (originally called A visit from St. Nicholas)",1,27),
("Lets build a snowman",0,27),
("I want to die",0,27),
("Christmas town",0,28),
("Whoville",1,28),
("Santown",0,28),
("Bob (A Street Cat Named Bob)",1,29),
("Elias",0,29),
("Anthon",0,29),
("Anthonie Strand",0,30),
("Jordan Belfort",1,30),
("Santiago Romero",0,30),
("Clown Fish",0,31),
("Blue Tang Fish",1,31),
("Salmon",0,31),
("Mexic",0,32),
("China",0,32),
("Chile",1,32),
("Risen",1,33),
("Nocturnal Animals",0,33),
("Lion",0,33),
("Snow White and the Seven Dwarfs (1937)",1,34),
("Micky Mouse",0,34),
("The Cinderella",0,34),
("Ridley Scott",1,35),
("Quentin Tarantino",0,35),
("David Fincher",0,35),
("Bob",0,36),
("Patrick",0,36),
("Elliott",1,36),
("Bernt Balchen",0,37),
("Jean Batten",0,37),
("Maverick and Goose (Top Gun Movie)",1,37),
("Wonder",0,38),
("KillBill",0,38),
("The Godfather",1,38),
("Universal Serial Bus",1,39),
("Universal Serie Bus",0,39),
("Unilaterial Serial Bus",0,39),
("19th century",0,40),
("18th century",1,40),
("20th century",0,40),
("False",1,41),
("True",0,41),
("N/A",0,41),
("The Pacific Ocean",1,42),
("The Atlantic Ocean",0,42),
("The Indic Ocean",0,42),
("Christmas",0,43),
("Easter",0,43),
("Halloween",1,43),
("Cycling",1,44),
("Running",0,44),
("Swimming",0,44),
("Sudan",1,45),
("Kazakhstan",0,45),
("Vietnam",0,45),
("The water in our body",0,46),
("The bloodstream",1,46),
("The nose",0,46),
("Eight hours (Sydneys 8 hours ahead of London)",0,47),
("Eight hours (Sydneys 7 hours ahead of London)",0,47),
("Nine hours (Sydneys 9 hours ahead of London)",1,47),
("A space traveller",0,48),
("A Russian space traveller",1,48),
("An Euroean space cabin",0,48),
("Captain Alexander Ginger",0,49),
("Captain Adolf The Big",0,49),
("Captain James Cook",1,49),
("The North Sea",1,50),
("The South Sea",0,50),
("The West Sea",0,50),
("William the Conqueror",1,51),
("William the King",0,51),
("William the Bastard",0,51),
("False",0,52),
("True",1,52),
("N/A",0,52),
("A Midsummer Days Dream",0,53),
("A Midsummer Nights Dream",1,53),
("A Midwinter Nights Dream",0,53),
("Emperor Penguin",0,54),
("Snares Penguin",0,54),
("King Penguin",1,54),
("mg",1,55),
("gn",0,55),
("ma",0,55),
("Richard Trevithick",1,56),
("Bob Elmanetes",0,56),
("Patrick Star",0,56),
("Swimming, cycling, running",1,57),
("Cycling, running",0,57),
("Swimming, running",0,57),
("The Berloi Falls",0,58),
("The Niagara Falls",1,58),
("The Pliva Falls",0,58);

INSERT INTO statistics (id_user, id_quiz, average, date) VALUES
-- user 2
(2, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(2, 1, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(2, 1, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(2, 1, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(2, 1, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(2, 1, ROUND(RAND(), 4), '2017-12-13 20:55:01'),

(2, 2, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(2, 2, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(2, 2, ROUND(RAND(), 4), '2017-12-16 20:55:01'),

(2, 3, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(2, 3, ROUND(RAND(), 4), '2017-12-18 20:55:01'),

(2, 4, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(2, 4, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(2, 4, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(2, 4, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(2, 4, ROUND(RAND(), 4), '2017-12-18 20:55:01'),

(2, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(2, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(2, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(2, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),

(2, 6, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(2, 6, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(2, 6, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(2, 6, ROUND(RAND(), 4), '2017-12-18 20:55:01'),
(2, 6, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(2, 6, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(2, 6, ROUND(RAND(), 4), '2017-12-20 20:55:01'),

-- user 3
(3, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(3, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(3, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(3, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(3, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(3, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),

(3, 2, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(3, 2, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(3, 2, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(3, 2, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(3, 2, ROUND(RAND(), 4), '2017-12-16 20:55:01'),

(3, 3, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(3, 3, ROUND(RAND(), 4), '2017-12-18 20:55:01'),

(3, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(3, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(3, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(3, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),

(3, 6, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(3, 6, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(3, 6, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(3, 6, ROUND(RAND(), 4), '2017-12-18 20:55:01'),
(3, 6, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(3, 6, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(3, 6, ROUND(RAND(), 4), '2017-12-20 20:55:01'),

-- user 4
(4, 1, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(4, 1, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(4, 1, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(4, 1, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(4, 1, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(4, 1, ROUND(RAND(), 4), '2017-12-20 20:55:01'),

(4, 2, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(4, 2, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(4, 2, ROUND(RAND(), 4), '2017-12-20 20:55:01'),

(4, 3, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(4, 3, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(4, 3, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(4, 3, ROUND(RAND(), 4), '2017-12-20 20:55:01'),

(4, 4, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(4, 4, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(4, 4, ROUND(RAND(), 4), '2017-12-19 20:55:01'),

-- user 5
(5, 1, ROUND(RAND(), 4), '2017-12-14 20:55:01'),
(5, 1, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(5, 1, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(5, 1, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(5, 1, ROUND(RAND(), 4), '2017-12-18 20:55:01'),
(5, 1, ROUND(RAND(), 4), '2017-12-18 20:55:01'),

-- user 6
(6, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(6, 1, ROUND(RAND(), 4), '2017-12-15 20:55:01'),

(6, 2, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(6, 2, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(6, 2, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(6, 2, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 2, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(6, 2, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 2, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(6, 2, ROUND(RAND(), 4), '2017-12-16 20:55:01'),

(6, 3, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(6, 3, ROUND(RAND(), 4), '2017-12-18 20:55:01'),
(6, 3, ROUND(RAND(), 4), '2017-12-18 20:55:01'),
(6, 3, ROUND(RAND(), 4), '2017-12-18 20:55:01'),
(6, 3, ROUND(RAND(), 4), '2017-12-18 20:55:01'),
(6, 3, ROUND(RAND(), 4), '2017-12-18 20:55:01'),

(6, 4, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(6, 4, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(6, 4, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(6, 4, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(6, 4, ROUND(RAND(), 4), '2017-12-18 20:55:01'),

(6, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 5, ROUND(RAND(), 4), '2017-12-20 20:55:01'),

(6, 6, ROUND(RAND(), 4), '2017-12-15 20:55:01'),
(6, 6, ROUND(RAND(), 4), '2017-12-16 20:55:01'),
(6, 6, ROUND(RAND(), 4), '2017-12-17 20:55:01'),
(6, 6, ROUND(RAND(), 4), '2017-12-18 20:55:01'),
(6, 6, ROUND(RAND(), 4), '2017-12-19 20:55:01'),
(6, 6, ROUND(RAND(), 4), '2017-12-20 20:55:01'),
(6, 6, ROUND(RAND(), 4), '2017-12-20 20:55:01');