# Instalacion entorno desarrollo

Dentro de la instancia quatrobus, seguir los pasos de confluence, guia quatrobus, solo para saber la estructura de carpetas y descargar el repositorio de quatrobus
Dentro de la instancia web, seguir los pasos de confluence, guia phalcon, solo estructura de carpetas y descargar repositorios

> Nota: Solo necesitas mapeas las estructuras de las aplicaciones dentro de las instancias como si fuesen cada una un servidor

### Hosts

Registrar hosts en etc apuntando al ip local
```
127.0.0.1	quatrobus
127.0.0.1	quaweb.phalcon
```

### Comandos
El comando make help listara los comandos necesarios para correr las aplicaciones
```
$ make help
usage: make [target]

targets:
help                  Show this help message                 
up                    Start the containers                   
down                  Stop the containers                    
ps                    list containers into compose           
ps-all                list all containers into compose       
restart               Restart the containers                 
build                 Rebuilds all the containers            
ssh-quatrobus         ssh's into the instance quatrobus      
ssh-web               ssh's into the instance web            
ssh-mariadb           ssh's into the instance web            
quaweb-prepare        prepare quaweb, install node__modules  
quaweb-run            run quaweb in localhost                8080
quaweb-build          build quaweb for deploy   
```

Por primera vez lo que necesitas ejecutar es `make build` para construir los servicios. Luego los comandos mas usados seran `make up`, `make down`, `make quaweb-run` y `make quaweb-build`. Cada una de estas indican su uso en la descripcion.

### Instancia Quatrobus
```
git clone git@bitbucket.org:mcets/quatrobus.git

mkdir quatrobus/3.2/application/cache
mkdir quatrobus/3.2/application/logs
chmod g+r quatrobus/3.2/application/cache quatrobus/3.2/application/logs

mkdir quatrobus/3.2/upload
mkdir quatrobus/3.2/upload/barcode
mkdir quatrobus/3.2/upload/qr_manual
mkdir quatrobus/3.2/upload/qr_package
mkdir quatrobus/3.2/upload/qr_ticket
mkdir quatrobus/3.2/upload/ticket
```

### Instancia Web
```
git clone git@bitbucket.org:mcets/bts_v2.git

mv bts_v2 bts.phalcon

mkdir bts.phalcon/app/cache/compiled_views/BTS
mkdir bts.phalcon/app/cache/compiled_views/QUAWEB

mkdir mcets
mkdir mcets.upload
mkdir mcets.logs

cp -r bts.phalcon/project_example mcets/project_example
mv mcets/project_example mcets/BTS

git clone git@bitbucket.org:mcets/quaweb.git mcets/quaweb
mv mcets/quaweb mcets/QUAWEB

mkdir phalcon.modules
mkdir phalcon.modules/jose
mkdir phalcon.modules/mpdf
mkdir phalcon.modules/swiftmailer
mkdir phalcon.modules/authorizenet-sdk
mkdir phalcon.modules/paypal-sdk
mkdir phalcon.modules/paypalnvp-sdk
mkdir phalcon.modules/culqi-sdk

```

### Archivos de configuracion por aplicacion

**quatrobus**
``` php
<?php
class db_config {
	public static $db_conection_config = array('quatrobus' => array(
			'siteName' => 'Autobuses Veracruz',
			'serverDBName' => 'mariadb', # Usar el nombre del servicio del contenedor mariadb o cualquier ip al que desees conectarte
			// 'serverDBName' => '192.168.0.30', IP LOCAL o CUALQUIER OTRA
			'serverPort' => '3306',
			'dbName' => 'qveracruz_M',
			'dbNameEtl' => '',
			'dbUser' => 'root',
			'dbPassword' => '280510jt',
			'skin' => 'veracruz',
			'website' => 'avexpress.mx',
			'lang' => 'es-quatrobus',
			'timeZone' => 'America/Mexico_City',
			'defaultIndex' => 'public/login/index',
			'email_system' => 'quatrobus@mcets-inc.com',
			'contactEmail' => 'ventas01@smilebus.com.mx',
			'contactEmailBlacklist' => 'quatrobus@mcets-inc.com',
			'contactCompany' => 'Autobuses Veracruz',
			'contactPhone' => '56 2558 5392 | 55 4944 5404',
			'contactAddress' => '',
			'sessionLifeTime' => 3600,
			'sessionDBLifeTime' => 0,
			'companyRuc' => '',
			'companyAddress' => 'Mexico',
			'paypal_environment' => '',
			'paypal_username' => '',
			'paypal_password' => '',
			'paypal_signature' => '.',
			'paypal_merchant_email' => 'quatrobus@mcets-inc.com',
			'paypal_gateway' => 'paypal_instant',
			'paypal_merchant_partner' => 'PayPal',
			'paypal_merchant_vendor' => 'tinkupe',
			'paypal_merchant_user' => 'tinkupe',
			'paypal_merchant_password' => '04379800ha',
			'paypal_method' => 'paypal_payflow_instant',
			'paypal_merchant_web_user' => 'tinkupe',
			'paypal_merchant_web_password' => '04379800ha',
			'authorize_environment' => Kohana::DEVELOPMENT,
			'environment' => Kohana::DEVELOPMENT,
			'environment_database' => Kohana::DEVELOPMENT,
			'environment_reports' => Kohana::DEVELOPMENT,
			'domain_data_reports' => 'privado.avexpress.mx',
			'key_system_customer' => '',
			'root_user' => '0',
			'googleVoice_username' => '',
			'googleVoice_password' => '',
			'pf_name' => 'Pasajero Frecuente Mcets',
			'meta_description_content' => 'Mcets Transporte Turístico',
			'meta_viewport_content' => 'width=device-width, user-scalable=no',
			'meta_author_content' => 'MotorCoach eTicket Solutions',
			'own_homepage' => 'Yes',
			'path_csv_files' => "/var/www/quatrobus/",
			'async_domain' => "privado.avexpress.mx",
			'reportingServiceURL' => '',
			'quaweb'=>'web.avexpress.mx'
		)
	);
}
```

**quaweb.phalcon**
``` php
<?php
return [
    IDX_CLIENT_INFO => [
        IDX_CLI_INFO_NAME => "MotorCoach eTicket Solutions"
        , IDX_CLI_INFO_ADDRESS => "8301 Lakeview Parkway Suite 111-136 - ROWLETT, TX 75088"
        , IDX_CLI_INFO_PHONE => "214-771-8049"
        , IDX_CLI_INFO_SUPPORT_PHONE => "214-534-9445"
        , IDX_CLI_INFO_CONTACT_INFO => "info@mcets-inc.com"
    ]
    , IDX_APPLICATION_INFO => [
        IDX_APP_INFO_SITE_NAME => "QUAWEB MASTER"
        , IDX_APP_CODE_NAME => "Tunqui"
        , IDX_APP_CHANGE_LOG_LINK => "quaweb.mcets-inc.com"
        , IDX_APP_INFO_VERSION => "0.1"
        , IDX_APP_SKIN => 'chayo'
        , IDX_APP_DEFAULT_LANG => "en"
        , IDX_APP_TIME_ZONE => "America/New_York"
        , IDX_APP_EMAIL => "bts@bts.com"
        , IDX_APP_API_URL => "http://quatrobus/public/externalfriendly/"
        , IDX_APP_ENVIRONMENT => APP_ENV_PRODUCTION
    ]
    , IDX_DATABASE => [
        APP_ENV_DEVELOPMENT => [
            IDX_DB_ADAPTER => "Mysql"
            , IDX_DB_NAME => "bts_prototype_tmp"
            , IDX_DB_HOST_IP => "localhost"
            , IDX_DB_USER => "root"
            , IDX_DB_PASSWORD => "08Dallas2013"
            , IDX_DB_PORT => "3306"
        ]
    ]
    , IDX_MAIL => [
        APP_ENV_DEVELOPMENT => [
            IDX_MAIL_HOST => "smtp.gmail.com"
            , IDX_MAIL_PORT => 465
            , IDX_MAIL_SECURITY => IDX_MAIL_SECURITY_SSL
            , IDX_MAIL_USER => "quatrobus@mcets-inc.com"
            , IDX_MAIL_PASSWORD => "qwerty123a"
        ]
    ],
    IDX_SERVICES => [
        APP_ENV_DEVELOPMENT => [
            IDX_SERVICES_GMS => [
                IDX_SERVICES_URL => "http://gms.phalcon/integration/export/"
            ]
        ]
    ]
];
```