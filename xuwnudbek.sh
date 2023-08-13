#!/usr/bin/bash

function main {

    flutter create $1 --platforms=android,ios

    cd $1

    #Create the folder structure

    #Home page
    home="lib/pages/home"
    mkdir -p $home
    touch $home/home.dart

    home_provider="lib/pages/home/provider"
    mkdir -p $home_provider
    touch $home_provider/home_provider.dart

    #Other Pages
    pages=("assets" "models" "services" "utils")

    for page in "${pages[@]}"; do
        case $page in
        "utils")
            mkdir -p lib/$page/widgets
            touch lib/$page/rgb_colors.dart
            ;;
        "assets")
            mkdir -p $page/images
            mkdir -p $page/fonts
            ;;
        *)
            mkdir -p lib/$page
            ;;
        esac
    done

    clear
    #Additions
    packages=("provider" "get")
    flutter pub add ${packages[@]}

    #show timer for 3 seconds
    clear

    # clear
    echo "  Loyiha yaratildi: $1"
    echo "  Kerakli paketlar qo'shildi: provider, get"
    echo "  Gazini bosing !"

}

#Lets create the project folder

if [ -z "$1" ]; then
    echo "Loyiha nomini kiritmadinu bratishka :("
    exit 1
else
    #Check if flutter is installed
    if command -v flutter &>/dev/null; then
        main $1
    else
        echo "Vaay blin, flutterni o'rnatmapsanu :("
        echo "Davay, manoni yoz:"
        echo "sudo snap install flutter --classic"
    fi
### End of if
fi
