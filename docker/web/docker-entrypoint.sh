#!/usr/bin/env bash

chown -R www-data:www-data /var/www/html/wp-content/uploads

/bin/bash -c "twit /srv/templates/wp-config.php.tpl /var/www/html/wp-config.php -n --params='{
	\"db_name\":          \"$WORDPRESS_DB_NAME\",
	\"db_user\":          \"$WORDPRESS_DB_USER\",
	\"db_password\":      \"$WORDPRESS_DB_PASSWORD\",
	\"db_host\":          \"$WORDPRESS_DB_HOST\",
	\"wp_home\":          \"$WORDPRESS_WP_HOME\",
	\"wp_siteurl\":       \"$WORDPRESS_WP_SITEURL\",
	\"auth_key\":         \"$WORDPRESS_AUTH_KEY\",
	\"secure_auth_key\":  \"$WORDPRESS_SECURE_AUTH_KEY\",
	\"logged_in_key\":    \"$WORDPRESS_LOGGED_IN_KEY\",
	\"nonce_key\":        \"$WORDPRESS_NONCE_KEY\",
	\"auth_salt\":        \"$WORDPRESS_AUTH_SALT\",
	\"secure_auth_salt\": \"$WORDPRESS_SECURE_AUTH_SALT\",
	\"logged_in_salt\":   \"$WORDPRESS_LOGGED_IN_SALT\",
	\"nonce_salt\":       \"$WORDPRESS_NONCE_SALT\",
	\"table_prefix\":     \"$WORDPRESS_TABLE_PREFIX\",
	\"force_ssl\":        ${WORDPRESS_FORCE_SSL:-false}
}'"

exec "$@"
