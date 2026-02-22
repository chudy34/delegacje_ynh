#!/bin/bash
# _common.sh – zmienne współdzielone dla wszystkich skryptów Delegacje YunoHost

app=$YNH_APP_INSTANCE_NAME

# Ścieżki (ustawiane przez system zasobów YunoHost)
install_dir=$(ynh_app_setting_get --app="$app" --key="install_dir")
data_dir=$(ynh_app_setting_get    --app="$app" --key="data_dir")

# Domena i ścieżka
domain=$(ynh_app_setting_get --app="$app" --key="domain")
path=$(ynh_app_setting_get   --app="$app" --key="path")
path=${path%/}  # usuń trailing slash

# Porty (ustawiane przez resources.ports)
port_backend=$(ynh_app_setting_get  --app="$app" --key="port_backend")
port_frontend=$(ynh_app_setting_get --app="$app" --key="port_frontend")

# Baza danych (ustawiana przez resources.database)
db_name=$(ynh_app_setting_get --app="$app" --key="db_name")
db_user=$(ynh_app_setting_get --app="$app" --key="db_user")
db_pwd=$(ynh_app_setting_get  --app="$app" --key="db_pwd")

# Sekrety aplikacji
jwt_secret=$(ynh_app_setting_get     --app="$app" --key="jwt_secret")
encryption_key=$(ynh_app_setting_get --app="$app" --key="encryption_key")

# Ustawienia AI
ai_provider=$(ynh_app_setting_get    --app="$app" --key="ai_provider")
gemini_api_key=$(ynh_app_setting_get --app="$app" --key="gemini_api_key")
openai_api_key=$(ynh_app_setting_get --app="$app" --key="openai_api_key")
