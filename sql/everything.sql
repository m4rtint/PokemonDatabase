DROP TABLE type_is;
CREATE TABLE type_is (tname varchar(30),
					normal number(2,1),
					fighting number(2,1),
					flying number(2,1),
					poison number(2,1),
					ground number(2,1),
					rock number(2,1),
					bug number(2,1),
					ghost number(2,1),
					fire number(2,1),
					water number(2,1),
					grass number(2,1),
					electric number(2,1),
					psychic number(2,1),
					ice number(2,1),
					dragon number(2,1),
					PRIMARY KEY (tname));

DROP TABLE moves;
CREATE TABLE moves (name varchar(30),
					type varchar(30),
					pp number(2,0),
					effect varchar(255),
					pid varchar(255),
					PRIMARY KEY (name));

DROP TABLE train_poke;	
CREATE TABLE train_poke (tid varchar(255) REFERENCES trainer(tid),
						pid varchar(255),
						PRIMARY KEY (tid, pid));

DROP TABLE pokemon;
CREATE TABLE pokemon (pid number(3,0),
					tname varchar(30),
					picture varchar(255),
					type varchar(10),
					PRIMARY KEY (pid),
					FOREIGN KEY (type) REFERENCES type_is);

DROP TABLE evolve;
CREATE TABLE evolve (pid number(3,0),
					requirement varchar(255),
					pid2 number,
					PRIMARY KEY (pid),
					FOREIGN KEY (pid2) REFERENCES pokemon
					ON DELETE CASCADE);

DROP TABLE poke_found;
CREATE TABLE poke_found (pid number(3,0),
						lname varchar(255),
						PRIMARY KEY (pid),
						FOREIGN KEY (lname) REFERENCES location);

DROP TABLE used_on;
CREATE TABLE used_on (entry number(20,0),
						iid varchar(255),
						pid number(3,0),
						tid varchar(255),
						PRIMARY KEY (entry),
						FOREIGN KEY (iid) REFERENCES item,
						FOREIGN KEY (pid) REFERENCES pokemon,
						FOREIGN KEY (tid) REFERENCES trainer);

DROP TABLE trainer;
CREATE TABLE trainer (tid varchar(255),
					party varchar(255) NOT NULL,
					PRIMARY KEY (tid));

DROP TABLE challenge;
CREATE TABLE challenge (entry number(20,0),
						tid varchar(255) REFERENCES trainer(tid),
						tid2 varchar(255) REFERENCES trainer(tid),
						PRIMARY KEY (entry));

DROP TABLE gymleader;
CREATE TABLE gymleader (tid varchar(255) REFERENCES trainer(tid),
						type varchar(255),
						badge varchar(255),
						PRIMARY KEY (badge),
						FOREIGN KEY (tid) REFERENCES trainer
						ON DELETE CASCADE);

DROP TABLE live;
CREATE TABLE live (tid varchar(255),
					lname varchar(255),
					PRIMARY KEY (tid, lname),
					FOREIGN KEY (tid) REFERENCES trainer,
					FOREIGN KEY (lname) REFERENCES location
					ON DELETE SET NULL);

DROP TABLE item;
CREATE TABLE item (iid varchar(255),
					type varchar(255),
					Description varchar(255),
					PRIMARY KEY (iid));

DROP TABLE item_loc;
CREATE TABLE item_loc (iid varchar(255),
					lname varchar(255),
					PRIMARY KEY (iid,lname));

DROP TABLE location;
CREATE TABLE location (lname varchar(255),
					description varchar(255),
					PRIMARY KEY (lname),
					FOREIGN KEY (lname) REFERENCES location
					ON DELETE CASCADE);

DROP TABLE users;

DROP TABLE party;

view

INSERT INTO type_is VALUES
('Normal'	,	'1'	,'1'	,'1'	,'1'	,'1'	,'0.5'	,'1'	,'0'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1');
INSERT INTO type_is VALUES
('Fighting',	'2'	,'1'	,'0.5'	,'0.5'	,'1'	,'2'	,'0.5'	,'0'	,'1'	,'1'	,'1'	,'1'	,'0.5'	,'2'	,'1');
INSERT INTO type_is VALUES
('Flying'	,	'1'	,'2'	,'1'	,'1'	,'1'	,'0.5'	,'2'	,'1'	,'1'	,'1'	,'2'	,'0.5'	,'1'	,'1'	,'1');
INSERT INTO type_is VALUES
('Poison'	,	'1'	,'1'	,'1'	,'0.5'	,'0.5'	,'0.5'	,'2'	,'0.5'	,'1'	,'1'	,'2'	,'1'	,'1'	,'1'	,'1');
INSERT INTO type_is VALUES
('Ground'	,	'1'	,'1'	,'0'	,'2'	,'1'	,'2'	,'0.5'	,'1'	,'2'	,'1'	,'0.5'	,'2'	,'1'	,'1'	,'1');
INSERT INTO type_is VALUES
('Rock'	,		'1'	,'0.5'	,'2'	,'1'	,'0.5'	,'1'	,'2'	,'1'	,'2'	,'1'	,'1'	,'1'	,'1'	,'2'	,'1');
INSERT INTO type_is VALUES
('Bug'	,		'1'	,'0.5'	,'0.5'	,'2'	,'1'	,'1'	,'1'	,'0.5'	,'0.5'	,'1'	,'2'	,'1'	,'2'	,'1'	,'1');
INSERT INTO type_is VALUES
('Ghost'	,	'0'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'2'	,'1'	,'1'	,'1'	,'1'	,'0'	,'1'	,'1');
INSERT INTO type_is VALUES
('Fire'	,		'1'	,'1'	,'1'	,'1'	,'1'	,'0.5'	,'2'	,'1'	,'0.5'	,'0.5'	,'2'	,'1'	,'1'	,'2'	,'1');
INSERT INTO type_is VALUES
('Water'	,	'1'	,'1'	,'1'	,'1'	,'2'	,'2'	,'1'	,'1'	,'2'	,'0.5'	,'0.5'	,'1'	,'1'	,'1'	,'0.5');
INSERT INTO type_is VALUES
('Grass'	,	'1'	,'1'	,'0.5'	,'0.5'	,'2'	,'2'	,'0.5'	,'1'	,'0.5'	,'2' 	,'0.5'	,'1'	,'1'	,'1'	,'0.5');
INSERT INTO type_is VALUES
('Electric',	'1'	,'1'	,'2'	,'1'	,'0'	,'1'	,'1'	,'1'	,'1'	,'2'	,'0.5'	,'0.5'	,'1'	,'1'	,'0.5');
INSERT INTO type_is VALUES
('Psychic',		'1'	,'2'	,'1'	,'2'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'0.5'	,'1'	,'1');
INSERT INTO type_is VALUES
('Ice'	,		'1'	,'1'	,'2'	,'1'	,'2'	,'1'	,'1'	,'1'	,'1'	,'0.5'	,'2'	,'1'	,'1'	,'0.5'	,'2');
INSERT INTO type_is VALUES
('Dragon'	,	'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'1'	,'2');

INSERT INTO moves VALUES('Absorb','GRASS','25','User recovers half the HP inflicted on opponent.','43,44,114,140,141');
INSERT INTO moves VALUES('Acid','POISON','30','May lower opponens Special Defense.','23,24,43,44,69,70,72,73');
INSERT INTO moves VALUES('Acid Armor','POISON','20','Sharply raises uses Defense.','88,89,134');
INSERT INTO moves VALUES('Agility','PSYCHIC','30','Sharply raises uses Speed.','15,16,17,18,21,22,25,58,77,78,83,84,85,107,116,117,118,119,123,135,137,142,144,145,146,147,148,149');
INSERT INTO moves VALUES('Amnesia','PSYCHIC','20','Sharply raises uses Special Defense.','54,55,79,80,143,150,151');
INSERT INTO moves VALUES('Aurora Beam','ICE','20','May lower opponens Attack.','86,87,90,91,134');
INSERT INTO moves VALUES('Barrage','NORMAL','20','Hits 2-5 times in one turn.','102,103');
INSERT INTO moves VALUES('Barrier','PSYCHIC','20','Sharply raises uses Defense.','72,73,122,150,151');
INSERT INTO moves VALUES('Bind','NORMAL','20','Traps opponent',' damaging them for 4-5 turns.','95,114,127');
INSERT INTO moves VALUES('Bite','NORMAL','25','May cause flinching.','7,8,9,19,20,23,24,29,30,41,42,52,53,58,59,115,130,133,134,136,138,139,142');
INSERT INTO moves VALUES('Blizzard','ICE','5','May freeze opponent.','124,144');
INSERT INTO moves VALUES('Body Slam','NORMAL','15','May paralyze opponent.','31,39,60,61,124,131,143');
INSERT INTO moves VALUES('Bone Club','GROUND','20','May cause flinching.','104,105');
INSERT INTO moves VALUES('Bonemerang','GROUND','10','Hits twice in one turn.','104,105');
INSERT INTO moves VALUES('Bubble','WATER','30','May lower opponens Speed.','7,8,9,60,61,98,99,116,117');
INSERT INTO moves VALUES('Bubble Beam','WATER','20','May lower opponens Speed.','72,73,120');
INSERT INTO moves VALUES('Clamp','WATER','10','Traps opponent damaging them for 4-5 turns.','90');
INSERT INTO moves VALUES('Comet Punch','NORMAL','15','Hits 2-5 times in one turn.','107,115');
INSERT INTO moves VALUES('Confuse Ray','GHOST','10','Confuses opponent.','37,38,41,42,92,93,94,121,126,131');
INSERT INTO moves VALUES('Confusion','PSYCHIC','25','May confuse opponent.','12,48,49,54,55,64,65,79,80,96,97,122,150');
INSERT INTO moves VALUES('Constrict','NORMAL','35','May lower opponens Speed by one stage.','72,74,114');
INSERT INTO moves VALUES('Conversion','NORMAL','30','Changes uses type to a type of one of its own moves.','137');
INSERT INTO moves VALUES('Counter','FIGHTING','20','When hit by a Physical Attack user strikes back with 2x power.','107');
INSERT INTO moves VALUES('Crabhammer','WATER','10','High critical hit ratio.','98,99');
INSERT INTO moves VALUES('Cut','NORMAL','30','Cuts using claws scythes etc.' ,'1,2,3,4,5,6,15,19,20,27,28,29,30,31,32,33,34,43,44,45,46,47,50,51,52,53,69,70,71,72,73,83,98,99,108,112,114,115,123,127,141,149,151');
INSERT INTO moves VALUES('Defense Curl','NORMAL','40','Raises uses Defense.','35,39,40,74,75,76,108,113');
INSERT INTO moves VALUES('Dig','GROUND','10','Digs underground on first turn attacks on second. Can also escape from caves.','50,51');
INSERT INTO moves VALUES('Disable','NORMAL','20','Opponent cas use its last attack for a few turns.','39,40,48,49,54,55,64,65,9,80,89,96,97,108,150');
INSERT INTO moves VALUES('Dizzy Punch','NORMAL','10','May confuse opponent.','115');
INSERT INTO moves VALUES('Double Kick','FIGHTING','30','Hits twice in one turn.','29,30,32,33,106,135');
INSERT INTO moves VALUES('Double Slap','NORMAL','10','Hits 2-5 times in one turn.','35,36,39,40,60,61,62,113,122,124');
INSERT INTO moves VALUES('Double Team','NORMAL','15','Raises uses Evasiveness.','25,123');
INSERT INTO moves VALUES('Double-Edge','NORMAL','15','User receives recoil damage.','39,113,143');
INSERT INTO moves VALUES('Dragon Rage','DRAGON','10','Always inflicts 40 HP.','130,147,148,149');
INSERT INTO moves VALUES('Dream Eater','PSYCHIC','15','User recovers half the HP inflicted on a sleeping opponent.','92,93,94');
INSERT INTO moves VALUES('Drill Peck','FLYING','20','A strong spinning-peck attack.','21,22,84,85,145');
INSERT INTO moves VALUES('Earthquake','GROUND','10','Power is doubled if opponent is underground from using Dig.','50,51,74,75,76,111,112');
INSERT INTO moves VALUES('Egg Bomb','NORMAL','10','Eggs are hurled at the foe.','103,133');
INSERT INTO moves VALUES('Ember','FIRE','25','May burn opponent.','4,5,6,37,38,58,59,77,78,126,136,146');
INSERT INTO moves VALUES('Explosion','NORMAL','5','User faints.','74,75,76,100,101,109,110');
INSERT INTO moves VALUES('Fire Blast','FIRE','5','May burn opponent.','77,78,126');
INSERT INTO moves VALUES('Fire Punch','FIRE','15','May burn opponent.','107,126');
INSERT INTO moves VALUES('Fire Spin','FIRE','15','Traps opponent damaging them for 4-5 turns.','4,5,6,37,38,77,78,126,146');
INSERT INTO moves VALUES('Fissure','GROUND','5','One-Hit-KO if it hits.','50,51');
INSERT INTO moves VALUES('Flamethrower','FIRE','15','May burn opponent.','4,5,6,37,58,126,136,146');
INSERT INTO moves VALUES('Flash','NORMAL','20','Lowers opponens Accuracy.','1,2,3,12,25,26,35,36,39,40,43,44,45,46,47,48,49,52,53,54,55,63,64,65,69,70,71,79,80,81,82,96,97,100,101,102,103,109,110,113,114,120,121,122,124,125,135,137,145,150,151');
INSERT INTO moves VALUES('Fly','FLYING','15','Flies up on first turn attacks on second turn.','6,16,17,18,21,22,83,84,85,142,144,145,146,149,151');
INSERT INTO moves VALUES('Focus Energy','NORMAL','30','Increases critical hit ratio.','15,19,32,33,34,56,57,66,67,68,104,105,106,123,127');
INSERT INTO moves VALUES('Fury Attack','NORMAL','20','Hits 2-5 times in one turn.','15,21,22,32,33,78,83,84,85,111,112,118,119');
INSERT INTO moves VALUES('Fury Swipes','NORMAL','15','Hits 2-5 times in one turn.','19,20,27,28,29,30,52,53,54,55,56,57');
INSERT INTO moves VALUES('Glare','NORMAL','30','Paralyzes opponent.','23,24');
INSERT INTO moves VALUES('Growl','NORMAL','40','Lowers opponens Attack.','1,2,3,4,5,6,21,22,25,29,30,35,50,51,52,53,77,78,79,80,84,85,86,87,104,105,113,131,133');
INSERT INTO moves VALUES('Growth','NORMAL','40','Raises uses Attack and Special Attack.','1,2,3,46,47,69,70,114');
INSERT INTO moves VALUES('Guillotine','NORMAL','5','One-Hit-KO if it hits.','98,99,127');
INSERT INTO moves VALUES('Gust','FLYING','35','Hits Pokémon using Fly/Bounce with double power.','12,16,17,18,41,42,49,83,144');
INSERT INTO moves VALUES('Harden','NORMAL','30','Raises uses Defense.','11,14,88,89,95,98,99,120,127,140,141');
INSERT INTO moves VALUES('Haze','ICE','30','Resets all stat changes.','23,24,41,42,109,110,134,144');
INSERT INTO moves VALUES('Headbutt','NORMAL','15','May cause flinching.','79,80,86,87,96,97,104,105,143');
INSERT INTO moves VALUES('High Jump Kick','FIGHTING','10','If it misses the user loses half their HP.','106,107');
INSERT INTO moves VALUES('Horn Attack','NORMAL','25','An attack using a horn to jab.','32,33,111,112,118,119,128');
INSERT INTO moves VALUES('Horn Drill','NORMAL','5','One-Hit-KO if it hits.','32,33,111,112,118,119');
INSERT INTO moves VALUES('Hydro Pump','WATER','5','A powerful water- type attack.','7,8,9,54,55,60,61,72,73,116,117,120,130,131,134,138,139');
INSERT INTO moves VALUES('Hyper Beam','NORMAL','5','User must recharge next turn.','130,142,143,147,148,149');
INSERT INTO moves VALUES('Hyper Fang','NORMAL','15','May cause flinching.','19,20');
INSERT INTO moves VALUES('Hypnosis','PSYCHIC','20','Puts opponent to sleep.','60,61,62,92,93,96,97,102,103');
INSERT INTO moves VALUES('Ice Beam','ICE','10','May freeze opponent.','86,87,90,131,144');
INSERT INTO moves VALUES('Ice Punch','ICE','15','May freeze opponent.','107,124');
INSERT INTO moves VALUES('Jump Kick','FIGHTING','10','If it misses the user loses half their HP.','106');
INSERT INTO moves VALUES('Karate Chop','FIGHTING','25','High critical hit ratio.','56,57,66,67,68');
INSERT INTO moves VALUES('Kinesis','PSYCHIC','15','Lowers opponens Accuracy.','64,65');
INSERT INTO moves VALUES('Leech Life','BUG','15','User recovers half the HP inflicted on opponent.','41,42,46,47,48,49');
INSERT INTO moves VALUES('Leech Seed','GRASS','10','User steals HP from opponent each turn.','1,2,3,102');
INSERT INTO moves VALUES('Leer','NORMAL','30','Lowers opponens Defense.','21,22,23,24,32,33,56,57,58,66,67,68,83,90,98,99,104,105,115,116,117,123,125,126,130,136,138,139,140,141,147,148,149');
INSERT INTO moves VALUES('Lick','GHOST','30','May paralyze opponent.','92,93,94,108,124');
INSERT INTO moves VALUES('Light Screen','PSYCHIC','30','Halves damage from Special attacks for 5 turns.','25,35,100,101,113,120,122,125,145');
INSERT INTO moves VALUES('Lovely Kiss','NORMAL','10','Puts opponent to sleep.','124');
INSERT INTO moves VALUES('Low Kick','FIGHTING','20','The heavier the opponent the stronger the attack.','56,57,66,67,68');
INSERT INTO moves VALUES('Meditate','PSYCHIC','40','Raises uses Attack.','96,97,106,122');
INSERT INTO moves VALUES('Mega Drain','GRASS','15','User recovers half the HP inflicted on opponent.','45,114,140,141');
INSERT INTO moves VALUES('Mega Kick','NORMAL','5','A powerful kicking attack.','106');
INSERT INTO moves VALUES('Mega Punch','NORMAL','20','A powerful punch thrown very hard.','107,115,151');
INSERT INTO moves VALUES('Metronome','NORMAL','10','User performs any move in the game at random.','35,36,151');
INSERT INTO moves VALUES('Mimic','NORMAL','10','Copies the opponens last move.','39');
INSERT INTO moves VALUES('Minimize','NORMAL','10','Sharply raises uses Evasiveness.','35,36,88,89,113,120');
INSERT INTO moves VALUES('Mirror Move','FLYING','20','User performs the opponens last move.','16,17,18,21,22');
INSERT INTO moves VALUES('Mist','ICE','30','Uses stats cannot be changed for a period of time.','131,144,150');
INSERT INTO moves VALUES('Night Shade','GHOST','15','Inflicts damage equal to uses level.','92,93,94');
INSERT INTO moves VALUES('Pay Day','NORMAL','20','A small amount of money is gained after the battle resolves.','52,53');
INSERT INTO moves VALUES('Peck','FLYING', '35', 'NULL' '21,22,32,33,34,83,84,85,118,119,144,145,146');
INSERT INTO moves VALUES('Petal Dance','GRASS','10','User attacks for 2-3 turns but then becomes confused.','3,43,44,45');
INSERT INTO moves VALUES('Pin Missile','BUG','20','Hits 2-5 times in one turn.','15,135');
INSERT INTO moves VALUES('Poison Gas','POISON','40','Poisons opponent.','88,89,96,97,109,110');
INSERT INTO moves VALUES('Poison Powder','POISON','35','Poisons opponent.','1,2,3,12,43,44,45,46,47,48,49,69,70,71,102,114');
INSERT INTO moves VALUES('Poison Sting','POISON','35','May poison the opponent.','13,23,24,27,28,29,30,31,32,33,34,72,73');
INSERT INTO moves VALUES('Pound','NORMAL', '35,' ,'NULL','35,39,88,89,96,97,113,124,151');
INSERT INTO moves VALUES('Psybeam','PSYCHIC','20','May confuse opponent.','12,48,49,64,65,96,97,122,137');
INSERT INTO moves VALUES('Psychic','PSYCHIC','10','May lower opponens Special Defense.','48,49,64,65,79,80,96,97,102,122,150,151');
INSERT INTO moves VALUES('Psywave','PSYCHIC','15','Inflicts damage 50-150% of uses level.','122');
INSERT INTO moves VALUES('Quick Attack','NORMAL','30','User attacks first.','16,17,18,19,20,25,37,38,77,78,84,85,123,125,133,134,135,136');
INSERT INTO moves VALUES('Rage','NORMAL','20','Raises uses Attack when hit.','4,5,6,15,57,84,85,95,104,105,115,128,136');
INSERT INTO moves VALUES('Razor Leaf','GRASS','25','High critical hit ratio.','1,2,3,69,70,71');
INSERT INTO moves VALUES('Razor Wind','NORMAL','10','Charges on first turn attacks on second. High critical hit ratio.','123');
INSERT INTO moves VALUES('Recover','NORMAL','10','User recovers 50% of its max HP.','64,65,120,121,137,150');
INSERT INTO moves VALUES('Reflect','PSYCHIC','20','Halves damage from Physical attacks for 5 turns.','64,65,102,122,144');
INSERT INTO moves VALUES('Rest','PSYCHIC','10','User sleeps for 2 turns but user is fully healed.','39,86,87,143,128');
INSERT INTO moves VALUES('Roar','NORMAL','20','In battles the opponent switches. In the wild',' the Pokémon runs.','37,38,58,59,142');
INSERT INTO moves VALUES('Rock Slide','ROCK','10','May cause flinching.','95,142');
INSERT INTO moves VALUES('Rock Throw','ROCK','15','Drops rocks on the enemy.','74,75,76,95');
INSERT INTO moves VALUES('Rolling Kick','FIGHTING','15','May cause flinching.','106');
INSERT INTO moves VALUES('Sand Attack','GROUND','15','Lowers opponents Accuracy.','16,17,28,37,38,50,51,83,133,134,135,136,140,141');
INSERT INTO moves VALUES('Scratch','NORMAL','35','Scratches with sharp claws.','4,5,6,27,28,29,30,31,46,47,50,51,52,53,54,55,56,57,140,141');
INSERT INTO moves VALUES('Screech','NORMAL','40','Sharply lowers opponens Defense.','23,24,42,52,53,54,55,56,57,72,73,81,82,88,89,95,100,101,108,125');
INSERT INTO moves VALUES('Seismic Toss','FIGHTING','20','Inflicts damage equal to uses level.','56,57,66,67,68,127');
INSERT INTO moves VALUES('Self-Destruct','NORMAL','5','User faints.','74,75,76,100,101,109,110');
INSERT INTO moves VALUES('Sharpen','NORMAL','30','Raises uses Attack.','137');
INSERT INTO moves VALUES('Sing','NORMAL','15','Puts opponent to sleep.','35,36,39,40,113,131');
INSERT INTO moves VALUES('Skull Bash','NORMAL','10','Raises Defense on first turn attacks on second.','7,8,9');
INSERT INTO moves VALUES('Sky Attack','FLYING','5','Charges on first turn attacks on second. May cause flinching.','146');
INSERT INTO moves VALUES('Slam','NORMAL','20','Slams the foe with a tail vine etc.','25','69','70','95','98','99','108','114');
INSERT INTO moves VALUES('Slash','NORMAL','20','High critical hit ratio.','4,5,6,27,28,46,47,50,51,52,53,83,123,127,140,141');
INSERT INTO moves VALUES('Sleep Powder','GRASS','15','Puts opponent to sleep.','1,2,3,12,43,44,45,48,49,69,70,71,102,114');

INSERT INTO moves VALUES('Sludge','POISON','20','May poison opponent.','88,89,109,110');

INSERT INTO moves VALUES('Smog','POISON','20','May poison opponent.','109,110,126,136');

INSERT INTO moves VALUES('Smokescreen','NORMAL','20','Lowers opponens Accuracy.','109,110,116,117,126');

INSERT INTO moves VALUES('Soft-Boiled','NORMAL','10','User recovers 50% of its max HP.','NULL');

INSERT INTO moves VALUES('Solar Beam','GRASS','10','Charges on first turn attacks on second.','1,2,3,43,44,102');

INSERT INTO moves VALUES('Sonic Boom','NORMAL','20','Always inflicts 20 HP.','81,82,100,101');

INSERT INTO moves VALUES('Spike Cannon','NORMAL','15','Hits 2-5 times in one turn.','91,138,139');

INSERT INTO moves VALUES('Splash','NORMAL','40','Doess do ANYTHING.','129');

INSERT INTO moves VALUES('Spore','GRASS','15','Puts opponent to sleep.','46,47');

INSERT INTO moves VALUES('Stomp','NORMAL','20','May cause flinching.','77,78,98,99,103,108,111,112,128');

INSERT INTO moves VALUES('Strength','NORMAL','15','A powerful physical attack.','NULL');

INSERT INTO moves VALUES('String Shot','BUG','40','Lowers opponens Speed.','10,13');

INSERT INTO moves VALUES('Struggle','NORMAL','0','Only usable when all PP are gone. Hurts the user.','NULL');

INSERT INTO moves VALUES('Stun Spore','GRASS','30','Paralyzes opponent.','12,43,44,45,46,47,48,49,69,70,102,114');

INSERT INTO moves VALUES('Submission','FIGHTING','25','User receives recoil damage.','66,67,68');

INSERT INTO moves VALUES('Substitute','NORMAL','10','Uses HP to creates a decoy that takes hits.','122');

INSERT INTO moves VALUES('Super Fang','NORMAL','10','Always takes off half of the opponens HP.','19,20');

INSERT INTO moves VALUES('Supersonic','NORMAL','20','Confuses opponent.','12,41,42,48,49,72,73,81,82,90,91,108,118,119,142');

INSERT INTO moves VALUES('Surf','WATER','15','Hits all adjacent Pokémon.','NULL');

INSERT INTO moves VALUES('Swift','NORMAL','20','Ignores Accuracy and Evasiveness.','25,27,28,81,82,100,101,120,150');

INSERT INTO moves VALUES('Swords Dance','NORMAL','20','Sharply raises uses Attack.','83,123,127');

INSERT INTO moves VALUES('Tackle','NORMAL','35','A full-body charge attack.','1,2,3,7,8,9,10,19,20,29,30,31,32,33,34,48,49,74,75,76,81,82,90,91,95,100,101,109,110,120,121,128,129,130,133,134,135,136,137');

INSERT INTO moves VALUES('Tail Whip','NORMAL','30','Lowers opponens Defense.','7,8,9,19,20,25,29,30,31,37,38,54,55,77,78,104,111,112,113,115,118,119,128,133,134,135,136,172');

INSERT INTO moves VALUES('Take Down','NORMAL','20','User receives recoil damage.','58,59,77,78,86,87,111,112,128,133,142');

INSERT INTO moves VALUES('Teleport','PSYCHIC','20','Allows user to switch out. In the wild the battle ends.','63,64,65');

INSERT INTO moves VALUES('Thrash','NORMAL','10','User attacks for 2-3 turns but then becomes confused.','34,56,57,104,105,124');

INSERT INTO moves VALUES('Thunder','ELECTRIC','10','May paralyze opponent.','25,125,135,145');

INSERT INTO moves VALUES('Thunder Punch','ELECTRIC','15','May paralyze opponent.','107,125');

INSERT INTO moves VALUES('Thunder Shock','ELECTRIC','30','May paralyze opponent.','25,26,81,82,125,135,145');

INSERT INTO moves VALUES('Thunder Wave','ELECTRIC','20','Paralyzes opponent.','25,26,81,82,135,147,148,149');

INSERT INTO moves VALUES('Thunderbolt','ELECTRIC','15','May paralyze opponent.','25');

INSERT INTO moves VALUES('Transform','NORMAL','10','User takes on the form and attacks of the opponent.','132,151');

INSERT INTO moves VALUES('Tri Attack','NORMAL','10','May paralyze burn or freeze opponent.','84,84,137');

INSERT INTO moves VALUES('Twineedle','BUG','20','Hits twice in one turn. May poison opponent.','15');

INSERT INTO moves VALUES('Vice Grip','NORMAL','30','Grips with powerful pincers.','98,99,127');

INSERT INTO moves VALUES('Vine Whip','GRASS','25','Whips the foe with slender vines.','1,2,3,69,70,114');

INSERT INTO moves VALUES('Water Gun','WATER','25','Squirts water to attack.','7,8,9,60,61,62,72,73,79,80,116,117,120,121,131,134,138,139');

INSERT INTO moves VALUES('Waterfall','WATER','15','May cause flinching.','118,119');

INSERT INTO moves VALUES('Whirlwind','NORMAL','20','In battles the opponent switches. In the wild',' the Pokémon runs.','12,16,17,18');

INSERT INTO moves VALUES('Wing Attack','FLYING','35','Strikes the target with wings.','16,17,18,41,42,123,142');

INSERT INTO moves VALUES('Withdraw','WATER','40','Raises uses Defense.','7,8,9,80,90,91,138,139');

INSERT INTO moves VALUES('Wrap','NORMAL','20','Traps opponent damaging them for 4-5 turns.','23,24,69,70,71,72,73,108,147,148,149');


INSERT INTO trainer VALUES ('Rival_1','13, 10');
INSERT INTO trainer VALUES ('Bug Catcher Rick','13, 14, 13');
INSERT INTO trainer VALUES ('Bug Catcher Doug','10');
INSERT INTO trainer VALUES ('Bug Catcher Anthony','50, 27');
INSERT INTO trainer VALUES ('Bug Catcher Charlie','74, 95');
INSERT INTO trainer VALUES ('Bug Catcher Sammy','13, 11');
INSERT INTO trainer VALUES ('Camper Liam','13, 14, 14');
INSERT INTO trainer VALUES ('Leader Brock','11');
INSERT INTO trainer VALUES ('Lass Janice','50, 28');
INSERT INTO trainer VALUES ('Bug Catcher Colton','74, 96');
INSERT INTO trainer VALUES ('Youngster Ben','13, 12');
INSERT INTO trainer VALUES ('Bug Catcher Greg','13, 14, 15');
INSERT INTO trainer VALUES ('Lass Sally','13, 11');
INSERT INTO trainer VALUES ('Bug Catcher James','13, 14, 14');
INSERT INTO trainer VALUES ('Youngster Calvin','11');
INSERT INTO trainer VALUES ('Lass Robin','50, 28');
INSERT INTO trainer VALUES ('Lass Iris','74, 96');
INSERT INTO trainer VALUES ('Bug Catcher Kent','13, 12');
INSERT INTO trainer VALUES ('Super Nerd Jovan','13, 14, 15');
INSERT INTO trainer VALUES ('Bug Catcher Robby','12');
INSERT INTO trainer VALUES ('Lass Miriam','50, 29');
INSERT INTO trainer VALUES ('Team Rocket Grunt_1','74, 97');
INSERT INTO trainer VALUES ('Team Rocket Grunt_2','13, 13');
INSERT INTO trainer VALUES ('Youngster Josh','13, 14, 16');
INSERT INTO trainer VALUES ('Hiker Marcos','13, 12');
INSERT INTO trainer VALUES ('Team Rocket Grunt_3','13, 14, 15');
INSERT INTO trainer VALUES ('Team Rocket Grunt_4','12');
INSERT INTO trainer VALUES ('Super Nerd Miguel','50, 29');
INSERT INTO trainer VALUES ('Lass Crissy','74, 97');
INSERT INTO trainer VALUES ('Rival_2','13, 13');
INSERT INTO trainer VALUES ('Bug Catcher Cale','13, 14, 16');
INSERT INTO trainer VALUES ('Lass Ali','13');
INSERT INTO trainer VALUES ('Youngster Timmy','50, 30');
INSERT INTO trainer VALUES ('Lass Reli','74, 98');
INSERT INTO trainer VALUES ('Camper Ethan','13, 14');
INSERT INTO trainer VALUES ('Team Rocket Grunt_5','13, 14, 17');
INSERT INTO trainer VALUES ('Camper Shane','13, 13');
INSERT INTO trainer VALUES ('Hiker Franklin','13, 14, 16');
INSERT INTO trainer VALUES ('Hiker Wayne','13');
INSERT INTO trainer VALUES ('Youngster Joey','50, 30');
INSERT INTO trainer VALUES ('Youngester Dan','74, 98');
INSERT INTO trainer VALUES ('Picnicker Kelsey','13, 14');
INSERT INTO trainer VALUES ('Hiker Nob','13, 14, 17');
INSERT INTO trainer VALUES ('Camper Flint','14');
INSERT INTO trainer VALUES ('Youngster Chad','50, 31');
INSERT INTO trainer VALUES ('Lass Haley','74, 99');
INSERT INTO trainer VALUES ('Swimmer Luis','13, 15');
INSERT INTO trainer VALUES ('Picnicker Diana','13, 14, 18');
INSERT INTO trainer VALUES ('Leader Misty','13, 14');
INSERT INTO trainer VALUES ('Team Rocket Grunt_6','13, 14, 17');
INSERT INTO trainer VALUES ('Bug Catcher Keigo','14');
INSERT INTO trainer VALUES ('Camper Ricky','50, 31');
INSERT INTO trainer VALUES ('Picnicker Nancy','74, 99');
INSERT INTO trainer VALUES ('Bug Catcher Elijah','13, 15');
INSERT INTO trainer VALUES ('Picnicker Isabelle','13, 14, 18');
INSERT INTO trainer VALUES ('Camper Jeff','15');
INSERT INTO trainer VALUES ('Youngster Eddie','50, 32');
INSERT INTO trainer VALUES ('Gamer Hugo','74, 100');
INSERT INTO trainer VALUES ('Engineer Bernie','13, 16');
INSERT INTO trainer VALUES ('Gamer Jasper','13, 14, 19');
INSERT INTO trainer VALUES ('Youngster Dave','13, 15');
INSERT INTO trainer VALUES ('Youngster Dillon','13, 14, 18');
INSERT INTO trainer VALUES ('Engineer Braxton','15');
INSERT INTO trainer VALUES ('Youngster Yasu','50, 32');
INSERT INTO trainer VALUES ('Gamer Darian','74, 100');
INSERT INTO trainer VALUES ('Gamer Dirk','13, 16');
INSERT INTO trainer VALUES ('Fisherman Barny','13, 14, 19');
INSERT INTO trainer VALUES ('Sailer Phillip','16');
INSERT INTO trainer VALUES ('Sailer Huey','50, 33');
INSERT INTO trainer VALUES ('Sailor Dylan','74, 101');
INSERT INTO trainer VALUES ('Sailor Duncan','13, 17');
INSERT INTO trainer VALUES ('Sailor leonard','13, 14, 20');
INSERT INTO trainer VALUES ('Gentleman Thomas','13, 16');
INSERT INTO trainer VALUES ('Gentleman Arthur','13, 14, 19');
INSERT INTO trainer VALUES ('Lass Ann','16');
INSERT INTO trainer VALUES ('Youngster Tyler','50, 33');
INSERT INTO trainer VALUES ('Sailor Trevor','74, 101');
INSERT INTO trainer VALUES ('Sailor Edmond','13, 17');
INSERT INTO trainer VALUES ('Fisherman Dale','13, 14, 20');
INSERT INTO trainer VALUES ('Gentleman Brooks','17');
INSERT INTO trainer VALUES ('Lass Dawn','50, 34');
INSERT INTO trainer VALUES ('Gentleman Lamar','74, 102');
INSERT INTO trainer VALUES ('Rival_3','13, 18');
INSERT INTO trainer VALUES ('Sailor Dwayne','13, 14, 21');
INSERT INTO trainer VALUES ('Engineer Baily','13, 17');
INSERT INTO trainer VALUES ('Gentleman Tucker','13, 14, 20');
INSERT INTO trainer VALUES ('Leader Lt. Surge','17');
INSERT INTO trainer VALUES ('Picnicker Alicia','50, 34');
INSERT INTO trainer VALUES ('Hiker Jeremy','74, 102');
INSERT INTO trainer VALUES ('Camper Chris','13, 18');
INSERT INTO trainer VALUES ('Bug Catcher Brent','13, 14, 21');
INSERT INTO trainer VALUES ('Bug Catcher Conner','18');
INSERT INTO trainer VALUES ('Bug Camper Drew','50, 35');
INSERT INTO trainer VALUES ('Hiker Alan','74, 103');
INSERT INTO trainer VALUES ('Hiker Brice','13, 19');
INSERT INTO trainer VALUES ('Picnicker Caitlin','13, 14, 22');
INSERT INTO trainer VALUES ('Picnicker Heidi','13, 18');
INSERT INTO trainer VALUES ('Picnicker Carol','13, 14, 21');
INSERT INTO trainer VALUES ('Hiker Clark','18');
INSERT INTO trainer VALUES ('Hiker Trent','50, 35');
INSERT INTO trainer VALUES ('Pokemaniac Herman','74, 103');
INSERT INTO trainer VALUES ('Pokemaniac Mark','13, 19');
INSERT INTO trainer VALUES ('Pokemaniac Ashton','13, 14, 22');
INSERT INTO trainer VALUES ('Pokemaniac Winston','19');
INSERT INTO trainer VALUES ('Picnicker Martha','50, 36');
INSERT INTO trainer VALUES ('Pokemaniac Steve','74, 104');
INSERT INTO trainer VALUES ('Hiker Allen','13, 20');
INSERT INTO trainer VALUES ('Hiker Eric','13, 14, 23');
INSERT INTO trainer VALUES ('Hiker Lenny','13, 19');
INSERT INTO trainer VALUES ('Hiker Oliver','13, 14, 22');
INSERT INTO trainer VALUES ('Hiker Lucas','19');
INSERT INTO trainer VALUES ('Picnicker Sofia','50, 36');
INSERT INTO trainer VALUES ('Hiker Dudley','74, 104');
INSERT INTO trainer VALUES ('Pokemaniac Cooper','13, 20');
INSERT INTO trainer VALUES ('Picnicker Leah','13, 14, 23');
INSERT INTO trainer VALUES ('Picnicker Arianna','20');
INSERT INTO trainer VALUES ('Picnicker Dana','50, 37');
INSERT INTO trainer VALUES ('Lass Julia','74, 105');
INSERT INTO trainer VALUES ('Gamer Rich','13, 21');
INSERT INTO trainer VALUES ('Super Nerd Glenn','13, 14, 24');
INSERT INTO trainer VALUES ('Lass Megan','13, 20');
INSERT INTO trainer VALUES ('Lass Andrea','13, 14, 23');
INSERT INTO trainer VALUES ('Super Nerd Leslie','20');
INSERT INTO trainer VALUES ('Lass Paige','50, 37');
INSERT INTO trainer VALUES ('Biker Jaren','74, 105');
INSERT INTO trainer VALUES ('Biker Ricardo','13, 21');
INSERT INTO trainer VALUES ('Super Nerd Aiden','13, 14, 24');
INSERT INTO trainer VALUES ('Gamer Stan','21');
INSERT INTO trainer VALUES ('Lass Kay','50, 38');
INSERT INTO trainer VALUES ('Beauty Bridget','74, 106');
INSERT INTO trainer VALUES ('Picnicker Tina','13, 22');
INSERT INTO trainer VALUES ('Beauty Tamia','13, 14, 25');
INSERT INTO trainer VALUES ('Beauty Lori','13, 21');
INSERT INTO trainer VALUES ('Lass Lisa','13, 14, 24');
INSERT INTO trainer VALUES ('Cooltrainer Mary','21');
INSERT INTO trainer VALUES ('Leader Erika','50, 38');
INSERT INTO trainer VALUES ('Team Rocket Grunt_7','74, 106');
INSERT INTO trainer VALUES ('Team Rocket Grunt_8','13, 22');
INSERT INTO trainer VALUES ('Team Rocket Grunt_9','13, 14, 25');
INSERT INTO trainer VALUES ('Team Rocket Grunt_10','22');
INSERT INTO trainer VALUES ('Team Rocket Grunt_11','50, 39');
INSERT INTO trainer VALUES ('Team Rocket Grunt_12','74, 107');
INSERT INTO trainer VALUES ('Team Rocket Grunt_13','13, 23');
INSERT INTO trainer VALUES ('Team Rocket Grunt_14','13, 14, 26');
INSERT INTO trainer VALUES ('Team Rocket Grunt_15','13, 22');
INSERT INTO trainer VALUES ('Team Rocket Grunt_16','13, 14, 25');
INSERT INTO trainer VALUES ('Team Rocket Grunt_17','22');
INSERT INTO trainer VALUES ('Boss Giovanni_1','50, 39');
INSERT INTO trainer VALUES ('Rival_7','74, 107');
INSERT INTO trainer VALUES ('Channeler Hope','13, 23');
INSERT INTO trainer VALUES ('Channeler Patricia','13, 14, 26');
INSERT INTO trainer VALUES ('Channeler Carly','23');
INSERT INTO trainer VALUES ('Channeler Laurel','50, 40');
INSERT INTO trainer VALUES ('Channeler Jody','74, 108');
INSERT INTO trainer VALUES ('Channeler Paula','13, 24');
INSERT INTO trainer VALUES ('Channeler Ruth','13, 14, 27');
INSERT INTO trainer VALUES ('Channeler Tammy','13, 23');
INSERT INTO trainer VALUES ('Channeler Karina','13, 14, 26');
INSERT INTO trainer VALUES ('Channeler janae','23');
INSERT INTO trainer VALUES ('Channeler Angelica','50, 40');
INSERT INTO trainer VALUES ('Channeler Jennifer','74, 108');
INSERT INTO trainer VALUES ('Channeler Emilia','13, 24');
INSERT INTO trainer VALUES ('Team Rocket Grunt_18','13, 14, 27');
INSERT INTO trainer VALUES ('Team Rocket Grunt_19','24');
INSERT INTO trainer VALUES ('Team Rocket Grunt_20','50, 41');
INSERT INTO trainer VALUES ('Biker Lao','74, 109');
INSERT INTO trainer VALUES ('Cue Ball Luke','13, 25');
INSERT INTO trainer VALUES ('Cue Ball Koji','13, 14, 28');
INSERT INTO trainer VALUES ('Biker Hideo','13, 24');
INSERT INTO trainer VALUES ('Biker Ruben','13, 14, 27');
INSERT INTO trainer VALUES ('Cue Ball Camron','24');
INSERT INTO trainer VALUES ('Cue Ball Isaiah','50, 41');
INSERT INTO trainer VALUES ('Biker Virgil','74, 109');
INSERT INTO trainer VALUES ('Cue Ball Raul','13, 25');
INSERT INTO trainer VALUES ('Biker Billy','13, 14, 28');
INSERT INTO trainer VALUES ('Biker Nikolas','25');
INSERT INTO trainer VALUES ('Cue Ball Zeek','50, 42');
INSERT INTO trainer VALUES ('Cue Ball Corey','74, 110');
INSERT INTO trainer VALUES ('Biker Jaxon','13, 26');
INSERT INTO trainer VALUES ('Cue Ball Jamal','13, 14, 29');
INSERT INTO trainer VALUES ('Biker William','13, 25');
INSERT INTO trainer VALUES ('Bird Keeper Jacob','13, 14, 28');
INSERT INTO trainer VALUES ('Bird Keeper Wilton','25');
INSERT INTO trainer VALUES ('Bird Keeper Ramiro','50, 42');
INSERT INTO trainer VALUES ('Juggler Nate','74, 110');
INSERT INTO trainer VALUES ('Juggler Kayden','13, 26');
INSERT INTO trainer VALUES ('Juggler Kirk','13, 14, 29');
INSERT INTO trainer VALUES ('Tamer Edgar','26');
INSERT INTO trainer VALUES ('Tamer Phil','50, 43');
INSERT INTO trainer VALUES ('Juggler Shawn','74, 111');
INSERT INTO trainer VALUES ('Leader Koga','13, 27');
INSERT INTO trainer VALUES ('Black Belt Hitoshi','13, 14, 30');
INSERT INTO trainer VALUES ('Black Belt Hideki','13, 26');
INSERT INTO trainer VALUES ('Black Belt Aaron','13, 14, 29');
INSERT INTO trainer VALUES ('Black Belt Mike','26');
INSERT INTO trainer VALUES ('Black Belt Koichi','50, 43');
INSERT INTO trainer VALUES ('Team Rocket Grunt_21','74, 111');
INSERT INTO trainer VALUES ('Team Rocket Grunt_22','13, 27');
INSERT INTO trainer VALUES ('Team Rocket Grunt_23','13, 14, 30');
INSERT INTO trainer VALUES ('Team Rocket Grunt_24','27');
INSERT INTO trainer VALUES ('Team Rocket Grunt_25','50, 44');
INSERT INTO trainer VALUES ('Team Rocket Grunt_26','74, 112');
INSERT INTO trainer VALUES ('Team Rocket Grunt_27','13, 28');
INSERT INTO trainer VALUES ('Team Rocket Grunt_28','13, 14, 31');
INSERT INTO trainer VALUES ('Team Rocket Grunt_29','13, 27');
INSERT INTO trainer VALUES ('Team Rocket Grunt_30','13, 14, 30');
INSERT INTO trainer VALUES ('Team Rocket Grunt_31','27');
INSERT INTO trainer VALUES ('Team Rocket Grunt_32','50, 44');
INSERT INTO trainer VALUES ('Team Rocket Grunt_33','74, 112');
INSERT INTO trainer VALUES ('Team Rocket Grunt_34','13, 28');
INSERT INTO trainer VALUES ('Team Rocket Grunt_35','13, 14, 31');
INSERT INTO trainer VALUES ('Team Rocket Grunt_36','28');
INSERT INTO trainer VALUES ('Team Rocket Grunt_37','50, 45');
INSERT INTO trainer VALUES ('Team Rocket Grunt_38','74, 113');
INSERT INTO trainer VALUES ('Team Rocket Grunt_39','13, 29');
INSERT INTO trainer VALUES ('Scientist Jerry','13, 14, 32');
INSERT INTO trainer VALUES ('Scientist Jose','13, 28');
INSERT INTO trainer VALUES ('Scientist Rodney','13, 14, 31');
INSERT INTO trainer VALUES ('Scientist Beau','28');
INSERT INTO trainer VALUES ('Juggler Dalton','50, 45');
INSERT INTO trainer VALUES ('Scientist Taylor','74, 113');
INSERT INTO trainer VALUES ('Scientist Joshua','13, 29');
INSERT INTO trainer VALUES ('Rival_6','13, 14, 32');
INSERT INTO trainer VALUES ('Scientist Parker','29');
INSERT INTO trainer VALUES ('Scientist Ed','50, 46');
INSERT INTO trainer VALUES ('Scientist Travis','74, 114');
INSERT INTO trainer VALUES ('Boss Giovanni_2','13, 30');
INSERT INTO trainer VALUES ('Psychic Cameron','13, 14, 33');
INSERT INTO trainer VALUES ('Channeler Tasha','13, 29');
INSERT INTO trainer VALUES ('Psychic Johan','13, 14, 32');
INSERT INTO trainer VALUES ('Psychic Tyron','29');
INSERT INTO trainer VALUES ('Channeler Stacy','50, 46');
INSERT INTO trainer VALUES ('Channeler Amanda','74, 114');
INSERT INTO trainer VALUES ('Psychic Preston','13, 30');
INSERT INTO trainer VALUES ('Leader Sabrina','13, 14, 33');
INSERT INTO trainer VALUES ('Fisherman Ned','30');
INSERT INTO trainer VALUES ('Fisherman Chip','50, 47');
INSERT INTO trainer VALUES ('Fisherman Hank','74, 115');
INSERT INTO trainer VALUES ('Fisherman Elliot','13, 31');
INSERT INTO trainer VALUES ('Rocker Luca','13, 14, 34');
INSERT INTO trainer VALUES ('Camper Justin','13, 30');
INSERT INTO trainer VALUES ('Fisherman Andrew','13, 14, 33');
INSERT INTO trainer VALUES ('Picnicker Alma','30');
INSERT INTO trainer VALUES ('Bird Keeper Sebastian','50, 47');
INSERT INTO trainer VALUES ('Picnicker Susie','74, 115');
INSERT INTO trainer VALUES ('Beauty Lola','13, 31');
INSERT INTO trainer VALUES ('Beauty Sheila','13, 14, 34');
INSERT INTO trainer VALUES ('Picnicker Valerie','31');
INSERT INTO trainer VALUES ('Picnicker Gwen','50, 48');
INSERT INTO trainer VALUES ('Bird Keeper Perry','74, 116');
INSERT INTO trainer VALUES ('Biker Jared','13, 32');
INSERT INTO trainer VALUES ('Bird Keeper Robert','13, 14, 35');
INSERT INTO trainer VALUES ('Bird Keeper Carter','13, 31');
INSERT INTO trainer VALUES ('Bird Keeper Mitch','13, 14, 34');
INSERT INTO trainer VALUES ('Bird Keeper Marlon','31');
INSERT INTO trainer VALUES ('Bird Keeper Beck','50, 48');
INSERT INTO trainer VALUES ('Bird Keeper Donald','74, 116');
INSERT INTO trainer VALUES ('Bird Keeper Benny','13, 32');
INSERT INTO trainer VALUES ('Biker Geralk','13, 14, 35');
INSERT INTO trainer VALUES ('Biker Malik','32');
INSERT INTO trainer VALUES ('Biker Isaac','50, 49');
INSERT INTO trainer VALUES ('Biker Lukas','74, 117');
INSERT INTO trainer VALUES ('Picnicker Becky','13, 33');
INSERT INTO trainer VALUES ('Picnicker Celia','13, 14, 36');
INSERT INTO trainer VALUES ('Biker Ernest','13, 32');
INSERT INTO trainer VALUES ('Biker Alex','13, 14, 35');
INSERT INTO trainer VALUES ('Beauty Grace','32');
INSERT INTO trainer VALUES ('Beauty Olivia','50, 49');
INSERT INTO trainer VALUES ('Picnicker Kindra','74, 117');
INSERT INTO trainer VALUES ('Bird Keeper Chester','13, 33');
INSERT INTO trainer VALUES ('Bird Keeper Edwin','13, 14, 36');
INSERT INTO trainer VALUES ('Picnicker Yazmin','33');
INSERT INTO trainer VALUES ('Swimmer (M) Richard','50, 50');
INSERT INTO trainer VALUES ('Swimer (M) Reece','74, 118');
INSERT INTO trainer VALUES ('Swimmer (M) Tony','13, 34');
INSERT INTO trainer VALUES ('Swimmer (M) David','13, 14, 37');
INSERT INTO trainer VALUES ('Swimmer (M) Douglas','13, 33');
INSERT INTO trainer VALUES ('Swimmer (M) Matthew','13, 14, 36');
INSERT INTO trainer VALUES ('Swimmer (M) Axle','33');
INSERT INTO trainer VALUES ('Swimmer (F) Alice','50, 50');
INSERT INTO trainer VALUES ('Swimmer (F) Connie','74, 118');
INSERT INTO trainer VALUES ('Swimmer (F) Anya','13, 34');
INSERT INTO trainer VALUES ('Swimmer (M) Barry','74, 116');
INSERT INTO trainer VALUES ('Swimmer (M) Darrin','13, 32');
INSERT INTO trainer VALUES ('Swimmer (F) Shirley','13, 14, 35');
INSERT INTO trainer VALUES ('Swimmer (F) Tiffany','32');
INSERT INTO trainer VALUES ('Picnicker Irene','50, 49');
INSERT INTO trainer VALUES ('Bird Keeper Roger','74, 117');
INSERT INTO trainer VALUES ('Swimmer (F) Nora','13, 33');
INSERT INTO trainer VALUES ('Swimmer (M) Dean','13, 14, 36');
INSERT INTO trainer VALUES ('Picnicker Missy','13, 32');
INSERT INTO trainer VALUES ('Swimmer (F) Melissa','13, 14, 35');
INSERT INTO trainer VALUES ('Youngster Johnson','32');
INSERT INTO trainer VALUES ('Scientist Ted','50, 49');
INSERT INTO trainer VALUES ('Burglar Arnie','74, 117');
INSERT INTO trainer VALUES ('Burglar Simon','13, 33');
INSERT INTO trainer VALUES ('Scientist Braydon','13, 14, 36');
INSERT INTO trainer VALUES ('Burglar Lewis','33');
INSERT INTO trainer VALUES ('Scientist Ivan','50, 50');
INSERT INTO trainer VALUES ('Burglar Quinn','74, 118');
INSERT INTO trainer VALUES ('Super Nerd Erik','13, 34');
INSERT INTO trainer VALUES ('Super Nerd Avery','13, 14, 37');
INSERT INTO trainer VALUES ('Burglar Ramon','13, 33');
INSERT INTO trainer VALUES ('Super Nerd Derek','13, 14, 36');
INSERT INTO trainer VALUES ('Burglar Dusty','33');
INSERT INTO trainer VALUES ('Super Nerd Zac','50, 50');
INSERT INTO trainer VALUES ('Leader Blaine','74, 118');
INSERT INTO trainer VALUES ('Fisherman Wade','13, 34');
INSERT INTO trainer VALUES ('Fisherman Ronald','13, 14, 37');
INSERT INTO trainer VALUES ('Swimmer (M) Spencer','34');
INSERT INTO trainer VALUES ('Fisherman Claude','50, 51');
INSERT INTO trainer VALUES ('Fisherman Nolan','74, 119');
INSERT INTO trainer VALUES ('Swimmer (M) Jack','13, 35');
INSERT INTO trainer VALUES ('Swimmer (M) Roland','13, 14, 38');
INSERT INTO trainer VALUES ('Swimmer (M) Jerome','13, 34');
INSERT INTO trainer VALUES ('Tamer Cole','13, 14, 37');
INSERT INTO trainer VALUES ('Black Belt Kiyo','34');
INSERT INTO trainer VALUES ('Cool Trainer Samuel','50, 51');
INSERT INTO trainer VALUES ('Cool Trainer Yuji','74, 119');
INSERT INTO trainer VALUES ('Black Belt Atsushi','13, 35');
INSERT INTO trainer VALUES ('Tamer Jason','74, 117');
INSERT INTO trainer VALUES ('Cool Trainer Warren','13, 33');
INSERT INTO trainer VALUES ('Black Belt Takashi','13, 14, 36');
INSERT INTO trainer VALUES ('Leader Giovanni','33');
INSERT INTO trainer VALUES ('Rival','50, 50');
INSERT INTO trainer VALUES ('Cool Trainer Naomi','74, 118');
INSERT INTO trainer VALUES ('Cool Trainer Rolando','13, 34');
INSERT INTO trainer VALUES ('Black Belt Daisuke','13, 14, 37');
INSERT INTO trainer VALUES ('Juggler Nelson','13, 33');
INSERT INTO trainer VALUES ('Tamer Vincent','13, 14, 36');
INSERT INTO trainer VALUES ('Juggler Gregory','33');
INSERT INTO trainer VALUES ('Cool Trainer George','50, 50');
INSERT INTO trainer VALUES ('Pokemanic Dawson','74, 118');
INSERT INTO trainer VALUES ('Cool Trainer Alexa','13, 34');
INSERT INTO trainer VALUES ('Cool Trainer Colby','13, 14, 37');
INSERT INTO trainer VALUES ('Cool Trainer Caroline','34');
INSERT INTO trainer VALUES ('Cool Couple Ray & Tyra','50, 51');
INSERT INTO trainer VALUES ('Elite Four Lorelei','74, 119');
INSERT INTO trainer VALUES ('Elite Four Bruno','13, 35');
INSERT INTO trainer VALUES ('Elite Four Agatha','13, 14, 38');
INSERT INTO trainer VALUES ('Elite Four Lance','13, 34');
INSERT INTO trainer VALUES ('Champion Rival','13, 14, 37');

INSERT INTO item VALUES ('Antidote','Recovery','Cures poison');
INSERT INTO item VALUES ('Awakening','Recovery','Cures sleep');
INSERT INTO item VALUES ('Bicycle','Key','Allows you to travel faster');
INSERT INTO item VALUES ('Bike Voucher','Key','Used to get a FREE Bike');
INSERT INTO item VALUES ('Burn Heal','Recovery','Heals burns');
INSERT INTO item VALUES ('Calcium','Vitamins','Increases Special level');
INSERT INTO item VALUES ('Carbos','Vitamins','Increases Speed level');
INSERT INTO item VALUES ('Card Key','Key','Unlocks Silph Co. doors');
INSERT INTO item VALUES ('Coin','Miscellaneous','Slot Machine money');
INSERT INTO item VALUES ('Coin Case','Key','Holds coins');
INSERT INTO item VALUES ('Dire Hit','Battle','Increases attack effectiveness');
INSERT INTO item VALUES ('Dome Fossil','Miscellaneous','Changes into Kabuto');
INSERT INTO item VALUES ('Elixir','Recovery','Gives 10 PP to all Attacks');
INSERT INTO item VALUES ('Escape Rope','Miscellaneous','Used to escape an area');
INSERT INTO item VALUES ('Ether','Recovery','Gives 10 PP to one Ability');
INSERT INTO item VALUES ('Exp. Share','Key','Shares experience points');
INSERT INTO item VALUES ('Fire Stone','Stone','Evolves some Fire Pokémon');
INSERT INTO item VALUES ('Fresh Water','Recovery','Quenches thirsts Restores 50 HP');
INSERT INTO item VALUES ('Full Heal','Recovery','Cures any ailments');
INSERT INTO item VALUES ('Full Restore','Recovery','Cures any ailments Restores all HP');
INSERT INTO item VALUES ('Gold Teeth','Key','Helps Warden to Speak');
INSERT INTO item VALUES ('Good Rod','Key','Used to fish');
INSERT INTO item VALUES ('Great Ball','Ball','More Effective than a Pokéball');
INSERT INTO item VALUES ('Guard Spec.','Battle','Disables Special Attacks');
INSERT INTO item VALUES ('Helix Fossil','Miscellaneous','Changes into Omanyte');
INSERT INTO item VALUES ('HP Up','Vitamins','Increases HP by 1');
INSERT INTO item VALUES ('Hyper Potion','Recovery','Restores 200 HP');
INSERT INTO item VALUES ('Ice Heal','Recovery','Heals frozen Pokémon');
INSERT INTO item VALUES ('Iron','Vitamins','Increases Defense level');
INSERT INTO item VALUES ('Itemfinder','Key','Finds Hidden Items');
INSERT INTO item VALUES ('Leaf Stone','Stone','Evolves some Grass Pokémon');
INSERT INTO item VALUES ('Lemonade','Recovery','Quenches thirst Restores 80 HP');
INSERT INTO item VALUES ('Lift Key','Key','Activates Game Corner Elevator');
INSERT INTO item VALUES ('Master Ball','Ball','Catches Pokémon 100% of time');
INSERT INTO item VALUES ('Max Elixir','Recovery','Restores all PP');
INSERT INTO item VALUES ('Max Ether','Recovery','Restores all PP of 1 ability');
INSERT INTO item VALUES ('Max Potion','Recovery','Restores all HP');
INSERT INTO item VALUES ('Max Repel','Miscellaneous','Prevents wild Pokémon from attacking');
INSERT INTO item VALUES ('Max Revive','Recovery','Revives Restores all HP');
INSERT INTO item VALUES ('Moon Stone','Stone','Evolves some Pokémon');
INSERT INTO item VALUES ('Nugget','Miscellaneous','Sold for 5000');
INSERT INTO item VALUES ('Oaks Parcel','Key','Exchange for Pokédex');
INSERT INTO item VALUES ('Old Amber','Miscellaneous','Changes into Aerodactyl');
INSERT INTO item VALUES ('Old Rod','Key','Fish for Magicarp');
INSERT INTO item VALUES ('Parlyz Heal','Recovery','Heals Paralysis');
INSERT INTO item VALUES ('Poké Ball','Ball','Lowest odds of catching Pokémon');
INSERT INTO item VALUES ('Poké Doll','Miscellaneous','Distracts Opponents Makes girls happy');
INSERT INTO item VALUES ('Poké Flute','Key','Wakes sleeping Pokémon');
INSERT INTO item VALUES ('Pokédex','Key','Records Pokémon Data');
INSERT INTO item VALUES ('Potion','Recovery','Restores 20 HP');
INSERT INTO item VALUES ('PP Up*','Vitamins','Increases PP by 1');
INSERT INTO item VALUES ('Protein','Vitamins','Increases Attack level');
INSERT INTO item VALUES ('Rare Candy','Vitamins','Increases Exp Level by 1');
INSERT INTO item VALUES ('Repel','Miscellaneous','Prevents wild Pokémon from attacking');
INSERT INTO item VALUES ('Revive','Recovery','Revives fainted Pokémon');
INSERT INTO item VALUES ('S.S. Ticket','Key','Used to Board S.S. Anne');
INSERT INTO item VALUES ('Safari Ball','Ball','Used in Safari Zone');
INSERT INTO item VALUES ('Secret Key','Key','Unlocks Cinnabar Island Gym');
INSERT INTO item VALUES ('Silph Scope','Key','Used to identify Ghosts');
INSERT INTO item VALUES ('Soda Pop','Recovery','Quenches Thirsts Restores 60 HP');
INSERT INTO item VALUES ('Super Potion','Recovery','Restores 50 HP');
INSERT INTO item VALUES ('Super Repel','Miscellaneous','Prevents wild Pokémon from attacking');
INSERT INTO item VALUES ('Super Rod','Key','Fishes for Pokémon');
INSERT INTO item VALUES ('Thunder Stone','Stone','Evolves Pikachu');
INSERT INTO item VALUES ('Town Map','Key','Shows you where you are');
INSERT INTO item VALUES ('Ultra Ball','Ball','Better than Great Balls');
INSERT INTO item VALUES ('Water Stone','Stone','Evolves some water Pokémon');
INSERT INTO item VALUES ('X Accuracy','Battle','Boosts Accuracy Temporarily');
INSERT INTO item VALUES ('X Attack','Battle','Boosts Attack Temporarily');
INSERT INTO item VALUES ('X Defend','Battle','Boosts Defense Temporarily');
INSERT INTO item VALUES ('X Special','Battle','Boosts Special Temporarily');
INSERT INTO item VALUES ('X Speed','Battle','Boosts Speed Temporarily');
INSERT INTO item VALUES ('TM01','Technical Machine','Mega Punch');
INSERT INTO item VALUES ('TM02','Technical Machine','Razor Wind');
INSERT INTO item VALUES ('TM03','Technical Machine','Swords Dance');
INSERT INTO item VALUES ('TM04','Technical Machine','Whirlwind');
INSERT INTO item VALUES ('TM05','Technical Machine','Mega Kick');
INSERT INTO item VALUES ('TM06','Technical Machine','Toxic');
INSERT INTO item VALUES ('TM07','Technical Machine','Horn Drill');
INSERT INTO item VALUES ('TM08','Technical Machine','Body Slam');
INSERT INTO item VALUES ('TM09','Technical Machine','Take Down');
INSERT INTO item VALUES ('TM10','Technical Machine','Double Edge');
INSERT INTO item VALUES ('TM11','Technical Machine','Bubble Beam');
INSERT INTO item VALUES ('TM12','Technical Machine','Water Gun');
INSERT INTO item VALUES ('TM13','Technical Machine','Ice Beam');
INSERT INTO item VALUES ('TM14','Technical Machine','Blizzard');
INSERT INTO item VALUES ('TM15','Technical Machine','Hyper Beam');
INSERT INTO item VALUES ('TM16','Technical Machine','Pay Day');
INSERT INTO item VALUES ('TM17','Technical Machine','Submission');
INSERT INTO item VALUES ('TM18','Technical Machine','Counter');
INSERT INTO item VALUES ('TM19','Technical Machine','Seismic Toss');
INSERT INTO item VALUES ('TM20','Technical Machine','Rage');
INSERT INTO item VALUES ('TM21','Technical Machine','Mega Drain');
INSERT INTO item VALUES ('TM22','Technical Machine','Solar Beam');
INSERT INTO item VALUES ('TM23','Technical Machine','Dragon Rage');
INSERT INTO item VALUES ('TM24','Technical Machine','Thunderbolt');
INSERT INTO item VALUES ('TM25','Technical Machine','Thunder');
INSERT INTO item VALUES ('TM26','Technical Machine','Earthquake');
INSERT INTO item VALUES ('TM27','Technical Machine','Fissure');
INSERT INTO item VALUES ('TM28','Technical Machine','Dig');
INSERT INTO item VALUES ('TM29','Technical Machine','Psychic');
INSERT INTO item VALUES ('TM30','Technical Machine','Teleport');
INSERT INTO item VALUES ('TM31','Technical Machine','Mimic');
INSERT INTO item VALUES ('TM32','Technical Machine','Double Team');
INSERT INTO item VALUES ('TM33','Technical Machine','Reflect');
INSERT INTO item VALUES ('TM34','Technical Machine','Bide');
INSERT INTO item VALUES ('TM35','Technical Machine','Metronome');
INSERT INTO item VALUES ('TM36','Technical Machine','Self Destruct');
INSERT INTO item VALUES ('TM37','Technical Machine','Egg Bomb');
INSERT INTO item VALUES ('TM38','Technical Machine','Fire Blast');
INSERT INTO item VALUES ('TM39','Technical Machine','Swift');
INSERT INTO item VALUES ('TM40','Technical Machine','Skull Bash');
INSERT INTO item VALUES ('TM41','Technical Machine','Soft Boiled');
INSERT INTO item VALUES ('TM42','Technical Machine','Dream Eater');
INSERT INTO item VALUES ('TM43','Technical Machine','Sky Attack');
INSERT INTO item VALUES ('TM44','Technical Machine','Rest');
INSERT INTO item VALUES ('TM45','Technical Machine','Thunder Wave');
INSERT INTO item VALUES ('TM46','Technical Machine','Psywave');
INSERT INTO item VALUES ('TM47','Technical Machine','Explosion');
INSERT INTO item VALUES ('TM48','Technical Machine','Rock Slide');
INSERT INTO item VALUES ('TM49','Technical Machine','Tri Attack');
INSERT INTO item VALUES ('TM50','Technical Machine','Substitute');
INSERT INTO item VALUES ('HM01','Hidden Machine','Cut');
INSERT INTO item VALUES ('HM02','Hidden Machine','Fly');
INSERT INTO item VALUES ('HM03','Hidden Machine','Surf');
INSERT INTO item VALUES ('HM04','Hidden Machine','Strength');
INSERT INTO item VALUES ('HM05','Hidden Machine','Flash');

INSERT INTO location VALUES ('LName','Description');
INSERT INTO location VALUES ('Pallet Town','A fairly new and quiet town. Its a small and pretty place.');
INSERT INTO location VALUES ('Viridian City','A beautiful city that is enveloped in green year-round.');
INSERT INTO location VALUES ('Pewter City','A quiet city nestled between rugged mountains and rocks.');
INSERT INTO location VALUES ('Cerulean City','A beautiful city with flowing water and blooming flowers.');
INSERT INTO location VALUES ('Vermilion City','A southern city that is bathed in orange by the setting sun.');
INSERT INTO location VALUES ('Lavender Town','A small town covered in a beautiful hue of purple.');
INSERT INTO location VALUES ('Celadon City','A rich rainbow colored city where people and Pokémon gather.');
INSERT INTO location VALUES ('Fuchsia City','A historic village that has become new.');
INSERT INTO location VALUES ('Saffron City','The biggest city in Kanto shining with a golden light.');
INSERT INTO location VALUES ('Cinnabar Island','A town used to be here until it was swept away by an eruption.');
INSERT INTO location VALUES ('Cerulean Cave','A mysterious cave that is filled with terribly tough Pokémon. It is so dangerous the Pokémon League is in charge of it');
INSERT INTO location VALUES ('Digletts Cave','A seemingly plain tunnel that was dug by wild Diglett. It is famous for connecting Routes 2 and 11');
INSERT INTO location VALUES ('Fighting Dojo','Former Pokemon Gym located in Saffron City');
INSERT INTO location VALUES ('Indigo Plateau','The fate of many Trainers aiming for the top rests here.');
INSERT INTO location VALUES ('Mt. Moon','A mystical mountain that is known for its frequent meteor falls. The shards of stars that fall here are known as Moon Stones.');
INSERT INTO location VALUES ('Pokemon Mansion','A decrepit burned-down mansion on Cinnabar Island. It got its name because a famous Pokémon researcher lived there.');
INSERT INTO location VALUES ('Pokemon Tower','A tower that houses the graves of countless Pokémon. Many people visit it daily to pay their respects to the fallen');
INSERT INTO location VALUES ('Power Plant','A power plant that was abandoned years ago though some of the machines still work. It is infested with electric Pokémon');
INSERT INTO location VALUES ('Rock Tunnel','A naturally formed underground tunnel. Because it has not been developed it is inky dark inside. A light is needed to get through.');
INSERT INTO location VALUES ('Celadon Game Corner','A fun time Casino');
INSERT INTO location VALUES ('Safari Zone','An amusement park outside Fuchsia City where many rare Pokémon can be observed in the wild. Catch them in a popular game!');
INSERT INTO location VALUES ('Seafoam Islands','A pair of islands that is situated on Route 20. The two islands are shaped the same as if they were twins.');
INSERT INTO location VALUES ('Silph Co.','They are the manufacturers of many tools including the Silph Scope—a device that allows the user to view spectral entities—as well as home appliances.');
INSERT INTO location VALUES ('Victory Road','A tunnel situated on Route 23. It earned its name because it must be traveled by all Trainers aiming for the top.');
INSERT INTO location VALUES ('Virdian Forest','A deep and sprawling forest that extends around Viridian City. A natural maze many people become lost inside.');
INSERT INTO location VALUES ('Route 1','A country road full of greenery and rough paths.');
INSERT INTO location VALUES ('Route 2','A path that winds and bends from the forest entrance.');
INSERT INTO location VALUES ('Route 3','A road where many rocks have fallen from the sky to create craters.');
INSERT INTO location VALUES ('Route 4','A one-way road down a hill that has a gentle slope and is fun to traverse.');
INSERT INTO location VALUES ('Route 5','A road running north of Saffron City connecting to the Underground Path.');
INSERT INTO location VALUES ('Route 6','A road running south of Saffron City connecting to the Underground Path.');
INSERT INTO location VALUES ('Route 7','A short road that leads to the blocked-off Underground Path.');
INSERT INTO location VALUES ('Route 8','Route 8 is a unique route traveling along east to west from Lavender Town to Saffron City.');
INSERT INTO location VALUES ('Route 9','A road that forms a maze crossing a small rocky mountain.');
INSERT INTO location VALUES ('Route 10','A road that passes along the canal and comes out at the Power Plant.');
INSERT INTO location VALUES ('Route 11','A grassy path with a gentle refreshing breeze.');
INSERT INTO location VALUES ('Route 12','A bridge known for its fishing. It also called Silence Bridge.');
INSERT INTO location VALUES ('Route 13','A difficult narrow path where many Trainers await you');
INSERT INTO location VALUES ('Route 14','A pleasant coastal road where the breeze blows and waves roar.');
INSERT INTO location VALUES ('Route 15','A path that cuts through the row of trees to come out on the coastline.');
INSERT INTO location VALUES ('Route 16','The northern starting point of Cycling Road.');
INSERT INTO location VALUES ('Route 17','An easy path of Cycling Road running above the sea.');
INSERT INTO location VALUES ('Route 18','The southern ending point of Cycling Road.');
INSERT INTO location VALUES ('Route 19','A coastal road littered with rocks due to Cinnabar Island volcano eruption.');
INSERT INTO location VALUES ('Route 20','A popular path with swimmers. The Seafoam Islands are also here.');
INSERT INTO location VALUES ('Route 21','A coastal road where the only threat might be the volcano on the horizon.');
INSERT INTO location VALUES ('Route 22','A path to Victory Road that eventually becomes impassable.');
INSERT INTO location VALUES ('Route 23','A route in northwest Kanto connecting Indigo Plateau to Victory Road and Route 22.');
INSERT INTO location VALUES ('Route 24','A beautiful bridge that stretches across a river.');
INSERT INTO location VALUES ('Route 25','A path that winds through the forest and comes out overlooking the sea.');

INSERT INTO pokemon (pid, name, picture) VALUES
(	'18',	'Pidgeot'	,	'http://img.pokemondb.net/artwork/pidgeot.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'19',	'Rattata'	,	'http://img.pokemondb.net/artwork/rattata.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'20',	'Raticate'	,	'http://img.pokemondb.net/artwork/raticate.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'21',	'Spearow'	,	'http://img.pokemondb.net/artwork/spearow.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'22',	'Fearow'	,	'http://img.pokemondb.net/artwork/fearow.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'23',	'Ekans'	,	'http://img.pokemondb.net/artwork/ekans.jpg	')	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'24',	'Arbok'	,	'http://img.pokemondb.net/artwork/arbok.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'25',	'Pikachu'	,	'http://img.pokemondb.net/artwork/pikachu.jpg	');
INSERT INTO pokemon (pid, name, picture) VALUES
(	'26',	'Raichu'	,	'http://img.pokemondb.net/artwork/raichu.jpg	');
INSERT INTO pokemon (pid, name, picture) VALUES
(	'27',	'Sandshrew'	,	'http://img.pokemondb.net/artwork/sandshrew.jpg	');
INSERT INTO pokemon (pid, name, picture) VALUES
(	'28',	'Sandslash'	,	'http://img.pokemondb.net/artwork/sandslash.jpg	');
INSERT INTO pokemon (pid, name, picture) VALUES
(	'29',	'Nidoran'	,	'http://img.pokemondb.net/artwork/nidoran-f.jpg	');
INSERT INTO pokemon (pid, name, picture) VALUES
(	'30',	'Nidorina'	,	'http://img.pokemondb.net/artwork/nidorina.jpg	');
INSERT INTO pokemon (pid, name, picture) VALUES
(	'31',	'Nidoqueen'	,	'http://img.pokemondb.net/artwork/nidoqueen.jpg	');
INSERT INTO pokemon (pid, name, picture) VALUES
(   '32',	'Nidoran'	,	'http://img.pokemondb.net/artwork/nidoran-m.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'33',	'Nidorino'	,	'http://img.pokemondb.net/artwork/nidorino.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'34',	'Nidoking'	,	'http://img.pokemondb.net/artwork/nidoking.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'35',	'Clefairy'	,	'http://img.pokemondb.net/artwork/clefairy.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'36',	'Clefable'	,	'http://img.pokemondb.net/artwork/clefable.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'37',	'Vulpix'	,	'http://img.pokemondb.net/artwork/vulpix.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'38',	'Ninetales'	,	'http://img.pokemondb.net/artwork/ninetales.jpg	')	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'39',	'Jigglypuff'	,	'http://img.pokemondb.net/artwork/jigglypuff.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'40',	'Wigglytuff'	,	'http://img.pokemondb.net/artwork/wigglytuff.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'41',	'Zubat'	,	'http://img.pokemondb.net/artwork/zubat.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'42',	'Golbat'	,	'http://img.pokemondb.net/artwork/golbat.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'43',	'Oddish'	,	'http://img.pokemondb.net/artwork/oddish.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'44',	'Gloom'	,	'http://img.pokemondb.net/artwork/gloom.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'45',	'Vileplume'	,	'http://img.pokemondb.net/artwork/vileplume.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'46',	'Paras'	,	'http://img.pokemondb.net/artwork/paras.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'47',	'Parasect'	,	'http://img.pokemondb.net/artwork/parasect.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'48',	'Venonat',	'http://img.pokemondb.net/artwork/venonat.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'49',	'Venomoth'	,	'http://img.pokemondb.net/artwork/venomoth.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'50',	'Diglett'	,	'http://img.pokemondb.net/artwork/diglett.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'51',	'Dugtrio'	,	'http://img.pokemondb.net/artwork/dugtrio.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'52',	'Meowth'	,	'http://img.pokemondb.net/artwork/meowth.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'53',	'Persian'	,	'http://img.pokemondb.net/artwork/persian.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'54',	'Psyduck'	,	'http://img.pokemondb.net/artwork/psyduck.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'55',	'Golduck'	,	'http://img.pokemondb.net/artwork/golduck.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'56',	'Mankey'	,	'http://img.pokemondb.net/artwork/mankey.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'57',	'Primeape'	,	'http://img.pokemondb.net/artwork/primeape.jpg'	);
INSERT INTO pokemon (pid, name, picture) VALUES
(	'58',	'Growlithe'	,	'http://img.pokemondb.net/artwork/growlithe.jpg');	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'59',	'Arcanine'	,	'http://img.pokemondb.net/artwork/arcanine.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'60',	'Poliwag'	,	'http://img.pokemondb.net/artwork/poliwag.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'61',	'Poliwhirl'	,	'http://img.pokemondb.net/artwork/poliwhirl.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'62',	'Poliwrath'	,	'http://img.pokemondb.net/artwork/poliwrath.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'63',	'Abra'	,	'http://img.pokemondb.net/artwork/abra.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'64',	'Kadabra'	,	'http://img.pokemondb.net/artwork/kadabra.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'65',	'Alakazam'	,	'http://img.pokemondb.net/artwork/alakazam.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'66',	'Machop'	,	'http://img.pokemondb.net/artwork/machop.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'67',	'Machoke'	,	'http://img.pokemondb.net/artwork/machoke.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'68',	'Machamp'	,	'http://img.pokemondb.net/artwork/machamp.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'69',	'Bellsprout'	,	'http://img.pokemondb.net/artwork/bellsprout.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'70',	'Weepinbell'	,	'http://img.pokemondb.net/artwork/weepinbell.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'71',	'Victreebel'	,	'http://img.pokemondb.net/artwork/victreebel.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'72',	'Tentacool'	,	'http://img.pokemondb.net/artwork/tentacool.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'73',	'Tentacruel'	,	'http://img.pokemondb.net/artwork/tentacruel.jpg'	);	
INSERT INTO pokemon (pid, name, picture) VALUES
(	'74',	'Geodude'	,	'http://img.pokemondb.net/artwork/geodude.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'75',	'Graveler'	,	'http://img.pokemondb.net/artwork/graveler.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'76',	'Golem'	,	'http://img.pokemondb.net/artwork/golem.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'88',	'Grimer'	,	'http://img.pokemondb.net/artwork/grimer.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'91',	'Cloyster'	,	'http://img.pokemondb.net/artwork/cloyster.jpg'	)	;
INSERT INTO pokemon (pid, name, picture) VALUES
(	'93',	'Haunter'	,	'http://img.pokemondb.net/artwork/haunter.jpg'	)	;

INSERT INTO evolve VALUES ('1','Null','0');
INSERT INTO evolve VALUES ('2','Lv. 16','1');
INSERT INTO evolve VALUES ('3','Lv. 32','2');
INSERT INTO evolve VALUES ('4','Null','0');
INSERT INTO evolve VALUES ('5','Lv. 16','4');
INSERT INTO evolve VALUES ('6','Lv. 36','5');
INSERT INTO evolve VALUES ('7','Null','0');
INSERT INTO evolve VALUES ('8','Lv. 16','7');
INSERT INTO evolve VALUES ('9','Lv. 36','8');
INSERT INTO evolve VALUES ('10','Null','0');
INSERT INTO evolve VALUES ('11','Lv. 7','10');
INSERT INTO evolve VALUES ('12','Lv. 10','11');
INSERT INTO evolve VALUES ('13','Null','0');
INSERT INTO evolve VALUES ('14','Lv. 7','13');
INSERT INTO evolve VALUES ('15','Lv. 10','14');
INSERT INTO evolve VALUES ('16','Null','0');
INSERT INTO evolve VALUES ('17','Lv. 18','16');
INSERT INTO evolve VALUES ('18','Lv. 36','17');
INSERT INTO evolve VALUES ('19','Null','0');
INSERT INTO evolve VALUES ('20','Lv. 20','19');
INSERT INTO evolve VALUES ('21','Null','0');
INSERT INTO evolve VALUES ('22','Lv. 20','21');
INSERT INTO evolve VALUES ('23','Null','0');
INSERT INTO evolve VALUES ('24','Lv. 22','23');
INSERT INTO evolve VALUES ('25','Null','0');
INSERT INTO evolve VALUES ('26','Thunderstone','25');
INSERT INTO evolve VALUES ('27','Null','0');
INSERT INTO evolve VALUES ('28','Lv. 22','27');
INSERT INTO evolve VALUES ('29','Null','0');
INSERT INTO evolve VALUES ('30','Lv. 16','29');
INSERT INTO evolve VALUES ('31','Moon Stone','30');
INSERT INTO evolve VALUES ('32','Null','0');
INSERT INTO evolve VALUES ('33','Lv. 16','32');
INSERT INTO evolve VALUES ('34','Moon Stone','33');
INSERT INTO evolve VALUES ('35','Null','0');
INSERT INTO evolve VALUES ('36','Moon Stone','35');
INSERT INTO evolve VALUES ('37','Null','0');
INSERT INTO evolve VALUES ('38','Fire Stone','37');
INSERT INTO evolve VALUES ('39','Null','0');
INSERT INTO evolve VALUES ('40','Moon Stone','39');
INSERT INTO evolve VALUES ('41','Null','0');
INSERT INTO evolve VALUES ('42','Lv. 22','41');
INSERT INTO evolve VALUES ('43','Null','0');
INSERT INTO evolve VALUES ('44','Lv. 22','43');
INSERT INTO evolve VALUES ('45','Leaf Stone','44');
INSERT INTO evolve VALUES ('46','Null','0');
INSERT INTO evolve VALUES ('47','Lv. 24','46');
INSERT INTO evolve VALUES ('48','Null','0');
INSERT INTO evolve VALUES ('49','Lv. 31','48');
INSERT INTO evolve VALUES ('50','Null','0');
INSERT INTO evolve VALUES ('51','Lv. 26','50');
INSERT INTO evolve VALUES ('52','Null','0');
INSERT INTO evolve VALUES ('53','Lv. 28','52');
INSERT INTO evolve VALUES ('54','Null','0');
INSERT INTO evolve VALUES ('55','Lv. 33','54');
INSERT INTO evolve VALUES ('56','Null','0');
INSERT INTO evolve VALUES ('57','Lv. 28','56');
INSERT INTO evolve VALUES ('58','Null','0');
INSERT INTO evolve VALUES ('59','Fire Stone','58');
INSERT INTO evolve VALUES ('60','Null','0');
INSERT INTO evolve VALUES ('61','Lv. 25','60');
INSERT INTO evolve VALUES ('62','Water Stone','61');
INSERT INTO evolve VALUES ('63','Null','0');
INSERT INTO evolve VALUES ('64','Lv. 16','63');
INSERT INTO evolve VALUES ('65','Trade','64');
INSERT INTO evolve VALUES ('66','Null','0');
INSERT INTO evolve VALUES ('67','Lv. 28','66');
INSERT INTO evolve VALUES ('68','Trade','67');
INSERT INTO evolve VALUES ('69','Null','0');
INSERT INTO evolve VALUES ('70','Lv. 21','69');
INSERT INTO evolve VALUES ('71','Leaf Stone','70');
INSERT INTO evolve VALUES ('72','Null','0');
INSERT INTO evolve VALUES ('73','Lv. 30','72');
INSERT INTO evolve VALUES ('74','Null','0');
INSERT INTO evolve VALUES ('75','Lv. 25','74');
INSERT INTO evolve VALUES ('76','Trade','75');
INSERT INTO evolve VALUES ('77','Null','0');
INSERT INTO evolve VALUES ('78','Lv. 40','77');
INSERT INTO evolve VALUES ('79','Null','0');
INSERT INTO evolve VALUES ('80','Lv. 37','79');
INSERT INTO evolve VALUES ('81','Null','0');
INSERT INTO evolve VALUES ('82','Lv. 30','81');
INSERT INTO evolve VALUES ('83','Null','0');
INSERT INTO evolve VALUES ('84','Null','0');
INSERT INTO evolve VALUES ('85','Lv. 31','84');
INSERT INTO evolve VALUES ('86','Null','0');
INSERT INTO evolve VALUES ('87','Lv. 34','86');
INSERT INTO evolve VALUES ('88','Null','0');
INSERT INTO evolve VALUES ('89','Lv. 38','88');
INSERT INTO evolve VALUES ('90','Null','0');
INSERT INTO evolve VALUES ('91','Water Stone','90');
INSERT INTO evolve VALUES ('92','Null','0');
INSERT INTO evolve VALUES ('93','Lv. 25','92');
INSERT INTO evolve VALUES ('94','Trade','93');
INSERT INTO evolve VALUES ('95','Null','0');
INSERT INTO evolve VALUES ('96','Null','0');
INSERT INTO evolve VALUES ('97','Lv. 26','96');
INSERT INTO evolve VALUES ('98','Null','0');
INSERT INTO evolve VALUES ('99','Lv. 28','98');
INSERT INTO evolve VALUES ('100','Null','0');
INSERT INTO evolve VALUES ('101','Lv. 30','100');
INSERT INTO evolve VALUES ('102','Null','0');
INSERT INTO evolve VALUES ('103','Leaf Stone','102');
INSERT INTO evolve VALUES ('104','Null','0');
INSERT INTO evolve VALUES ('105','Lv. 28','104');
INSERT INTO evolve VALUES ('106','Null','0');
INSERT INTO evolve VALUES ('107','Null','0');
INSERT INTO evolve VALUES ('108','Null','0');
INSERT INTO evolve VALUES ('109','Null','0');
INSERT INTO evolve VALUES ('110','Lv. 35','109');
INSERT INTO evolve VALUES ('111','Null','0');
INSERT INTO evolve VALUES ('112','Lv. 42','111');
INSERT INTO evolve VALUES ('113','Null','0');
INSERT INTO evolve VALUES ('114','Null','0');
INSERT INTO evolve VALUES ('115','Null','0');
INSERT INTO evolve VALUES ('116','Null','0');
INSERT INTO evolve VALUES ('117','Lv. 32','116');
INSERT INTO evolve VALUES ('118','Null','0');
INSERT INTO evolve VALUES ('119','Lv. 33','118');
INSERT INTO evolve VALUES ('120','Null','0');
INSERT INTO evolve VALUES ('121','Water Stone','120');
INSERT INTO evolve VALUES ('122','Null','0');
INSERT INTO evolve VALUES ('123','Null','0');
INSERT INTO evolve VALUES ('124','Null','0');
INSERT INTO evolve VALUES ('125','Null','0');
INSERT INTO evolve VALUES ('126','Null','0');
INSERT INTO evolve VALUES ('127','Null','0');
INSERT INTO evolve VALUES ('128','Null','0');
INSERT INTO evolve VALUES ('129','Null','0');
INSERT INTO evolve VALUES ('130','Lv. 20','129');
INSERT INTO evolve VALUES ('131','Null','0');
INSERT INTO evolve VALUES ('132','Null','0');
INSERT INTO evolve VALUES ('133','Null','0');
INSERT INTO evolve VALUES ('134','Water Stone','133');
INSERT INTO evolve VALUES ('135','Thunderstone','133');
INSERT INTO evolve VALUES ('136','Fire Stone','133');
INSERT INTO evolve VALUES ('137','Null','0');
INSERT INTO evolve VALUES ('138','Null','0');
INSERT INTO evolve VALUES ('139','Lv. 40','138');
INSERT INTO evolve VALUES ('140','Null','0');
INSERT INTO evolve VALUES ('141','Lv. 40','140');
INSERT INTO evolve VALUES ('142','Null','0');
INSERT INTO evolve VALUES ('143','Null','0');
INSERT INTO evolve VALUES ('144','Null','0');
INSERT INTO evolve VALUES ('145','Null','0');
INSERT INTO evolve VALUES ('146','Null','0');
INSERT INTO evolve VALUES ('147','Null','0');
INSERT INTO evolve VALUES ('148','Lv. 30','147');
INSERT INTO evolve VALUES ('149','Lv. 55','148');
INSERT INTO evolve VALUES ('150','Null','0');
INSERT INTO evolve VALUES ('151','Null','0');

INSERT INTO gymleader VALUES ('Brock','Rock','Boulder Badge');
INSERT INTO gymleader VALUES ('Misty','Water','Cascade Badge');
INSERT INTO gymleader VALUES ('Lt. Surge','Electric','Thunder Badge');
INSERT INTO gymleader VALUES ('Erika','Grass','Rainbow Badge');
INSERT INTO gymleader VALUES ('Koga','Poison','Soul Badge');
INSERT INTO gymleader VALUES ('Sabrina','Psychic','Marsh Badge');
INSERT INTO gymleader VALUES ('Blaine','Fire','Volcano Badge');
INSERT INTO gymleader VALUES ('Giovanni','Ground','Earth Badge');

INSERT INTO item_loc VALUES ('IID','LName');
INSERT INTO item_loc VALUES ('ANTIDOTE','PokeMart Virdian Forest');
INSERT INTO item_loc VALUES ('AWAKENING','PokeMart Pokemon Tower');
INSERT INTO item_loc VALUES ('BICYCLE','Cerulean Bike Shop');
INSERT INTO item_loc VALUES ('BIKE VOUCHER','Vermillion Pokemon Fan Club');
INSERT INTO item_loc VALUES ('BURN HEAL','PokeMart');
INSERT INTO item_loc VALUES ('CALCIUM','Silph Co. Route 13 Pokemon Mansion Celadon Dept. Store');
INSERT INTO item_loc VALUES ('CARBOS','Silph Co.Safari Zone Power Plant Pokemon Mansion Celadon Dept. Store');
INSERT INTO item_loc VALUES ('CARD KEY','Silph Co.5th Floor');
INSERT INTO item_loc VALUES ('COIN','Game Corner');
INSERT INTO item_loc VALUES ('COIN CASE','Celadon Resturant');
INSERT INTO item_loc VALUES ('DIRE HIT','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('DOME FOSSIL','Mt. Moon');
INSERT INTO item_loc VALUES ('ELIXER','Pokemon Tower');
INSERT INTO item_loc VALUES ('ESCAPE ROPE','Pokemart Mt. Moon Game Corner Pokemon Tower Silph Co. Pokemon Mansion');
INSERT INTO item_loc VALUES ('ETHER','Different Areas S.S. Anne');
INSERT INTO item_loc VALUES ('EXP. ALL','Route 15');
INSERT INTO item_loc VALUES ('FIRE STONE','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('FRESH WATER','Celadon Dept. Store Roof');
INSERT INTO item_loc VALUES ('FULL HEAL','PokeMart Silph Co. Victory Road');
INSERT INTO item_loc VALUES ('FULL RESTORE','PokeMart Safari Zone Pokemon Mansion 2 in Cerulean Cave');
INSERT INTO item_loc VALUES ('GOLD TEETH','Safari Zone 3');
INSERT INTO item_loc VALUES ('GOOD ROD','Fuchsia City');
INSERT INTO item_loc VALUES ('GREAT BALL','PokeMart S.S. Anne');
INSERT INTO item_loc VALUES ('GUARD SPEC.','Celadon Dept. Store Victory Road');
INSERT INTO item_loc VALUES ('HELIX FOSSIL','Mt. Moon');
INSERT INTO item_loc VALUES ('HP UP','Route 2 Mt. Moon Game Corner Celadon Dept. Store Pokemon Tower Silph Co. Power Plant');
INSERT INTO item_loc VALUES ('HYPER POTION','PokeMart Game Corner Silph Co.');
INSERT INTO item_loc VALUES ('ICE HEAL','PokeMart');
INSERT INTO item_loc VALUES ('IRON','Game Corner Route 12 Pokemon Mansion Celadon Dept. Store');
INSERT INTO item_loc VALUES ('ITEM FINDER','Route 11');
INSERT INTO item_loc VALUES ('LEAF STONE','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('LEMONADE','Celadon Dept. Store Roof');
INSERT INTO item_loc VALUES ('LIFT KEY','Game Corner');
INSERT INTO item_loc VALUES ('MASTER BALL','Silph Co.');
INSERT INTO item_loc VALUES ('MAX ELIXER','Various Areas Cerulean Cave');
INSERT INTO item_loc VALUES ('MAX ETHER','Various Areas S.S. Anne');
INSERT INTO item_loc VALUES ('MAX POTION','PokeMart S.S. Anne 2 in Safari Zone Pokemon Mansion');
INSERT INTO item_loc VALUES ('MAX REPEL','PokeMart');
INSERT INTO item_loc VALUES ('MAX REVIVE','Silph Co. Safari Zone Victory Road Cerulean Cave');
INSERT INTO item_loc VALUES ('MOON STONE','2 in Mt. Moon Route 2 Game Corner Pokemon Mansion');
INSERT INTO item_loc VALUES ('NUGGET','Various Areas Nugget Bridge Game Corner Pokemon Tower Safari Zone Cerulean Cave');
INSERT INTO item_loc VALUES ('OAK PARCEL','Virdian City-PokeMart');
INSERT INTO item_loc VALUES ('OLD AMBER','Pewter City-Museum');
INSERT INTO item_loc VALUES ('OLD ROD','Vermillion City');
INSERT INTO item_loc VALUES ('PARALYZE HEAL','PokeMart');
INSERT INTO item_loc VALUES ('POKeBALL','PokeMart Viridian Forest');
INSERT INTO item_loc VALUES ('POKeDEX','Pallet Town');
INSERT INTO item_loc VALUES ('POKeDOLL','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('POKeFLUTE','Pokemon Tower');
INSERT INTO item_loc VALUES ('POTION','PokeMart Pallet Town Route 1 Viridian City Viridian Forest 2 in Mt. Moon');
INSERT INTO item_loc VALUES ('PP UP','Various Areas Cerulean Cave');
INSERT INTO item_loc VALUES ('PROTEIN','Celadon Dept. Store Silph Co. Route 13 Safari Zone');
INSERT INTO item_loc VALUES ('RARE CANDY','Mt. Moon Cerulean City S.S. Anne Game Corner Pokemon Tower Silph Co. Power Plant Pokemon Mansion Victory Road Cerulean Cave');
INSERT INTO item_loc VALUES ('REPEL','PokeMart');
INSERT INTO item_loc VALUES ('REVIVE','PokeMart');
INSERT INTO item_loc VALUES ('S.S. TICKET','Sea Cottage');
INSERT INTO item_loc VALUES ('SAFARI BALL (30)','Safari Zone');
INSERT INTO item_loc VALUES ('SECRET KEY','Pokemon Mansion');
INSERT INTO item_loc VALUES ('SILPH SCOPE','Game Corner');
INSERT INTO item_loc VALUES ('SODA POP','Celadon Dept. Store Roof');
INSERT INTO item_loc VALUES ('SUPER POTION','PokeMart Game Corner');
INSERT INTO item_loc VALUES ('SUPER REPEL','PokeMart');
INSERT INTO item_loc VALUES ('SUPER ROD','Route 12');
INSERT INTO item_loc VALUES ('THUNDER STONE','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TOWN MAP','Rival House');
INSERT INTO item_loc VALUES ('ULTRA BALL','PokeMart 2 in Cerulean Cave');
INSERT INTO item_loc VALUES ('WATER STONE','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('X ACCURACY','Pokemon Tower Silph Co. Celadon Dept. Store');
INSERT INTO item_loc VALUES ('X ATTACK','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('X DEFEND','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('X SPECIAL','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('X SPEED','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TM01','Mt. Moon, Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TM02','Celadon Dept. Store, Game Corner');
INSERT INTO item_loc VALUES ('TM03','Saffron City — Silph Co.');
INSERT INTO item_loc VALUES ('TM04','Route 4');
INSERT INTO item_loc VALUES ('TM05','Victory Road, Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TM06','Fuchsia City — Pokemon Gym');
INSERT INTO item_loc VALUES ('TM07','Celadon Dept. Store, Game Corner');
INSERT INTO item_loc VALUES ('TM08','Vermilion City — S.S. Anne');
INSERT INTO item_loc VALUES ('TM09','Saffron City, Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TM10','Game Corner');
INSERT INTO item_loc VALUES ('TM11','Cerulean City — Pokemon Gym');
INSERT INTO item_loc VALUES ('TM12','Mt. Moon');
INSERT INTO item_loc VALUES ('TM13','Celadon Dept. Store Roof - Give girl Water');
INSERT INTO item_loc VALUES ('TM14','Cinnabar Island — Pokemon Mansion');
INSERT INTO item_loc VALUES ('TM15','Celadon City - Game Corner Exchange');
INSERT INTO item_loc VALUES ('TM16','Route 12');
INSERT INTO item_loc VALUES ('TM17','Victory Road, Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TM18','Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TM19','Route 25');
INSERT INTO item_loc VALUES ('TM20','Route 15');
INSERT INTO item_loc VALUES ('TM21','Celadon City — Pokemon Gym');
INSERT INTO item_loc VALUES ('TM22','Cinnabar Island — Pokemon Mansion');
INSERT INTO item_loc VALUES ('TM23','Celadon City - Game Corner Exchange');
INSERT INTO item_loc VALUES ('TM24','Vermilion Gym');
INSERT INTO item_loc VALUES ('TM25','Power Plant');
INSERT INTO item_loc VALUES ('TM26','Saffron City — Silph Co.');
INSERT INTO item_loc VALUES ('TM27','Viridian City — Pokemon Gym');
INSERT INTO item_loc VALUES ('TM28','Cerulean City');
INSERT INTO item_loc VALUES ('TM29','Saffron City');
INSERT INTO item_loc VALUES ('TM30','Route 9');
INSERT INTO item_loc VALUES ('TM31','Saffron City');
INSERT INTO item_loc VALUES ('TM32','Fuchsia City, Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TM33','Power Plant, Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TM34','Pewter City — Pokemon Gym');
INSERT INTO item_loc VALUES ('TM35','Cinnabar Island — Pokemon Lab');
INSERT INTO item_loc VALUES ('TM36','Saffron City — Silph Co.');
INSERT INTO item_loc VALUES ('TM37','Fuchsia City, Celadon Dept. Store');
INSERT INTO item_loc VALUES ('TM38','Cinnabar Island — Pokemon Gym');
INSERT INTO item_loc VALUES ('TM39','Route 12 — Lookout Station');
INSERT INTO item_loc VALUES ('TM40','Fuchsia City — Safari Zone');
INSERT INTO item_loc VALUES ('TM41','Celadon City');
INSERT INTO item_loc VALUES ('TM42','Viridian City');
INSERT INTO item_loc VALUES ('TM43','Victory Road');
INSERT INTO item_loc VALUES ('TM44','Vermilion City — S.S. Anne');
INSERT INTO item_loc VALUES ('TM45','Route 24');
INSERT INTO item_loc VALUES ('TM46','Saffron City — Pokemon Gym');
INSERT INTO item_loc VALUES ('TM47','Victory Road');
INSERT INTO item_loc VALUES ('TM48','Celadon Dept. Store Roof - Give girl Soda');
INSERT INTO item_loc VALUES ('TM49','Celadon Dept. Store Roof - Give girl Lemonade');
INSERT INTO item_loc VALUES ('TM50','Celadon City - Game Corner Exchange');
INSERT INTO item_loc VALUES ('HM01','S.S. Anne');
INSERT INTO item_loc VALUES ('HM02','Route 16');
INSERT INTO item_loc VALUES ('HM03','Fuchsia City - Safari Zone');
INSERT INTO item_loc VALUES ('HM04','Fuchsia City');
INSERT INTO item_loc VALUES ('HM05','Route 2');

INSERT INTO live VALUES ('TID','LName');
INSERT INTO live VALUES ('Rival_1','Prof. Oak Lab');
INSERT INTO live VALUES ('Bug Catcher Rick','Viridian Forest');
INSERT INTO live VALUES ('Bug Catcher Doug','Viridian Forest');
INSERT INTO live VALUES ('Bug Catcher Anthony','Viridian Forest');
INSERT INTO live VALUES ('Bug Catcher Charlie','Viridian Forest');
INSERT INTO live VALUES ('Bug Catcher Sammy','Viridian Forest');
INSERT INTO live VALUES ('Camper Liam','Pewter City Gym');
INSERT INTO live VALUES ('Leader Brock','Pewter City Gym');
INSERT INTO live VALUES ('Lass Janice','Route 3');
INSERT INTO live VALUES ('Bug Catcher Colton','Route 3');
INSERT INTO live VALUES ('Youngster Ben','Route 3');
INSERT INTO live VALUES ('Bug Catcher Greg','Route 3');
INSERT INTO live VALUES ('Lass Sally','Route 3');
INSERT INTO live VALUES ('Bug Catcher James','Route 3');
INSERT INTO live VALUES ('Youngster Calvin','Route 3');
INSERT INTO live VALUES ('Lass Robin','Route 3');
INSERT INTO live VALUES ('Lass Iris','Mt. Moon');
INSERT INTO live VALUES ('BUg Catcher Kent','Mt. Moon');
INSERT INTO live VALUES ('Super Nerd Jovan','Mt. Moon');
INSERT INTO live VALUES ('Bug Catcher Robby','Mt. Moon');
INSERT INTO live VALUES ('Lass Miriam','Mt. Moon');
INSERT INTO live VALUES ('Team Rocket Grunt_1','Mt. Moon');
INSERT INTO live VALUES ('Team Rocket Grunt_2','Mt. Moon');
INSERT INTO live VALUES ('Youngster Josh','Mt. Moon');
INSERT INTO live VALUES ('Hiker Marcos','Mt. Moon');
INSERT INTO live VALUES ('Team Rocket Grunt_3','Mt. Moon');
INSERT INTO live VALUES ('Team Rocket Grunt_4','Mt. Moon');
INSERT INTO live VALUES ('Super Nerd Miguel','Mt. Moon');
INSERT INTO live VALUES ('Lass Crissy','Route 4');
INSERT INTO live VALUES ('Rival_2','Route 24');
INSERT INTO live VALUES ('Bug Catcher Cale','Route 24');
INSERT INTO live VALUES ('Lass Ali','Route 24');
INSERT INTO live VALUES ('Youngster Timmy','Route 24');
INSERT INTO live VALUES ('Lass Reli','Route 24');
INSERT INTO live VALUES ('Camper Ethan','Route 24');
INSERT INTO live VALUES ('Team Rocket Grunt_5','Route 24');
INSERT INTO live VALUES ('Camper Shane','Route 24');
INSERT INTO live VALUES ('Hiker Franklin','Route 25');
INSERT INTO live VALUES ('Hiker Wayne','Route 25');
INSERT INTO live VALUES ('Youngster Joey','Route 25');
INSERT INTO live VALUES ('Youngester Dan','Route 25');
INSERT INTO live VALUES ('Picnicker Kelsey','Route 25');
INSERT INTO live VALUES ('Hiker Nob','Route 25');
INSERT INTO live VALUES ('Camper Flint','Route 25');
INSERT INTO live VALUES ('Youngster Chad','Route 25');
INSERT INTO live VALUES ('Lass Haley','Route 25');
INSERT INTO live VALUES ('Swimmer Luis','Cerulean City Gym');
INSERT INTO live VALUES ('Picnicker Diana','Cerulean City Gym');
INSERT INTO live VALUES ('Leader Misty','Cerulean City Gym');
INSERT INTO live VALUES ('Team Rocket Grunt_6','Cerulean City');
INSERT INTO live VALUES ('Bug Catcher Keigo','Route 6');
INSERT INTO live VALUES ('Camper Ricky','Route 6');
INSERT INTO live VALUES ('Picnicker Nancy','Route 6');
INSERT INTO live VALUES ('Bug Catcher Elijah','Route 6');
INSERT INTO live VALUES ('Picnicker Isabelle','Route 6');
INSERT INTO live VALUES ('Camper Jeff','Route 6');
INSERT INTO live VALUES ('Youngster Eddie','Route 11');
INSERT INTO live VALUES ('Gamer Hugo','Route 11');
INSERT INTO live VALUES ('Engineer Bernie','Route 11');
INSERT INTO live VALUES ('Gamer Jasper','Route 11');
INSERT INTO live VALUES ('Youngster Dave','Route 11');
INSERT INTO live VALUES ('Youngster Dillon','Route 11');
INSERT INTO live VALUES ('Engineer Braxton','Route 11');
INSERT INTO live VALUES ('Youngster Yasu','Route 11');
INSERT INTO live VALUES ('Gamer Darian','Route 11');
INSERT INTO live VALUES ('Gamer Dirk','Route 11');
INSERT INTO live VALUES ('Fisherman Barny','S. S. Anne');
INSERT INTO live VALUES ('Sailer Phillip','S. S. Anne');
INSERT INTO live VALUES ('Sailer Huey','S. S. Anne');
INSERT INTO live VALUES ('Sailor Dylan','S. S. Anne');
INSERT INTO live VALUES ('Sailor Duncan','S. S. Anne');
INSERT INTO live VALUES ('Sailor leonard','S. S. Anne');
INSERT INTO live VALUES ('Gentleman Thomas','S. S. Anne');
INSERT INTO live VALUES ('Gentleman Arthur','S. S. Anne');
INSERT INTO live VALUES ('Lass Ann','S. S. Anne');
INSERT INTO live VALUES ('Youngster Tyler','S. S. Anne');
INSERT INTO live VALUES ('Sailor Trevor','S. S. Anne');
INSERT INTO live VALUES ('Sailor Edmond','S. S. Anne');
INSERT INTO live VALUES ('Fisherman Dale','S. S. Anne');
INSERT INTO live VALUES ('Gentleman Brooks','S. S. Anne');
INSERT INTO live VALUES ('Lass Dawn','S. S. Anne');
INSERT INTO live VALUES ('Gentleman Lamar','S. S. Anne');
INSERT INTO live VALUES ('Rival_3','S. S. Anne');
INSERT INTO live VALUES ('Sailor Dwayne','Vermillion City Gym');
INSERT INTO live VALUES ('Engineer Baily','Vermillion City Gym');
INSERT INTO live VALUES ('Gentleman Tucker','Vermillion City Gym');
INSERT INTO live VALUES ('Leader Lt. Surge','Vermillion City Gym');
INSERT INTO live VALUES ('Picnicker Alicia','Route 9');
INSERT INTO live VALUES ('Hiker Jeremy','Route 9');
INSERT INTO live VALUES ('Camper Chris','Route 9');
INSERT INTO live VALUES ('Bug Catcher Brent','Route 9');
INSERT INTO live VALUES ('Bug Catcher Conner','Route 9');
INSERT INTO live VALUES ('Bug Camper Drew','Route 9');
INSERT INTO live VALUES ('Hiker Alan','Route 9');
INSERT INTO live VALUES ('Hiker Brice','Route 9');
INSERT INTO live VALUES ('Picnicker Caitlin','Route 9');
INSERT INTO live VALUES ('Picnicker Heidi','Route 10');
INSERT INTO live VALUES ('Picnicker Carol','Route 10');
INSERT INTO live VALUES ('Hiker Clark','Route 10');
INSERT INTO live VALUES ('Hiker Trent','Route 10');
INSERT INTO live VALUES ('Pokemaniac Herman','Route 10');
INSERT INTO live VALUES ('Pokemaniac Mark','Route 10');
INSERT INTO live VALUES ('Pokemaniac Ashton','Rock Tunnel');
INSERT INTO live VALUES ('Pokemaniac Winston','Rock Tunnel');
INSERT INTO live VALUES ('Picnicker Martha','Rock Tunnel');
INSERT INTO live VALUES ('Pokemaniac Steve','Rock Tunnel');
INSERT INTO live VALUES ('Hiker Allen','Rock Tunnel');
INSERT INTO live VALUES ('Hiker Eric','Rock Tunnel');
INSERT INTO live VALUES ('Hiker Lenny','Rock Tunnel');
INSERT INTO live VALUES ('Hiker Oliver','Rock Tunnel');
INSERT INTO live VALUES ('Hiker Lucas','Rock Tunnel');
INSERT INTO live VALUES ('Picnicker Sofia','Rock Tunnel');
INSERT INTO live VALUES ('Hiker Dudley','Rock Tunnel');
INSERT INTO live VALUES ('Pokemaniac Cooper','Rock Tunnel');
INSERT INTO live VALUES ('Picnicker Leah','Rock Tunnel');
INSERT INTO live VALUES ('Picnicker Arianna','Rock Tunnel');
INSERT INTO live VALUES ('Picnicker Dana','Rock Tunnel');
INSERT INTO live VALUES ('Lass Julia','Route 8');
INSERT INTO live VALUES ('Gamer Rich','Route 8');
INSERT INTO live VALUES ('Super Nerd Glenn','Route 8');
INSERT INTO live VALUES ('Lass Megan','Route 8');
INSERT INTO live VALUES ('Lass Andrea','Route 8');
INSERT INTO live VALUES ('Super Nerd Leslie','Route 8');
INSERT INTO live VALUES ('Lass Paige','Route 8');
INSERT INTO live VALUES ('Biker Jaren','Route 8');
INSERT INTO live VALUES ('Biker Ricardo','Route 8');
INSERT INTO live VALUES ('Super Nerd Aiden','Route 8');
INSERT INTO live VALUES ('Gamer Stan','Route 8');
INSERT INTO live VALUES ('Lass Kay','Celadon City Gym');
INSERT INTO live VALUES ('Beauty Bridget','Celadon City Gym');
INSERT INTO live VALUES ('Picnicker Tina','Celadon City Gym');
INSERT INTO live VALUES ('Beauty Tamia','Celadon City Gym');
INSERT INTO live VALUES ('Beauty Lori','Celadon City Gym');
INSERT INTO live VALUES ('Lass Lisa','Celadon City Gym');
INSERT INTO live VALUES ('Cooltrainer Mary','Celadon City Gym');
INSERT INTO live VALUES ('Leader Erika','Celadon City Gym');
INSERT INTO live VALUES ('Team Rocket Grunt_7','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_8','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_9','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_10','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_11','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_12','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_13','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_14','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_15','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_16','Casino');
INSERT INTO live VALUES ('Team Rocket Grunt_17','Casino');
INSERT INTO live VALUES ('Boss Giovanni_1','Casino');
INSERT INTO live VALUES ('Rival_6','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Hope','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Patricia','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Carly','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Laurel','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Jody','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Paula','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Ruth','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Tammy','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Karina','Pokemon Tower');
INSERT INTO live VALUES ('Channeler janae','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Angelica','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Jennifer','Pokemon Tower');
INSERT INTO live VALUES ('Channeler Emilia','Pokemon Tower');
INSERT INTO live VALUES ('Team Rocket Grunt_18','Pokemon Tower');
INSERT INTO live VALUES ('Team Rocket Grunt_19','Pokemon Tower');
INSERT INTO live VALUES ('Team Rocket Grunt_20','Pokemon Tower');
INSERT INTO live VALUES ('Biker Lao','Route 16');
INSERT INTO live VALUES ('Cue Ball Luke','Route 16');
INSERT INTO live VALUES ('Cue Ball Koji','Route 16');
INSERT INTO live VALUES ('Biker Hideo','Route 16');
INSERT INTO live VALUES ('Biker Ruben','Route 16');
INSERT INTO live VALUES ('Cue Ball Camron','Route 16');
INSERT INTO live VALUES ('Cue Ball Isaiah','Route 17');
INSERT INTO live VALUES ('Biker Virgil','Route 17');
INSERT INTO live VALUES ('Cue Ball Raul','Route 17');
INSERT INTO live VALUES ('Biker Billy','Route 17');
INSERT INTO live VALUES ('Biker Nikolas','Route 17');
INSERT INTO live VALUES ('Cue Ball Zeek','Route 17');
INSERT INTO live VALUES ('Cue Ball Corey','Route 17');
INSERT INTO live VALUES ('Biker Jaxon','Route 17');
INSERT INTO live VALUES ('Cue Ball Jamal','Route 17');
INSERT INTO live VALUES ('Biker William','Route 17');
INSERT INTO live VALUES ('Bird Keeper Jacob','Route 18');
INSERT INTO live VALUES ('Bird Keeper Wilton','Route 18');
INSERT INTO live VALUES ('Bird Keeper Ramiro','Route 18');
INSERT INTO live VALUES ('Juggler Nate','Fuscia City Gym');
INSERT INTO live VALUES ('Juggler Kayden','Fuscia City Gym');
INSERT INTO live VALUES ('Juggler Kirk','Fuscia City Gym');
INSERT INTO live VALUES ('Tamer Edgar','Fuscia City Gym');
INSERT INTO live VALUES ('Tamer Phil','Fuscia City Gym');
INSERT INTO live VALUES ('Juggler Shawn','Fuscia City Gym');
INSERT INTO live VALUES ('Leader Koga','Fuscia City Gym');
INSERT INTO live VALUES ('Black Belt Hitoshi','Fighting Dojo');
INSERT INTO live VALUES ('Black Belt Hideki','Fighting Dojo');
INSERT INTO live VALUES ('Black Belt Aaron','Fighting Dojo');
INSERT INTO live VALUES ('Black Belt Mike','Fighting Dojo');
INSERT INTO live VALUES ('Black Belt Koichi','Fighting Dojo');
INSERT INTO live VALUES ('Team Rocket Grunt_21','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_22','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_23','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_24','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_25','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_26','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_27','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_28','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_29','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_30','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_31','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_32','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_33','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_34','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_35','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_36','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_37','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_38','Silph Co. Building');
INSERT INTO live VALUES ('Team Rocket Grunt_39','Silph Co. Building');
INSERT INTO live VALUES ('Scientist Jerry','Silph Co. Building');
INSERT INTO live VALUES ('Scientist Jose','Silph Co. Building');
INSERT INTO live VALUES ('Scientist Rodney','Silph Co. Building');
INSERT INTO live VALUES ('Scientist Beau','Silph Co. Building');
INSERT INTO live VALUES ('Juggler Dalton','Silph Co. Building');
INSERT INTO live VALUES ('Scientist Taylor','Silph Co. Building');
INSERT INTO live VALUES ('Scientist Joshua','Silph Co. Building');
INSERT INTO live VALUES ('Rival_4','Silph Co. Building');
INSERT INTO live VALUES ('Scientist Parker','Silph Co. Building');
INSERT INTO live VALUES ('Scientist Ed','Silph Co. Building');
INSERT INTO live VALUES ('Scientist Travis','Silph Co. Building');
INSERT INTO live VALUES ('Boss Giovanni_2','Silph Co. Building');
INSERT INTO live VALUES ('Psychic Cameron','Saffron City Gym');
INSERT INTO live VALUES ('Channeler Tasha','Saffron City Gym');
INSERT INTO live VALUES ('Psychic Johan','Saffron City Gym');
INSERT INTO live VALUES ('Psychic Tyron','Saffron City Gym');
INSERT INTO live VALUES ('Channeler Stacy','Saffron City Gym');
INSERT INTO live VALUES ('Channeler Amanda','Saffron City Gym');
INSERT INTO live VALUES ('Psychic Preston','Saffron City Gym');
INSERT INTO live VALUES ('Leader Sabrina','Saffron City Gym');
INSERT INTO live VALUES ('Fisherman Ned','Route 12');
INSERT INTO live VALUES ('Fisherman Chip','Route 12');
INSERT INTO live VALUES ('Fisherman Hank','Route 12');
INSERT INTO live VALUES ('Fisherman Elliot','Route 12');
INSERT INTO live VALUES ('Rocker Luca','Route 12');
INSERT INTO live VALUES ('Camper Justin','Route 12');
INSERT INTO live VALUES ('Fisherman Andrew','Route 12');
INSERT INTO live VALUES ('Picnicker Alma','Route 13');
INSERT INTO live VALUES ('Bird Keeper Sebastian','Route 13');
INSERT INTO live VALUES ('Picnicker Susie','Route 13');
INSERT INTO live VALUES ('Beauty Lola','Route 13');
INSERT INTO live VALUES ('Beauty Sheila','Route 13');
INSERT INTO live VALUES ('Picnicker Valerie','Route 13');
INSERT INTO live VALUES ('Picnicker Gwen','Route 13');
INSERT INTO live VALUES ('Bird Keeper Perry','Route 13');
INSERT INTO live VALUES ('Biker Jared','Route 13');
INSERT INTO live VALUES ('Bird Keeper Robert','Route 13');
INSERT INTO live VALUES ('Bird Keeper Carter','Route 14');
INSERT INTO live VALUES ('Bird Keeper Mitch','Route 14');
INSERT INTO live VALUES ('Bird Keeper Marlon','Route 14');
INSERT INTO live VALUES ('Bird Keeper Beck','Route 14');
INSERT INTO live VALUES ('Bird Keeper Donald','Route 14');
INSERT INTO live VALUES ('Bird Keeper Benny','Route 14');
INSERT INTO live VALUES ('Biker Geralk','Route 14');
INSERT INTO live VALUES ('Biker Malik','Route 14');
INSERT INTO live VALUES ('Biker Isaac','Route 14');
INSERT INTO live VALUES ('Biker Lukas','Route 14');
INSERT INTO live VALUES ('Picnicker Becky','Route 15');
INSERT INTO live VALUES ('Picnicker Celia','Route 15');
INSERT INTO live VALUES ('Biker Ernest','Route 15');
INSERT INTO live VALUES ('Biker Alex','Route 15');
INSERT INTO live VALUES ('Beauty Grace','Route 15');
INSERT INTO live VALUES ('Beauty Olivia','Route 15');
INSERT INTO live VALUES ('Picnicker Kindra','Route 15');
INSERT INTO live VALUES ('Bird Keeper Chester','Route 15');
INSERT INTO live VALUES ('Bird Keeper Edwin','Route 15');
INSERT INTO live VALUES ('Picnicker Yazmin','Route 15');
INSERT INTO live VALUES ('Swimmer (M) Richard','Route 19');
INSERT INTO live VALUES ('Swimer (M) Reece','Route 19');
INSERT INTO live VALUES ('Swimmer (M) Tony','Route 19');
INSERT INTO live VALUES ('Swimmer (M) David','Route 19');
INSERT INTO live VALUES ('Swimmer (M) Douglas','Route 19');
INSERT INTO live VALUES ('Swimmer (M) Matthew','Route 19');
INSERT INTO live VALUES ('Swimmer (M) Axle','Route 19');
INSERT INTO live VALUES ('Swimmer (F) Alice','Route 19');
INSERT INTO live VALUES ('Swimmer (F) Connie','Route 19');
INSERT INTO live VALUES ('Swimmer (F) Anya','Route 19');
INSERT INTO live VALUES ('Swimmer (M) Barry','Route 20');
INSERT INTO live VALUES ('Swimmer (M) Darrin','Route 20');
INSERT INTO live VALUES ('Swimmer (F) Shirley','Route 20');
INSERT INTO live VALUES ('Swimmer (F) Tiffany','Route 20');
INSERT INTO live VALUES ('Picnicker Irene','Route 20');
INSERT INTO live VALUES ('Bird Keeper Roger','Route 20');
INSERT INTO live VALUES ('Swimmer (F) Nora','Route 20');
INSERT INTO live VALUES ('Swimmer (M) Dean','Route 20');
INSERT INTO live VALUES ('Picnicker Missy','Route 20');
INSERT INTO live VALUES ('Swimmer (F) Melissa','Route 20');
INSERT INTO live VALUES ('Youngster Johnson','Cinnibar Island Mansion');
INSERT INTO live VALUES ('Scientist Ted','Cinnibar Island Mansion');
INSERT INTO live VALUES ('Burglar Arnie','Cinnibar Island Mansion');
INSERT INTO live VALUES ('Burglar Simon','Cinnibar Island Mansion');
INSERT INTO live VALUES ('Scientist Braydon','Cinnibar Island Mansion');
INSERT INTO live VALUES ('Burglar Lewis','Cinnibar Island Mansion');
INSERT INTO live VALUES ('Scientist Ivan','Cinnibar Island Mansion');
INSERT INTO live VALUES ('Burglar Quinn','Cinnabar Island Gym');
INSERT INTO live VALUES ('Super Nerd Erik','Cinnabar Island Gym');
INSERT INTO live VALUES ('Super Nerd Avery','Cinnabar Island Gym');
INSERT INTO live VALUES ('Burglar Ramon','Cinnabar Island Gym');
INSERT INTO live VALUES ('Super Nerd Derek','Cinnabar Island Gym');
INSERT INTO live VALUES ('Burglar Dusty','Cinnabar Island Gym');
INSERT INTO live VALUES ('Super Nerd Zac','Cinnabar Island Gym');
INSERT INTO live VALUES ('Leader Blaine','Cinnabar Island Gym');
INSERT INTO live VALUES ('Fisherman Wade','Route 21');
INSERT INTO live VALUES ('Fisherman Ronald','Route 21');
INSERT INTO live VALUES ('Swimmer (M) Spencer','Route 21');
INSERT INTO live VALUES ('Fisherman Claude','Route 21');
INSERT INTO live VALUES ('Fisherman Nolan','Route 21');
INSERT INTO live VALUES ('Swimmer (M) Jack','Route 21');
INSERT INTO live VALUES ('Swimmer (M) Roland','Route 21');
INSERT INTO live VALUES ('Swimmer (M) Jerome','Route 21');
INSERT INTO live VALUES ('Tamer Cole','Viridian City Gym');
INSERT INTO live VALUES ('Black Belt Kiyo','Viridian City Gym');
INSERT INTO live VALUES ('Cool Trainer Samuel','Viridian City Gym');
INSERT INTO live VALUES ('Cool Trainer Yuji','Viridian City Gym');
INSERT INTO live VALUES ('Black Belt Atsushi','Viridian City Gym');
INSERT INTO live VALUES ('Tamer Jason','Viridian City Gym');
INSERT INTO live VALUES ('Cool Trainer Warren','Viridian City Gym');
INSERT INTO live VALUES ('Black Belt Takashi','Viridian City Gym');
INSERT INTO live VALUES ('Leader Giovanni','Viridian City Gym');
INSERT INTO live VALUES ('Rival_5','Route 22');
INSERT INTO live VALUES ('Cool Trainer Naomi','Victory Road');
INSERT INTO live VALUES ('Cool Trainer Rolando','Victory Road');
INSERT INTO live VALUES ('Black Belt Daisuke','Victory Road');
INSERT INTO live VALUES ('Juggler Nelson','Victory Road');
INSERT INTO live VALUES ('Tamer Vincent','Victory Road');
INSERT INTO live VALUES ('Juggler Gregory','Victory Road');
INSERT INTO live VALUES ('Cool Trainer George','Victory Road');
INSERT INTO live VALUES ('Pokemanic Dawson','Victory Road');
INSERT INTO live VALUES ('Cool Trainer Alexa','Victory Road');
INSERT INTO live VALUES ('Cool Trainer Colby','Victory Road');
INSERT INTO live VALUES ('Cool Trainer Caroline','Victory Road');
INSERT INTO live VALUES ('Cool Couple Ray & Tyra','Victory Road');
INSERT INTO live VALUES ('Elite Four Lorelei','Elite Four');
INSERT INTO live VALUES ('Elite Four Bruno','Elite Four');
INSERT INTO live VALUES ('Elite Four Agatha','Elite Four');
INSERT INTO live VALUES ('Elite Four Lance','Elite Four');
INSERT INTO live VALUES ('Champion Rival','Elite Four');

INSERT INTO poke_found VALUES ('1','Professor Oak Lab');
INSERT INTO poke_found VALUES ('2','Evolved from Bulbasaur');
INSERT INTO poke_found VALUES ('3','Evolve from Ivysaur');
INSERT INTO poke_found VALUES ('4','Professor Oak Lab');
INSERT INTO poke_found VALUES ('5','Evolved from Charmander');
INSERT INTO poke_found VALUES ('6','Evolved from Charmeleon');
INSERT INTO poke_found VALUES ('7','Professor Oak Lab');
INSERT INTO poke_found VALUES ('8','Evolved from Squirtle');
INSERT INTO poke_found VALUES ('9','Evolved from Wartortle');
INSERT INTO poke_found VALUES ('10','Viridian Forest Route 2 Route 24 & 25');
INSERT INTO poke_found VALUES ('11','Viridian Forest Route 24 & 25');
INSERT INTO poke_found VALUES ('12','Evolved from Metapod');
INSERT INTO poke_found VALUES ('13','Viridian ForestRoute 2 Route 24 & 25');
INSERT INTO poke_found VALUES ('14','Viridian Forest Route 24 & 25');
INSERT INTO poke_found VALUES ('15','Evolved from Kakuna');
INSERT INTO poke_found VALUES ('16','Lots of places! About 14');
INSERT INTO poke_found VALUES ('17','Route 21 14 & 15');
INSERT INTO poke_found VALUES ('18','Evolved from Pidgeotto');
INSERT INTO poke_found VALUES ('19','Lots of places about 11');
INSERT INTO poke_found VALUES ('20','Route 16 17 18 and 21');
INSERT INTO poke_found VALUES ('21','Lots of places about 9');
INSERT INTO poke_found VALUES ('22','Route 17 18 and 23');
INSERT INTO poke_found VALUES ('23','Lots of places about 5');
INSERT INTO poke_found VALUES ('24','Route 23 and Unknown Dungeon');
INSERT INTO poke_found VALUES ('25','Viridian Forest and the Power Plant');
INSERT INTO poke_found VALUES ('26','Route 23 the Power Plant and Unknown Dungeon');
INSERT INTO poke_found VALUES ('27','Lots of places about 5');
INSERT INTO poke_found VALUES ('28','Route 23 and Unknown Dungeon');
INSERT INTO poke_found VALUES ('29','Route 22 and Safari Zone');
INSERT INTO poke_found VALUES ('30','Safari Zone Celedon City and Route 11');
INSERT INTO poke_found VALUES ('31','Evolved from Nidorina');
INSERT INTO poke_found VALUES ('32','Route 22 and Safari Zone');
INSERT INTO poke_found VALUES ('33','Safari Zone and Celedon City');
INSERT INTO poke_found VALUES ('34','evolved from Nidorino');
INSERT INTO poke_found VALUES ('35','Mt. Moon Celedon City and Unknown Dungeon');
INSERT INTO poke_found VALUES ('36','Evolved from Clefairy');
INSERT INTO poke_found VALUES ('37','Pokemon Mansion Route 7 and 8');
INSERT INTO poke_found VALUES ('38','Evolved from Vulpix');
INSERT INTO poke_found VALUES ('39','Route 3');
INSERT INTO poke_found VALUES ('40','the Unknown Dungeon');
INSERT INTO poke_found VALUES ('41','Mt. Moon Rock Tunnel Victory Road and Seafoam Island');
INSERT INTO poke_found VALUES ('42','Route 23 Victory Road and Seafoam Island');
INSERT INTO poke_found VALUES ('43','Lots of places about 9');
INSERT INTO poke_found VALUES ('44','Route 15 14 13 and 12');
INSERT INTO poke_found VALUES ('45','Evolved from Gloom');
INSERT INTO poke_found VALUES ('46','Mt. Moon and Safari Zone');
INSERT INTO poke_found VALUES ('47','Safari Zone and Unknown Dungeon');
INSERT INTO poke_found VALUES ('48','Route 15 14 13 12 and Safari Zone');
INSERT INTO poke_found VALUES ('49','Victory Road Safari Zone and Unknown Dungeon');
INSERT INTO poke_found VALUES ('50','Diglett Cave');
INSERT INTO poke_found VALUES ('51','Diglett Cave');
INSERT INTO poke_found VALUES ('52','Route 8 7 6 and 5');
INSERT INTO poke_found VALUES ('53','Evolved from Meowth');
INSERT INTO poke_found VALUES ('54','Lots of places about 6');
INSERT INTO poke_found VALUES ('55','Seafoam Island');
INSERT INTO poke_found VALUES ('56','Route 8 7 6 and 5');
INSERT INTO poke_found VALUES ('57','Evolved from Mankey');
INSERT INTO poke_found VALUES ('58','Route 7 8 and the Pokemon Mansion');
INSERT INTO poke_found VALUES ('59','Evolved from Growlithe');
INSERT INTO poke_found VALUES ('60','Fish for him');
INSERT INTO poke_found VALUES ('61','Fish for him');
INSERT INTO poke_found VALUES ('62','Evolved from Poliwhirl');
INSERT INTO poke_found VALUES ('63','Celedon Ex. corner Route 24 and 25');
INSERT INTO poke_found VALUES ('64','The Unknown Dungeon');
INSERT INTO poke_found VALUES ('65','Evolved from Kadabra');
INSERT INTO poke_found VALUES ('66','Victory Road and Rock Tunnel');
INSERT INTO poke_found VALUES ('67','Victory Road');
INSERT INTO poke_found VALUES ('68','Evolved from Machoke');
INSERT INTO poke_found VALUES ('69','Lots of places about 9');
INSERT INTO poke_found VALUES ('70','Route 12 13 14 and 15');
INSERT INTO poke_found VALUES ('71','Evolved from Weepinbell');
INSERT INTO poke_found VALUES ('72','fish for him');
INSERT INTO poke_found VALUES ('73','Evolved from Tentacool');
INSERT INTO poke_found VALUES ('74','Mt. Moon Rock Tunnel and Victory Road');
INSERT INTO poke_found VALUES ('75','Victory Road');
INSERT INTO poke_found VALUES ('76','Evolved from Graveler');
INSERT INTO poke_found VALUES ('77','Pokemon Mansion');
INSERT INTO poke_found VALUES ('78','Evolved from Ponyta');
INSERT INTO poke_found VALUES ('79','fish for him');
INSERT INTO poke_found VALUES ('80','fish for him');
INSERT INTO poke_found VALUES ('81','the Unknown Dungeon and the Power Plant');
INSERT INTO poke_found VALUES ('82','the Unknown Dungeon and the Power Plant');
INSERT INTO poke_found VALUES ('83','Vermilion City (trade Spearow)');
INSERT INTO poke_found VALUES ('84','Route 16 17 18 and Safari Zone');
INSERT INTO poke_found VALUES ('85','the Unknown Dungeon');
INSERT INTO poke_found VALUES ('86','Seafoam Island');
INSERT INTO poke_found VALUES ('87','Seafoam Island');
INSERT INTO poke_found VALUES ('88','Pokemon Mansion');
INSERT INTO poke_found VALUES ('89','the Unknown Dungeon');
INSERT INTO poke_found VALUES ('90','fish for him');
INSERT INTO poke_found VALUES ('91','Evolved from Shellder');
INSERT INTO poke_found VALUES ('92','Pokemon Tower');
INSERT INTO poke_found VALUES ('93','Pokemon Tower');
INSERT INTO poke_found VALUES ('94','Evolved from Haunter');
INSERT INTO poke_found VALUES ('95','Victory Road and Rock Tunnel');
INSERT INTO poke_found VALUES ('96','Route 11');
INSERT INTO poke_found VALUES ('97','the Unknown Dungeon');
INSERT INTO poke_found VALUES ('98','fish for him');
INSERT INTO poke_found VALUES ('99','Route 23 (fish) Seafoam Island and the Unknown Dungeon');
INSERT INTO poke_found VALUES ('100','Power Plant and Route 9');
INSERT INTO poke_found VALUES ('101','Unknown Dungeon Power Plant Cinibar Island and');
INSERT INTO poke_found VALUES ('102','Safari Zone');
INSERT INTO poke_found VALUES ('103','Evolved from Exeggcute');
INSERT INTO poke_found VALUES ('104','Pokemon Tower');
INSERT INTO poke_found VALUES ('105','Victroy Road and Unknown Dungeon');
INSERT INTO poke_found VALUES ('106','Saffron City (beat the fighting do-jo)');
INSERT INTO poke_found VALUES ('107','Saffron City (beat the fighting do-jo)');
INSERT INTO poke_found VALUES ('108','Route 18 (trade Slowbro in the building)');
INSERT INTO poke_found VALUES ('109','Pokemon Mansion');
INSERT INTO poke_found VALUES ('110','Pokemon Mansion');
INSERT INTO poke_found VALUES ('111','Safari Zone');
INSERT INTO poke_found VALUES ('112','Unknown Dungeon');
INSERT INTO poke_found VALUES ('113','Safari Zone and Unknown Dungeon');
INSERT INTO poke_found VALUES ('114','Route 21 and Cinnabar Island');
INSERT INTO poke_found VALUES ('115','Safari Zone');
INSERT INTO poke_found VALUES ('116','Fish for him');
INSERT INTO poke_found VALUES ('117','Fish for him');
INSERT INTO poke_found VALUES ('118','Fish for her');
INSERT INTO poke_found VALUES ('119','Fish for her');
INSERT INTO poke_found VALUES ('120','Fish for her/him');
INSERT INTO poke_found VALUES ('121','Evolved from Staryu');
INSERT INTO poke_found VALUES ('122','Viridian City on the right side where you use the CUT ability trade Abra');
INSERT INTO poke_found VALUES ('123','Celedon ex. Corner (Red) and Safari Zone');
INSERT INTO poke_found VALUES ('124','Cerulean City (trade Poliwhirl)');
INSERT INTO poke_found VALUES ('125','Power Plant');
INSERT INTO poke_found VALUES ('126','Pokemon Mansion');
INSERT INTO poke_found VALUES ('127','Celedon ex. Corner (Blue) and Safari Zone');
INSERT INTO poke_found VALUES ('128','Safari Zone');
INSERT INTO poke_found VALUES ('129','Fish for him');
INSERT INTO poke_found VALUES ('130','Evolved from Magikarp');
INSERT INTO poke_found VALUES ('131','Silph Co. (floor 7)');
INSERT INTO poke_found VALUES ('132','Lots of places about 5');
INSERT INTO poke_found VALUES ('133','Celedon City (go around back of Celedon Mansion)');
INSERT INTO poke_found VALUES ('134','Evolved from Eevee');
INSERT INTO poke_found VALUES ('135','Evolved from Eevee');
INSERT INTO poke_found VALUES ('136','Evolved from Eevee');
INSERT INTO poke_found VALUES ('137','Celedon ex. Corner');
INSERT INTO poke_found VALUES ('138','Take the Helix fossil to Cinnabar Island and go to the Pokemon Lab');
INSERT INTO poke_found VALUES ('139','Evolved from Omanyte');
INSERT INTO poke_found VALUES ('140','Take the Dome fossil to Cinnabar Island and go to the Pokemon Lab');
INSERT INTO poke_found VALUES ('141','Evolved from Kabuto');
INSERT INTO poke_found VALUES ('142','Take the Old Amber to Cinnabar Island and go to the Pokemon Lab');
INSERT INTO poke_found VALUES ('143','Route 12 and 16 (the sleeping Pokemon in the middle of the Routes)');
INSERT INTO poke_found VALUES ('144','Seafoam Island (one chance to get Pokemon)');
INSERT INTO poke_found VALUES ('145','Power Plant(one chance to get Pokemon)');
INSERT INTO poke_found VALUES ('146','Victory Road (one chance to get Pokemon)');
INSERT INTO poke_found VALUES ('147','Celedon ex. Corner and Safari Zone');
INSERT INTO poke_found VALUES ('148','Evolved from Dratini');
INSERT INTO poke_found VALUES ('149','Evolved from Dragonair');
INSERT INTO poke_found VALUES ('150','The Unknown Dungeon');
INSERT INTO poke_found VALUES ('151','Look in the Cheats section for Red/Blue.');


