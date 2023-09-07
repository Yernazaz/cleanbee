import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? averageRating(List<double>? ratings) {
  // Get average rating to one decimal point from a its list

  // Check if ratings is null or empty
  if (ratings == null || ratings.isEmpty) {
    return 5;
  }
  // Compute the average rating and round it to one decimal point
  double total = ratings.reduce((a, b) => a + b);
  double avg = total / ratings.length;
  return double.parse(avg.toStringAsFixed(1));
}

List<String>? returnList() {
  // return list of streets from json file
  final jsonString = '''
{
    "streets": [
        "ул. 101-я",
        "ул. 103-я",
        "ул. 12-104",
        "ул. 135-я",
        "ул. 150 лет Абая",
        "ул. 167-я",
        "ул. 172-я",
        "ул. 179-я",
        "ул. 187-я",
        "ул. 188-я",
        "ул. 189-я",
        "ул. 191-я",
        "ул. 199-я",
        "мкр. 1-й (пос. Кызылсуат)",
        "пер. 1-й Разина",
        "ул. 1-я Алматинская",
        "ул. 200-я",
        "ул. 20-40",
        "ул. 207-я",
        "пер. 217-й",
        "пер. 222-й",
        "ул. 22-я",
        "ул. 23-13",
        "ул. 23-15",
        "ул. 23-30",
        "ул. 23-я",
        "ул. 247-я",
        "ул. 24-я",
        "ул. 25-я",
        "ул. 27-я",
        "ул. 2-я Алматинская",
        "ул. 31-я",
        "ул. 36-я",
        "проезд 37-ой",
        "ул. 38-я",
        "мкр. 3-й",
        "ул. 3-й Микрорайон",
        "ул. 41-я",
        "ул. 44-я",
        "мкр. 4Б (село. Коянды)",
        "мкр. 4-й",
        "ул. 52-я",
        "мкр. 5-й",
        "ул. 638-я",
        "ул. 69-я",
        "проезд 70-ый",
        "ул. 70-я",
        "проезд 77-й",
        "ул. 85-я",
        "ул. 8 Марта",
        "ул. 93-я",
        "Аул. А 184",
        "ул. А 185",
        "ул. А 195",
        "ул. А 333",
        "ул. А 34",
        "ул. А-98",
        "ул. Абат-Байтак",
        "пр-кт Абая",
        "ул. Абая (аул. Косшы)",
        "ул. Абая Кунанбаева (село. Коянды)",
        "ул. Абылай хана (пос. Жибек-Жолы)",
        "пр-кт Абылай Хана",
        "ул. Агадырь",
        "ул. Аганас",
        "ул. Агыбай батыра",
        "ул. Адольфа Янушкевича",
        "ул. Адырна",
        "ул. Азатык (аул. Косшы)",
        "ул. Азербайжана Мамбетова",
        "ул. Айганым",
        "ул. Айгыржал",
        "ул. Айдархана Турлыбаева",
        "пер. Айдын",
        "ул. Айманова",
        "ул. Айман-Шолпан",
        "ул. Аймауытова",
        "ул. Айнакол",
        "ул. Айтеке би (аул. Косшы)",
        "ул. Айша Биби",
        "ул. Акан Серы",
        "ул. Акан Серы (аул. Караоткель)",
        "ул. Акарыс",
        "пер. Акберен",
        "ул. Акбидай",
        "ул. Акбиик",
        "ул. Акбокен",
        "ул. Акбугы",
        "мкр. Акбулак-3",
        "ул. Акжайык (пос. Жибек-Жолы)",
        "ул. Акжар",
        "ул. Акжелен",
        "ул. Акжол",
        "пер. Аккайын",
        "ул. Аккемер",
        "пер. Аккент",
        "ул. Аккербез",
        "ул. Аккорган",
        "ул. Аккум",
        "ул. Акмешит",
        "ул. Акмола",
        "ул. Акмолинская",
        "ул. Аксай",
        "ул. Аксенгир",
        "ул. Аксуат",
        "ул. Аксу-Аюлы",
        "ул. Аксу-Жабагалы",
        "пер. Аксумбе",
        "пер. Аксункар",
        "ул. Актасты",
        "ул. Актау",
        "ул. Актобе",
        "ул. Актолкын",
        "ул. Акшокы",
        "ул. Акын Сара",
        "ул. Акыртас",
        "ул. Акыт Улимжиулы",
        "ул. Алаколь",
        "мкр. Алатау",
        "ш. Алаш",
        "ул. Александра Затаевича",
        "ул. Александра Княгинина",
        "ул. Александра Кравцова",
        "ул. Александра Пушкина",
        "ул. Алии Молдагуловой",
        "ул. Алии Молдагуловой (аул. Жибек Жолы)",
        "ул. Аликей Маргулан (аул. Каражар)",
        "ул. Алихана Букейхана",
        "пер. Алконыр",
        "ул. Алмалык",
        "ул. Алматы",
        "ул. Алмуртты",
        "ул. Алпамыс батыр",
        "ул. Алтыбакан",
        "ул. Алтынемел",
        "мкр. Аль-фараби",
        "пр-кт Аль-Фараби",
        "ул. Аль-Фараби (село. Коянды)",
        "ул. Аманат",
        "ул. Амангельды Иманова",
        "ул. Аманжолова",
        "ул. Аманкарагай",
        "ул. Амире Кашаубаева",
        "ул. Амман",
        "ул. Анарская",
        "ул. Антона Чехова",
        "ул. Ануара Алимжанова",
        "ул. Аныракай",
        "ул. Арай",
        "ул. Арасан",
        "ул. Арганаты",
        "ул. Ардагерлер",
        "ул. Аркайым",
        "ул. Аркалык",
        "ул. Армандастар",
        "ул. Арнасай",
        "ул. Арыкты",
        "ул. Асан кайгы",
        "пер. Асаукок",
        "пер. Асемконыр",
        "ул. Асенбай Калкабекулы (аул. Косшы)",
        "ул. Аскартау",
        "ул. Аспандияра Кенжина",
        "ул. Аспара",
        "пр-кт Астана",
        "ш. Астана - Караганда",
        "тр. Астана-Караганда",
        "ш. Астраханское",
        "ул. Атаконыс",
        "ул. Атамура",
        "ул. Атасу",
        "ул. Атбасарская",
        "пер. Атбасарский",
        "ул. А Токпанова",
        "ул. Атырау",
        "ул. Ахмета Байтурсынова",
        "ул. Ахмета Жубанова",
        "ул. Аягоз",
        "Бул. Базарлык",
        "ул. Байконур",
        "ул. Байтурсынова",
        "ул. Байшешек",
        "ул. Байыркум",
        "ул. Бактыораза Бейсекбаева",
        "ул. Балбырауын",
        "ул. Балкантау",
        "ул. Балочная",
        "ул. Балталы",
        "ул. Балуана Шолака",
        "ул. Бараева",
        "пер. Баркытбел",
        "пер. Басире",
        "ул. Бастау",
        "ул. Бастобе",
        "пр-кт Бауржана Момышулы",
        "ул. Бауыржан Момышулы (аул. Караоткель)",
        "ул. Бауыржан Момышулы (аул. Косшы)",
        "ул. Баянауыл",
        "ул. Баянтау",
        "ул. Бегельдинова",
        "ул. Бейбитшилик",
        "ул. Бейбитшилик (аул. Жибек Жолы)",
        "ул. Бейбитшилик (пос. Жибек-Жолы)",
        "ул. Бейимбет Майлина",
        "ул. Бекарыс",
        "ул. Бекетай",
        "ул. Беласар",
        "ул. Белая",
        "ул. Белкарагай",
        "ул. Берел",
        "ул. Берен",
        "ул. Берлик",
        "ул. Бестерек",
        "ул. Бестобе",
        "ул. Бесшалкар",
        "пер. Бесшатыр",
        "ул. Биржан Сала",
        "пр-кт Богенбай батыра",
        "ул. Богенбай батыра (село. Коянды)",
        "ул. Богенбая",
        "ул. Бозбиик",
        "пер. Бозинген",
        "ул. Бозторгай",
        "ул. Бокеева",
        "ул. Болашак",
        "ул. Болашак (село. Коянды)",
        "ул. Борили",
        "ул. Боталы",
        "ул. Брусиловского",
        "ул. Буктырма",
        "ул. Буланты",
        "ул. Булбул",
        "ул. Бурабай",
        "ул. Бухарбай батыра",
        "Вул. Василия Бартольда",
        "ул. Василия Радлова",
        "ул. Вишневского",
        "ш. Вишневское",
        "ул. Вячеславская",
        "Гул. Габдуллина",
        "ул. Габидена Мусрепова",
        "ул. Габидена Мустафина",
        "ул. Габита Мусрепова",
        "пер. Гагарина",
        "ул. Газеты Егемен Казахстан",
        "пер. Гастелло",
        "ул. Гаухартас",
        "ул. Гейдара Алиева",
        "ул. Генерала Сабыра Ракымова",
        "ул. Герцена",
        "ул. Гете",
        "ул. Гоголя",
        "ул. Горького",
        "ул. Грязнова",
        "Дпер. Дальный",
        "ул. Дарабоз",
        "ул. Даулеткерей",
        "ул. Дауылпаз",
        "пер. Дегелен",
        "пер. Дегерес",
        "ул. Джалиля",
        "ул. Джангильдина",
        "ул. Джунусова",
        "ул. Джунусова (село. Коянды)",
        "ул. Дина Нурпеисова (аул. Караоткель)",
        "ул. Домалак ана",
        "ул. Домбыралы",
        "ул. Достык",
        "ул. Достык (аул. Жибек Жолы)",
        "ул. Достык (село. Коянды)",
        "ул. Дулата Бабатайулы",
        "ул. Дулати",
        "ул. Дулатова",
        "ул. Дулыга",
        "ул. Дунаевского",
        "Еул. Едил",
        "ул. Елубая Тайбекова",
        "ул. Енбекши (аул. Караоткель)",
        "ул. Енбекшилер",
        "ул. Енесай",
        "ул. Енилик-Кебек",
        "ул. Енлик-Кебек",
        "ул. Ер Кокше",
        "ул. Ер Косай",
        "ул. Ермекова",
        "ул. Ер Таргын",
        "ул. Ертис",
        "ул. Есет батыра",
        "ул. Есиль",
        "Жул. Жабаева",
        "ул. Жагалау (аул. Караоткель)",
        "ул. Жагоркызы",
        "пер. Жайдарман",
        "ул. Жайык",
        "ул. Жайылма",
        "пер. Жалаулы",
        "ул. Жамбыла",
        "ул. Жанажол",
        "ул. Жанайдара Жирентаева",
        "ул. Жанаконыс",
        "пер. Жанаозен",
        "ул. Жанарыс",
        "ул. Жанатурмыс",
        "ул. Жангельдина",
        "ул. Жангильдина (аул. Косшы)",
        "ул. Жанибека Тархана",
        "ул. Жанкент",
        "ул. Жансугурова",
        "ул. Жаркент",
        "пер. Жарколь",
        "пер. Жарсуат",
        "ул. Жасыбай",
        "ул. Жаяу Муса",
        "ул. Жекебатыр",
        "ул. Желтоксан",
        "ул. Желтоксан (аул. Жибек Жолы)",
        "ул. Желтоксан (аул. Каражар)",
        "ул. Желтоксан (пос. Жибек-Жолы)",
        "пр-кт Женис",
        "ул. Жерек",
        "ул. Жетиген",
        "пер. Жетисай",
        "ул. Жибек Жолы (пос. Жибек-Жолы)",
        "пер. Жигер",
        "ул. Жидебай",
        "ул. Жиембет Жырау",
        "ул. Жолымбетская",
        "ул. Жумабека Ташенова",
        "пер. Жумабека Ташенова",
        "ул. Жылой",
        "Зул. Зайсан",
        "ул. Зеренды",
        "ул. Зорге",
        "Иул. Ивана Панфилова",
        "ул. Игилик",
        "ул. Игишева",
        "ул. Иле",
        "ул. Илияса Есенберлина",
        "ул. Илияс Жансугирулы",
        "ул. Ильяса Есенберлина",
        "ул. Иманак",
        "ул. Иманбаевой",
        "ул. Иманжусипа Кутпанова",
        "пер. Иманова",
        "ул. Имантау",
        "ул. Интернациональная (аул. Косшы)",
        "ул. Ирченко",
        "ул. Исатай батыра",
        "Кпр-кт Кабанбай батыра",
        "ул. Кабанбай батыра (село. Коянды)",
        "ул. Кадыргали Жалайыри",
        "ул. Кажымукан",
        "ул. Кажымукана",
        "ул. Казанат",
        "ул. Казахстан (село. Коянды)",
        "ул. Казыбек Би (аул. Жибек Жолы)",
        "ул. Казыбек Би (пос. Жибек-Жолы)",
        "ул. Кайнар",
        "ул. Кайрата Рыскулбекова",
        "ул. Кайыма Мухамедханова",
        "ул. Кайынды",
        "ул. Калба",
        "ул. Калкаман",
        "ул. Камысты",
        "ул. Капал",
        "ул. Капшагай",
        "ул. Карагандинская",
        "ул. Каражорга",
        "ул. Караоткель",
        "ул. Карасаз",
        "ул. Карасай батыра",
        "ул. Карасакал Еримбет",
        "ул. Карасу",
        "ул. Карасу (пос. Жибек-Жолы)",
        "ул. Каратал",
        "ул. Каратобе",
        "ул. Карашаш",
        "ул. Карашаш Ана",
        "ул. Карбышева",
        "ул. Каркабат",
        "ш. Каркаралы",
        "ул. Карталинская",
        "пер. Катченко",
        "ул. Кеген",
        "пер. Келес",
        "пер. Келешек",
        "пер. Кемел",
        "ул. Кеменгерулы",
        "ул. Кендала",
        "ул. Кенена Азербаева",
        "ул. Кенесары",
        "ул. Кенесары (село. Коянды)",
        "ул. Кенесары хан (аул. Караоткель)",
        "ул. Кенжебека Кумисбекова",
        "ул. Кентау",
        "ул. Кеншагын",
        "ул. Кеншилер",
        "пер. Кербулак",
        "ул. Керегетас",
        "ул. Керей и Жанибека Тархана",
        "ул. Кертолгау",
        "ул. Клубничная",
        "пер. Кобда",
        "ул. Кобыз",
        "ул. Кожахметова",
        "ул. Козыбасы",
        "ул. Козыкош (аул. Караоткель)",
        "ул. Кокарал",
        "ул. Кокжазык",
        "ул. Кокжелек",
        "ул. Кокжиек",
        "пер. Кокорай",
        "ул. Коксай",
        "ул. Коксенгир",
        "ул. Коктал",
        "ул. Коктем",
        "пер. Кокшетау",
        "ул. Комсомолькая",
        "ул. Конституции",
        "ул. Коныраулы",
        "ш. Коргалжинское",
        "ул. Кордай",
        "ул. Коркыт Ата (аул. Косшы)",
        "ул. Косалка",
        "ул. Космонавтов",
        "пер. Костанай",
        "ул. Кошкарбаева",
        "пер. Коянды",
        "ул. Коянды (село. Коянды)",
        "ул. Куйши Дина",
        "пер. Култобе",
        "ул. Кулынды",
        "ул. Куляш Байсейитова",
        "ул. Кумкент",
        "ул. Кунаева",
        "ул. Кунаева (село. Коянды)",
        "ул. Кундызды",
        "ул. Куншуак",
        "пер. Куракты",
        "ш. Кургальжинское",
        "ул. Курмангазы",
        "ул. Курманова",
        "ул. Кусжолы",
        "ул. Кусмурын",
        "ул. Кусни Корлан",
        "ул. Кыз Жибек",
        "ул. Кыз-Жибек",
        "ул. Кызылкениш",
        "пер. Кызылкол",
        "пер. Кызылкум",
        "Лул. Лайлы-Мажнун",
        "ул. Лепсы",
        "мкр. Лесная Поляна",
        "ул. Ломоносова",
        "ул. Луи Пастера",
        "ул. Льва Гумилева (аул. Караоткель)",
        "ул. Льва Толстого",
        "Мпр-кт Магжана Жумабаева",
        "ул. Майбалык",
        "ул. Майдаконыр",
        "ул. Майкайын",
        "пер. Майлыкент",
        "ул. Макат",
        "ул. Макатаева (аул. Караоткель)",
        "пер. Макинский",
        "ул. Малахова",
        "ул. Малика Габдулина",
        "пер. Малыбай",
        "ул. Маметовой (аул. Жибек Жолы)",
        "ул. Маметовой (пос. Жибек-Жолы)",
        "ул. Манаса",
        "ул. Манатау",
        "пр-кт Мангилик Ел",
        "ул. Манкент",
        "ул. Маншук Маметовой (аул. Косшы)",
        "пер. Маралсай",
        "ул. Маркова",
        "ул. Масанчи",
        "ул. Масаты",
        "ул. Матросова",
        "ул. Махтумкули",
        "ул. Машат",
        "ул. Машхур Жусип Копейулы",
        "ул. Маяковского",
        "ул. Медеу",
        "ул. Мендешев",
        "пер. Мерей",
        "ул. Мереке",
        "ул. Минская",
        "пер. Минский",
        "ул. Мира (пос. Кызылсуат)",
        "ул. Мирзояна",
        "ул. Мирная",
        "ул. Михаила Лермонтова",
        "ул. Можайского",
        "ул. Мойылды",
        "ул. Мойынты",
        "ул. Молодежная (аул. Караоткель)",
        "мкр. Молодежный",
        "ул. Московская",
        "пер. Мугалжар",
        "пер. Музбел",
        "ул. Музтау",
        "ул. Мукагали Макатаева",
        "ул. Мукагали Макатаева (аул. Караоткель)",
        "ул. Муканова",
        "ул. Мунайтпасова",
        "ул. Мунайшылар",
        "ул. Мустафа Шокай",
        "ул. Мустафа Шокай (аул. Караоткель)",
        "ул. Мустафа Шокай (село. Коянды)",
        "ул. Мухамеджана Тынышбаева",
        "ул. Мухтара Ауэзова",
        "ул. Мынарал",
        "пер. Мырзашол",
        "Нул. Нагорная",
        "ул. Нажимеденова",
        "ул. Найзакара",
        "ул. Нарын",
        "ул. Наурыз",
        "ул. Нигматуллина",
        "ул. Николая Хлудова",
        "ул. Новая (пос. Кызылсуат)",
        "ул. Новостроительная",
        "ул. Новый Аэропорт",
        "ул. Ногайлы",
        "ул. Нура (аул. Караоткель)",
        "пр-кт Нургисы Тлендиева",
        "ул. Нуржол",
        "ул. Нурлыжол",
        "ул. Нуртаса Ондасынова",
        "Оул. Обаган",
        "ул. Озен",
        "ул. Ойжайлау",
        "пер. Ойтоган",
        "ул. Ойыл",
        "ул. Окжетпес",
        "ул. Омарова",
        "ш. Ондирис",
        "ул. Ораза Жандосова (село. Коянды)",
        "ул. Орбулак",
        "ул. Орлыкол",
        "ул. Орнек",
        "ул. Орхон",
        "ул. Орынбор",
        "ул. Отыкен",
        "ул. Отырар",
        "Пул. Павлова",
        "ул. Петрова",
        "ул. Пионерская",
        "пр-кт Победы",
        "ул. Потанина",
        "ул. Придорожная",
        "ул. Промзона",
        "ул. Пушкина",
        "Рул. Рамазан",
        "пер. Рауан",
        "ул. Рахимжана Кошкарбаева",
        "пр-кт Республики",
        "ул. Республики (аул. Косшы)",
        "ул. Речная",
        "ул. Речная (аул. Косшы)",
        "ул. Романтиков",
        "ул. Рябиновая",
        "Сул. С308",
        "ул. С 409",
        "ул. Сабира Рахимова",
        "ул. Сагадата Нурмагамбетова (село. Коянды)",
        "ул. Садвакасова",
        "ул. Садовая",
        "пер. Садовый",
        "ул. Сакена Сейфуллина",
        "мкр. Самал",
        "пер. Сандыктас",
        "ул. Сарайшык",
        "ул. Саргуль",
        "ул. Саржайлау",
        "ул. Саркан",
        "ул. Саркырыма (аул. Косшы)",
        "ул. Сарыадыр",
        "пр-кт Сарыарка",
        "ул. Сары Арка (аул. Жибек Жолы)",
        "ул. Сары Арка (пос. Жибек-Жолы)",
        "ул. Сарыбулакская",
        "ул. Сарын",
        "ул. Сарыозек",
        "ул. Сарыозен",
        "ул. Сарысу",
        "ул. Сарытогай",
        "ул. Сатпаева",
        "ул. Сауран",
        "ул. Северная",
        "ул. Северная (аул. Караоткель)",
        "ул. Сейдалина",
        "ул. Сексек ата",
        "ул. Сембинова",
        "ул. Серпер",
        "ул. Силети",
        "бульв. Скрябина",
        "ул. Сливовая",
        "ул. Советская (аул. Караоткель)",
        "пер. Созак",
        "ш. Софиевское",
        "ул. Степана Кубрина",
        "ул. Степная",
        "ул. Суворова",
        "ул. Суинбай акына",
        "ул. Суйинбай акын",
        "ул. Султана Бейбарыса (аул. Жибек Жолы)",
        "ул. Султана Бейбарыса (пос. Жибек-Жолы)",
        "ул. Султанмахмуда Торайгырова",
        "ул. Сулуколь",
        "пер. Сулутал",
        "ул. Сулутобе",
        "ул. Сусамыр",
        "пер. Суткент",
        "ул. Сыганак",
        "ул. Сыдыка Мухамеджанова",
        "ул. Сырдария",
        "ул. Сырымбет",
        "Тул. Тайбурыл",
        "ул. Тайказан",
        "ул. Талапкерская",
        "пер. Талапкерский",
        "пер. Талас",
        "ул. Талгар",
        "пер. Талды",
        "ул. Тамшалы",
        "ул. Танжарык Жолдыулы",
        "ул. Тараз",
        "ул. Тараса Шевченко",
        "ул. Тарбагатай",
        "ул. Таскескен",
        "пер. Тасшокы",
        "пр-кт Тауелсыздык",
        "ул. Тауелсыздык (аул. Косшы)",
        "ул. Таукент",
        "ул. Таха Хусейна",
        "ул. Ташкентская",
        "ул. Т. Бигельдинова",
        "ул. Темирказык",
        "пер. Темиртау",
        "пер. Тесиктас",
        "ул. Титова",
        "ул. Тлендиева (пос. Жибек-Жолы)",
        "ул. Токтарова",
        "ул. Тополиная",
        "ул. Торгай",
        "ул. Тулкибас",
        "ул. Тумар Ханым",
        "пр-кт Туран",
        "ул. Турара Рыскулова",
        "ул. Туркестан",
        "ул. Туркистан",
        "пер. Тюленина",
        "Уул. Уланбел",
        "ул. Улбике Акын",
        "ул. Ул болшан (аул. Караоткель)",
        "пр-кт Улы Дала",
        "ул. Улытау",
        "пер. Ульяны Громовой",
        "ул. Уркер",
        "пер. Училищный",
        "ул. Ушконыр",
        "ул. Ушкопир",
        "ул. Ушкултай Субханбердина",
        "ул. Ушкыштар",
        "Фул. Фахд бен Абдулл Азиза",
        "Хул. Халел Досмухамедулы",
        "ул. Хантау",
        "ул. Хачатуряна",
        "ул. Хмельницкого",
        "Цул. Цветочная",
        "ул. Целинная (аул. Караоткель)",
        "мкр. Целинный",
        "ул. Центральная",
        "ул. Центральная (аул. Караоткель)",
        "ул. Центральный Парк",
        "ул. Циолковского",
        "Чул. Челюскинцев",
        "ул. Чехоева",
        "ул. Чингиза Айтматова",
        "ул. Чолпон-Ата",
        "ул. Чубары",
        "Шул. Шабал Бейсековой",
        "ул. Шабдалы",
        "ул. Шагыл",
        "ул. Шаймердена Косшыгулулы",
        "пр-кт Шакарима Кудайбердиулы",
        "ул. Шакпак",
        "ул. Шалкар",
        "ул. Шалкоде",
        "ул. Шамши Калдаякова",
        "ул. Шапагат (село. Коянды)",
        "ул. Шара Жиенкулова",
        "ул. Шарбаккол",
        "ул. Шарбакты",
        "ул. Шардара",
        "пер. Шардары",
        "ул. Шарденова",
        "ул. Шарля де Голля",
        "ул. Шары Жиенкуловой",
        "пер. Шаттык",
        "пер. Шашу",
        "пер. Шеркала",
        "ул. Шертер",
        "ул. Шиели",
        "пер. Шиликты",
        "ул. Шокана Валиханова",
        "ул. Шокан Валиханова (аул. Косшы)",
        "ул. Шолохова",
        "ул. Шонанулы",
        "ул. Шопан ата",
        "ул. Шортандинская",
        "ул. Шу",
        "ул. Шугыла",
        "ул. Шыганак",
        "ул. Шынгырлау",
        "пер. Шынтас",
        "пер. Шынырау",
        "пер. Шырайлы",
        "Щул. Щорса",
        "Ыул. Ыбрая Алтынсарина",
        "ул. Ыкылас Дукенулы",
        "ул. Ынталы",
        "ул. Ынтымак (село. Коянды)",
        "ул. Ыргыз",
        "Эул. Экибастуз",
        "ул. Элеваторная",
        "Юул. Южная",
        "Яул. Янушкевичаdone"
    ]
}
''';

  final jsonMap = json.decode(jsonString);
  final List<dynamic> streets = jsonMap['streets'];
  return streets.cast<String>().toList();
}