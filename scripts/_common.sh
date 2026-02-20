#!/bin/bash

# Helper to load settings safely
load_app_settings() {
    # Get basic app settings
    install_dir=$(ynh_app_setting_get --app=$app --key=install_dir)
    data_dir=$(ynh_app_setting_get --app=$app --key=data_dir)
    domain=$(ynh_app_setting_get --app=$app --key=domain)
    path=$(ynh_app_setting_get --app=$app --key=path)

    # Get ports
    port_backend=$(ynh_app_setting_get --app=$app --key=port_backend)
    port_frontend=$(ynh_app_setting_get --app=$app --key=port_frontend)

    # Get DB settings from resources
    db_name=$(ynh_app_setting_get --app=$app --key=db_name)
    db_user=$(ynh_app_setting_get --app=$app --key=db_user)
    db_pwd=$(ynh_app_setting_get --app=$app --key=db_pwd)

    # Get AI settings
    ai_provider=$(ynh_app_setting_get --app=$app --key=ai_provider)
    gemini_api_key=$(ynh_app_setting_get --app=$app --key=gemini_api_key)
}

# Check if paths are not empty to avoid 'chown' errors
validate_paths() {
    if [ -z "$install_dir" ] || [ -z "$data_dir" ]; then
        ynh_die --message="Critical error: install_dir or data_dir is empty. Check YunoHost settings."
    fi
}
