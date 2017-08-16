-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 16 2017 г., 18:06
-- Версия сервера: 10.1.25-MariaDB
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bblog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `date`) VALUES
(1, 'test', 'content', '2017-08-05'),
(2, 'test2', 'content2', '2017-08-15'),
(3, 'test3', 'content3', '2017-08-01'),
(4, 'test4', 'content4', '2017-08-18'),
(6, 'Что нового в PHP 7.2?', 'Перенос mcrypt в PECL\r\n\r\nРасширение mcrypt, объявленное устаревшим в PHP 7.1, было перемещено в PECL.\r\n\r\nОбъявлено устаревшим в PHP 7.2 (RFC)\r\n\r\nСледующий функционал объявлен устаревшим и больше не рекомендуется к использованию.\r\nЭтот функционал будет удален в версии 8.0.\r\n\r\nУстарел __autoload\r\n\r\nФункция __autoload была заменена на __spl_autoload_register ещё в версии 5.1.\r\nОсновным преимуществом __spl_autoload_register является возможность использовать несколько автозагрузчиков. Теперь будет выбрасываться Deprecation notice на стадии компиляции.\r\n\r\nУстарели png2wbmp() и jpeg2wbmp()\r\n\r\nPng2wbmp() и jpeg2wbmp() — единственные функции, изменяющие формат изображений, которые можно вызвать напрямую, доступные в ext / gd, что делает их довольно обособленными, поскольку libgd не предлагает таких функций. Кроме того, WBMP был изобретен для поддержки WAP, который в настоящее время устарел. Теперь будет выбрасываться Deprecation notice.\r\n\r\nУстарела $php_errormsg\r\n\r\nПеременная $php_errormsg создается в локальной области при возникновении нефатальной ошибки, если параметр track_errors включен (отключен по умолчанию), и ошибка не перехватывалась никаким обработчиком ошибок.\r\n\r\nПомимо того, что поведение зависело от настроек ini-файла, оно также было магическим. Функция error_get_last обеспечивает более чистый способ получения последней ошибки. С PHP 7 доступна функция error_clear_last, таким образом, охватываются все возможные варианты использования $php_errormsg без манипуляции с областями видимости.\r\n\r\nУстарела create_function()\r\n\r\ncreate_function() — это тонкая оболочка вокруг конструкции языка eval(), позволяющая создавать функцию со сгенерированным именем, списком аргументов и телом в виде строковых аргументов. До введения замыканий в PHP 5.3 она обеспечивала способ создания чего-то похожего на лямбда-функции.\r\n\r\nИз-за характера работы create_function(), помимо потенциального источника проблем безопасности, имеет очень плохие характеристики производительности и использования памяти. Использование реальных замыканий во всех отношениях предпочтительнее.\r\n\r\nУстарел mbstring.func_overload\r\n\r\nПараметр mbstring.func_overload в ini-файле позволяет заменить определенное подмножество строковых функций на аналоги с расширением mbstring. Например, strlen() больше не будет возвращать длину строки в байтах, вместо этого она вернет длину в символах в соответствии с текущей выбранной внутренней кодировкой.\r\n\r\nЭто означает, что код с использованием mbstring.func_overload не совместим кодом, написанным в предположении, что основные операции со строками работают нормально. Некоторые библиотеки прямо запрещают func_overload (например, Symfony), другие библиотеки перестают работать. Код, который хочет поддерживать func_overload, должен условно переключаться между обычными строковыми функциями и функциями mbstring с 8-битным кодированием (обычно только библиотеки для криптографии пытаются это сделать).\r\nТеперь будет выбрасываться Deprecation notice если mbstring.func_overload содержит ненулевое значение.\r\n\r\nУстарел (unset) cast\r\n\r\nКаст (unset) превращает значение в null. Это означает, что (unset) expr — просто выражение, которое всегда возвращает null и не имеет других побочных эффектов.\r\nПомимо бесполезности, это поведение только путает, так как многие люди разумно предполагают, что (unset) $a будет вести себя аналогично unset($a), а на самом деле этого не происходит.\r\nТеперь будет выбрасываться Deprecation notice на стадии компиляции.\r\n\r\nУстарела функция parse_str() без второго аргумента\r\n\r\nФункция parse_str() разбирает строку URL и присваивает значения переменным в текущем контексте (или заносит в массив, если задан параметр result).\r\n\r\nИспользовать эту функцию без параметра result крайне не рекомендовалось, потому что динамическое создание переменных в области видимости функции ведет ровно к тем же проблемам, что и register_globals. Теперь выбрасывается Deprecation notice, если параметр result не передается.\r\n\r\nУстарела функция gmp_random()\r\n\r\nФункция gmp_random() генерирует случайное число. Число будет в диапазоне нуля до произведения числа limiter на количество бит в лимбе (limb). Если число limiter отрицательное, будет возвращен отрицательный результат.\r\n\r\nЛимб — внутренний GMP-механизм. Технически это часть числа, помещающаяся в одно машинное слово. Количество бит в нем может различаться в разных системах. В основном это либо 16, либо 32, но это не гарантируется. Так происходит, потому что реализация GMP/MPIR не доступна пользователю. Таким образом, использование этой функции требует угадывания размера Лимба и может зависеть от платформы.\r\n\r\nЧтобы исправить это, в PHP 5.6 добавили функции gmp_random_bits() и gmp_random_range(), которые позволяют точно контролировать используемый диапазон случайных чисел. Эти функции всегда должны быть предпочтительнее, чем gmp_random().\r\nТеперь при вызове gmp_random() выбрасывается Deprecation notice.\r\n\r\nУстарела функция each()\r\n\r\nФункция each() может использоваться для итерации по массиву, подобно foreach. В каждом вызове он возвращает массив с текущим ключом и значением и продвигает указатель внутреннего массива на следующую позицию. Типичное использование, представленное в руководстве, выглядит следующим образом:\r\n\r\nreset($array);\r\nwhile (list($key, $val) = each($array)) {\r\n    echo \"$key => $val\\n\";\r\n}\r\n\r\nФункция each уступает foreach практически во всём, среди прочего она в 10 раз медленнее.\r\nПоддержка этой функции создает проблему для некоторых изменений языка. Например, в предупреждении для невалидного контейнера массива (RFC) пришлось исключить list(), потому что типичное использование each полагается на факт, что вы можете получить доступ к смещениям массива на false без предупреждения.\r\n\r\nТеперь выбрасывается Deprecation warning при первом вызове each, потому что чаще всего он используется в цикле.\r\n\r\nУстарела функция assert() со строковым аргументом\r\n\r\nФункция assert() имеет два режима работы: если передано что-то, кроме строки, она будет проверять, что значение является истиной. Если была передана строка, она будет запущена через eval(), и assert будет проверять истинность результата eval().\r\n\r\nПричиной такого поведения является то, что до PHP 7 это было единственным способом предотвратить вычисление выражения. Начиная с PHP 7 опция zend.assertions в ini-файле может использоваться, чтобы избежать вычисления выражений. Таким образом, больше нет необходимости поддерживать неявное вычисление строковых аргументов.\r\n\r\nИспользование assert($value) для проверки истинности значения открывает уязвимость удаленного выполнения кода, если существует вероятность того, что $value будет строкой.\r\nТеперь выбрасывается Deprecation notice, если assert() используется со строковым аргументом.\r\n\r\nУстарел $errcontext аргумент в error handler\r\n\r\nОбработчикам ошибок, заданных с помощью set_error_handler(), передается в качестве последнего аргумента $errcontext. Этот аргумент представляет собой массив, содержащий все локальные переменные в месте, где была сгенерирована ошибка.\r\n\r\nЭта функция трудна для оптимизации, поскольку $errcontext может использоваться для изменения всех ссылок и объектов в текущей области видимости. Эта функциональность практически не используется. Если вы хотите проверить переменные состояния в месте ошибки, вы должны использовать debugger.\r\n\r\nОбратите внимание, что контекст ошибки содержит только локальные переменные. Ошибки backtrace, включая $this и аргументы функции, останутся доступны через debug_backtrace().\r\n\r\nВ этом случае невозможно выбрасывать Deprecation warning, поэтому этот функционал будет просто отмечен в документации как устаревший.\r\n\r\nУстарела константа INTL_IDNA_VARIANT_2003\r\n\r\nВ PHP 7.2 константа INTL_IDNA_VARIANT_2003 объявлена устаревшей.\r\nВ PHP 7.4 будут изменены idn_to_ascii() и idn_to_utf8(), в которых дефолтный $variant параметр станет INTL_IDNA_VARIANT_UTS46.\r\nВ PHP 8.0 уберут поддержку INTL_IDNA_VARIANT_2003.\r\n\r\nОбъявлены устаревшими приведение типов (binary) и b\"\" литералы (RFC)\r\n\r\nПриведение типа (binary) и поддержка префикса b были добавлены в PHP 5.2.1 для совместимости с PHP 6, однако эта версия так и не появилась, и неизвестно, будут ли когда-нибудь ещё попытки реализовать двоичные строки. Тем не менее, они все еще принимаются языковым сканером, хотя и игнорируются.\r\nТеперь выбрасывается Deprecation notice при использовании этих кастов.\r\n\r\nСпециально к версии 7.2 я подготовил репозиторий — \"Что нового в PHP\", который описывает изменения в версиях PHP, начиная с 5.\r\n\r\nСписок на английском языке вы можете найти в источниках:\r\nhttps://github.com/php/php-src/blob/PHP-7.2/UPGRADING\r\nhttps://wiki.php.net/rfc#php_next_72\r\n\r\nПопробовать новую версию онлайн:\r\nhttps://3v4l.org/\r\n\r\nКак мы видим, глобальных изменений достаточно мало.\r\nА как вы относитесь к изменениям в PHP? Какая фича понравилась больше всего?', '2017-08-16');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;