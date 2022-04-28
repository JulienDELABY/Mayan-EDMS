��    7      �  I   �      �     �  �   �  �   x  B  l    �  s  �  d   ;
    �
  +  �  �   �  #  �    �  �   �  2  h  u  �  Z     ^   l  8   �  �     �   �  C   �  �   �  2  �  �   �  �  �  b   E  �  �     1!     2"     9"     >"     O"     ]"  =   z"     �"     �"  
   �"  
   �"     �"     �"     #     +#     4#  d   N#  `   �#     $  �   #$    %  O   *&    z&     �'     �'     �'  x  �'    *)  &   6+  �   ]+    #,  o  1-  n  �.  }  0  u   �1  �  2  �  �5  �   w8  @  t9     �:  �   �;  z  }<  �  �=  g   �?  q   '@  L   �@  �   �@  �   �A  J   �B    �B  �  �C    �G  �  �H  k   hJ  �  �J  M  �L     	N     N     N     -N  %   ?N  A   eN     �N  $   �N     �N     �N     �N     O  %   O  
   CO  !   NO  o   pO  �   �O     hP    �P    �Q  G   �R  `  �R  	   VT     `T     tT  �  �T         1   .   &                   *           ,   4          3          "       2   /                      +         #            %          $   !              5          
         7       (          	           '            6       -      0              )       "%s" not a valid entry. A boolean that specifies whether to use the X-Forwarded-Host header in preference to the Host header. This should only be enabled if a proxy which sets this header is in use. A boolean that specifies whether to use the X-Forwarded-Port header in preference to the SERVER_PORT META variable. This should only be enabled if a proxy which sets this header is in use. USE_X_FORWARDED_HOST takes priority over this setting. A dictionary containing the settings for all databases to be used with Django. It is a nested dictionary whose contents map a database alias to a dictionary containing the options for an individual database. The DATABASES setting must configure a default database; any number of additional databases may also be specified. A list of IP addresses, as strings, that: Allow the debug() context processor to add some variables to the template context. Can use the admindocs bookmarklets even if not logged in as a staff user. Are marked as "internal" (as opposed to "EXTERNAL") in AdminEmailHandler emails. A list of all available languages. The list is a list of two-tuples in the format (language code, language name) for example, ('ja', 'Japanese'). This specifies which languages are available for language selection. Generally, the default value should suffice. Only set this setting if you want to restrict language selection to a subset of the Django-provided languages.  A list of authentication backend classes (as strings) to use when attempting to authenticate a user. A list of strings representing the host/domain names that this site can serve. This is a security measure to prevent HTTP Host header attacks, which are possible even under many seemingly-safe web server configurations. Values in this list can be fully qualified names (e.g. 'www.example.com'), in which case they will be matched against the request's Host header exactly (case-insensitive, not including port). A value beginning with a period can be used as a subdomain wildcard: '.example.com' will match example.com, www.example.com, and any other subdomain of example.com. A value of '*' will match anything; in this case you are responsible to provide your own validation of the Host header (perhaps in a middleware; if so this middleware must be listed first in MIDDLEWARE). A string representing the language code for this installation. This should be in standard language ID format. For example, U.S. English is "en-us". It serves two purposes: If the locale middleware isn't in use, it decides which translation is served to all users. If the locale middleware is active, it provides a fallback language in case the user's preferred language can't be determined or is not supported by the website. It also provides the fallback translation when a translation for a given literal doesn't exist for the user's preferred language. A string representing the time zone for this installation. Note that this isn't necessarily the time zone of the server. For example, one server may serve multiple Django-powered sites, each with a separate time zone setting. A tuple representing a HTTP header/value combination that signifies a request is secure. This controls the behavior of the request object’s is_secure() method. Warning: Modifying this setting can compromise your site’s security. Ensure you fully understand your setup before changing it. Default: '' (Empty string). Password to use for the SMTP server defined in EMAIL_HOST. This setting is used in conjunction with EMAIL_HOST_USER when authenticating to the SMTP server. If either of these settings is empty, Django won't attempt authentication. Default: '' (Empty string). Username to use for the SMTP server defined in EMAIL_HOST. If empty, Django won't attempt authentication. Default: '/accounts/login/' The URL where requests are redirected for login, especially when using the login_required() decorator. This setting also accepts named URL patterns which can be used to reduce configuration duplication since you don't have to define the URL in two places (settings and URLconf). Default: '/accounts/profile/' The URL where requests are redirected after login when the contrib.auth.login view gets no next parameter. This is used by the login_required() decorator, for example. This setting also accepts named URL patterns which can be used to reduce configuration duplication since you don't have to define the URL in two places (settings and URLconf). Default: 'django.contrib.sessions.backends.db'. Controls where Django stores session data. Default: 'django.core.mail.backends.smtp.EmailBackend'. The backend to use for sending emails. Default: 'localhost'. The host to use for sending email. Default: 'sessionid'. The name of the cookie to use for sessions.This can be whatever you want (as long as it's different from the other cookie names in your application). Default: 'webmaster@localhost' Default email address to use for various automated correspondence from the site manager(s). This doesn't include error messages sent to ADMINS and MANAGERS; for that, see SERVER_EMAIL. Default: 25. Port to use for the SMTP server defined in EMAIL_HOST. Default: 2621440 (i.e. 2.5 MB). The maximum size (in bytes) that an upload will be before it gets streamed to the file system. See Managing files for details. See also DATA_UPLOAD_MAX_MEMORY_SIZE. Default: 2621440 (i.e. 2.5 MB). The maximum size in bytes that a request body may be before a SuspiciousOperation (RequestDataTooBig) is raised. The check is done when accessing request.body or request.POST and is calculated against the total request size excluding any file upload data. You can set this to None to disable the check. Applications that are expected to receive unusually large form posts should tune this setting. The amount of request data is correlated to the amount of memory needed to process the request and populate the GET and POST dictionaries. Large requests could be used as a denial-of-service attack vector if left unchecked. Since web servers don't typically perform deep request inspection, it's not possible to perform a similar check at that level. See also FILE_UPLOAD_MAX_MEMORY_SIZE. Default: False. Whether to use a TLS (secure) connection when talking to the SMTP server. This is used for explicit TLS connections, generally on port 587. If you are experiencing hanging connections, see the implicit TLS setting EMAIL_USE_SSL. Default: False. Whether to use an implicit TLS (secure) connection when talking to the SMTP server. In most email documentation this type of TLS connection is referred to as SSL. It is generally used on port 465. If you are experiencing problems, see the explicit TLS setting EMAIL_USE_TLS. Note that EMAIL_USE_TLS/EMAIL_USE_SSL are mutually exclusive, so only set one of those settings to True. Default: None. Specifies a timeout in seconds for blocking operations like the connection attempt. Default: None. The URL where requests are redirected after a user logs out using LogoutView (if the view doesn't get a next_page argument). If None, no redirect will be performed and the logout view will be rendered. This setting also accepts named URL patterns which can be used to reduce configuration duplication since you don't have to define the URL in two places (settings and URLconf). Default: [] (Empty list). List of compiled regular expression objects representing User-Agent strings that are not allowed to visit any page, systemwide. Use this for bad robots/crawlers. This is only used if CommonMiddleware is installed (see Middleware). Django Edit Edit setting: %s Edit settings Enter the new setting value. Is this settings being overridden by an environment variable? Name Namespace: %s, not found Namespaces Overridden Setting count Setting namespaces Setting updated successfully. Settings Settings in namespace: %s Settings inherited from an environment variable take precedence and cannot be changed in this view.  Settings updated, restart your installation and refresh your browser for changes to take effect. Smart settings The file storage engine to use when collecting static files with the collectstatic management command. A ready-to-use instance of the storage backend defined in this setting can be found at django.contrib.staticfiles.storage.staticfiles_storage. The full Python path of the WSGI application object that Django's built-in servers (e.g. runserver) will use. The django-admin startproject management command will create a simple wsgi.py file with an application callable in it, and point this setting to that application. The list of validators that are used to check the strength of user's passwords. URL to use when referring to static files located in STATIC_ROOT. Example: "/static/" or "http://static.example.com/" If not None, this will be used as the base path for asset definitions (the Media class) and the staticfiles app. It must end in a slash if set to a non-empty value. Value View settings Warning When set to True, if the request URL does not match any of the patterns in the URLconf and it doesn't end in a slash, an HTTP redirect is issued to the same URL with a slash appended. Note that the redirect may cause any data submitted in a POST request to be lost. The APPEND_SLASH setting is only used if CommonMiddleware is installed (see Middleware). See also PREPEND_WWW. Project-Id-Version: Mayan EDMS
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2022-02-03 10:14+0000
Last-Translator: Tomasz Szymanowicz <alakdae@gmail.com>, 2022
Language-Team: Polish (https://www.transifex.com/rosarior/teams/13584/pl/)
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=4; plural=(n==1 ? 0 : (n%10>=2 && n%10<=4) && (n%100<12 || n%100>14) ? 1 : n!=1 && (n%10>=0 && n%10<=1) || (n%10>=5 && n%10<=9) || (n%100>=12 && n%100<=14) ? 2 : 3);
 „%s” nie jest prawidłowym wpisem. Wartość logiczna określająca, czy używać nagłówka X-Forwarded-Host zamiast nagłówka Host. Należy to włączyć tylko wtedy, gdy używany jest serwer proxy, który ustawia ten nagłówek. Wartość logiczna określająca, czy używać nagłówka X-Forwarded-Port zamiast zmiennej META SERVER_PORT. Należy to włączyć tylko wtedy, gdy używany jest serwer proxy, który ustawia ten nagłówek. USE_X_FORWARDED_HOST ma pierwszeństwo przed tym ustawieniem. Słownik zawierający ustawienia dla wszystkich baz danych, które będą używane z Django. Jest to zagnieżdżony słownik, którego zawartość odwzorowuje alias bazy danych na słownik zawierający opcje dla pojedynczej bazy danych. Ustawienie DATABASES musi skonfigurować domyślną bazę danych; można również podać dowolną liczbę dodatkowych baz danych. Lista adresów IP jako ciągów znaków: Zezwól procesorowi kontekstowemu debug() na dodanie niektórych zmiennych do kontekstu szablonu. Może korzystać z bookmarkletów admindocs, nawet jeśli nie jest zalogowany jako użytkownik personelu. Są oznaczone jako „wewnętrzne” (w przeciwieństwie do „ZEWNĘTRZNE”) w wiadomościach e-mail AdminEmailHandler. Lista wszystkich dostępnych języków. Lista jest listą dwóch krotek w formacie (kod języka, nazwa języka), na przykład („ja”, „japoński”). Określa, które języki są dostępne do wyboru języka. Ogólnie wartość domyślna powinna wystarczyć. Ustaw to ustawienie tylko, jeśli chcesz ograniczyć wybór języka do podzbioru języków dostarczonych przez Django. Lista klas silnika uwierzytelniania (w postaci ciągów) wykorzystywana podczas próby uwierzytelnienia użytkownika. Lista ciągów znaków reprezentujących nazwy hosta / domeny, które może obsługiwać ta strona. Jest to środek bezpieczeństwa zapobiegający atakom na nagłówki hosta HTTP, które są możliwe nawet przy wielu pozornie bezpiecznych konfiguracjach serwera WWW. Wartości na tej liście mogą być w pełni kwalifikowanymi nazwami (np. „www.example.com”), w którym to przypadku zostaną one dokładnie dopasowane do nagłówka hosta żądania (bez rozróżniania wielkości liter, bez portu). Wartość zaczynającą się od kropki można wykorzystać jako symbol zastępczy subdomeny: „.example.com” będzie pasował do example.com, www.example.com i każdej innej subdomeny example.com. Wartość „*” pasuje do wszystkiego; w takim przypadku jesteś odpowiedzialny za zapewnienie własnej walidacji nagłówka hosta (być może w oprogramowaniu pośrednim; jeśli tak, to oprogramowanie pośrednie musi być wymienione najpierw w MIDDLEWARE). Ciąg reprezentujący kod języka dla tej instalacji. Powinien być w standardowym formacie identyfikatora języka. Na przykład amerykański angielski to „en-us”. Służy on dwóm celom: jeśli lokalne oprogramowanie pośredniczące nie jest używane, decyduje, które tłumaczenie zostanie dostarczone wszystkim użytkownikom. Jeśli lokalne oprogramowanie pośredniczące jest aktywne, zapewnia język zastępczy na wypadek, gdyby preferowany język użytkownika nie mógł zostać określony lub nie jest obsługiwany przez witrynę internetową. Zapewnia również tłumaczenie awaryjne, gdy tłumaczenie dla danego literału nie istnieje dla preferowanego języka użytkownika. Ciąg reprezentujący strefę czasową dla tej instalacji. Pamiętaj, że niekoniecznie jest to strefa czasowa serwera. Na przykład jeden serwer może obsługiwać wiele witryn obsługiwanych przez Django, każde z osobnym ustawieniem strefy czasowej. Krotka reprezentująca kombinację nagłówka / wartości HTTP, która oznacza żądanie, jest bezpieczna. Kontroluje to zachowanie metody is_secure() obiektu żądania. Ostrzeżenie: zmiana tego ustawienia może zagrozić bezpieczeństwu witryny. Przed zmianą upewnij się, że w pełni rozumiesz swoją konfigurację. Domyślnie: „” (pusty ciąg). Hasło do użycia dla serwera SMTP zdefiniowanego w EMAIL_HOST. To ustawienie jest używane w połączeniu z EMAIL_HOST_USER podczas uwierzytelniania na serwerze SMTP. Jeśli jedno z tych ustawień jest puste, Django nie podejmie próby uwierzytelnienia. Domyślnie: „” (pusty ciąg). Nazwa użytkownika używana dla serwera SMTP zdefiniowanego w EMAIL_HOST. Jeśli pusty, Django nie podejmie próby uwierzytelnienia. Domyślnie: „/account/login/” Adres URL, na który żądania są przekierowywane w celu zalogowania, szczególnie gdy używa się dekoratora login_required(). To ustawienie akceptuje również wzorce nazwanych adresów URL, których można użyć do ograniczenia duplikacji konfiguracji, ponieważ nie trzeba definiować adresu URL w dwóch miejscach (ustawienia i URLconf). Domyślnie: „/account/profile/” Adres URL, na który żądania są przekierowywane po zalogowaniu, gdy widok contrib.auth.login nie otrzymuje następnego parametru. Jest to wykorzystywane na przykład przez dekorator login_required(). To ustawienie akceptuje również wzorce nazwanych adresów URL, których można użyć do ograniczenia duplikacji konfiguracji, ponieważ nie trzeba definiować adresu URL w dwóch miejscach (ustawienia i URLconf). Domyślnie: „django.contrib.sessions.backends.db”. Kontroluje, gdzie Django przechowuje dane sesji. Domyślnie: „django.core.mail.backends.smtp.EmailBackend”. Backend używany do wysyłania wiadomości e-mail. Domyślnie: „localhost”. Host używany do wysyłania wiadomości e-mail. Domyślnie: „sessionid”. Nazwa pliku cookie wykorzystywanego podczas sesji. Może to być dowolna nazwa (pod warunkiem, że różni się od innych nazw plików cookie w aplikacji). Domyślnie: „webmaster@localhost” Domyślny adres e-mail używany do różnych automatycznych korespondencji od managerów witryn. Nie obejmuje to komunikatów o błędach wysyłanych do ADMINS i MANAGERS; w tym celu zobacz SERVER_EMAIL. Domyślnie: 25. Port używany przez serwer SMTP zdefiniowany w EMAIL_HOST. Domyślnie: 2621440 (tj. 2,5 MB). Maksymalny rozmiar (w bajtach), jaki będzie przesyłany, zanim zostanie przesłany strumieniowo do systemu plików. Szczegółowe informacje można znaleźć w części Zarządzanie plikami. Zobacz także DATA_UPLOAD_MAX_MEMORY_SIZE. Domyślnie: 2621440 (tj. 2,5 MB). Maksymalny rozmiar w bajtach, jaki może znajdować się w treści żądania, przed wyrzuceniem SuspiciousOperation (RequestDataTooBig). Sprawdzanie odbywa się podczas uzyskiwania dostępu do request.body lub request.POST i jest obliczane na podstawie całkowitego rozmiaru żądania z wyłączeniem danych do przesłania pliku. Możesz ustawić Brak, aby wyłączyć sprawdzanie. Aplikacje, które powinny otrzymywać niezwykle duże posty, powinny dostosować to ustawienie. Ilość danych żądania jest skorelowana z ilością pamięci potrzebnej do przetworzenia żądania i zapełnienia słowników GET i POST. Duże żądania mogą zostać wykorzystane jako wektor ataku typu „denial-of-service”, jeśli nie zostaną zaznaczone. Ponieważ serwery sieciowe zwykle nie przeprowadzają głębokiej inspekcji żądań, nie można przeprowadzić podobnej kontroli na tym poziomie. Zobacz także FILE_UPLOAD_MAX_MEMORY_SIZE. Domyślnie: False. Określa, czy używać połączenia TLS (bezpiecznego) podczas połączenia z serwerem SMTP. Służy to do jawnych połączeń TLS, zwykle na porcie 587. Jeśli występują zawieszające się połączenia, zobacz niejawne ustawienie TLS EMAIL_USE_SSL. Domyślnie: False. Określa, czy używać niejawnego połączenia TLS (bezpiecznego) podczas rozmowy z serwerem SMTP. W większości dokumentów e-mail ten typ połączenia TLS jest określany jako SSL. Jest zwykle używany na porcie 465. Jeśli masz problemy, zobacz jawne ustawienie TLS EMAIL_USE_TLS. Pamiętaj, że EMAIL_USE_TLS / EMAIL_USE_SSL wzajemnie się wykluczają, więc ustaw tylko jedno z tych ustawień na True. Domyślnie: brak. Określa limit czasu w sekundach dla operacji blokowania, takich jak próba połączenia. Domyślnie: brak. Adres URL, na który żądania są przekierowywane po wylogowaniu użytkownika za pomocą LogoutView (jeśli widok nie otrzymuje argumentu następnej_strony). Jeśli Brak, przekierowanie nie zostanie wykonane, a widok wylogowania zostanie wyświetlony. To ustawienie akceptuje również wzorce nazwanych adresów URL, których można użyć do ograniczenia duplikacji konfiguracji, ponieważ nie trzeba definiować adresu URL w dwóch miejscach (ustawienia i URLconf). Domyślnie: [] (pusta lista). Lista skompilowanych obiektów wyrażeń regularnych reprezentujących ciągi User-Agent, które nie mogą odwiedzać żadnej strony, w całym systemie. Użyj tego w przypadku złych robotów/crawlerów. Jest to używane tylko wtedy, gdy zainstalowano CommonMiddleware (patrz Oprogramowanie pośrednie). Django Edytuj Edytuj ustawienie: %s Edytuj ustawienia Wprowadź nową wartość ustawienia. Czy te ustawienia są zastępowane przez zmienną środowiskową? Nazwa Przestrzeń nazw: %s, nie znaleziono Przestrzenie nazw Zastąpione Liczba ustawień Przestrzenie nazw ustawień Ustawienie zaktualizowane pomyślnie. Ustawienia Ustawienia w przestrzeni nazw: %s Ustawienia dziedziczone ze zmiennej środowiskowej mają pierwszeństwo i nie można ich zmienić w tym widoku. Ustawienia zostały zaktualizowane. Uruchom ponownie instalację i odśwież przeglądarkę internetową, aby zmiany przyniosły efekt. Inteligentne ustawienia Mechanizm przechowywania plików używany podczas zbierania plików statycznych za pomocą komendy managestatic management. Gotową do użycia instancję zaplecza pamięci zdefiniowaną w tym ustawieniu można znaleźć na stronie django.contrib.staticfiles.storage.staticfiles_storage. Pełna ścieżka do Pythona obiektu aplikacji WSGI, z którego będą korzystać wbudowane serwery Django (np. Runserver). Polecenie zarządzania django-admin startproject utworzy prosty plik wsgi.py z aplikacją do wywołania i wskaże to ustawienie dla tej aplikacji. Lista walidatorów używanych do sprawdzania siły haseł użytkownika. Adres URL używany w odniesieniu do plików statycznych znajdujących się w STATIC_ROOT. Przykład: „/static/” lub „http://static.example.com/” Jeśli nie, to zostanie on użyty jako podstawowa ścieżka do definicji zasobów (klasa Media) i aplikacji staticfiles. Musi kończyć się ukośnikiem, jeśli jest ustawiona na niepustą wartość. Wartość Przegląd ustawień Ostrzeżenie Po ustawieniu wartości True, jeśli adres URL żądania nie pasuje do żadnego z wzorców w URLconf i nie kończy się ukośnikiem, przekierowanie HTTP jest wysyłane do tego samego adresu URL z dołączonym ukośnikiem. Pamiętaj, że przekierowanie może spowodować utratę danych przesłanych w żądaniu POST. Ustawienie APPEND_SLASH jest używane tylko wtedy, gdy zainstalowano CommonMiddleware (patrz Middleware). Zobacz także PREPEND_WWW. 