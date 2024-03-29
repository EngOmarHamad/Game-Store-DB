
-- https://www.phpmyadmin.net/
--


CREATE TABLE developers (
  developer_id  int primary key NOT NULL,
  name varchar(23) DEFAULT NULL,
  website varchar(33) DEFAULT NULL
)


INSERT INTO developers (developer_id, name, website) VALUES
(1, 'Behaviour Digital Inc. ', 'http://www.bhvr.com'),
(2, 'Rockstar North', 'http://www.rockstarnorth.com'),
(3, 'Valve', 'http://www.valvesoftware.com'),
(4, 'Blizzard Entertainment', 'http://www.blizzard.com'),
(5, 'Square Enix', 'http://www.square-enix.com'),
(6, 'Platinum Games', 'https://www.platinumgames.com'),
(7, 'Atlus', 'https://www.atlus.co.jp'),
(8, 'ArenaNet', 'http://www.arena.net'),
(9, 'Playdead ApS', 'http://www.playdead.com'),
(10, 'Supergiant Games', 'http://www.supergiantgames.com'),
(11, 'Hopoo Games', 'http://hopoogames.com'),
(12, 'FromSoftware, Inc.', 'http://fromsoftware.jp'),
(13, 'Relic Entertainment', 'https://www.relic.com'),
(14, 'Slightly Mad Studios', 'http://www.slightlymadstudios.com'),
(15, 'Rocksteady Studios', 'http://rocksteadyltd.com'),
(16, 'Red Barrels', 'https://redbarrelsgames.com');



CREATE TABLE publishers (
  publisher_id  int  primary key identity NOT NULL,
  name varchar(38) DEFAULT NULL,
  country varchar(7) DEFAULT NULL,
  website varchar(30) DEFAULT NULL
) 

CREATE TABLE stores (
  store_id int primary key identity NOT NULL,
  country varchar(9) NOT NULL
) 


CREATE TABLE games (
  game_id int primary key identity NOT NULL,
  name varchar(33) DEFAULT NULL,
  developer int DEFAULT NULL,
  publisher int DEFAULT NULL,
  store_id int DEFAULT NULL,
  genre varchar(52) DEFAULT NULL,
  price int DEFAULT NULL,
  review int DEFAULT NULL,
  age_limit int DEFAULT NULL,
  release_date varchar(11) DEFAULT NULL,
  except_country varchar(10) DEFAULT NULL,
  description varchar(763) DEFAULT NULL,
   CONSTRAINT FK_developer FOREIGN KEY (developer)
      REFERENCES developers (developer_id) ,
	  CONSTRAINT FK_publisher FOREIGN KEY (publisher)
      REFERENCES publishers (publisher_id) ,
	  CONSTRAINT FK_game2 FOREIGN KEY (store_id)
      REFERENCES stores (store_id) 


) 

CREATE TABLE users (
  user_id int primary key identity NOT NULL,
  name varchar(9) DEFAULT NULL,
  surname varchar(11) DEFAULT NULL,
  username varchar(11) DEFAULT NULL,
  password bigint  DEFAULT NULL,
  gender varchar(6) DEFAULT NULL,
  age int DEFAULT NULL,
  email varchar(24) DEFAULT NULL,
  store_id int ,
  CONSTRAINT country FOREIGN KEY (store_id) REFERENCES stores (store_id)
) 

CREATE TABLE payments (
  payment_id int primary key identity NOT NULL,
  user_id int DEFAULT NULL,
  payment_type varchar(10) DEFAULT NULL,
  card_number bigint DEFAULT NULL ,
  valid tinyint DEFAULT NULL,
   CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
) 



CREATE TABLE orders (
  order_id int primary key  identity NOT NULL,
  user_id int DEFAULT NULL,
  game_id int DEFAULT NULL,
  price int DEFAULT NULL,
  payment_id int DEFAULT NULL,
  date datetime DEFAULT NULL,
  CONSTRAINT FK_user FOREIGN KEY (user_id)
      REFERENCES users (user_id) ,
	  CONSTRAINT FK_game FOREIGN KEY (game_id)
      REFERENCES games (game_id) 
) 


CREATE TABLE wishlists (
  wish_id int primary key identity NOT NULL,
  user_id int DEFAULT NULL,
  game_id int DEFAULT NULL,
  date datetime DEFAULT NULL,
  CONSTRAINT wishlists_ibfk_1 FOREIGN KEY (user_id) REFERENCES users(user_id),
   CONSTRAINT wishlists_ibfk_2 FOREIGN KEY (game_id) REFERENCES games (game_id)
) 


--------------------------------------
INSERT INTO publishers (publisher_id, name, country, website) VALUES
(1, 'Starbreeze Studios', 'Sweden', 'https://www.starbreeze.com'),
(2, 'Rockstar Games', 'U.S.', 'https://www.rockstargames.com'),
(3, 'Valve', 'U.S.', 'http://www.valvesoftware.com'),
(4, 'Blizzard Entertainment', 'U.S.', 'http://www.blizzard.com'),
(5, 'Square Enix', 'Japan', 'http://www.square-enix.com'),
(6, 'Atlus', 'Japan', 'https://www.atlus.co.jp'),
(7, 'NCsoft', 'Korea', 'http://www.ncsoft.com'),
(8, 'Playdead ApS', 'Denmark', 'http://www.playdead.com'),
(9, 'Supergiant Games', 'U.S.', 'http://www.supergiantgames.com'),
(10, 'Chucklefish Limited', 'U.K.', 'http://chucklefish.org'),
(11, 'Bandai Namco Entertainment', 'Japan', 'http://bandainamcoent.co.jp'),
(12, 'SEGA', 'Japan', 'http://www.sega.com'),
(13, 'Warner Bros. Interactive Entertainment', 'U.S.', 'https://www.warnerbros.com'),
(14, 'Red Barrels', 'Canada', 'https://redbarrelsgames.com');


INSERT INTO stores (store_id, country) VALUES
(7, 'Brazil'),
(8, 'China'),
(6, 'Hong Kong'),
(5, 'India'),
(2, 'Japan'),
(9, 'Singapore'),
(10, 'Spain'),
(1, 'Thailand'),
(4, 'U.K.'),
(3, 'U.S.');


INSERT INTO games (game_id,store_id, name, developer, publisher, genre, price, review, age_limit, release_date, except_country, description) VALUES
(1,7, 'Dead by daylight', 1, 1, '{Horror, Survival, Horror, Multiplayer, Co-op}', 369, 4, 18, '14-Jun-2016', 'China', 'Dead by Daylight is a multiplayer (4vs1) horror game where one player takes on the role of the savage Killer, and the other four players play as Survivors, trying to escape the Killer and avoid being caught and killed.'),
(2,3, 'Grand Theft Auto V', 2, 2, '{Open World, Action, Multiplayer, First-Person}', 1499, 5, 18, '14-Apr-2015', 'China', 'Strap on a Stunt Suit and get ready for 20 electrifying new Stunt Races custom built for the Rocket Voltic, Ruiner 2000 & Blazer Aqua, in GTA Online Cunning Stunts: Special Vehicle Circuit. Also, Legendary Motorsport adds the Progen GP1 to its formidable roster of supercars.'),
(3, 2,'Counter-Strike: Global Offensive', 3, 3, '{FPS, Multiplayer, Shooter, Action, Team-Based}', 315, 5, 13, '22-Aug-2012', 'China', 'Counter-Strike: Global Offensive (CS: GO) will expand upon the team-based action gameplay that it pioneered when it was launched 14 years ago. CS: GO features new maps, characters, and weapons and delivers updated versions of the classic CS content (de_dust, etc.).'),
(4, 1,'Hearthstone', 4, 4, '{Collectible card game}', 0, 4, 7, '11-Mar-2014', '', 'Hearthstone is a digital-only collectible card game that revolves around turn-based matches between two opponents (player vs. player or player vs. computer opponent) using pre-made decks of cards from their collection.'),
(5, 4,'Overwatch', 4, 4, '{First-person shooter}', 1560, 5, 12, '24-May-2016', 'Hong Kong', 'Overwatch is a first-person shooter that features squad-based combat with two opposing teams of six players each.[1] Players choose one of several hero characters, each with their own unique abilities and role classes.'),
(6, 4,'Diablo 3', 4, 4, '{Action, RPG, hack and slash}', 1250, 4, 16, '15-May-2012', 'India', 'Diablo 3 is an action role-playing hack and slash video game. The player moves and interacts with the environment primarily by way of a mouse.[7] Other actions, such as casting a spell, are performed in response to keyboard inputs.[7] The player can acquire items, learn spells, defeat enemies, and interact with non-player characters (NPC)s throughout the game.'),
(7, 4,'Nier:Automata', 6, 5, '{Action, RPG, hack and slash}', 1990, 5, 16, '23-Feb-2017', 'U.K.', 'Nier: Automata is an open-world action role-playing game set on a post-apocalyptic Earth thousands of years after the events of the original Nier.[1] The player takes the role of combat androids from the YoRHa units across an open world environment.'),
(8, 4,'Final Fantasy XV', 5, 5, '{Action, RPG}', 2190, 5, 16, '29-Nov-2016', '', 'Final Fantasy XV takes place on the fictional world of Eos. All the world\ countries, bar the kingdom of Lucis, are under the dominion of the empire of Niflheim. Noctis Lucis Caelum, heir to the Lucian throne, goes on a quest to retake his homeland and its magical Crystal after it is seized by Niflheim on the eve of peace negotiations between the two nations. However, he soon discovers that the Crystal is at the heart of a much greater threat to Eos, and that his role as the future king is key to averting an apocalyptic event from taking place.'),
(9, 5,'Persona 5', 7, 6, '{RPG, social simulation}', 1990, 5, 16, '4-Apr-2017', 'U.K.', 'Persona 5 takes place in Tokyo, and follows a silent protagonist after their transfer to the fictional Shujin Academy after being put on probation for an assault he was falsely accused of. During the course of a school year, he and other students awaken to their Persona powers, become masked vigilantes dubbed the \"Phantom Thieves of Hearts\", and explore the supernatural Palace realm to steal ill intent from the hearts of adults. As with previous dd series, the party does battle with supernatural  Using manifestations of their psyche called Personas. The game incorporates role-playing elements and dungeon exploration alongside social simulation scenarios.'),
(10, 7,'Guild wars 2', 8, 7, '{MMORPG}', 1850, 4, 12, '28-Aug-2012', 'Spain', 'Guild Wars 2 claims to be unique in the genre by featuring a storyline that is responsive to player actions, something which is common in single player role-playing games but rarely seen in multiplayer ones. A dynamic event system replaces traditional questing, utilising the ripple effect to allow players to approach quests in different ways as part of a persistent world. Also of note is the combat system, which aims to be more dynamic than its predecessor by promoting synergy between professions and using the environment as a weapon, as well as reducing the complexity of the Magic-style skill system of the original game.'),
(11, 7,'Limbo', 9, 8, '{Adventure, Indie}', 219, 5, 16, '21-Jul-2010', '', 'The primary character in Limbo is a nameless boy, who awakens in the middle of a forest on the \"edge of hell\" (the game title is taken from the Latin limbus, meaning \"edge\") missing sister, he encounters only a few human characters who either attack him, run away, or are dead. At one point during his journey, he encounters a female character, but is prevented from reaching her. The forest eventually gives way to a crumbling city environment. On completion of the final puzzle, the boy is thrown through a pane of glass and back into the forest. He walks a short distance until he again encounters a girl, who, upon his approach, stands up, startled. At this point, the game abruptly ends.'),
(12, 7,'Transistor', 10, 9, '{Action, Indie, RPG}', 369, 5, 12, '20-May-2014', '', 'Red, a famous singer in a city called Cloudbank, is attacked by the Process, a robotic force commanded by a group called the Camerata. She manages to escape and comes into possession of the mysterious Transistor—the great sword-like weapon she was to be assassinated with. The Transistor is buried into the chest of a man, now slumped over and dead; though his consciousness and voice seems to have been absorbed into the Transistor itself along with Red voice. The Camerata  totrack Red and the Transistor down  the weapon for some yet-unknown cause.'),
(13, 5,'Bastion', 10, 9, '{Action, Indie, RPG}', 315, 5, 12, '20-Jul-2011', 'Japan', 'The game takes place in the aftermath of the Calamity, a catastrophic event that suddenly fractured the city of Caelondia seɪˈlɒndiə/) as well as the surrounding areas of the game\ world into many floating pieces, disrupting its ecology and reducing most of its people to ash. Players take control of the Kid, a silent protagonist who awakens on one of the few remaining pieces of the old world and sets off for the eponymous Bastion, where everyone was supposed to '),
(14, 7,'Risk of Rain', 11, 10, '{Action, Indie, RPG}', 219, 4, 7, '8-Nov-2013', '', 'The player controls the survivor of a space freighter crash on a strange planet. As the player progresses through levels, selected randomly and  some procedural placement of objects within the level, they attempt to survive by killing monsters and collecting items that can boost their offensive and defensive abilities. The game features a difficulty scale that increases  requiring the player to choose between spending time building experience and completing levels quickly before the monsters become more difficult. By discovering various hidden locations, players can discover artifacts which can  gameplay. The game supports up to four cooperative players in online play and up to two players in local play..'),
(15, 7,'Dark Soul 3', 12, 11, '{Action, RPG}', 1500, 4, 16, '12-Apr-2016', '', ' in the Kingdom of Lothric, a bell has rung to signal that the First Flame, responsible for prolonging the Age of Fire, is dying out. As has happened many times before, the coming of the Age of Dark produces the undead, cursed beings that rise up after death. The Age of Fire can be prolonged  the linking of the fires, a ritual in which great lords and heroes sacrifice their souls to kindle the First Flame. However, Prince Lothric has abandoned his duty and instead chooses to watch the flame die from afar. The bell is the last hope for the Age of Fire, raising previous Lords of Cinder, heroes who have linked the flame across aeons to attempt to link the fire again. However, all but one Lord abandon their thrones rather than linking the fire again.'),
(16, 7,'INSIDE', 9, 8, '{Atmospheric, Dark, Indie, Adventure, Puzzle}', 369, 5, 18, '7-Jul-2016', 'India', 'Hunted and alone, a boy finds himself drawn into the center of a dark project.'),
(17, 7,'Warhammer 40,000: Dawn of War III', 13, 12, '{Strategy, RTS, Sci-fi, Action}', 1129, 0, 16, '28-Apr-2017', '', 'Step into a brutal battle between three warring factions In Dawn of War III you will have no choice but to face your foes when a catastrophic weapon is found on the mysterious world of Acheron.'),
(18, 7,'Project CARS', 14, 11, '{Racing, Simulation, Driving, Realistic, Sports}', 955, 4, 3, '16-Mar-2015', '', 'Project CARS is the ultimate driver journey!'),
(19, 7,'Portal', 3, 3, '{Puzzle, First-Person, Singleplayer, Sci-fi, Action}', 219, 5, 0, '10-Oct-2007', 'Hong Kong', 'Portal™ is a new single player game from Valve.  in the mysterious Aperture Science Laboratories, Portal has been called one of the most innovative new games on the horizon and will offer gamers hours of unique gameplay.'),
(20, 7,'Batman™: Arkham Knight', 15, 13, '{Batman, Action, OpenWorld, Superhero, Dark}', 369, 4, 18, '23-Jun-2015' , '', 'Batman™: Arkham Knight brings the award-winning Arkham trilogy from Rocksteady Studios to its epic conclusion. Developed exclusively for New-Gen platforms,  Arkham Knight introduces Rocksteady\ uniquely designed version of the Batmobile.'),
(21,7, 'Outlast 2', 16, 14, '{Psychological Horror, FirstPerson, Nudity, Violent}', 599, 4, 18, '25-Apr-2017', 'Singapore', 'Outlast 2 introduces you to Sullivan Knoth and his followers, who left our wicked world behind to give birth to Temple Gate, a town, deep in the wilderness and hidden from civilization. Knoth and his flock are preparing for the tribulations of the endof times and you’re right in the thick of it.');


INSERT INTO users (user_id, name, surname, username, password, gender, age, email, store_id) VALUES
(1, 'Thanut', 'Saj', 'ots911', 123456, 'Male', 20, 'admin@ku.com', 2),
(2, 'Thafght', 'Rrtukf', 'ots911hesj', 9345757203, 'Male', 23, 'ehrxjm@hotmail.com', 5),
(3, 'Txcvbnut', 'Shgjjb', 'otgjtxjj', 1638492303, 'Male', 17, 'wrfvehe@hotmail.com', 4),
(4, 'Chanon', 'Jen', 'mickeycj97', 7417234894, 'Male', 19, 'chanon@gmail.com', 3),
(5, 'Mike', 'Wonder', 'fishy1234', 1204971230, 'Male', 25, 'michael@gmail.com', 2),
(6, 'James', 'Johnson', 'JimmyFalcon', 4361734019, 'Male', 13, 'jamezz@gmail.com', 1),
(7, 'Michelle', 'Wilson', 'MsVoodoo', 4738459210, 'Female', 21, 'voodoo@gmail.com', 2),
(8, 'Jane', 'Foster', 'Almeida', 3948340573, 'Female', 26, 'foster123@gmail.com', 3),
(9, 'Ginny', 'Wells', 'abcjjjj555', 4738492759, 'Female', 15, 'wells12345@gmail.com', 4),
(10, 'Daisy', 'Thawne', 'reversie111', 1663940397, 'Female', 31, 'thawnee@gmail.com', 6),
(11, 'Thanet', 'Sajja', 'odfe123', 7653940201, 'Male', 20, 'tha@hotmail.com', 8),
(12, 'Thsdght', 'Rakkan', 'oers923hesj', 7438204935, 'Male', 23, 'ehrxdj@yahoo.com', 5),
(13, 'Txfdkjeut', 'Shie', 'otgfooexjj', 3849023809, 'Male', 17, 'wrfvehe@gmail.com', 4),
(14, 'Cheenon', 'Jendi', 'mickiicj97', 4723485923, 'Male', 19, 'cheenon@gmail.com', 3),
(15, 'Mikeey', 'Wonderwomen', 'fishy5678', 6234762348, 'Male', 25, 'michone@gmail.com', 2),
(16, 'Jarames', 'Johnsonbaby', 'BabyBarth', 7403756293, 'Male', 13, 'jamexx69@gmail.com', 1),
(17, 'Michone', 'Wilsonslade', 'MrVodoo', 2134758330, 'Female', 21, 'mrvodoo@gmail.com', 2),
(18, 'Janey', 'Fosterghost', 'Adameida', 3475817493, 'Female', 26, 'foster123ghost@gmail.com', 3),
(19, 'Ginery', 'Wellsdone', 'abceiei555', 7428129483, 'Female', 15, 'wells123done@gmail.com', 4),
(20, 'Daiso', 'Thawneshop', 'resie121', 4810293850, 'Female', 31, 'thaeshop@gmail.com', 4),
(21, 'Nutthapol', 'Sin', 'babestvl', 6412893470, 'Male', 20, 'jiowe@gmail.com', 4),
(22, 'Low', 'High', 'lowsa1111', 3748239412, 'Male', 29, 'lowH@gmail.com', 4),
(23, 'Snack', 'lays', 'laysnack', 2182830180, 'Male', 23, 'laysnackz@gmail.com', 4),
(24, 'poom', 'jinsoo', 'rave1150', 8883293741, 'Male', 30, 'asuslop@gmail.com', 4),
(25, 'Art', 'So', 'artty1212', 1823749182, 'Female', 24, 'so_art@gmail.com', 5),
(26, 'Bas', 'Weaver', 'lol5555', 5723819283, 'Female', 22, 'weaver123@gmail.com', 7),
(27, 'Harry', 'Hotter', 'iamsohot99', 3741823973, 'Female', 15, 'udemi@gmail.com', 8),
(28, 'Ron', 'Mark', 'Ronnn1821', 7438472940, 'Female', 31, 'Ronnn@gmail.com', 2),
(29, 'Rib', 'Mediumrare', 'steak1112', 2384938473, 'Female', 27, 'steaky@gmail.com', 5),
(30, 'iris', 'Bunnee', 'iiris', 7501923847, 'Female', 16, 'iiiris@gmail.com', 3),
(31, 'Mike', 'Hotter', 'Mikee289', 3805829056, 'Male', 30, 'Mikie287@gmail.com', 2);

INSERT INTO payments (payment_id, user_id, payment_type, card_number, valid) VALUES
(1, 28, 'Visa', 4539791458727308, 1),
(2, 23, 'MasterCard', 5141314786935894, 1),
(3, 30, 'Visa', 4539407898629166, 1),
(4, 31, 'None', 0, 0),
(5, 1, 'None', 0, 0),
(6, 3, 'None', 0, 0),
(7, 24, 'None', 0, 0),
(8, 2, 'Visa', 4532644511720850, 1),
(9, 29, 'Visa', 4532637388761999, 1),
(10, 27, 'Visa', 4916651075398235, 1),
(11, 10, 'Visa', 4916386681535538, 1),
(12, 9, 'MasterCard', 5122801961147058, 1),
(13, 19, 'Visa', 4427479730433458, 1),
(14, 8, 'Visa', 4485982327775156, 1),
(15, 18, 'Visa', 4532349990498594, 1),
(16, 7, 'MasterCard', 5333275219585259, 1),
(17, 4, 'MasterCard', 5553322886582079, 1),
(18, 16, 'None', 0, 0),
(19, 6, 'None', 0, 0),
(20, 17, 'Visa', 4716000778302254, 1),
(21, 5, 'Visa', 4916179775038901, 1),
(22, 21, 'Visa', 4929191027001269, 1),
(23, 25, 'Visa', 4485492057210184, 1),
(24, 22, 'MasterCard', 5315070013296928, 1),
(25, 12, 'Visa', 4485310692705956, 1),
(26, 15, 'Visa', 4556676055427170, 1),
(27, 11, 'Visa', 4929066953559706, 1),
(28, 14, 'Visa', 4532858329953574, 1),
(29, 13, 'MasterCard', 5302549741478119, 1),
(30, 26, 'Visa', 4539039205063241, 1),
(31, 20, 'Visa', 4532145979275577, 1);


INSERT INTO orders (order_id, user_id, game_id, price, payment_id, date) VALUES
(1, 1, 2, 1499, 28, '2017-01-01 11:59:00'),
(2, 8, 6, 1250, 2, '2017-01-03 10:14:25'),
(3, 4, 3, 315, 31, '2017-01-03 18:39:12'),
(4, 2, 1, 369, 23, '2017-01-04 08:32:23'),
(5, 10, 19, 219, 27, '2017-01-07 13:21:10'),
(6, 13, 15, 1500, 19, '2017-01-11 14:12:22'),
(7, 15, 10, 1850, 18, '2017-01-13 19:29:13'),
(8, 14, 9, 1990, 8, '2017-01-20 16:53:15'),
(9, 11, 7, 1990, 10, '2017-01-20 21:45:11'),
(10, 7, 4, 0, 24, '2017-01-23 07:10:02'),
(11, 24, 3, 315, 22, '2017-01-23 15:30:08'),
(12, 30, 5, 2190, 26, '2017-01-23 22:17:17'),
(13, 1, 19, 219, 28, '2017-01-30 17:18:44'),
(14, 16, 10, 1850, 7, '2017-02-02 00:26:18'),
(15, 13, 14, 219, 19, '2017-02-03 12:39:37'),
(16, 5, 11, 219, 1, '2017-02-06 14:23:04'),
(17, 12, 13, 315, 9, '2017-02-07 10:30:45'),
(18, 31, 12, 369, 20, '2017-02-09 14:43:19'),
(19, 29, 18, 955, 13, '2017-02-12 07:21:48'),
(20, 18, 20, 369, 16, '2017-02-15 23:34:34'),
(21, 15, 2, 1499, 18, '2017-02-16 20:14:43'),
(22, 20, 7, 1990, 17, '2017-02-19 19:40:03'),
(23, 23, 12, 369, 25, '2017-02-23 15:34:08'),
(24, 21, 15, 1500, 5, '2017-02-23 19:51:38'),
(25, 5, 7, 1990, 1, '2017-02-24 07:28:45'),
(26, 7, 5, 1560, 24, '2017-02-26 12:28:48'),
(27, 12, 20, 369, 9, '2017-02-26 17:12:28'),
(28, 25, 19, 219, 12, '2017-02-26 21:27:18'),
(29, 26, 4, 0, 15, '2017-02-27 08:58:41'),
(30, 29, 10, 1850, 13, '2017-02-28 10:54:10');




-- --------------------------------------------------------

















------------------------------------------------------------


ALTER TABLE developers
  ADD PRIMARY KEY (developer_id);


ALTER TABLE games
  ADD PRIMARY KEY (game_id)

  ALTER TABLE games
   ADD CONSTRAINT FK_developer FOREIGN KEY (developer)
      REFERENCES developers (developer_id) 

  ALTER TABLE games
   ADD CONSTRAINT FK_publisher FOREIGN KEY (publisher)
      REFERENCES publishers (publisher_id) 



ALTER TABLE orders
  ADD PRIMARY KEY (order_id)

  ALTER TABLE users
  ADD PRIMARY KEY (user_id)


  ALTER TABLE orders
  ADD CONSTRAINT FK_user FOREIGN KEY (user_id)
      REFERENCES users (user_id) 

	  ALTER TABLE orders
	  ADD CONSTRAINT FK_game FOREIGN KEY (game_id)
      REFERENCES games (game_id) 

	  ALTER TABLE stores
  ADD PRIMARY KEY (country);

	   ALTER TABLE games
	  ADD CONSTRAINT FK_game2 FOREIGN KEY (store_id)
      REFERENCES stores (store_id) 

 

ALTER TABLE payments
  ADD PRIMARY KEY (payment_id)
  


ALTER TABLE publishers
  ADD PRIMARY KEY (publisher_id);








ALTER TABLE wishlists
  ADD PRIMARY KEY (wish_id)


ALTER TABLE games
  ADD CONSTRAINT developer_id FOREIGN KEY (developer) REFERENCES developers (developer_id),
   CONSTRAINT publisher_id FOREIGN KEY (publisher) REFERENCES publishers(publisher_id);


ALTER TABLE orders
  ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (user_id),
   CONSTRAINT orders_ibfk_2 FOREIGN KEY (game_id) REFERENCES games (game_id);


ALTER TABLE payments
  ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES users (user_id);


ALTER TABLE users
  ADD CONSTRAINT country FOREIGN KEY (country) REFERENCES stores (country);


ALTER TABLE wishlists
  ADD CONSTRAINT wishlists_ibfk_1 FOREIGN KEY (user_id) REFERENCES users(user_id),
   CONSTRAINT wishlists_ibfk_2 FOREIGN KEY (game_id) REFERENCES games (game_id);





exec   GetAllGames