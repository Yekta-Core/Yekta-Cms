<?php

final class Locations
{
    private $countries = array(
        'AF' => array(
            'name'   => 'Afghanistan (افغانستان)',
            'states' => array(),
        ),

        'AX' => array(
            'name'   => 'Åland Islands',
            'states' => array(),
        ),

        'AL' => array(
            'name'   => 'Albania (Shqipëria)',
            'states' => array(),
        ),

        'DZ' => array(
            'name'   => 'Algeria (الجزائر)',
            'states' => array(),
        ),

        'AS' => array(
            'name'   => 'American Samoa',
            'states' => array(),
        ),

        'AD' => array(
            'name'   => 'Andorra',
            'states' => array(),
        ),

        'AO' => array(
            'name'   => 'Angola',
            'states' => array(),
        ),

        'AI' => array(
            'name'   => 'Anguilla',
            'states' => array(),
        ),

        'AQ' => array(
            'name'   => 'Antarctica',
            'states' => array(),
        ),

        'AG' => array(
            'name'   => 'Antigua and Barbuda',
            'states' => array(),
        ),

        'AR' => array(
            'name'   => 'Argentina',
            'states' => array(),
        ),

        'AM' => array(
            'name'   => 'Armenia (Հայաստան)',
            'states' => array(),
        ),

        'AW' => array(
            'name'   => 'Aruba',
            'states' => array(),
        ),

        'AU' => array(
            'name'   => 'Australia',
            'states' => array(),
        ),

        'AT' => array(
            'name'   => 'Austria (Österreich)',
            'states' => array(),
        ),

        'AZ' => array(
            'name'   => 'Azerbaijan (Azərbaycan)',
            'states' => array(),
        ),

        'BS' => array(
            'name'   => 'Bahamas',
            'states' => array(),
        ),

        'BH' => array(
            'name'   => 'Bahrain (البحرين)',
            'states' => array(),
        ),

        'BD' => array(
            'name'   => 'Bangladesh (বাংলাদেশ)',
            'states' => array(),
        ),

        'BB' => array(
            'name'   => 'Barbados',
            'states' => array(),
        ),

        'BY' => array(
            'name'   => 'Belarus (Белару́сь)',
            'states' => array(),
        ),

        'BE' => array(
            'name'   => 'Belgium (België)',
            'states' => array(),
        ),

        'BZ' => array(
            'name'   => 'Belize',
            'states' => array(),
        ),

        'BJ' => array(
            'name'   => 'Benin (Bénin)',
            'states' => array(),
        ),

        'BM' => array(
            'name'   => 'Bermuda',
            'states' => array(),
        ),

        'BT' => array(
            'name'   => 'Bhutan (འབྲུག་ཡུལ)',
            'states' => array(),
        ),

        'BO' => array(
            'name'   => 'Bolivia',
            'states' => array(),
        ),

        'BA' => array(
            'name'   => 'Bosnia and Herzegovina (Bosna i Hercegovina)',
            'states' => array(),
        ),

        'BW' => array(
            'name'   => 'Botswana',
            'states' => array(),
        ),

        'BV' => array(
            'name'   => 'Bouvet Island',
            'states' => array(),
        ),

        'BR' => array(
            'name'   => 'Brazil (Brasil)',
            'states' => array(),
        ),

        'IO' => array(
            'name'   => 'British Indian Ocean Territory',
            'states' => array(),
        ),

        'VG' => array(
            'name'   => 'British Virgin Islands',
            'states' => array(),
        ),

        'BN' => array(
            'name'   => 'Brunei (Brunei Darussalam)',
            'states' => array(),
        ),

        'BG' => array(
            'name'   => 'Bulgaria (България)',
            'states' => array(),
        ),

        'BF' => array(
            'name'   => 'Burkina Faso',
            'states' => array(),
        ),

        'BI' => array(
            'name'   => 'Burundi (Uburundi)',
            'states' => array(),
        ),

        'KH' => array(
            'name'   => 'Cambodia (Kampuchea)',
            'states' => array(),
        ),

        'CM' => array(
            'name'   => 'Cameroon (Cameroun)',
            'states' => array(),
        ),

        'CA' => array(
            'name'   => 'Canada',
            'states' => array(),
        ),

        'CV' => array(
            'name'   => 'Cape Verde (Cabo Verde)',
            'states' => array(),
        ),

        'KY' => array(
            'name'   => 'Cayman Islands',
            'states' => array(),
        ),

        'CF' => array(
            'name'   => 'Central African Republic (Centrafricaine)',
            'states' => array(),
        ),

        'TD' => array(
            'name'   => 'Chad (Tchad)',
            'states' => array(),
        ),

        'CL' => array(
            'name'   => 'Chile',
            'states' => array(),
        ),

        'CN' => array(
            'name'   => 'China (中国)',
            'states' => array(),
        ),

        'CX' => array(
            'name'   => 'Christmas Island',
            'states' => array(),
        ),

        'CC' => array(
            'name'   => 'Cocos [Keeling] Islands',
            'states' => array(),
        ),

        'CO' => array(
            'name'   => 'Colombia',
            'states' => array(),
        ),

        'KM' => array(
            'name'   => 'Comoros (Comores)',
            'states' => array(),
        ),

        'CD' => array(
            'name'   => 'Congo [DRC]',
            'states' => array(),
        ),

        'CG' => array(
            'name'   => 'Congo [Republic]',
            'states' => array(),
        ),

        'CK' => array(
            'name'   => 'Cook Islands',
            'states' => array(),
        ),

        'CR' => array(
            'name'   => 'Costa Rica',
            'states' => array(),
        ),

        'CI' => array(
            'name'   => 'Côte d’Ivoire',
            'states' => array(),
        ),

        'HR' => array(
            'name'   => 'Croatia (Hrvatska)',
            'states' => array(),
        ),

        'CU' => array(
            'name'   => 'Cuba',
            'states' => array(),
        ),

        'CY' => array(
            'name'   => 'Cyprus (Κυπρος)',
            'states' => array(),
        ),

        'CZ' => array(
            'name'   => 'Czech Republic (Česko)',
            'states' => array(),
        ),

        'DK' => array(
            'name'   => 'Denmark (Danmark)',
            'states' => array(),
        ),

        'DJ' => array(
            'name'   => 'Djibouti',
            'states' => array(),
        ),

        'DM' => array(
            'name'   => 'Dominica',
            'states' => array(),
        ),

        'DO' => array(
            'name'   => 'Dominican Republic',
            'states' => array(),
        ),

        'EC' => array(
            'name'   => 'Ecuador',
            'states' => array(),
        ),

        'EG' => array(
            'name'   => 'Egypt (مصر)',
            'states' => array(),
        ),

        'SV' => array(
            'name'   => 'El Salvador',
            'states' => array(),
        ),

        'GQ' => array(
            'name'   => 'Equatorial Guinea (Guinea Ecuatorial)',
            'states' => array(),
        ),

        'ER' => array(
            'name'   => 'Eritrea (Ertra)',
            'states' => array(),
        ),

        'EE' => array(
            'name'   => 'Estonia (Eesti)',
            'states' => array(),
        ),

        'ET' => array(
            'name'   => 'Ethiopia (Ityop\'iya)',
            'states' => array(),
        ),

        'FK' => array(
            'name'   => 'Falkland Islands [Islas Malvinas]',
            'states' => array(),
        ),

        'FO' => array(
            'name'   => 'Faroe Islands',
            'states' => array(),
        ),

        'FJ' => array(
            'name'   => 'Fiji',
            'states' => array(),
        ),

        'FI' => array(
            'name'   => 'Finland (Suomi)',
            'states' => array(),
        ),

        'FR' => array(
            'name'   => 'France',
            'states' => array(),
        ),

        'GF' => array(
            'name'   => 'French Guiana',
            'states' => array(),
        ),

        'PF' => array(
            'name'   => 'French Polynesia',
            'states' => array(),
        ),

        'TF' => array(
            'name'   => 'French Southern Territories',
            'states' => array(),
        ),

        'GA' => array(
            'name'   => 'Gabon',
            'states' => array(),
        ),

        'GM' => array(
            'name'   => 'Gambia',
            'states' => array(),
        ),

        'GE' => array(
            'name'   => 'Georgia (საქართველო)',
            'states' => array(),
        ),

        'DE' => array(
            'name'   => 'Germany (Deutschland)',
            'states' => array(),
        ),

        'GH' => array(
            'name'   => 'Ghana',
            'states' => array(),
        ),

        'GI' => array(
            'name'   => 'Gibraltar',
            'states' => array(),
        ),

        'GR' => array(
            'name'   => 'Greece (Ελλάς)',
            'states' => array(),
        ),

        'GL' => array(
            'name'   => 'Greenland',
            'states' => array(),
        ),

        'GD' => array(
            'name'   => 'Grenada',
            'states' => array(),
        ),

        'GP' => array(
            'name'   => 'Guadeloupe',
            'states' => array(),
        ),

        'GU' => array(
            'name'   => 'Guam',
            'states' => array(),
        ),

        'GT' => array(
            'name'   => 'Guatemala',
            'states' => array(),
        ),

        'GG' => array(
            'name'   => 'Guernsey',
            'states' => array(),
        ),

        'GN' => array(
            'name'   => 'Guinea (Guinée)',
            'states' => array(),
        ),

        'GW' => array(
            'name'   => 'Guinea-Bissau (Guiné-Bissau)',
            'states' => array(),
        ),

        'GY' => array(
            'name'   => 'Guyana',
            'states' => array(),
        ),

        'HT' => array(
            'name'   => 'Haiti (Haïti)',
            'states' => array(),
        ),

        'HM' => array(
            'name'   => 'Heard Island and McDonald Islands',
            'states' => array(),
        ),

        'HN' => array(
            'name'   => 'Honduras',
            'states' => array(),
        ),

        'HK' => array(
            'name'   => 'Hong Kong',
            'states' => array(),
        ),

        'HU' => array(
            'name'   => 'Hungary (Magyarország)',
            'states' => array(),
        ),

        'IS' => array(
            'name'   => 'Iceland (Ísland)',
            'states' => array(),
        ),

        'IN' => array(
            'name'   => 'India',
            'states' => array(),
        ),

        'ID' => array(
            'name'   => 'Indonesia',
            'states' => array(),
        ),

        'IR' => array(
            'name'   => 'Iran (ایران)',
            'states' => array(
                'azs' => 'آذربایجان شرقی',
                'azg' => 'آذربایجان غربی',
                'ard' => 'اردبیل',
                'esf' => 'اصفهان',
                'alb' => 'البرز',
                'ila' => 'ایلام',
                'bou' => 'بوشهر',
                'teh' => 'تهران',
                'cmb' => 'چهارمحال و بختیاری',
                'kjo' => 'خراسان جنوبی',
                'kra' => 'خراسان رضوی',
                'ksh' => 'خراسان شمالی',
                'kho' => 'خوزستان',
                'zan' => 'زنجان',
                'sem' => 'سمنان',
                'sis' => 'سیستان و بلوچستان',
                'far' => 'فارس',
                'gha' => 'قزوین',
                'gho' => 'قم',
                'kor' => 'کردستان',
                'ker' => 'کرمان',
                'sha' => 'کرمانشاه',
                'kbh' => 'کهگیلویه و بویراحمد',
                'gol' => 'گلستان',
                'gil' => 'گیلان',
                'lor' => 'لرستان',
                'maz' => 'مازندران',
                'mar' => 'مرکزی',
                'hor' => 'هرمزگان',
                'ham' => 'همدان',
                'yaz' => 'یزد',
            ),
        ),

        'IQ' => array(
            'name'   => 'Iraq (العراق)',
            'states' => array(),
        ),

        'IE' => array(
            'name'   => 'Ireland',
            'states' => array(),
        ),

        'IM' => array(
            'name'   => 'Isle of Man',
            'states' => array(),
        ),

        'IL' => array(
            'name'   => 'Israel (ישראל)',
            'states' => array(),
        ),

        'IT' => array(
            'name'   => 'Italy (Italia)',
            'states' => array(),
        ),

        'JM' => array(
            'name'   => 'Jamaica',
            'states' => array(),
        ),

        'JP' => array(
            'name'   => 'Japan (日本)',
            'states' => array(),
        ),

        'JE' => array(
            'name'   => 'Jersey',
            'states' => array(),
        ),

        'JO' => array(
            'name'   => 'Jordan (الاردن)',
            'states' => array(),
        ),

        'KZ' => array(
            'name'   => 'Kazakhstan (Қазақстан)',
            'states' => array(),
        ),

        'KE' => array(
            'name'   => 'Kenya',
            'states' => array(),
        ),

        'KI' => array(
            'name'   => 'Kiribati',
            'states' => array(),
        ),

        'KW' => array(
            'name'   => 'Kuwait (الكويت)',
            'states' => array(),
        ),

        'KG' => array(
            'name'   => 'Kyrgyzstan (Кыргызстан)',
            'states' => array(),
        ),

        'LA' => array(
            'name'   => 'Laos (ນລາວ)',
            'states' => array(),
        ),

        'LV' => array(
            'name'   => 'Latvia (Latvija)',
            'states' => array(),
        ),

        'LB' => array(
            'name'   => 'Lebanon (لبنان)',
            'states' => array(),
        ),

        'LS' => array(
            'name'   => 'Lesotho',
            'states' => array(),
        ),

        'LR' => array(
            'name'   => 'Liberia',
            'states' => array(),
        ),

        'LY' => array(
            'name'   => 'Libya (ليبيا)',
            'states' => array(),
        ),

        'LI' => array(
            'name'   => 'Liechtenstein',
            'states' => array(),
        ),

        'LT' => array(
            'name'   => 'Lithuania (Lietuva)',
            'states' => array(),
        ),

        'LU' => array(
            'name'   => 'Luxembourg (Lëtzebuerg)',
            'states' => array(),
        ),

        'MO' => array(
            'name'   => 'Macau',
            'states' => array(),
        ),

        'MK' => array(
            'name'   => 'Macedonia [FYROM] (Македонија)',
            'states' => array(),
        ),

        'MG' => array(
            'name'   => 'Madagascar (Madagasikara)',
            'states' => array(),
        ),

        'MW' => array(
            'name'   => 'Malawi',
            'states' => array(),
        ),

        'MY' => array(
            'name'   => 'Malaysia',
            'states' => array(),
        ),

        'MV' => array(
            'name'   => 'Maldives (ގުޖޭއްރާ ޔާއްރިހޫމްޖ)',
            'states' => array(),
        ),

        'ML' => array(
            'name'   => 'Mali',
            'states' => array(),
        ),

        'MT' => array(
            'name'   => 'Malta',
            'states' => array(),
        ),

        'MH' => array(
            'name'   => 'Marshall Islands',
            'states' => array(),
        ),

        'MQ' => array(
            'name'   => 'Martinique',
            'states' => array(),
        ),

        'MR' => array(
            'name'   => 'Mauritania (موريتانيا)',
            'states' => array(),
        ),

        'MU' => array(
            'name'   => 'Mauritius',
            'states' => array(),
        ),

        'YT' => array(
            'name'   => 'Mayotte',
            'states' => array(),
        ),

        'MX' => array(
            'name'   => 'Mexico (México)',
            'states' => array(),
        ),

        'FM' => array(
            'name'   => 'Micronesia',
            'states' => array(),
        ),

        'MD' => array(
            'name'   => 'Moldova',
            'states' => array(),
        ),

        'MC' => array(
            'name'   => 'Monaco',
            'states' => array(),
        ),

        'MN' => array(
            'name'   => 'Mongolia (Монгол Улс)',
            'states' => array(),
        ),

        'ME' => array(
            'name'   => 'Montenegro (Црна Гора)',
            'states' => array(),
        ),

        'MS' => array(
            'name'   => 'Montserrat',
            'states' => array(),
        ),

        'MA' => array(
            'name'   => 'Morocco (المغرب)',
            'states' => array(),
        ),

        'MZ' => array(
            'name'   => 'Mozambique (Moçambique)',
            'states' => array(),
        ),

        'MM' => array(
            'name'   => 'Myanmar [Burma] (Myanmar (Burma))',
            'states' => array(),
        ),

        'NA' => array(
            'name'   => 'Namibia',
            'states' => array(),
        ),

        'NR' => array(
            'name'   => 'Nauru (Naoero)',
            'states' => array(),
        ),

        'NP' => array(
            'name'   => 'Nepal (नेपाल)',
            'states' => array(),
        ),

        'NL' => array(
            'name'   => 'Netherlands (Nederland)',
            'states' => array(),
        ),

        'AN' => array(
            'name'   => 'Netherlands Antilles',
            'states' => array(),
        ),

        'NC' => array(
            'name'   => 'New Caledonia',
            'states' => array(),
        ),

        'NZ' => array(
            'name'   => 'New Zealand',
            'states' => array(),
        ),

        'NI' => array(
            'name'   => 'Nicaragua',
            'states' => array(),
        ),

        'NE' => array(
            'name'   => 'Niger',
            'states' => array(),
        ),

        'NG' => array(
            'name'   => 'Nigeria',
            'states' => array(),
        ),

        'NU' => array(
            'name'   => 'Niue',
            'states' => array(),
        ),

        'NF' => array(
            'name'   => 'Norfolk Island',
            'states' => array(),
        ),

        'MP' => array(
            'name'   => 'Northern Mariana Islands',
            'states' => array(),
        ),

        'KP' => array(
            'name'   => 'North Korea (조선)',
            'states' => array(),
        ),

        'NO' => array(
            'name'   => 'Norway (Norge)',
            'states' => array(),
        ),

        'OM' => array(
            'name'   => 'Oman (عمان)',
            'states' => array(),
        ),

        'PK' => array(
            'name'   => 'Pakistan (پاکستان)',
            'states' => array(),
        ),

        'PW' => array(
            'name'   => 'Palau (Belau)',
            'states' => array(),
        ),

        'PS' => array(
            'name'   => 'Palestinian Territories',
            'states' => array(),
        ),

        'PA' => array(
            'name'   => 'Panama (Panamá)',
            'states' => array(),
        ),

        'PG' => array(
            'name'   => 'Papua New Guinea',
            'states' => array(),
        ),

        'PY' => array(
            'name'   => 'Paraguay',
            'states' => array(),
        ),

        'PE' => array(
            'name'   => 'Peru (Perú)',
            'states' => array(),
        ),

        'PH' => array(
            'name'   => 'Philippines (Pilipinas)',
            'states' => array(),
        ),

        'PN' => array(
            'name'   => 'Pitcairn Islands',
            'states' => array(),
        ),

        'PL' => array(
            'name'   => 'Poland (Polska)',
            'states' => array(),
        ),

        'PT' => array(
            'name'   => 'Portugal',
            'states' => array(),
        ),

        'PR' => array(
            'name'   => 'Puerto Rico',
            'states' => array(),
        ),

        'QA' => array(
            'name'   => 'Qatar (قطر)',
            'states' => array(),
        ),

        'RE' => array(
            'name'   => 'Réunion',
            'states' => array(),
        ),

        'RO' => array(
            'name'   => 'Romania (România)',
            'states' => array(),
        ),

        'RU' => array(
            'name'   => 'Russia (Россия)',
            'states' => array(),
        ),

        'RW' => array(
            'name'   => 'Rwanda',
            'states' => array(),
        ),

        'SH' => array(
            'name'   => 'Saint Helena',
            'states' => array(),
        ),

        'KN' => array(
            'name'   => 'Saint Kitts and Nevis',
            'states' => array(),
        ),

        'LC' => array(
            'name'   => 'Saint Lucia',
            'states' => array(),
        ),

        'PM' => array(
            'name'   => 'Saint Pierre and Miquelon',
            'states' => array(),
        ),

        'VC' => array(
            'name'   => 'Saint Vincent and the Grenadines',
            'states' => array(),
        ),

        'WS' => array(
            'name'   => 'Samoa',
            'states' => array(),
        ),

        'SM' => array(
            'name'   => 'San Marino',
            'states' => array(),
        ),

        'ST' => array(
            'name'   => 'São Tomé and Príncipe',
            'states' => array(),
        ),

        'SA' => array(
            'name'   => 'Saudi Arabia (المملكة العربية السعودية)',
            'states' => array(),
        ),

        'SN' => array(
            'name'   => 'Senegal (Sénégal)',
            'states' => array(),
        ),

        'RS' => array(
            'name'   => 'Serbia (Србија)',
            'states' => array(),
        ),

        'CS' => array(
            'name'   => 'Serbia and Montenegro (Србија и Црна Гора)',
            'states' => array(),
        ),

        'SC' => array(
            'name'   => 'Seychelles',
            'states' => array(),
        ),

        'SL' => array(
            'name'   => 'Sierra Leone',
            'states' => array(),
        ),

        'SG' => array(
            'name'   => 'Singapore (Singapura)',
            'states' => array(),
        ),

        'SK' => array(
            'name'   => 'Slovakia (Slovensko)',
            'states' => array(),
        ),

        'SI' => array(
            'name'   => 'Slovenia (Slovenija)',
            'states' => array(),
        ),

        'SB' => array(
            'name'   => 'Solomon Islands',
            'states' => array(),
        ),

        'SO' => array(
            'name'   => 'Somalia (Soomaaliya)',
            'states' => array(),
        ),

        'ZA' => array(
            'name'   => 'South Africa',
            'states' => array(),
        ),

        'GS' => array(
            'name'   => 'South Georgia and the South Sandwich Islands',
            'states' => array(),
        ),

        'KR' => array(
            'name'   => 'South Korea (한국)',
            'states' => array(),
        ),

        'ES' => array(
            'name'   => 'Spain (España)',
            'states' => array(),
        ),

        'LK' => array(
            'name'   => 'Sri Lanka',
            'states' => array(),
        ),

        'SD' => array(
            'name'   => 'Sudan (السودان)',
            'states' => array(),
        ),

        'SR' => array(
            'name'   => 'Suriname',
            'states' => array(),
        ),

        'SJ' => array(
            'name'   => 'Svalbard and Jan Mayen',
            'states' => array(),
        ),

        'SZ' => array(
            'name'   => 'Swaziland',
            'states' => array(),
        ),

        'SE' => array(
            'name'   => 'Sweden (Sverige)',
            'states' => array(),
        ),

        'CH' => array(
            'name'   => 'Switzerland (Schweiz)',
            'states' => array(),
        ),

        'SY' => array(
            'name'   => 'Syria (سوريا)',
            'states' => array(),
        ),

        'TW' => array(
            'name'   => 'Taiwan (台灣)',
            'states' => array(),
        ),

        'TJ' => array(
            'name'   => 'Tajikistan (Тоҷикистон)',
            'states' => array(),
        ),

        'TZ' => array(
            'name'   => 'Tanzania',
            'states' => array(),
        ),

        'TH' => array(
            'name'   => 'Thailand (ราชอาณาจักรไทย)',
            'states' => array(),
        ),

        'TL' => array(
            'name'   => 'Timor-Leste',
            'states' => array(),
        ),

        'TG' => array(
            'name'   => 'Togo',
            'states' => array(),
        ),

        'TK' => array(
            'name'   => 'Tokelau',
            'states' => array(),
        ),

        'TO' => array(
            'name'   => 'Tonga',
            'states' => array(),
        ),

        'TT' => array(
            'name'   => 'Trinidad and Tobago',
            'states' => array(),
        ),

        'TN' => array(
            'name'   => 'Tunisia (تونس)',
            'states' => array(),
        ),

        'TR' => array(
            'name'   => 'Turkey (Türkiye)',
            'states' => array(),
        ),

        'TM' => array(
            'name'   => 'Turkmenistan (Türkmenistan)',
            'states' => array(),
        ),

        'TC' => array(
            'name'   => 'Turks and Caicos Islands',
            'states' => array(),
        ),

        'TV' => array(
            'name'   => 'Tuvalu',
            'states' => array(),
        ),

        'UM' => array(
            'name'   => 'U.S. Minor Outlying Islands',
            'states' => array(),
        ),

        'VI' => array(
            'name'   => 'U.S. Virgin Islands',
            'states' => array(),
        ),

        'UG' => array(
            'name'   => 'Uganda',
            'states' => array(),
        ),

        'UA' => array(
            'name'   => 'Ukraine (Україна)',
            'states' => array(),
        ),

        'AE' => array(
            'name'   => 'United Arab Emirates (الإمارات العربيّة المتّحدة)',
            'states' => array(),
        ),

        'GB' => array(
            'name'   => 'United Kingdom',
            'states' => array(),
        ),

        'US' => array(
            'name'   => 'United States',
            'states' => array(),
        ),

        'UY' => array(
            'name'   => 'Uruguay',
            'states' => array(),
        ),

        'UZ' => array(
            'name'   => 'Uzbekistan (O\'zbekiston)',
            'states' => array(),
        ),

        'VU' => array(
            'name'   => 'Vanuatu',
            'states' => array(),
        ),

        'VA' => array(
            'name'   => 'Vatican City (Città del Vaticano)',
            'states' => array(),
        ),

        'VE' => array(
            'name'   => 'Venezuela',
            'states' => array(),
        ),

        'VN' => array(
            'name'   => 'Vietnam (Việt Nam)',
            'states' => array(),
        ),

        'WF' => array(
            'name'   => 'Wallis and Futuna',
            'states' => array(),
        ),

        'EH' => array(
            'name'   => 'Western Sahara (الصحراء الغربية)',
            'states' => array(),
        ),

        'YE' => array(
            'name'   => 'Yemen (اليمن)',
            'states' => array(),
        ),

        'ZM' => array(
            'name'   => 'Zambia',
            'states' => array(),
        ),

        'ZW' => array(
            'name'   => 'Zimbabwe',
            'states' => array(),
        ),

    );

    final public function getCountries()
    {
        // Return all countries includes all of their data
        return $this->countries;
    }

    final public function getCountry($name = false, $nameOnly = false)
    {
        if(!is_string($name) || !strlen($name))
            return false;

        if(!isset($this->countries[$name]))
            return false;

        if(filter_var($nameOnly, FILTER_VALIDATE_BOOLEAN))
            return $this->countries[$name]['name'];

        return $this->countries[$name];;
    }

    final public function getStates($country = '')
    {
        $country = $this->getCountry($country);
        if($country === false)
            return false;

        return $country['states'];
    }

    final public function getState($country = '', $name = false)
    {
        $country = $this->getCountry($country);
        if($country === false)
            return false;

        if(!is_string($name) || !strlen($name))
            return false;

        if(!isset($country['states'][$name]))
            return false;

        return $country['states'][$name];
    }
}