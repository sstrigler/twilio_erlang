%% Twilio records
-record(twilio_recording,
        {
          recording_sid,
          recording_duration,
          recording_url
         }).

-record(twilio_inprogress,
        {
          digits,
          msg
         }).

-record(twilio_duration,
        {
          duration,
          call_duration
         }).

-record(twilio_called,
        {
          number       = [],
          city         = [],
          zip          = [],
          state        = [],
          country      = [],
          country_code = [],
          prefix       = []
         }).

-record(twilio_caller,
        {
          number       = [],
          city         = [],
          zip          = [],
          state        = [],
          country      = [],
          country_code = [],
          prefix       = []
         }).

-record(twilio_from,
        {
          number       = [],
          city         = [],
          zip          = [],
          state        = [],
          country      = [],
          country_code = [],
          prefix       = []
         }).

-record(twilio_to,
        {
          number       = [],
          city         = [],
          zip          = [],
          state        = [],
          country      = [],
          country_code = [],
          prefix       = []
         }).

-record(twilio,
        {
          account_sid     = [],
          application_sid = [],
          direction       = [],
          call_status     = [],
          call_sid        = [],
          api_version     = [],
          custom_params   = [],
          called          = null,
          caller          = null,
          from            = null,
          to              = null,
          call_duration   = null,
          inprogress      = null,
          recording       = null
         }).

% Country Codes For Lookup
% from http://countrycode.org/
-define(CCLOOKUP,
        [
         {"Afghanistan", "AFG", 93},
         {"Afghanistan", "AF", 93},
         {"Albania", "ALB", 355},
         {"Albania", "AL", 355},
         {"Algeria", "DZA", 213},
         {"Algeria", "DZ", 213},
         {"American Samoa", "ASM", 1684},
         {"American Samoa", "AS", 1684},
         {"Andorra", "AND", 376},
         {"Andorra", "AD", 376},
         {"Angola", "AGO", 244},
         {"Angola", "AO", 244},
         {"Anguilla", "AIA", 1264},
         {"Anguilla", "AI", 1264},
         {"Antarctica", "ATA", 672},
         {"Antarctica", "AQ", 672},
         {"Antigua and Barbuda", "ATG", 1268},
         {"Antigua and Barbuda", "AG", 1268},
         {"Argentina", "ARG", 54},
         {"Argentina", "AR", 54},
         {"Armenia", "ARM", 374},
         {"Armenia", "AM", 374},
         {"Aruba", "ABW", 297},
         {"Aruba", "AW", 297},
         {"Australia", "AUS", 61},
         {"Australia", "AU", 61},
         {"Austria", "AUT", 43},
         {"Austria", "AT", 43},
         {"Azerbaijan", "AZE", 994},
         {"Azerbaijan", "AZ", 994},
         {"Bahamas", "BHS", 1242},
         {"Bahamas", "BS", 1242},
         {"Bahrain", "BHR", 973},
         {"Bahrain", "BH", 973},
         {"Bangladesh", "BGD", 880},
         {"Bangladesh", "BD", 880},
         {"Barbados", "BRB", 1246},
         {"Barbados", "BB", 1246},
         {"Belarus", "BLR", 375},
         {"Belarus", "BY", 375},
         {"Belgium", "BEL", 32},
         {"Belgium", "BE", 32},
         {"Belize", "BLZ", 501},
         {"Belize", "BZ", 501},
         {"Benin", "BEN", 229},
         {"Benin", "BJ", 229},
         {"Bermuda", "BMU", 1441},
         {"Bermuda", "BM", 1441},
         {"Bhutan", "BTN", 975},
         {"Bhutan", "BT", 975},
         {"Bolivia", "BOL", 591},
         {"Bolivia", "BO", 591},
         {"Bosnia and Herzegovina", "BIH", 387},
         {"Bosnia and Herzegovina", "BA", 387},
         {"Botswana", "BWA", 267},
         {"Botswana", "BW", 267},
         {"Brazil", "BRA", 55},
         {"Brazil", "BR", 55},
         %{"British Indian Ocean Territory", "IOT", }", Diego Garcia
         %{"British Indian Ocean Territory", "IO", }",  Let them home
         {"British Virgin Islands", "VGB", 1284},
         {"British Virgin Islands", "VG", 1284},
         {"Brunei", "BRN", 673},
         {"Brunei", "BN", 673},
         {"Bulgaria", "BGR", 359},
         {"Bulgaria", "BG", 359},
         {"Burkina Faso", "BFA", 226},
         {"Burkina Faso", "BF", 226},
         {"Burma(Myanmar)", "MMR", 95},
         {"Burma(Myanmar)", "MM", 95},
         {"Burundi", "BDI", 257},
         {"Burundi", "BI", 257},
         {"Cambodia", "KHM", 855},
         {"Cambodia", "KH", 855},
         {"Cameroon", "CMR", 237},
         {"Cameroon", "CM", 237},
         {"Canada", "CAN", 1},
         {"Canada", "CA", 1},
         {"Cape Verde", "CPV", 238},
         {"Cape Verde", "CV", 238},
         {"Cayman Islands", "CYM", 1345},
         {"Cayman Islands", "KY", 1345},
         {"Central African Republic", "CAF", 236},
         {"Central African Republic", "CF", 236},
         {"Chad", "TCD", 235},
         {"Chad", "TD", 235},
         {"Chile", "CHL", 56},
         {"Chile", "CL", 56},
         {"China", "CHN", 86},
         {"China", "CN", 86},
         {"Christmas Island", "CXR", 61},
         {"Christmas Island", "CX", 61},
         {"Cocos (Keeling) Islands", "CCK", 61},
         {"Cocos (Keeling) Islands", "CC", 61},
         {"Colombia", "COL", 57},
         {"Colombia", "CO", 57},
         {"Comoros", "COM", 269},
         {"Comoros", "KM", 269},
         {"Cook Islands", "COK", 682},
         {"Cook Islands", "CK", 682},
         {"Costa Rica", "CRC", 506},
         {"Costa Rica", "CR", 506},
         {"Croatia", "HRV", 385},
         {"Croatia", "HR", 385},
         {"Cuba", "CUB", 53},
         {"Cuba", "CU", 53},
         {"Cyprus", "CYP", 357},
         {"Cyprus", "CY", 357},
         {"Czech Republic", "CZE", 420},
         {"Czech Republic", "CZ", 420},
         {"Democratic Republic of the Congo", "COD", 243},
         {"Democratic Republic of the Congo", "CD", 243},
         {"Denmark", "DNK", 45},
         {"Denmark", "DK", 45},
         {"Djibouti", "DJI", 253},
         {"Djibouti", "DJ", 253},
         {"Dominica", "DMA", 1767},
         {"Dominica", "DM", 1767},
         {"Dominican Republic", "DOM", 1809},
         {"Dominican Republic", "DO", 1809},
         {"Ecuador", "ECU", 593},
         {"Ecuador", "EC", 593},
         {"Egypt", "EGY", 20},
         {"Egypt", "EG", 20},
         {"El Salvador", "SLV", 503},
         {"El Salvador", "SV", 503},
         {"Equatoria Guinea", "GNQ", 240},
         {"Equatoria Guinea", "GQ", 240},
         {"Eritrea", "ERI", 291},
         {"Eritrea", "ER", 291},
         {"Estonia", "EST", 372},
         {"Estonia", "EE", 372},
         {"Ethiopia", "ETH", 251},
         {"Ethiopia", "ET", 251},
         {"Falkland Islands", "FLK", 500},
         {"Falkland Islands", "FK", 500},
         {"Faroe Islands", "FRO", 298},
         {"Faroe Islands", "FO", 298},
         {"Fiji", "FJI", 679},
         {"Fiji", "FJ", 679},
         {"Finland", "FIN", 358},
         {"Finland", "FI", 358},
         {"France", "FRA", 33},
         {"France", "FR", 33},
         {"French Polynesia", "PYF", 689},
         {"French Polynesia", "PF", 689},
         {"Gabon", "GAB", 241},
         {"Gabon", "GA", 241},
         {"Gambia", "GMB", 220},
         {"Gambia", "GM", 220},
         %{"Gaza Strip", "970", ??}", the blocade
         %{"Gaza Strip", "??,??}",   continues :(
         {"Georgia", "GEO", 995},
         {"Georgia", "GE", 995},
         {"Germany", "DEU", 49},
         {"Germany", "DE", 49},
         {"Ghana", "GHA", 233},
         {"Ghana", "GH", 233},
         {"Gibraltar", "GIB", 350},
         {"Gibraltar", "GI", 350},
         {"Greece", "GRC", 30},
         {"Greece", "GR", 30},
         {"Greenland", "GRL", 299},
         {"Greenland", "GL", 299},
         {"Grenada", "GRD", 1473},
         {"Grenada", "GD", 1473},
         {"Guam", "GUM", 1671},
         {"Guam", "GU", 1671},
         {"Guatemala", "GTM", 502},
         {"Guatemala", "GT", 502},
         {"Guinea", "GIN", 224},
         {"Guinea", "GN", 224},
         {"Guinea-Bissau", "GNB", 245},
         {"Guinea-Bissau", "GW", 245},
         {"Guyana", "GUY", 592},
         {"Guyana", "GY", 592},
         {"Haiti", "HTI", 509},
         {"Haiti", "HT", 509},
         {"Holy See (Vatican City)", "VAT", 39},
         {"Holy See (Vatican City)", "VA", 39},
         {"Honduras", "HND", 504},
         {"Honduras", "HN", 504},
         {"HongKong", "HKG", 852},
         {"HongKong", "HK", 852},
         {"Hungary", "HUN", 36},
         {"Hungary", "HU", 36},
         {"Iceland", "IS", 354},
         {"Iceland", "IS", 354},
         {"India", "IND", 91},
         {"India", "IN", 91},
         {"Indonesia", "IDN", 62},
         {"Indonesia", "ID", 62},
         {"Iran", "IRN", 98},
         {"Iran", "IR", 98},
         {"Iraq", "IRQ", 964},
         {"Iraq", "IQ", 964},
         {"Ireland", "IRL", 353},
         {"Ireland", "IE", 353},
         {"Isle of Man", "IMN", 44},
         {"Isle of Man", "IM", 44},
         {"Israel", "ISR", 972},
         {"Israel", "IL", 972},
         {"Italy", "ITA", 39},
         {"Italy", "IT", 39},
         {"Ivory Coast", "CIV", 225},
         {"Ivory Coast", "CI", 225},
         {"Jamaica", "JAM", 1876},
         {"Jamaica", "JM", 1876},
         {"Japan", "JPN", 81},
         {"Japan", "JP", 81},
         %{"Jersey", "JEY", }", my grannie went her
         %{"Jersey", "JE", }",  holidays there twice a year
         {"Jordan", "JOR", 962},
         {"Jordan", "JO", 962},
         {"Kazakhstan", "KAZ", 7},
         {"Kazakhstan", "KZ", 7},
         {"Kenya", "KEN", 254},
         {"Kenya", "KE", 254},
         {"Kiribati", "KIR", 686},
         {"Kiribati", "KI", 686},
         %{"Kosovo", "381", ??}", A short tour of
         %{"Kosovo", "??,??}",   geopolitics
         {"Kuwait", "KWT", 965},
         {"Kuwait", "KW", 965},
         {"Kyrgyzstan", "KGZ", 996},
         {"Kyrgyzstan", "KG", 996},
         {"Laos", "LAO", 856},
         {"Laos", "LA", 856},
         {"Latvia", "LVA", 371},
         {"Latvia", "LV", 371},
         {"Lebanon", "LBN", 961},
         {"Lebanon", "LB", 961},
         {"Lesotho", "LSO", 266},
         {"Lesotho", "LS", 266},
         {"Liberia", "LBR", 231},
         {"Liberia", "LR", 231},
         {"Libya", "LBY", 218},
         {"Libya", "LY", 218},
         {"Liechtenstein", "LIE", 423},
         {"Liechtenstein", "LI", 423},
         {"Lithuania", "LTU", 370},
         {"Lithuania", "LT", 370},
         {"Luxembourg", "LUX", 352},
         {"Luxembourg", "LU", 352},
         {"Macau", "MAC", 853},
         {"Macau", "MO", 853},
         {"Macedonia", "MKD", 389},
         {"Macedonia", "MK", 389},
         {"Madagascar", "MDG", 261},
         {"Madagascar", "MG", 261},
         {"Malawi", "MWI", 265},
         {"Malawi", "MW", 265},
         {"Malaysia", "MYS", 60},
         {"Malaysia", "MY", 60},
         {"Maldives", "MDV", 960},
         {"Maldives", "MV", 960},
         {"Mali", "MLI", 223},
         {"Mali", "ML", 223},
         {"Malta", "MLT", 356},
         {"Malta", "MT", 356},
         {"Marshall Islands", "MHL", 692},
         {"Marshall Islands", "MH", 692},
         {"Mauritania", "MRT", 222},
         {"Mauritania", "MR", 222},
         {"Mauritius", "MUS", 230},
         {"Mauritius", "MU", 230},
         {"Mayotte", "MYT", 262},
         {"Mayotte", "YT", 262},
         {"Mexico", "MEX", 52},
         {"Mexico", "MX", 52},
         {"Micronesia", "FSM", 691},
         {"Micronesia", "FM", 691},
         {"Moldova", "MDA", 373},
         {"Moldova", "MD", 373},
         {"Monaco", "MCO", 377},
         {"Monaco", "MC", 377},
         {"Mongolia", "MNG", 976},
         {"Mongolia", "MN", 976},
         {"Montenegro", "MNE", 382},
         {"Montenegro", "ME", 382},
         {"Montserrat", "MSR", 1664},
         {"Montserrat", "MS", 1664},
         {"Morocco", "MAR", 212},
         {"Morocco", "MA", 212},
         {"Mozambique", "MOZ", 258},
         {"Mozambique", "MZ", 258},
         {"Namibia", "NAM", 264},
         {"Namibia", "NA", 264},
         {"Nauru", "NRU", 674},
         {"Nauru", "NR", 674},
         {"Nepal", "NPL", 977},
         {"Nepal", "NP", 977},
         {"Netherlands", "NLD", 31},
         {"Netherlands", "NL", 31},
         {"Netherlands Antilles", "ANT", 599},
         {"Netherlands Antilles", "AN", 599},
         {"New Caledonia", "NCL", 687},
         {"New Caledonia", "NC", 687},
         {"New Zealand", "NZL", 64},
         {"New Zealand", "NZ", 64},
         {"Nicaragua", "NIC", 505},
         {"Nicaragua", "NI", 505},
         {"Niger", "NER", 227},
         {"Niger", "NE", 227},
         {"Nigeria", "NGA", 234},
         {"Nigeria", "NG", 234},
         {"Niue", "NIU", 683},
         {"Niue", "NU", 683},
         {"Norfolk Island", "NFK", 672 },
         {"Northern Mariana Islands", "MNP", 1670},
         {"Northern Mariana Islands", "MP", 1670},
         {"North Korea", "PRK", 850},
         {"North Korea", "KP", 850},
         {"Norway", "NOR", 47},
         {"Norway", "NO", 47},
         {"Oman", "OMN", 968},
         {"Oman", "OM", 968},
         {"Pakistan", "PAK", 92},
         {"Pakistan", "PK", 92},
         {"Palau", "PLW", 680},
         {"Palau", "PW", 680},
         {"Panama", "PAN", 507},
         {"Panama", "PA", 507},
         {"Papua New Guinea", "PNG", 675},
         {"Papua New Guinea", "PG", 675},
         {"Paraguay", "PRY", 595},
         {"Paraguay", "PY", 595},
         {"Peru", "PER", 51},
         {"Peru", "PE", 51},
         {"Philippines", "PHL", 63},
         {"Philippines", "PH", 63},
         {"Pitcairn Islands", "PCN", 870},
         {"Pitcairn Islands", "PN", 870},
         {"Poland", "POL", 48},
         {"Poland", "PL", 48},
         {"Portugal", "PRT", 351},
         {"Portugal", "PT", 351},
         {"Puerto Rico", "PRI", 1},
         {"Puerto Rico", "PR", 1},
         {"Qatar", "QAT", 974},
         {"Qatar", "QA", 974},
         {"Republic of the Congo", "COG", 242},
         {"Republic of the Congo", "CG", 242},
         {"Romania", "ROU", 40},
         {"Romania", "RO", 40},
         {"Russia", "RUS", 7},
         {"Russia", "RU", 7},
         {"Rwanda", "RWA", 250},
         {"Rwanda", "RW", 250},
         {"Saint Barthelemy", "BLM", 590},
         {"Saint Barthelemy", "BL", 590},
         {"Saint Helena", "SHN", 290},
         {"Saint Helena", "SH", 290},
         {"Saint Kitts and Nevis", "KNA", 1869},
         {"Saint Kitts and Nevis", "KN", 1869},
         {"Saint Lucia", "LCA", 1758},
         {"Saint Lucia", "LC", 1758},
         {"Saint Martin", "MAF", 1599},
         {"Saint Martin", "MF", 1599},
         {"Saint Pierre and Miquelon", "SPM", 508},
         {"Saint Pierre and Miquelon", "PM", 508},
         {"Saint Vincent and the Grenadines", "VCT", 1784},
         {"Saint Vincent and the Grenadines", "VC", 1784},
         {"Samoa", "WSM", 685},
         {"Samoa", "WS", 685},
         {"San Marino", "SMR", 378},
         {"San Marino", "SM", 378},
         {"Sao Tome and Principe", "STP", 239},
         {"Sao Tome and Principe", "ST", 239},
         {"Saudi Arabia", "SAU", 966},
         {"Saudi Arabia", "SA", 966},
         {"Senegal", "SEN", 221},
         {"Senegal", "SN", 221},
         {"Serbia", "SRB", 381},
         {"Serbia", "RS", 381},
         {"Seychelles", "SYC", 248},
         {"Seychelles", "SC", 248},
         {"Sierra Leone", "SLE", 232},
         {"Sierra Leone", "SL", 232},
         {"Singapore", "SGP", 65},
         {"Singapore", "SG", 65},
         {"Slovakia", "SVK", 421},
         {"Slovakia", "SK", 421},
         {"Slovenia", "SVN", 386},
         {"Slovenia", "SI", 386},
         {"Solomon Islands", "SLB", 677},
         {"Solomon Islands", "SB", 677},
         {"Somalia", "SOM", 252},
         {"Somalia", "SO", 252},
         {"South Africa", "ZAF", 27},
         {"South Africa", "ZA", 27},
         {"South Korea", "KOR", 82},
         {"South Korea", "KR", 82},
         {"Spain", "ESP", 34},
         {"Spain", "ES", 34},
         {"Sri Lanka", "LKA", 94},
         {"Sri Lanka", "LK", 94},
         {"Sudan", "SDN", 249},
         {"Sudan", "SD", 249},
         {"Suriname", "SUR", 597},
         {"Suriname", "SR", 597},
         %{"Svalbard", "SJM", ??}", No calls from
         %{"Svalbard", "SJ", ??}",  Iorek Byrnison then
         {"Swaziland", "SWZ", 268},
         {"Swaziland", "SZ", 268},
         {"Sweden", "SWE", 46},
         {"Sweden", "SE", 46},
         {"Switzerland", "CHE", 41},
         {"Switzerland", "CH", 41},
         {"Syria", "SYR", 963},
         {"Syria", "SY", 963},
         {"Taiwan", "TWN", 886},
         {"Taiwan", "TW", 886},
         {"Tajikistan", "TJK", 992},
         {"Tajikistan", "TJ", 992},
         {"Tanzania", "TZA", 255},
         {"Tanzania", "TZ", 255},
         {"Thailand", "THA", 66},
         {"Thailand", "TH", 66},
         {"Timor-Leste", "TLS", 670},
         {"Timor-Leste", "TL", 670},
         {"Togo", "TGO", 228},
         {"Togo", "TG", 228},
         {"Tokelau", "TKL", 690},
         {"Tokelau", "TK", 690},
         {"Tonga", "TON", 676},
         {"Tonga", "TO", 676},
         {"Trinidad and Tobago", "TTO", 1868}, % big up to Mayaro
         {"Trinidad and Tobago", "TT", 1868},  % and Guayaguayare
         {"Tunisia", "TUN", 216},
         {"Tunisia", "TN", 216},
         {"Turkey", "TUR", 90},
         {"Turkey", "TR", 90},
         {"Turkmenistan", "TKM", 993},
         {"Turkmenistan", "TM", 993},
         {"Turks and Caicos Islands", "TCA", 1649},
         {"Turks and Caicos Islands", "TC", 1649},
         {"Tuvalu", "TUV", 688},
         {"Tuvalu", "TV", 688},
         {"Uganda", "UGA", 256},
         {"Uganda", "UG", 256},
         {"Ukraine", "UKR", 380},
         {"Ukraine", "UA", 380},
         {"United Arab Emirates", "ARE", 971},
         {"United Arab Emirates", "AE", 971},
         {"United Kingdom", "GBR", 44},
         {"United Kingdom", "GB", 44},
         {"United States", "USA", 1},
         {"United States", "US", 1},
         {"Uruguay", "URY", 598},
         {"Uruguay", "UY", 598},
         {"US Virgin Islands", "VIR", 1340},
         {"US Virgin Islands", "VI", 1340},
         {"Uzbekistan", "UZB", 998},
         {"Uzbekistan", "UZ", 998},
         {"Vanuatu", "VUT", 678},
         {"Vanuatu", "VU", 678},
         {"Venezuela", "VEN", 58},
         {"Venezuela", "VE", 58},
         {"Vietnam", "VNM", 84},
         {"Vietnam", "VN", 84},
         {"Wallis and Futuna", "WLF", 681},
         {"Wallis and Futuna", "WF", 681},
         %{"West Bank", "??", 970}",      Free Palestine!
         %{"Western Sahara", "ESH", ??}", and the poor
         %{"Western Sahara", "EH", ??}",  bloody Tuareg
         {"Yemen", "YEM", 967},
         {"Yemen", "YE", 967},
         {"Zambia", "ZMB", 260},
         {"Zambia", "ZM", 260},
         {"Zimbabwe", "ZWE", 263},
         {"Zimbabwe", "ZW", 263}
        ]).
