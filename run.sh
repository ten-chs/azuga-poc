#!/bin/bash

#wget the cookie
session=$(wget --debug https://apps.azuga.com/azuga --debug -S 2>&1 | tee output.txt | grep -m 1 -o 'JSESSIONID=.*' | cut -d ';' -f 1 | cut -d '=' -f 2)

#curl login
curl 'https://apps.azuga.com/azuga/j_spring_security_check?back_url=https://apps.azuga.com/azuga/admin.html?l=en_US#Devices' \
  -H 'authority: apps.azuga.com' \
  -H 'pragma: no-cache' \
  -H 'cache-control: no-cache' \
  -H 'sec-ch-ua: "Google Chrome";v="93", " Not;A Brand";v="99", "Chromium";v="93"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'origin: https://apps.azuga.com' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-user: ?1' \
  -H 'sec-fetch-dest: document' \
  -H 'referer: https://apps.azuga.com/azuga/login.html' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H "cookie: JSESSIONID=${session}; G_ENABLED_IDPS=google; _ga=GA1.3.996744039.1632171487; _gid=GA1.3.1849584780.1632171487; _gid=GA1.2.2012017189.1632171487; _gcl_au=1.1.1502327679.1632171487; _mkto_trk=id:003-XNB-951&token:_mch-azuga.com-1632171487315-87431; Pod=NODE_3; org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE=en-US; p=[object Object]; b=1,2,3,4,41,106,113,116,117,124,142,150,155,174,177,178,179,191,192,195,196,200,204,227,232,290,298,300,302,305,314,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,360,361,362,367,377,378,379,380,385,387,389,394,415,416,420,422,427,431,433,437,438,439,440,441,442,443,444,446,447,448,449,450,451,453,454,455,456,459,460,462,464,465,466,467,470,475,476,478; r=42,43,44,45,46,48,49,51,60,61,62,76,81,82,83,100,134,173,276,283,288,289,292,294,299,313,317,323,325,326,327,369,374,390,418,421,435,436,457; u=; _gat_UA-40333098-1=1; _dc_gtm_UA-37189921-1=1; _uetsid=9e639ac01bac11ec97e211b475fd1ef5; _uetvid=74b540801a5511eca8a9e3072fbca9a8; _ga=GA1.2.1831615936.1632171487; _ga_LTEVWT33K1=GS1.1.1632492094.7.1.1632492095.59" \
  --data-raw 'j_username=admin%40tennacam.thehartford.com&j_password=FlDM40Z_mvOeLT8&loginType=1&LOGIN=LOGIN' \
  --compressed

#curl deviceList
curl 'https://apps.azuga.com/azuga/getDeviceList.json' \
  -H 'authority: apps.azuga.com' \
  -H 'pragma: no-cache' \
  -H 'cache-control: no-cache' \
  -H 'sec-ch-ua: "Google Chrome";v="93", " Not;A Brand";v="99", "Chromium";v="93"' \
  -H 'accept: application/json, text/javascript, */*; q=0.01' \
  -H 'content-type: application/json' \
  -H 'x-requested-with: XMLHttpRequest' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'origin: https://apps.azuga.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://apps.azuga.com/azuga/admin.html?l=en_US' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H "cookie: JSESSIONID=${session}; G_ENABLED_IDPS=google; _ga=GA1.3.996744039.1632171487; _gid=GA1.3.1849584780.1632171487; _gid=GA1.2.2012017189.1632171487; _gcl_au=1.1.1502327679.1632171487; _mkto_trk=id:003-XNB-951&token:_mch-azuga.com-1632171487315-87431; Pod=NODE_3; org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE=en-US; p=[object Object]; b=1,2,3,4,41,106,113,116,117,124,142,150,155,174,177,178,179,191,192,195,196,200,204,227,232,290,298,300,302,305,314,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,360,361,362,367,377,378,379,380,385,387,389,394,415,416,420,422,427,431,433,437,438,439,440,441,442,443,444,446,447,448,449,450,451,453,454,455,456,459,460,462,464,465,466,467,470,475,476,478; r=42,43,44,45,46,48,49,51,60,61,62,76,81,82,83,100,134,173,276,283,288,289,292,294,299,313,317,323,325,326,327,369,374,390,418,421,435,436,457; u=; _gat_UA-40333098-1=1; _dc_gtm_UA-37189921-1=1; _uetsid=9e639ac01bac11ec97e211b475fd1ef5; _uetvid=74b540801a5511eca8a9e3072fbca9a8; _ga=GA1.2.1831615936.1632171487; _ga_LTEVWT33K1=GS1.1.1632492094.7.1.1632492095.59" \
  --data-raw '{}' \
  --compressed \
  > results.json

#reformat deviceList
#let deviceData = json.serverResponse.result.map((d) => {return {serial: d.serialNum, firmware: d.firmwareVersion, config: d.configVersion}; });
node process.js

#cleanup log files
rm azuga
rm output.txt
rm results.json
