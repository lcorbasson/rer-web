-- PRAGMA encoding="UTF-8";

DROP TABLE IF EXISTS metadata;
CREATE TABLE IF NOT EXISTS metadata (
	`key` VARCHAR(8) PRIMARY KEY,
	`value` TEXT 
);


DROP TABLE IF EXISTS gares;
CREATE TABLE IF NOT EXISTS gares (
	`code` VARCHAR(3) PRIMARY KEY,
	`name` VARCHAR(60) NOT NULL,
	`uic`  INTEGER,
	`is_transilien` INTEGER DEFAULT 1
);

DELETE FROM gares;

-- source codes UIC : 
-- http://aurelienb.pagesperso-orange.fr/HTML/transports/obli_UIC.htm

INSERT INTO gares (code, uic, name) VALUES
	('AB',  8727141, 'Aulnay sous Bois'),
	('ABL', 8754526, 'Ablon'),
	('ACW', 8738165, 'Achères-Ville'),
	('AEE', 8738113, 'Asnières sur Seine'),
	('AEH', 8738673, 'Aubergenville Elisabethville'),
	('AHM', 8738104, 'Avenue Henri Martin'),
	('ALC', 8727130, 'Aubervilliers La Courneuve'),
	('ANY', 8738149, 'Andrésy'),
	('APK', 8754320, 'Avenue du Président Kennedy'),
	('ARK', 8775867, 'Arcueil Cachan'),
	('ARP', 8754546, 'Arpajon'),
	('ARW', 8738184, 'Argenteuil'),
	('ATH', 8754525, 'Athis Mons'),
	('ATW', 8775875, 'Antony'),
	('AUU', 8775859, 'Auber'),
	('AUW', 8727654, 'Auvers-sur-Oise'),
	('AVF', 8738103, 'Avenue Foch'),
	('BAM', 8727147, 'Blanc Mesnil'),
	('BBN', 8727628, 'La Borne Blanche'),
	('BCO', 8738107, 'Bois Colombes'),
	('BDE', 8727144, 'Sevran Beaudottes'),
	('BDY', 8711340, 'Bondy' ),
	('BEC', 8738200, 'Bécon les Bruyères'),
	('BFM', 8732832, 'Bibliothèque François Mitterrand'),
	('BFX', 8768139, 'Le Bras de Fer'),
	('BGK', 8775868, 'Bagneux'),
	('BGV', 8738244, 'Bougival'),
	('BIH', 8754548, 'Breuillet Bruyères le Chatel'),
	('BIS', 8739354, 'Bièvres'),
	('BJN', 8768147, 'Boutigny'),
	('BJR', 8768220, 'Bois Le Roi'),
	('BKR', 8768251, 'Boissise-le-Roi'),
	('BLA', 8738115, 'Boissy-l''Aillerie'),
	('BLU', 8739311, 'Bellevue'),
	('BNY', 8768212, 'Brunoy'),
	('BOF', 8727648, 'Bouffemont Moisselles'),
	('BOM', 8768411, 'Bourron Marlotte Grez'),
	('BQA', 8775832, 'Bry sur Marne'),
	('BQC', 8775877, 'Les Baconnets'),
	('BQQ', 8775869, 'Bourg la Reine'),
	('BQV', 8768151, 'Buno-Gironville'),
	('BRK', 8727645, 'Bruyères-sur-Oise'),
	('BRN', 8727644, 'Boran-sur-Oise'),
	('BRW', 8754549, 'Breuillet Village'),
	('BSO', 8754517, 'Bouray'),
	('BSR', 8727664, 'Bessancourt'),
	('BSW', 8727655, 'Belloy - Saint-Martin'),
	('BUR', 8768143, 'Ballancourt'),
	('BVI', 8739332, 'Boulevard Victor - Pont du Garigliano'),
	('BVJ', 8775885, 'Bures sur Yvette'),
	('BWI', 8768440, 'Boigneville'),
	('BWR', 8754318, 'Boulainvilliers'),
	('BXG', 8775498, 'Bussy Saint-Georges'),
	('BXI', 8768213, 'Boussy Saint-Antoine'),
	('BXN', 8768419, 'Bagneaux sur Loing'),
	('BXP', 8711377, 'Les Boullereaux Champigny'),
	('BXR', null,    'Boissy-Saint-Léger'),
	('BY' , 8754519, 'Brétigny'),
	('BYS', 8739336, 'Beynes'),
	('CAZ', 8739363, 'Chilly Mazarin'),
	('CBK', 8738108, 'Colombes'),
	('CBV', 8768214, 'Combs la Ville Quincy'),
	('CEG', 8727603, 'Champ de Courses d''Enghien'),
	('CEJ', 8727606, 'Cernay'),
	('CES', 8768216, 'Cesson'),
	('CEV', 8738122, 'Chaumont-en-Vexin'),
	('CEX', 8768163, 'Le Coudray-Monceaux'),
	('CFD', 8738145, 'Conflans-Fin-d''Oise'),
	('CGG', 8711352, 'Chenay Gagny' ),
	('CGJ', null,    'Champigny'),
	('CGP', 8775800, 'Charles de Gaulle-Étoile'),
	('CGW', 8739327, 'Coignières'),
	('CH',  8739400, 'Chartres'),
	('CHK', 8754515, 'Chamarande'),
	('CHQ', 8754631, 'Chemin d''Antony'),
	('CHR', 8738119, 'Chars'),
	('CHV', 8739317, 'Chaville Vélizy'),
	('CJN', 8711650, 'Changis Saint-Jean'),
	('CJR', 8768241, 'Chartrettes'),
	('CJV', 8738265, 'Cergy le Haut'),
	('CL' , 8727600, 'Creil'),
	('CLC', 8711677, 'Crécy-la-Chapelle'),
	('CLL', 8738112, 'Clichy Levallois'),
	('CLR', 8754528, 'Choisy le Roi'),
	('CLX', 8775860, 'Châtelet les Halles'),
	('CLY', 8727611, 'Chantilly Gouvieux'),
	('CMA', 8739156, 'Clamart'),
	('CME', 8768245, 'Champagne sur Seine'),
	('CO',  8711630, 'Coulommiers'),
	('COE', 8768100, 'Corbeil Essonnes'),
	('COJ', 8727204, 'Compans'),
	('CPA', 8738186, 'Cormeilles en Parisis'),
	('CPK', 8711587, 'Champbenoist - Poigny'),
	('CPM', 8739305, 'Champ de Mars Tour Eiffel'),
	('CPO', 8727651, 'Champagne sur Oise'),
	('CPW', 8727616, 'Chaponval'),
	('CQQ', 8711664, 'Crouy-sur-Ourcq'),
	('CSG', 8711611, 'Chelles Gournay'),
	('CSH', 8738189, 'Conflans Sainte Honorine'),
	('CTH', 8711658, 'Château Thierry'),
	('CUF', 8775864, 'Cité Universitaire'),
	('CVF', 8738147, 'Chanteloup les Vignes'),
	('CVI', 8739320, 'Chaville Rive Gauche'),
	('CVW', 8775888, 'Courcelles sur Yvette'),
	('CWJ', 8739320, 'Chaville Rive Droite'),
--	('CXA', 8775860, 'Châtelet les Halles RER A'),
	('CYC', 8738249, 'Cergy Saint-Christophe'),
	('CYP', 8738190, 'Cergy Préfecture'),
	('CYQ', 8711673, 'Couilly Saint-Germain Quincy'),
	('CYV', 8727159, 'Crépy-en-Valois'),
	('CYZ', 8711657, 'Chézy sur Marne'),
	('D',   8754552, 'Dourdan'),
	('DA',  8754017, 'Dourdan la Forêt'),
	('DAM', 8727153, 'Dammartin Juilly-Saint-Mard'),
	('DDI', 8768423, 'Dordives'),
	('DEU', 8727634, 'Deuil Montmagny'),
	('DFR', 8775863, 'Denfert Rochereau'),
	('DMO', 8727643, 'Domont'),
	('DRN', 8727140, 'Drancy'),
	('DX',  8739348, 'Dreux'),
	('ECZ', 8727639, 'Écouen Ézanville'),
	('ELW', 8738247, 'L''Étang-la-Ville'),
	('ELY', 8754547, 'Égly'),
	('EM',  8711604, 'Emerainville Pontault Combault'),
	('EN',  8727602, 'Enghien les Bains'),
	('EPL', 8727614, 'Épluches'),
	('EPN', 8739411, 'Épernon'),
	('EPO', 8738676, 'Épone Mézières'),
	('EPV', 8727112, 'Épinay Villetaneuse'),
	('ERA', 8738141, 'Éragny Neuville'),
	('ERM', 8727658, 'Ermont Halte'),
	('ERT', 8727605, 'Ermont Eaubonne'),
	('ESO', 8768160, 'Essonnes-Robinson'),
	('ETP', 8754513, 'Étampes'),
	('ETY', 8754514, 'Étrechy'),
	('EVC', 8768138, 'Évry Courcouronnes'),
	('EVR', 8768136, 'Évry'),
	('EY',  8711632, 'Esbly'),
	('EYO', 8754522, 'Épinay sur Orge'),
	('EYS', 8727114, 'Épinay sur Seine'),
	('FAF', 8739340, 'Fontenay le Fleury'),
	('FFY', 8768424, 'Ferrières Fontenay'),
	('FMN', 8775876, 'Fontaine Michalon'),
	('FMP', 8711627, 'Faremoutiers Pommeuse'),
	('FMY', 8738187, 'La Frette Montigny'),
	('FNR', 8775871, 'Fontenay aux Roses'),
	('FON', 8768221, 'Fontainebleau Avon'),
	('FPB', 8727607, 'Franconville Le Plessis Bouchard'),
	('FPN', 8727665, 'Frépillon'),
	('FPO', 8768242, 'Fontaine le Port'),
	('FSB', null,    'Fontenay-sous-Bois'),
	('GAJ', 8727619, 'Garges Sarcelles'),
	('GAQ', 8739343, 'Garancières la Queue'),
--	('GAW', 8775801, 'La Défense RER A'),
	('GBG', 8768135, 'Grand Bourg'),
	('GBI', 8739364, 'Gravigny Balizy'),
	('GCM', 8711626, 'Guérard la Celle sur Morin'),
	('GCR', 8738605, 'Achères Grand Cormier'),
	('GDS', 8727102, 'Paris Nord'),
	('GEN', 8727120, 'Gennevilliers'),
	('GGG', 8768137, 'Grigny Centre'),
	('GGV', 8738156, 'Gargenville'),
	('GIF', 8775887, 'Gif sur Yvette'),
	('GIS', 8738124, 'Gisors'),
	('GMC', 8738225, 'Garches Marnes-la-Coquette'),
	('GN',  8711351, 'Gagny' ),
	('GNX', 8727659, 'Gros Noyer Saint-Prix'),
	('GOU', 8727624, 'Goussainville'),
	('GPA', 8768247, 'La Grande Paroisse'),
	('GRL', 8727636, 'Groslay'),
	('GTL', 8775865, 'Gentilly'),
	('GUW', 8775883, 'Le Guichet'),
	('GYN', 8775858, 'Gare de Lyon RER A'),
	('GZ',  8711601, 'Gretz Armainvilliers' ),
	('GZA', 8739334, 'Gazeran'),
	('HAQ', 8775886, 'La Hacquinière'),
	('HAR', 8738640, 'Houilles Carrières sur Seine'),
	('HER', 8768243, 'Héricy'),
	('HOA', 8739346, 'Houdan'),
	('HRY', 8738188, 'Herblay'),
	('HSL', 8728189, 'Haussman Saint-Lazare' ),
	('IAC', 8711661, 'Isles-Armentières-Congis'),
	('IAP', 8727652, 'L''Isle Adam Parmain'),
	('IBM', 8768162, 'Le Plessis-Chenet'),
	('IGY', 8739356, 'Igny'),
	('INV', 8739303, 'Invalides'),
	('IPO', 8738157, 'Issou Porcheville'),
	('ISP', 8739330, 'Issy Val de Seine'),
	('ISY', 8739307, 'Issy'),
	('IV',  8754530, 'Ivry sur Seine'),
	('JAS', 8739351, 'Jouy en Josas'),
	('JOY', 8739415, 'Jouy'),
	('JUZ', 8738155, 'Juziers'),
	('JVL', 8739306, 'Javel'),
	('JVR', null,    'Joinville-le-Pont'),
	('JY' , 8754524, 'Juvisy'),
	('KOU', 8738220, 'Courbevoie'),
	('KRW', 8768210, 'Montgeron Crosne'),
	('KVE', 8738666, 'Les Clairières de Verneuil'),
	('LAD', 8749210, 'Les Ardoines'),
	('LBJ', 8727117, 'La Barre Ormesson'),
	('LBT', 8727139, 'Le Bourget'),
	('LCB', 8738243, 'La Celle-Saint-Cloud'),
--	('LDU', 8738221, 'La Défense SNCF'),
	('LDU', 8738221, 'La Défense'),
	('LEG', 8727214, 'Les Grésillons'),
	('LFA', 8768145, 'La Ferté Alais'),
	('LFC', 8738245, 'Louveciennes'),
	('LFJ', 8711651, 'La Ferté sous Jouarre'),
	('LFM', 8711667, 'La Ferté Milon'),
	('LGK', 8738600, 'La Garenne Colombes'),
	('LGY', 8711631, 'Lagny Thorigny'),
	('LIE', 8733798, 'Saint-Ouen l''Aumône Liesse'),
	('LIM', 8738158, 'Limay'),
	('LIU', 8768215, 'Lieusaint Moissy'),
	('LJA', 8775866, 'Laplace'),
	('LJU', 8739361, 'Longjumeau'),
	('LMU', 8738668, 'Les Mureaux'),
	('LNX', 8727623, 'Les Noues'),
	('LON', 8711613, 'Longueville'), 
	('LOV', 8727625, 'Louvres'),
	('LPE', 8739329, 'Le Perray'),
	('LPN', 8716479, 'La Plaine Stade de France'),
	('LQK', 8738121, 'Liancourt-Saint-Pierre'),
	('LQN', 8775836, 'Lognes'),
	('LSD', 8738109, 'Le Stade'),
	('LSI', 8739328, 'Les Essarts le Roi'),
	('LSW', 8754622, 'Les Saules'),
	('LUZ', 8727657, 'Luzarches'),
	('LVZ', null,    'La Varenne Chennevières'),
	('LWA', 8738630, 'Les Vallées'),
	('LXJ', 8775861, 'Luxembourg'),
	('LYO', 8754516, 'Lardy'),
	('LYQ', 8768240, 'Livry sur Seine'),
	('LYV', 8711380, 'Les Yvris Noisy Le Grand' ),
	('LZO', 8711663, 'Lizy-sur-Ourcq'),
	('LZV', 8775882, 'Lozère'),
	('MAE', 8738172, 'Maule'),
	('MGT', 8728187, 'Magenta'), -- c'était MAG avant, wtf
	('MAL', 8768441, 'Malesherbes'),
	('MAQ', 8711666, 'Mareuil-sur-Ourcq'),
	('MBP', 8727608, 'Montigny Beauchamp'),
	('MBR', 8739347, 'Marchezais Broué'),
	('MDN', 8739310, 'Meudon'),
	('MDS', 8754730, 'Musée d''Orsay'),
	('MEA', 8711610, 'Meaux'),
	('MEL', 8768200, 'Melun'),
	('MFA', 8768115, 'Maisons Alfort Alfortville'),
	('MFL', 8738287, 'Montreuil'),
	('MFY', 8739308, 'Meudon Val Fleury'),
	('MHD', 8738183, 'Meulan Hardricourt'),
	('MJM', 8738171, 'Mareil sur Mauldre'),
	('MJW', 8768140, 'Moulin-Galant'),
	('MKN', 8768410, 'Montigny sur Loing'),
	('MKU', 8738116, 'Montgeroult - Courcelles'),
	('MLB', 8711622, 'Marles en Brie'),
	('MLF', 8738642, 'Maisons Laffitte'),
	('MLM', 8739389, 'Montfort l''Amaury Méré'),
	('MLR', 8738246, 'Marly-le-Roi'),
	('MLV', 8727667, 'Meriel'),
	('MNY', 8768141, 'Mennecy'),
	('MOF', 8711624, 'Mortcerf'),
	('MOR', 8768227, 'Morêt Veneux les Sablons'),
	('MP' , 8775879, 'Massy Palaiseau RER B'),
	('MPU', 8739357, 'Massy Palaiseau RER C'),
	('MRK', 8738148, 'Maurecourt'),
	('MRT', 8711608, 'Mormant'),
	('MS' , 8768400, 'Montargis'),
	('MSN', 8768148, 'Maisse'),
	('MSO', 8727649, 'Montsoult Maffliers'),
	('MSX', 8754518, 'Marolles en Hurepoix'),
	('MTE', 8738150, 'Mantes la Jolie'),
	('MTN', 8739413, 'Maintenon'),
	('MTQ', 8738159, 'Mantes Station'),
	('MTU', 8768230, 'Montereau'),
	('MVC', 8711184, 'Marne la Vallée Chessy'), -- ou 8775499 ?
	('MVH', 8738237, 'Suresnes Mont Valérien'),
	('MVP', 8775878, 'Massy Verrières RER B'),
	('MVW', 8738328, 'Massy Verrières RER C'),
	('MWO', 8727666, 'Méry sur Oise'), 
	('MXK', 8711628, 'Mouroux'),
	('MY',  8727152, 'Mitry Claye'),
	('MYD', 8711640, 'Montry Condé'),
	('NAA', 8711656, 'Nogent l''Artaud Charly'),
	('NAF', 8775802, 'Nanterre Préfecture SNCF'),
	('NAN', 8711609, 'Nangis'),
	('NAU', 8711655, 'Nanteuil Saacy'),
	('NC1', null,    'Saint-Germain-en-Laye'),
	('NC2', null,    'Le Vésinet Le Pecq'),
	('NC3', null,    'Nanterre Ville'),
	('NC4', null,    'Le Vésinet-Centre'),
	('NC5', null,    'Chatou-Croissy'),
	('NC6', null,    'Rueil-Malmaison'),
	('NG',  8754545, 'La Norville Saint-Germain lès Arpajon'),
	('NGM', null,    'Nogent-sur-Marne'),
	('NH',  8727157, 'Nanteuil-le-Haudoin'),
	('NLP', 8711374, 'Nogent Le Perreux' ),
	('NO',  8727675, 'Nointel - Mours'),
	('NPT', 8738102, 'Neuilly Porte Maillot'),
	('NSL', 8775835, 'Noisiel'),
	('NSP', 8768412, 'Nemours Saint-Pierre'),
	('NSY', 8711321, 'Noisy Le Sec' ),
	('NTN', 8775810, 'Nation'),
	('NUE', 8733448, 'Neuville Université'),
	('NUN', 8738631, 'Nanterre Université'),
	('NYC', 8775834, 'Noisy Champs'),
	('NYG', 8775833, 'Noisy le Grand Mont d''Est'),
	('NYP', 8775831, 'Neuilly Plaisance'),
	('NZL', 8738173, 'Nezel Aulnay'),
	('OBP', 8768134, 'Orangis Bois de l''Épine'),
	('OGB', 8739344, 'Orgerus Behoust'),
	('ORM', 8727158, 'Ormoy-Villers'),
	('ORS', 8775884, 'Orsay Ville'),
	('ORY', 8727627, 'Orry la Ville Coye'),
	('OSN', 8738114, 'Osny'),
	('OY',  8754620, 'Orly Ville'),
	('OZF', 8711602, 'Ozoir la Ferrière' ),
	('PLY', 8768600, 'Paris Gare de Lyon'), 
	('PAA', 8768603, 'Paris Gare de Lyon'), -- et pas 8768600
	('PAN', 8711320, 'Pantin' ),
	('PAW', 8775881, 'Palaiseau Villebon'),
	('PAX', 8775880, 'Palaiseau'),
	('PCX', 8775873, 'Parc de Sceaux'),
	('PDM', 8739304, 'Pont de l''Alma'),
	('PE',  8711300, 'Paris Est'),
	('PEB', 8727646, 'Persan Beaumont'),
	('PEX', 8727148, 'Parc des Expositions'),
	('PG',  8739342, 'Plaisir Grignon'),
	('PIE', 8739362, 'Plaisir les Clayes'),
	('PJ',  8739350, 'Petit Jouy les Loges'),
	('PKY', 8711127, 'Porte de Clichy'),
	('PLB', 8727155, 'Plessis-Belleville'),
	('PMP', 8739100, 'Paris Montparnasse'),
	('POA', 8739316, 'Porchefontaine'),
	('POP', 8768252, 'Ponthierry-Pringy'),
	('PPD', 8760880, 'Créteil Pompadour'), -- je connais pas le code tr3 officiel, quelqu'un l'a ?
	('PPT', 8727615, 'Pont-Petit'),
	('PRF', 8727116, 'Pierrefitte Stains'),
	('PRO', 8711616, 'Provins'),
	('PRQ', 8727650, 'Presles - Courcelles'),
	('PRR', 8738101, 'Pereire Levallois'),
	('PRU', 8754619, 'Pont de Rungis Aéroport d''Orly'),
	('PRY', 8727609, 'Pierrelaye'),
	('PSE', 8727613, 'Pontoise'),
	('PSL', 8738400, 'Paris Saint-Lazare'),
	('PSY', 8738657, 'Poissy'),
	('PTC', 8738111, 'Pont Cardinet'),
	('PTX', 8738238, 'Puteaux'),
	('PV',  8739365, 'Petit Vaux'),
	('PWR', 8775862, 'Port Royal'),
	('PXO', null,    'Le Parc de Saint-Maur'),
	('PYO', 8727641, 'Précy-sur-Oise'),
	('PZB', 8754702, 'Paris Austerlitz'), -- pas 8754700
	('RBI', 8711369, 'Rosny Bois Perrier' ),
	('RBT', 8739331, 'Rambouillet'),
	('RF',  8754629, 'Rungis la Fraternelle'),
	('RIS', 8768133, 'Ris Orangis'),
	('RNS', 8775872, 'Robinson'),
	('ROB', 8711603, 'Roissy en Brie' ),
	('RSB', 8711370, 'Rosny sous Bois' ),
	('RSY', 8727146, 'Aéroport Charles de Gaulle 1'),
	('RVM', 8711347, 'Le Raincy Villemomble' ),
	('RYR', 8700147, 'Aéroport Charles de Gaulle 2 TGV'),
	('SAO', 8754523, 'Savigny sur Orge'),
	('SCD', 8738235, 'Saint-Cloud'),
	('SCR', 8739322, 'Saint-Cyr'),
	('SCW', 8754550, 'Saint-Chéron'),
	('SDE', 8727101, 'Saint-Denis'),
	('SEV', 8727142, 'Sevran Livry'),
	('SF' , 8768229, 'Saint-Mammes'),
	('SFD', 8716478, 'Stade de France Saint-Denis'),
	('SGT', 8727617, 'Saint-Gratien'),
	('SHL', 8754731, 'Saint-Michel Notre Dame RER C'), 
	('SHO', 8754520, 'Saint-Michel sur Orge'),
	('SKX', 8775870, 'Sceaux'),
	('SLF', 8727660, 'Saint-Leu la Forêt'),
	('SLL', 8727638, 'Sarcelles Saint-Brice'),
	('SLT', 8727640, 'Saint-Leu d''Esserent'),
	('SME', 8754535, 'Saint-Martin d''Étampes'),
	('SNB', 8738248, 'Saint-Nom-la-Bretèche - Forêt de Marly'),
	('SNM', 8775889, 'Saint-Rémy lès Chevreuse'),
	('SNN', 8727618, 'Sannois'),
	('SOA', 8727610, 'Saint-Ouen l''Aumône'),
	('SOS', 8727124, 'Saint-Ouen'),
	('SPI', 8739414, 'Saint-Piat'),
	('SPP', 8768421, 'Souppes Château Landon'),
	('SQY', 8739384, 'Saint-Quentin en Yvelines'),
	('SUR', 8727626, 'Survilliers Fosses'),
	('SVL', 8738641, 'Sartrouville'),
	('SVR', 8739312, 'Sèvres Rive Gauche'),
	('SWY', 8727203, 'Seugy'),
	('SXE', 8754551, 'Sermaise'),
	('SXG', 8754521, 'Sainte Geneviève des Bois'),
	('TAE', 8739345, 'Tacoignières Richebourg'),
	('TLP', 8711649, 'Trilport'),
	('TMR', 8768225, 'Thomery'),
	('TNT', 8727205, 'Thieux - Nantouillet'),
	('TOC', 8775837, 'Torcy'),
	('TOU', 8711621, 'Tournan'),
	('TPA', 8738182, 'Thun le Paradis'),
	('TRH', 8738123, 'Trie-Château'),
	('TSS', 8738180, 'Triel sur Seine'),
	('TVO', 8739383, 'Trappes'),
	('TVY', 8727663, 'Taverny'),
	('US',  8738117, 'Us'),
	('VAI', 8711629, 'Vaires Torcy'),
	('VBB', 8711674, 'Villiers-Montbarbin'),
	('VBO', 8739353, 'Vauboyen'),
	('VBV', 8768161, 'Villabé'),
	('VC',  8739300, 'Versailles Chantiers'),
	('VCN', 8738226, 'Vaucresson'),
	('VCX', 8727662, 'Vaucelles'),
	('VD' , 8768124, 'Le Vert de Maisons'),
	('VDA', 8738179, 'Val d''Argenteuil'),
	('VDE', 8773006, 'Val d''Europe'),
	('VDF', 8711371, 'Val de Fontenay RER E'),
	('VDO', 8738236, 'Le Val d''Or'),
	('VDV', 8738234, 'Sèvres Ville d''Avray'),
	('VEH', 8739388, 'Villiers Neauphle Pontchartrain'),
	('VEP', 8739341, 'Villepreux les Clayes'),
	('VET', 8738665, 'Vernouillet Verneuil'),
	('VFD', 8738288, 'Viroflay Rive Droite'),
	('VFG', 8739321, 'Viroflay Rive Gauche'),
	('VFR', 8775830, 'Val de Fontenay RER A'),
	('VGL', 8727143, 'Vert Galant'),
	('VGS', 8768130, 'Vigneux sur Seine'),
	('VIB', 8727622, 'Villiers le Bel Gonesse Arnouville'),
	('VII', 8727151, 'Villeparisis Mitry Le Neuf'),
	('VMD', 8727653, 'Valmondois'),
	('VMK', 8739153, 'Vanves Malakoff'),
	('VMS', 8727656, 'Viarmes'),
	('VNC', 8775811, 'Vincennes'),
	('VNL', 8711607, 'Verneuil l''Étang'),
	('VOM', 8768250, 'Vosves'),
	('VP' , 8768185, 'Villeneuve Prairie'),
	('VPN', 8727145, 'Villepinte'),
	('VRD', 8738286, 'Versailles Rive Droite'),
	('VRG', 8739315, 'Versailles Rive Gauche Château'),
	('VRI', 8754527, 'Villeneuve le Roi'),
	('VSG', 8768182, 'Villeneuve Saint-Georges'),
	('VSM', 8711379, 'Villiers sur Marne Plessis Trévise'),
	('VSS', 8768246, 'Vernou sur Seine'),
	('VSW', 8738664, 'Villennes sur Seine'),
	('VTV', 8768180, 'Villeneuve Triage'),
	('VUN', 8768244, 'Vulaines sur Seine Samoreau'),
	('VW',  8727202, 'Villaines'),
	('VWC', 8768131, 'Viry Châtillon'),
	('VWT', 8738120,    'La Villetertre'),
	('VXS', 8738181, 'Vaux sur Seine'),
	('VY',  8754529, 'Vitry sur Seine'),
	('VYL', 8739325, 'La Verrière'),
	('WEE', 8768217, 'Le Mée'),
	('XBY', 8775874, 'La Croix de Berny'),
	('XCS', 8711617, 'Saint-Colombe - Septveilles'),
	('XFA', 8768254, 'Saint-Fargeau'),
	('XMC', null,    'Saint-Maur-Créteil'),
	('XND', 8778543, 'Saint-Michel Notre Dame RER B'),
	('XOA', 8738142, 'Saint-Ouen l''Aumône Quartier de l''Église'),
	('XPY', 8738118, 'Santeuil - Le Perchay'),
	('YES', 8768211, 'Yerres'),
	('ZTN', 8768218, 'Savigny le Temple Nandy'),
	('ZUB', null,    'Sucy Bonneuil');

INSERT INTO gares (code, name, is_transilien) VALUES
	('AGR', 'Aingeray', 0),
	('AGV', 'Angerville', 0),
	('API', 'Anizy-Pinon', 0),
	('AR',  'Argentan', 0),
	('AS',  'Amiens', 0),
	('ASN', 'Ailly-sur-Noye', 0),
	('ATY', 'Artenay', 0),
	('AUN', 'Auneau', 0),
	('AVY', 'Avrechy', 0),
	('BAX', 'Boisseaux', 0),
	('BAY', 'Bayeux', 0),
	('BBI', 'Bornel-Belle-Église', 0),
	('BEB', 'Breteuil-Embranchement', 0),
	('BLG', 'Brive la Gaillarde', 0),
	('BLR', 'Beaumont-le-Roger', 0),
	('BNR', 'Bonnières', 0),
	('BO',  'Bonneval', 0),
	('BUE', 'Bueil', 0),
	('BVA', 'Bréval', 0),
	('BVS', 'Beauvais', 0),
	('BVU', 'La Bonneville-sur-Iton', 0),
	('BZN', 'Briouze', 0),
	('CAR', 'Carentan', 0),
	('CBU', 'Cherbourg', 0),
	('CCH', 'Conches', 0),
	('CCT', 'Cercottes', 0),
	('CDO', 'Clermont-de-l''Oise', 0),
	('CFO', 'Conflans-Fin-d''Oise', 0), -- redondant avec CFD
	('CGK', 'Château-Gaillard', 0),
	('CN',  'Caen', 0),
	('CNY', 'Chauny', 0),
	('COB', 'Connerré - Beillé', 0),
	('COU', 'Avignon TGV', 0),
	('CPE', 'Compiègne', 0),
	('CSY', 'Champigny sur Yonne', 0),
	('CUN', 'Châteaudun', 0),
	('CVB', 'Courville sur Eure', 0),
	('CVE', 'Chevrières', 0),
	('CVK', 'Chambly', 0),
	('CVY', 'Chevilly', 0),
	('DEJ', 'Laboissière-le-Déluge', 0),
	('ESC', 'Esches', 0),
	('ERE', 'Ermont Eaubonne', 0),      -- redondant avec ERT
	('EVX', 'Évreux-Normandie', 0),
	('FL',  'Flers', 0),
	('GAA', 'Gaillon Aubevoye', 0),
	('GAI', 'Gaillac', 0),
	('GRV', 'Granville', 0),
	('GU',  'Guillerval', 0),
	('JAX', 'Jaux', 0),
	('JOI', 'Joigny', 0),
	('LAB', 'Les Aubrais-Orléans', 0),
	('LAE', 'L''Aigle', 0),
	('LAI', 'Laigneville', 0),
	('LAO', 'Laon', 0),
	('LAR', 'Laroche Mignennes', 0),
	('LEW', 'Lille Europe', 0),
	('LFB', 'La Ferté Bernard', 0),
	('LIA', 'Liancourt-Rantigny', 0),
	('LJP', 'Longpont', 0),
	('LLP', 'La Loupe', 0),
	('LLT', 'Le-Merlerault', 0),
	('LM',  'Le Mans', 0),
	('LSN', 'Lison', 0),
	('LUA', 'Longueau', 0),
	('LUE', 'Longueuil-Sainte-Marie', 0),
	('LXS', 'Le Meux La Croix-Saint-Ouen', 0),
	('LYD', 'Lyon Part-Dieu', 0),
	('MRU', 'Méru', 0),
	('MSC', 'Marseille Saint-Charles', 0),
	('MW',  'Monnerville', 0),
	('NCO', 'Nonancourt', 0),
	('NGR', 'Nogent le Rotrou', 0),
	('NOY', 'Noyon', 0),
	('OI',  'Oissel', 0),
	('ORL', 'Orléans', 0),
	('PAZ', 'Paris Austerlitz', 0),
	('PNB', 'Paris Nord', 0), -- banlieue, redondant (UIC 8727103)
	('PNO', 'Paris Nord', 0), -- grandes lignes, redondant 
	('PUY', 'Pont-sur-Yonne', 0),
	('PVA', 'Paris Vaugirard', 0), -- redondant avec PMP
	('PXE', 'Pont Sainte-Maxence', 0),
	('RIA', 'Rieux Angicourt', 0),
	('RN',  'Rouen Rive Droite', 0),
	('RSS', 'Rosny sur Seine', 0),
	('RYP', 'Romilly-la-Puthenaye', 0),
	('SDN', 'Surdon', 0),
	('SES', 'Sens', 0),
	('SGG', 'Sainte-Gauburge', 0),
	('SJS', 'Saint-Just-en-Chaussée', 0),
	('SJX', 'Saint-Julien-du-Sault', 0),
	('SOI', 'Soissons', 0),
	('SQ',  'Saint-Quentin', 0),
	('SUP', 'Saint-Sulpice-Auteuil', 0),
	('SY',  'Serquigny', 0),
	('TGR', 'Tergnier', 0),
	('TY',  'Toury', 0),
	('VAL', 'Valognes', 0),
	('VCT', 'Villers-Cotterets', 0),
	('VDR', 'Val-de-Reuil', 0),
	('VDS', 'Villedieu-les-Poêles', 0),
	('VEA', 'Verneuil sur Avre', 0),
	('VIR', 'Vire', 0),
	('VN',  'Vernon', 0),
	('VO',  'Voves', 0),
	('VPL', 'Villers-Saint-Paul', 0),
	('VSX', 'Villeneuve Point X', 0),
	('VTP', 'La Villette - Saint-Prest', 0),
	('VVG', 'Villeneuve la Guyard', 0),
	('VXN', 'Valence TGV', 0),
	('VYE', 'Villeneuve sur Yonne', 0);

CREATE INDEX index_uic ON gares (uic);


-- Une procédure stockée pour faire un CURDATE() translaté d'un jour en 
-- si besoin (lorsqu'on touche à des heures postérieures à "minuit du
-- jour suivant", i.e. 24:00:00).

DROP FUNCTION IF EXISTS DATE_GTFS; 
CREATE FUNCTION DATE_GTFS(d DATE, t TIME)
RETURNS DATE DETERMINISTIC
RETURN IF(t >= '24:00:00', SUBDATE(d, INTERVAL 1 DAY), d);



DROP PROCEDURE IF EXISTS train_times_for_date;
DROP PROCEDURE IF EXISTS train_station_list;

DELIMITER //
CREATE PROCEDURE `train_times_for_date`(_d DATE, _station_code TEXT, _train_number CHAR(6))
BEGIN
SELECT r.route_short_name,
	SUBSTR(trip_id, 6, 6) AS train_number,
	ADDTIME(CAST(DATE_GTFS(_d, departure_time) AS DATETIME), departure_time) AS due_time,
	gares.code,
	CAST(COALESCE(gares.uic, SUBSTR(stop_id, 14)) AS CHAR) AS uic,
	gares.name,
	stop_times.stop_sequence
FROM trips AS t
	LEFT JOIN calendar AS c USING (service_id)
	LEFT JOIN calendar_dates AS cd USING (service_id)
	LEFT JOIN routes AS r USING (route_id)
	JOIN stop_times USING (trip_id)
	LEFT JOIN gares ON (SUBSTR(stop_id, 14) = gares.uic)
WHERE (
	(start_date <= DATE_GTFS(_d, departure_time)
		AND DATE_GTFS(_d, departure_time) <= end_date
		AND (date <> DATE_GTFS(_d, departure_time) OR date IS NULL OR exception_type <> 2)
        )
        OR (
		date = DATE_GTFS(_d, departure_time) AND exception_type = 1)
        )
	AND (trip_id LIKE CONCAT('DUASN', _train_number, '%'))
	AND (code = _station_code);
END //


CREATE PROCEDURE `train_station_list`(_d DATE, _train_number CHAR(6), _index INTEGER)
BEGIN
SELECT gares.code,
	CAST(COALESCE(gares.uic, SUBSTR(stop_id, 14)) AS CHAR) AS uic,
	gares.name
FROM trips AS t
	LEFT JOIN calendar AS c USING (service_id)
	LEFT JOIN calendar_dates AS cd USING (service_id)
	LEFT JOIN routes AS r USING (route_id)
	JOIN stop_times USING (trip_id)
	LEFT JOIN gares ON (SUBSTR(stop_id, 14) = gares.uic)
WHERE (
	(start_date <= DATE_GTFS(_d, departure_time)
		AND DATE_GTFS(_d, departure_time) <= end_date
		AND (date <> DATE_GTFS(_d, departure_time) OR date IS NULL OR exception_type <> 2)
        )
        OR (
		date = DATE_GTFS(_d, departure_time) AND exception_type = 1)
        )
	AND (trip_id LIKE CONCAT('DUASN', _train_number, '%'))
	AND (stop_sequence > _index);
END //

DELIMITER ;

-- Quelques vues pour me faciliter la vie

-- CREATE OR REPLACE VIEW train_dates AS 
-- 	SELECT trip_id, 
-- 		SUBSTR(trip_id, 6, 6) AS train_number, 
-- 		t.route_id,
-- 		t.service_id, 
-- 		(c.sunday + (c.monday << 1) 
-- 			+ (c.tuesday << 2) 
-- 			+ (c.wednesday << 3) 
-- 			+ (c.thursday << 4) 
-- 			+ (c.friday << 5) 
-- 			+ (c.saturday << 6)) AS day_mask, 
-- 		c.start_date, 
-- 		c.end_date, 
-- 		cd.date, 
-- 		cd.exception_type,
-- 		r.route_short_name
-- 	FROM trips AS t 
-- 		LEFT JOIN calendar AS c USING (service_id) 
-- 		LEFT JOIN calendar_dates AS cd USING (service_id) 
-- 		LEFT JOIN routes AS r USING (route_id);
-- 
-- CREATE OR REPLACE VIEW train_times_temp1 AS 
-- 	SELECT td.trip_id, 
-- 		td.train_number, 
-- 		td.route_id,
-- 		stop_times.departure_time, 
-- 		stop_times.stop_sequence, 
-- 		gares.code, 
-- 		gares.uic, 
-- 		gares.name, 
-- 		start_date, 
-- 		end_date, 
-- 		date, 
-- 		exception_type,
-- 		route_short_name
-- 	FROM train_dates AS td   
-- 		NATURAL JOIN stop_times   
-- 		JOIN gares ON (SUBSTR(stop_id, 14) = gares.uic);
-- 
