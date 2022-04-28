��    8      �  O   �      �     �  �   �  �   �  B  �    �  s  �  d   c
    �
  +  �  �     #  �      �   
  2  �  u  �  Z   9  ^   �  8   �  �   ,  �   �  C   �  �   �  2  �  �   �  �  �  b   m  �  �     Y!     Z"     a"     f"     w"     �"     �"  =   �"     �"     �"  
   #  
   #     #     *#     =#     [#     d#  d   ~#  `   �#     D$  �   S$    I%  O   Z&    �&     �'     �'     �'  x  �'  �  Z)      �*  �    +  	  �+  y  �,  6  F.  �  }/  �   01  c  �1  �  *5  �   �7  k  �8  +  �9  �   ;  G  �;  �  &=  \   �>  \   /?  7   �?  �   �?  �   r@  T   fA  �   �A  �  �B  7  �F    �G  {   �I  �  OJ  F  �K     .M  
   5M     @M     ZM     sM     |M  C   �M     �M     �M     �M     N     N     &N  %   ;N     aN     oN  �   �N  �   O     �O  �   �O    �P  p   �Q    R     
S     S     &S  �  .S         3       1         ,         #          $       
   	      (          7       *                                      2           5   %                   4      "              -             /          '   !                   &   .      0          8               +          6   )    "%s" not a valid entry. A boolean that specifies whether to use the X-Forwarded-Host header in preference to the Host header. This should only be enabled if a proxy which sets this header is in use. A boolean that specifies whether to use the X-Forwarded-Port header in preference to the SERVER_PORT META variable. This should only be enabled if a proxy which sets this header is in use. USE_X_FORWARDED_HOST takes priority over this setting. A dictionary containing the settings for all databases to be used with Django. It is a nested dictionary whose contents map a database alias to a dictionary containing the options for an individual database. The DATABASES setting must configure a default database; any number of additional databases may also be specified. A list of IP addresses, as strings, that: Allow the debug() context processor to add some variables to the template context. Can use the admindocs bookmarklets even if not logged in as a staff user. Are marked as "internal" (as opposed to "EXTERNAL") in AdminEmailHandler emails. A list of all available languages. The list is a list of two-tuples in the format (language code, language name) for example, ('ja', 'Japanese'). This specifies which languages are available for language selection. Generally, the default value should suffice. Only set this setting if you want to restrict language selection to a subset of the Django-provided languages.  A list of authentication backend classes (as strings) to use when attempting to authenticate a user. A list of strings representing the host/domain names that this site can serve. This is a security measure to prevent HTTP Host header attacks, which are possible even under many seemingly-safe web server configurations. Values in this list can be fully qualified names (e.g. 'www.example.com'), in which case they will be matched against the request's Host header exactly (case-insensitive, not including port). A value beginning with a period can be used as a subdomain wildcard: '.example.com' will match example.com, www.example.com, and any other subdomain of example.com. A value of '*' will match anything; in this case you are responsible to provide your own validation of the Host header (perhaps in a middleware; if so this middleware must be listed first in MIDDLEWARE). A string representing the language code for this installation. This should be in standard language ID format. For example, U.S. English is "en-us". It serves two purposes: If the locale middleware isn't in use, it decides which translation is served to all users. If the locale middleware is active, it provides a fallback language in case the user's preferred language can't be determined or is not supported by the website. It also provides the fallback translation when a translation for a given literal doesn't exist for the user's preferred language. A string representing the time zone for this installation. Note that this isn't necessarily the time zone of the server. For example, one server may serve multiple Django-powered sites, each with a separate time zone setting. A tuple representing a HTTP header/value combination that signifies a request is secure. This controls the behavior of the request object’s is_secure() method. Warning: Modifying this setting can compromise your site’s security. Ensure you fully understand your setup before changing it. Default: '' (Empty string). Password to use for the SMTP server defined in EMAIL_HOST. This setting is used in conjunction with EMAIL_HOST_USER when authenticating to the SMTP server. If either of these settings is empty, Django won't attempt authentication. Default: '' (Empty string). Username to use for the SMTP server defined in EMAIL_HOST. If empty, Django won't attempt authentication. Default: '/accounts/login/' The URL where requests are redirected for login, especially when using the login_required() decorator. This setting also accepts named URL patterns which can be used to reduce configuration duplication since you don't have to define the URL in two places (settings and URLconf). Default: '/accounts/profile/' The URL where requests are redirected after login when the contrib.auth.login view gets no next parameter. This is used by the login_required() decorator, for example. This setting also accepts named URL patterns which can be used to reduce configuration duplication since you don't have to define the URL in two places (settings and URLconf). Default: 'django.contrib.sessions.backends.db'. Controls where Django stores session data. Default: 'django.core.mail.backends.smtp.EmailBackend'. The backend to use for sending emails. Default: 'localhost'. The host to use for sending email. Default: 'sessionid'. The name of the cookie to use for sessions.This can be whatever you want (as long as it's different from the other cookie names in your application). Default: 'webmaster@localhost' Default email address to use for various automated correspondence from the site manager(s). This doesn't include error messages sent to ADMINS and MANAGERS; for that, see SERVER_EMAIL. Default: 25. Port to use for the SMTP server defined in EMAIL_HOST. Default: 2621440 (i.e. 2.5 MB). The maximum size (in bytes) that an upload will be before it gets streamed to the file system. See Managing files for details. See also DATA_UPLOAD_MAX_MEMORY_SIZE. Default: 2621440 (i.e. 2.5 MB). The maximum size in bytes that a request body may be before a SuspiciousOperation (RequestDataTooBig) is raised. The check is done when accessing request.body or request.POST and is calculated against the total request size excluding any file upload data. You can set this to None to disable the check. Applications that are expected to receive unusually large form posts should tune this setting. The amount of request data is correlated to the amount of memory needed to process the request and populate the GET and POST dictionaries. Large requests could be used as a denial-of-service attack vector if left unchecked. Since web servers don't typically perform deep request inspection, it's not possible to perform a similar check at that level. See also FILE_UPLOAD_MAX_MEMORY_SIZE. Default: False. Whether to use a TLS (secure) connection when talking to the SMTP server. This is used for explicit TLS connections, generally on port 587. If you are experiencing hanging connections, see the implicit TLS setting EMAIL_USE_SSL. Default: False. Whether to use an implicit TLS (secure) connection when talking to the SMTP server. In most email documentation this type of TLS connection is referred to as SSL. It is generally used on port 465. If you are experiencing problems, see the explicit TLS setting EMAIL_USE_TLS. Note that EMAIL_USE_TLS/EMAIL_USE_SSL are mutually exclusive, so only set one of those settings to True. Default: None. Specifies a timeout in seconds for blocking operations like the connection attempt. Default: None. The URL where requests are redirected after a user logs out using LogoutView (if the view doesn't get a next_page argument). If None, no redirect will be performed and the logout view will be rendered. This setting also accepts named URL patterns which can be used to reduce configuration duplication since you don't have to define the URL in two places (settings and URLconf). Default: [] (Empty list). List of compiled regular expression objects representing User-Agent strings that are not allowed to visit any page, systemwide. Use this for bad robots/crawlers. This is only used if CommonMiddleware is installed (see Middleware). Django Edit Edit setting: %s Edit settings English Enter the new setting value. Is this settings being overridden by an environment variable? Name Namespace: %s, not found Namespaces Overridden Setting count Setting namespaces Setting updated successfully. Settings Settings in namespace: %s Settings inherited from an environment variable take precedence and cannot be changed in this view.  Settings updated, restart your installation and refresh your browser for changes to take effect. Smart settings The file storage engine to use when collecting static files with the collectstatic management command. A ready-to-use instance of the storage backend defined in this setting can be found at django.contrib.staticfiles.storage.staticfiles_storage. The full Python path of the WSGI application object that Django's built-in servers (e.g. runserver) will use. The django-admin startproject management command will create a simple wsgi.py file with an application callable in it, and point this setting to that application. The list of validators that are used to check the strength of user's passwords. URL to use when referring to static files located in STATIC_ROOT. Example: "/static/" or "http://static.example.com/" If not None, this will be used as the base path for asset definitions (the Media class) and the staticfiles app. It must end in a slash if set to a non-empty value. Value View settings Warning When set to True, if the request URL does not match any of the patterns in the URLconf and it doesn't end in a slash, an HTTP redirect is issued to the same URL with a slash appended. Note that the redirect may cause any data submitted in a POST request to be lost. The APPEND_SLASH setting is only used if CommonMiddleware is installed (see Middleware). See also PREPEND_WWW. Project-Id-Version: Mayan EDMS
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2022-02-03 10:14+0000
Last-Translator: Mathias Behrle <mathiasb@m9s.biz>, 2022
Language-Team: German (Germany) (https://www.transifex.com/rosarior/teams/13584/de_DE/)
Language: de_DE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 "%s" ist kein gültiger Eintrag. Ein Boolescher Wert, der angibt, ob der X-Forwarded-Host-Header dem Host-Header vorgezogen werden soll. Dies sollte nur aktiviert werden, wenn ein Proxy verwendet wird, der diesen Header setzt. Ein Boolescher Wert, der angibt, ob der X-Forwarded-Port-Header der SERVER_PORT META-Variablen vorgezogen werden soll. Dies sollte nur aktiviert werden, wenn ein Proxy verwendet wird, der diesen Header setzt. USE_X_FORWARDED_HOST hat Vorrang vor dieser Einstellung. Ein Dictionary welches eine Liste aller Einstellungen für die mit Django verwendeten Datenbanken enthält. Dieses Dictionary enthält Aliase zu einem weiteren Dictionaries, welche wiederum die Einstellungen für weitere Datenbanken enthalten. Die DATABASES Einstellung muss eine Standarddatenbank enthalten, es können aber auch beliebige weitere Datenbanken angegeben werden. Eine Liste von IP-Adressen (als Zeichenketten). Ermöglicht dem debug() context processor einige Variablen zum Vorlagenkontext hinzuzufügen. Kann admindocs bookmarklets benutzen, auch wenn nicht als Benutzer angemeldet. Werden in AdminEmailHandler E-Mails als "internal" (im Gegensatz zu "EXTERNAL") markiert. Liste von verfügbaren Sprachen. Die Liste setzt sich zusammen aus Zweier-Tupeln mit dem Format (Sprachencode, Sprachenname), z.B. ('ja', 'Japanese'). Diese Eintellung bestimmt die für die Auswahl verfügbaren Sprachen. Üblicherweise sollte die Einstellung des Standardwerts ausreichen. Benutzen Sie diese Einstellung nur, wenn Sie die Auswahl auf eine Untermenge der von Django zur Verfügung gestellten Sprachen einstellen wollen. Eine Liste der Authentifizierungs-Backend-Klassen (als Zeichenfolgen), die beim Versuch, einen Benutzer zu authentifizieren, verwendet werden sollen. Eine Liste aller Hosts bzw. Domainnamen, die mit dieser Seite funktionieren. Sie dient als  Sicherheitsmaßnahme um Angriffe über HTTP Hostheader zu verhindern, welche selbst unter vermeintlich sicheren Webserverkonfigurationen möglich sein können. Werte in dieser Liste können voll qualifizierte Domainnamen enthalten, die exakt gegen den Hostheader des Requests geprüft werden (ohne Prüfung von Groß-/Kleinschreibung und Port). Werte, die mit einem Punkt beginnen werden wie eine Subdomain Wildcard behandelt, so steht  z.B. '.example.com' für 'example.com' oder 'www.example.com' oder jede andere Subdomain von example.com. '*' steht als Wert für alles Mögliche, in diesem Fall sind Sie selbst verantwortlich für eine Validierung des Hostheaders (z.B. mittels einer Middleware. Sollte das der Fall sein, muss diese in MIDDLEWARE zuerst gelistet werden). Eine Zeichenkette, die den Sprachencode für diese Installation festlegt. Das Format sollte das Standardsprachenformat für IDs sein, z.B. "en-us" für U.S. English. Die Einstellung dient zwei Zwecken: Wenn die Lokalisierungs-Middleware nicht in Gebrauch ist, bestimmt sie die Übersetzung für alle Benutzer. Wenn die Lokalisierungs-Middleware in Gebrauch ist, bestimmt sie die Rückfallsprache, wenn die bevorzugte Sprache des Benutzers nicht ermittelt werden kann oder von der Website nicht unterstützt wird. Außerdem dient sie als Rückfallübersetzung, wenn eine Übersetzung in der vom Benutzer eingestellten Sprache nicht existiert. Eine Zeichenkette für die Zeitzone dieser Installation. Die muss nicht unbedingt die Zeitzone des Servers sein. Zum Beispiel kann ein Server mehrere Django-Sites bedienen, jede mit einer eigenen Zeitzoneneinstellung. Ein Tupel, das eine HTTP-Header / Wert-Kombination darstellt, die darstellt, dass eine Anfrage sicher ist Dies steuert das Verhalten der is_secure()-Methode der Anfrage. Warnung: Das Ändern dieser Einstellung kann die Sicherheit Ihrer Webseite gefährden. Stellen Sie sicher, dass Sie Ihr Setup vollständig verstanden haben, bevor Sie diese Einstellung ändern. Standard: " (Leere Zeichenfolge). Das Passwort zur Nutzung des SMTP-Servers, der in EMAIL_HOST definiert wurde. Diese Einstellung wird zusammen mit der für EMAIL_HOST_USER für die Authentifizierung am SMTP-Server genutzt. Wird eine der beiden leer gelassen, benutzt Django keine Authentifizierung. Standard: " (Leere Zeichenfolge). Der Benutzername zur Nutzung des SMTP-Servers, der in EMAIL_HOST definiert wurde. Wird die Einstellung leer gelassen, benutzt Django keine Authentifizierung. Standard: '/accounts/login/' Die URL zur Weiterleitung zum Login, insbesondere wenn z.B. der login_required() Decorator benutzt wird. Diese Einstellung akzeptiert auch die Eingabe von URL-Mustern, wenn z.B. mehrfach gleiche Konfigurationen an verschiedenen Stellen vermieden werden sollen (z.B. in 'Einstellungen' und URLconf). Standard: '/accounts/profile/' Die URL zur Weiterleitung von Requests nach erfolgreichem Login, insbesondere wenn die Ansicht contrib.auth.login keinen next Parameter übermittelt bekommt. Wird z.B. vom login_required() Decorator benutzt. Diese Einstellung akzeptiert auch die Eingabe von URL-Mustern, wenn mehrfach gleiche Konfigurationen an verschiedenen Stellen vermieden werden sollen (z.B. in 'Einstellungen' und URLconf). Standard: 'django.contrib.sessions.backends.db'. Steuert, wo Django Sitzungsdaten speichert. Standard: 'django.core.mail.backends.smtp.EmailBackend'. Das Backend für den E-Mailversand. Standard: 'localhost'. Der Host für den E-Mailversand. Standard: 'sessionid'. Der Name des Cookies, der für Sitzungen verwendet werden soll. Dieser kann beliebig sein (sofern er sich von den anderen Cookie-Namen unterscheidet). Standard: 'webmaster@localhost' Standard-E-Mailadresse, die für verschiedene automatische Korrespondenz durch die Sitemanager verwendet wird. Dies gilt nicht für Fehlerbenachrichtigungen an ADMINS and MANAGERS, für diese siehe SERVER_EMAIL. Standard: 25. Der für den in EMAIL_HOST definierten SMTP-Server zu benutzende Port. Standard: 2621440 (entspricht 2,5 MB). Die Maximalgröße eines Uploads in Bytes, bevor dieser zum Dateisystem gestreamt wird. Mehr Details im Kapitel zum Dateimanagement. Siehe auch: DATA_UPLOAD_MAX_MEMORY_SIZE. Standard: 2621440 (entspricht 2,5 MB). Die Maximalgröße eines Requestbodys in Bytes, für Werte darüber wird die Aktion 'SuspiciousOperation - RequestDataTooBig' ausgelöst. Diese Prüfung wird immer ausgeführt, wenn auf  'request.body' oder 'request.POST' zugegriffen wird. Dabei wird die Gesamtgröße des Requests berechnet ohne Einbezug der Größe einer eventuell hochzuladenen Datei. Die Einstellung 'None' deaktiviert diese Prüfung. Anwendungen, welche erwartungsgemäß umfangreichere Formularanfragen erhalten, sollten diese Einstellung entsprechend anpassen. Der Umfang an Requestdaten korreliert mit dem zur Verarbeitung benötigten Speicher und dem benötigten Speicher zur Befüllung der GET und POST Dictionaries. Sehr umfangreiche Requests könnten ungeprüft einem Denial-of-Service Angriff dienen. Da Webserver für gewöhnlich eine solch gründliche Prüfung der Anfragen nicht durchführen, ist eine vergleichbare Prüfung auf Dieser Ebene nicht möglich. Siehe auch: FILE_UPLOAD_MAX_MEMORY_SIZE. Standard: False. Definiert ob eine TLS Verbindung (sichere Verbindung) beim Verbinden zum SMTP-Server aufgebaut werden soll. Wird für explizite TLS-Verbindungen, üblicherweise über den Port 587, verwendet. Sollte es zu Verbindungsfehlern kommen, prüfen Sie bitte die implizite TLS Einstellung EMAIL_USE_SSL. Standard: False. Definiert ob eine TLS Verbindung (sichere Verbindung) beim Verbinden zum SMTP Server aufgebaut werden soll. Gelegentlich wird diese TLS Verbindung auch als SSL bezeichnet. Die Verbindung nutzt üblicherweise den Port 465. Sollte es zu Verbindungsfehlern kommen, prüfen Sie bitte die explizite TLS Einstellung EMAIL_USE_TLS. Beachten Sie bitte, dass immer nur eine Einstellung für EMAIL_USE_TLS oder EMAIL_USE_SSL genutzt werden kann, es sollte daher immer nur eine Einstellungen auf "True" gestellt werden. Standard: None (Keiner). Stellt einen Timeout (in Sekunden) für blockierende Operationen wie z.B. Verbindungsversuche ein. Standard: None. Die URL zu der Benutzer nach der Nutzung von LogoutView weitergeleitet werden (wenn das Formular kein Argument für nächste Seite enthält). Mit None wird keine Weiterleitung durchgeführt und das Logout-Formular dargestellt. Diese Einstellung akzeptiert auch 'named URL patterns', die benutzt werden können um die URL nur an einer Stelle zu definieren (anstatt Einstellungen und URLconf). Standard: [] (Leere Liste). Eine Liste von kompilierten regulären Ausdrücken (RegEx) welche diejenigen User-Agent Strings repräsentieren die systemweit keine einzige Seite aufrufen dürfen. Nutzen Sie diese gegen unerwünschte Robots oder Crawler. Wird nur genutzt wenn CommonMiddleware installiert ist (siehe: Middleware). Django Bearbeiten Einstellung %s bearbeiten Einstellungen bearbeiten Englisch Den neuen Wert eingeben. Wird diese Einstellung von einer Umgebungsvariablen überschrieben? Name Bereich %s nicht gefunden Namensräume Überschrieben Seitenzahl setzen Einstellungsbereiche Einstellung erfolgreich aktualisiert. Einstellungen Einstellungen für Bereich %s Einstellungen die durch Umgebungsvariablen vorgenommen wurden sind vorrangig und können auf dieser Seite nicht geändert werden. Einstellungen aktualisiert, starten Sie Ihre Installation neu und aktualisieren Sie Ihren Browser, damit die Änderungen wirksam werden. Einstellungen Das Backend für die Speicherung von statischen Dateien mit dem collectstatic Management-Kommando. Eine betriebsfertige Instanz des Speicherungsbackends kann in django.contrib.staticfiles.storage.staticfiles_storage gefunden werden. Der volle Pythonpfad für die WSGI application, das Django's built-in servers (e.g. runserver) benutzen wird. Das django-admin startproject Management-Kommando erstellt eine einfache wsgi.py Datei mit einem application callable, auf das diese Einstellung zeigt. Liste der Validatoren, die für die Überprüfung der Passwortstärke von Benutzerpasswörtern verwendet werden. URL für statische Dateien in STATIC_ROOT. Beispiel: "/static/" oder "http://static.example.com/". Wenn nicht None, dient diese URL als Basispfad für Medien (die Medienklasse) und die staticfiles App. Sie muss mit einem Schrägstrich enden, falls nicht leer. Wert Einstellungen anzeigen Warnung Falls "Wahr" (true), wird eine Umleitung (HTTP Redirect) auf die bereitgestellte URL mit angehängtem Slash erzeugt, sofern diese nicht bereits mit einem Slash endet oder einem Muster aus der URLconf entspricht. Bitte beachten Sie, dass die Umleitung den Verlust von Daten aus den übermittelten POST-Requests verursachen kann. Die Einstellung APPEND_SLASH wird nur benutzt, wenn CommonMiddleware installiert ist (siehe Middleware). Siehe auch PREPEND_WWW. 