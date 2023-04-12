-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 02 2022 г., 21:21
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `site`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mess` varchar(500) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `name`, `mess`, `post_id`) VALUES
(1, 'Максим', 'avadcsdvsdcdsvscdssdc', 15),
(75, 'Максим', '888888', 16),
(79, 'Admin', 'asdasdsadsadsadsaddas', 16),
(80, 'Admin', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', 15),
(81, 'Admin', '55555555555', 16),
(82, 'Admin', '3333333333', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(190) CHARACTER SET utf8 NOT NULL,
  `content` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `id_topic` int(12) DEFAULT NULL,
  `img` varchar(250) CHARACTER SET utf8 NOT NULL,
  `mirror` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `id_topic`, `img`, `mirror`) VALUES
(19, 'КНИГА «ВАРКРАФТ ХРОНИКИ. ТОМ 3»', 'После первых двух войн между Ордой и Альянсом мир на небольшое время воцарился в Азероте. Но близилась Третья война, события которой хорошо раскрыты в серии игр Warcraft III.\r\n\r\nВ третий том Хроник вошел большой промежуток событий вселенной, начиная от Третьей войны, и заканчивая разрушительным Катаклизмом, который создал дракон Смертокрыл. В этом томе вы узнаете о первом вторжении Пылающего Легиона в Азерот, названного Третьей войной; об Артасе и его становлении Королём-личом; об Иллидане Ярость Бури и Пылающем походе на Запределье; о пробуждении Короля-лича и о войне в Нордсколе; а также о Смертокрыле и о Катаклизме, который он причинил.', 9, '1648810540_3.jpg', 'https://mmo-obzor.ru/content/books/Warcraft_Hroniki_Tom3_mmo-obzor.ru.pdf'),
(20, 'КНИГА «ВАРКРАФТ ХРОНИКИ. ТОМ 2»', 'Большая часть книги посвящена Дренору и всему, что там происходило с самого начала. Создание планеты, древние конфликты между Изначальными и Колоссами, судьба империи Апекситов, больше подробностей о судьбе дренеев и ещё много всего, чего ранее о Дреноре мы нигде не слышали. Все события описываются вплоть до открытия Тёмного Портала.\r\n\r\nВторая половина энциклопедии посвящена открытию Тёмного Портала и последствиям этого события – Первой и Второй войне людей с орками, экспедиции Альянса на Дренор и его последующее трагическое разрушение. История создания Ордена Серебряной Длани и море всего того, о чём раньше приходилось только догадываться. Практически все события пересекаются с ранее вышедшими романами: «Рождение Орды», «Последний страж», «Потоки тьмы» и «По ту сторону Тёмного Портала».', 9, '1648810897_2.jpeg', 'https://mmo-obzor.ru/content/books/Warcraft_Hroniki_Tom2_mmo-obzor.ru.pdf'),
(21, 'КНИГА «ВАРКРАФТ ХРОНИКИ. ТОМ 1»', 'В книге достаточно подробно описываются события до открытия Тёмного Портала, являющимся некой точкой летосчисления. Книга написана как альманах, и содержит колоссальные объемы информации. С первого раза всё и не усвоишь. Как понятно по её структуре, покрывает она очень большой отрезок времени, в который входит множество других книг, но читать её стоит в первую очередь.\r\n\r\nСодержит она много разъяснений и трактовок уже существующего лора, и в некоторых местах он отличается от устоявшегося. Однако, эта книга считается самым, что не на есть каноном.', 9, '1648821035_1.jpg', 'https://mmo-obzor.ru/content/books/warcraft_chronicle-tom-1-pdf.zip'),
(22, 'КНИГА «ПО ТУ СТОРОНУ ТЕМНОГО ПОРТАЛА»', 'После поражения орков в последней войне, Нер\'Зул – орк-шаман - снова берет бразды правления над Ордой. Ему вновь удается открыть Темный Портал, и его армия снова атакует Азерот. Оркам удается взять в осаду Крепость Стражей Пустоты, которую люди построили для защиты. Люди, под командованием мага Кадгара и главнокомандующего Туралиона вновь под знаменами Альянса собирают армию, чтобы защитить свой мир. Люди, Эльфы и Дворфы должны остановить новое вторжение. Кадгару удается заметить, что маленькая группа Орков больше не намерена захватывать Азерот.\r\n\r\nЕще одной ужасной новостью стало появление Черных Драконов, которые с радостью помогают Оркам. Кадгар должен что то придумать, и он организовывает экспедицию в Дренор, с целью уничтожить Орков на их же родине.\r\n\r\nУдастся ли героям Альянса остановить Нер\'Зула? Сможет ли Смертокрыл воплотить свой зловещий план? Об этих и других событиях читайте в книге Аарона Розенберга «По ту сторону Темного Портала», которую Вы можете скачать по представленным ниже ссылкам.', 1, '1648821670_world-of-warcraft-po-tu-storonu-temnogo-portala_b5e.jpg', 'https://mmo-obzor.ru/content/books/aaron_rozenberg-po_tu_storonu_temnogo_portala-txt.zip'),
(23, 'КНИГА «ПОТОКИ ТЬМЫ»', 'ождь Орды Чернорук убит. Теперь новую Орду возглавляет Оргрим Молот Рока. После полного разгрома над жителями Штормграда, новый вождь планирует захватить Северные земли Лордерона, а потом и весь Азерот. Он свято верит в то, что Азерот должен принадлежать только оркам. Спасаясь бегством, Андуин Лотар и его люди плывут на север в надежде, что король Лордерона Теренас Менетил послушает их, ведь орки теперь реальная угроза для всего Азерота. Создается Великий Альянс трех рас – эльфов, людей и дворфов, который должен остановить бесчисленную Орду.\r\n\r\nТем временем Оргрим договаривается с Зул\'Джином, и тролли, ведомые местью эльфам за то, что вторые отобрали у них земли, вступают в Великую битву Альянса и Орды.\r\n\r\nСможет ли Альянс остановить бесчисленные потоки тьмы Орды или орки уничтожат Азерот? Об этих и многих других событиях читайте в книге Аарона Розенберга «Потоки Тьмы».', 1, '1648821820_BC4_1490695071.jpg', 'https://mmo-obzor.ru/content/books/aaron_rozenberg-potoki_tmy-txt.zip'),
(24, 'КНИГА «РОЖДЕНИЕ ОРДЫ»', 'Книга «Рождение Орды» является первым полноценным романом, который рассказывает об истории мира Warcraft. События этой книги происходят в далеком прошлом, когда орки еще были мирными шаманами и охотниками, когда Дренор процветал в лучах солнца, и ничто не грозило обитателям этого мира. Все это продолжалось, пока не пришел Пылающий Легион. Кил\'джеден, ведомый местью своему брату Велену, порабощает орков и с помощью них истребляет дренеев, которые спрятались в Дреноре от рук Пылающего Легиона. Следом орки, теперь уже жаждущие новой крови, открывают портал в новый мир Азерот и отправляются через него, чтобы истребить человеческую расу. Так начинается великое противостояние Орков и Людей.\r\n\r\nСмогут ли люди остановить демоническую Орду? Смогут ли дренеи выжить после их уничтожения? Об этих и других событиях читайте в книге Кристи Голден «Рождение Орды», которую можете скачать по представленным ниже ссылкам.', 1, '1648821890_BC4_1592260029.jpg', 'https://mmo-obzor.ru/content/books/kristi_golden-rozhdenie_ordy-txt.zip'),
(25, 'КНИГА «ПОВЕЛИТЕЛЬ КЛАНОВ»', 'Клан Северного Волка под командованием Дуротана был изгнан за предательство из рядов Орды. Он единственный не поддержал идеологию Гул\'Дана. Но у Дуротана еще остался друг, поддерживающий его. Оргрим Молот Рока был единственным орком, который разделял взгляды лидера клана Северного Волка. Дуротана со своей женой Дрекой и их сыном тайно отправляется к Оргримму, что бы раз и навсегда решить дальнейшие планы. Но в этом походе семья была атакована приспешниками Гул\'Дана и жестоко убита. Звуки бойни услышал небольшой отряд людей, патрулирующий местность, они поспешили туда, но опоздали. В живых они нашли только маленького орченка, которого забрали с собой.\r\n\r\nТак началась новая жизнь молодого орка среди людей, которые назвали его - Тралл, что в переводе означало «раб». Для своего хозяина он стал лишь оружием, на котором человек зарабатывал деньги. Тралл был рабом, гладиатором, просто развлечением для хозяина. Но однажды, благодаря маленькой девочке по имени Тарета, Траллу удастся вырваться из оков. И ему предстоит пройти еще много испытаний, целью которых будет – освободить орков из плена и восстановить былую мощь Орды. Удастся ли Траллу пройти все испытания? Сможет ли он, воспитанный людьми, повести свой народ к свободе? Об этих и многих других событиях читайте в книге Кристи Голден «Повелитель кланов», которую можете скачать по представленным ниже ссылкам.', 1, '1648822079_438.jpg', 'https://mmo-obzor.ru/content/books/kristi_golden-povelitel_klanov-txt.zip'),
(26, 'КНИГА «НОЧЬ ДРАКОНА»', 'Вот уже более пятнадцати лет прошло со времен, когда отважные герои во главе с Красом освободили королеву красных драконов Алекстразу из плена орков в Грим Батоле. Но после тех ужасных событий зло в этой проклятой горе не перестало существовать. И вот снова Крас, более известный как супруг королевы красных драконов – Кориалстраз, чувствует появление чего-то страшного и смертельного. Он решается в одиночку отправиться в Грим Батол, и выяснить, что же на самом деле таит эта гора, и чем Азероту придется пожертвовать, что бы остаться невредимым.\r\n\r\nНо не одному Красу почувствовалось пробуждение зла. Жрица Ириди из рода дренеев также держит свой путь в Грим Батол, но почему именно туда направила ее судьба, она пока не знает. Следопыт высших эльфов Вериса Ветрокрылая, жена великого мага из Даларана – Ронина, преследует своего врага, который ранее пытался украсть ее детей. Калесгос, синий дракон из стаи Малигоса, был послан предводителем стаи в Грим Батол для расследования необычной магической активности в горе.\r\n\r\nВсех героев объединяло одно – все они держали путь в Грим Батол. Какие секреты таят глубины черной горы? Сумеют ли герои справиться со злом, так смело начавшим свою активность? И смогут ли они выполнить свои миссии в этом нелегком задании судьбы? Об этих и других событиях читайте в книге Ричарда Кнаака «Ночь дракона».', 1, '1648822153_219.jpg', 'https://mmo-obzor.ru/content/books/richard_knaak-noch_drakona-txt.zip'),
(27, 'КНИГА «ИЛЛИДАН»', '«Преданный всеми, гонимый ото всюду, прислужник Пылающего Легиона». Таким мы знаем Иллидана со времен Warcraft III. В 2016 году Blizzard все же решили раскрыть его образ и историю в полном объеме, так как в апреле выходит новый роман от Уильяма Кинга с одноименным названием «Иллидан». Автор обещает раскрыть его историю с другой стороны, в которой он будет не просто только злодеем Азерота и Запределья.\r\n\r\nОписанные в романе события происходят во времена TBC (дополнение The Burning Crusade в World of Warcraft), когда Иллидан вместе с Кель’тасом Солнечным Скитальцем и нагой Леди Вайш убегает в Запределье, чтобы спрятаться от гнева Кил’джедена. Будут раскрыты подробности того, почему Иллидан и его войска не участвовали в войне за Запределье, личные отношения с Пылающим Легионом, а также подробности предательства в лице лидера пеплоустов Акамы.', 1, '1648822210_91fjt3evozl.jpg', 'https://mmo-obzor.ru/content/books/uiljam_king-illidan-txt.zip'),
(28, 'КНИГА «АРТАС: ВОСХОЖДЕНИЕ КОРОЛЯ-ЛИЧА»', 'Король-лич – существо, воплощенное зло которого стало легендой. Он повелевает армией Плети, его рука обладает величайшим оружием – Ледяной Скорбью и он является самым страшным кошмаром всего Азерота. Он не имеет души, обладает невообразимой мощью и хочет поработить всех жителей мира Warcraft. Но так было не всегда...\r\n\r\nДо того момента, как он объединился с душой орка-шамана Нер\'Зула, Короля-лича именовали Артас Менетил. Он был наследником престола Лордерона, сыном Теренаса Менетила и паладином ордена Серебряной Длани. Этот роман повествует нам о жизни Артаса и его нелегком пути, в итоге которого он предал свой народ и стал Королем-личом.\r\n\r\nКогда землям Лордерона угрожала опасность в виде заражения народа чумой, Артас Менетил отправился на поиски источника ее распространения. В этом походе ему пришлось выбрать нелегкий путь, который привел его в северные земли, именуемые Нордсколом. Именно там ему придется встретить свою судьбу и стать Рыцарем Смерти. Предавший свой народ, своего отца, свою возлюбленную – Джайну Праудмур, он вернется уже не человеком. Какое страшное задание дал Артасу Нер\'Зул? Смогут ли герои Азерота остановить обезумевшего, и тепер уже бывшего принца Лордерона? Сможет ли Джайна достучаться до остатков души Артаса? Об этих и других событиях читайте в книге Кристи Голден «Артас: Восхождение Короля-лича», которую Вы можете скачать по представленным ниже ссылкам.', 1, '1648822327_ArthasCover.jpg', 'https://mmo-obzor.ru/content/books/kristi_golden-artas-voskhozhdenie_korolja-licha-tx.zip'),
(29, 'КНИГА «ВОЙНА ДРЕВНИХ»', 'Первое вторжение Пылающего Легиона под предводительством Саргераса в Азерот состоялось более 10 000 тысяч лет тому назад. По странному стечению обстоятельств в настоящем времени в Азероте образовалось аномальное явление, которое смогло перенести в прошлое трех героев – великого красного дракона Кориалстраза (Краса), мага и волшебника Ронина и орка по имени Броксигар, который ищет доблестную смерть в бою.\r\n\r\nСмогут ли герои помочь своим потомкам остановить Пылающий Легион, и не изменять ли они при этом историю? Об этих и многих других событиях читайте в трилогии книг Ричарда Кнаака «Война Древних».', 1, '1648822457_Warancarch.webp', 'https://mmo-obzor.ru/content/books/richard_knaak-vojna_drevnikh-txt.zip');

-- --------------------------------------------------------

--
-- Структура таблицы `topics`
--

CREATE TABLE `topics` (
  `id` int(12) NOT NULL,
  `name_topic` varchar(140) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`id`, `name_topic`) VALUES
(1, 'Книги'),
(9, 'Томы');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `password`, `admin`) VALUES
(109, 'Admin', 'maxkuzgenich@gmail.com', '$2y$10$RtlKVFbh7Cqimu3m6UP9puF3FEp0H421fKrzi7UZ/1HIeyl8EjG/i', 1),
(119, 'Krivoruk', 'krivi@mail.com', '$2y$10$SoDxXSmjtGyXpnTyzhFdyeS2tzFL.Jc0aGskpopdmn140CPBBcCEu', 0),
(121, 'Maxim', 'max@gmail.com', '$2y$10$s8Wqaxz9o4ubdGzpRPCHs.DZ3G49lJpn.YFa/0CbcUJAG3ff8hB.S', 0),
(137, 'Lokaka', 'fsdfjsdf@fsfesf', '$2y$10$uwPXwwpHP2dtr/cWz23Kle8iROLrjkhnseoKpWAqZtrHW/udsyC66', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_topic` (`id_topic`);

--
-- Индексы таблицы `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_topic` (`name_topic`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_topic`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;