mkdir -p ~/.postgresql && \
wget "https://storage.yandexcloud.net/cloud-certs/CA.pem" \
    --output-document ~/.postgresql/root.crt && \
chmod 0600 ~/.postgresql/root.crt
#Установите зависимости:

sudo apt update && sudo apt install --yes postgresql-client
#Подключитесь к базе данных:

psql "host=rc1b-8pmicg28wpx86q8d.mdb.yandexcloud.net,rc1d-2yvgdvzosrwjrezo.mdb.yandexcloud.net \
    port=6432 \
    sslmode=verify-full \
    dbname=db1 \
    user=user1 \
    target_session_attrs=read-write"
#После выполнения команды введите пароль пользователя для завершения процедуры подключения.

#Для проверки успешности подключения выполните запрос:

SELECT version();