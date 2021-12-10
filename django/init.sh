#!/bin/bash

function ft_init(){
	echo "Project name: "
	read PROJECT_NAME
	echo "App name: "
	read APP_NAME

	virtualenv -p python3 .
	source bin/activate
	pip install --upgrade pip
	pip3 install django
	pip3 install pyyaml
	pip3 freeze > requirements.txt
	mkdir secrets
	touch secrets/memo.yaml
	touch secrets/secret.yaml
	touch secrets/secret_dev.yaml
	if [ ! -f .gitignore ]; then
		touch .gitignore
	fi
	if [ -f .DS_Store ]; then
		echo .DS_Store >> .gitignore
	fi
	cat django/init_modules/init/gitignore.txt > .gitignore
	cat django/init_modules/init/secret.txt > secrets/secret.yaml
	cat django/init_modules/init/secret_dev.txt > secrets/secret_dev.yaml
	django-admin startproject $PROJECT_NAME .
	python3 manage.py startapp $APP_NAME
	python3 manage.py makemigrations
	python3 manage.py migrate
	if [ ! `cat $PROJECT_NAME/settings.py | grep 'import os'` ]; then
		chmod 755 $PROJECT_NAME/settings.py
		sed -e 's/from pathlib import Path/import os\nfrom pathlib import Path/g' ${PROJECT_NAME}/settings.py > ${PROJECT_NAME}/settings_tmp.py
		rm -f $PROJECT_NAME/settings.py
		chmod 755 $PROJECT_NAME/settings_tmp.py
		cp $PROJECT_NAME/settings_tmp.py $PROJECT_NAME/settings.py
		rm -f $PROJECT_NAME/settings_tmp.py
	fi
	sed -i -e "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['*'\]/g" ${PROJECT_NAME}/settings.py
	sed -i -e "s/'DIRS': \[\]/'DIRS': \[os.path.normpath(os.path.join(BASE_DIR, 'templates')),\]/g" ${PROJECT_NAME}/settings.py
	mkdir templates
	if [ ! `cat $PROJECT_NAME/settings.py | grep "os.path.join(BASE_DIR, 'static')"` ]; then
		sed -i -e "s/STATIC_URL = '\/static\/'/STATIC_URL = '\/static\/'\nSTATICFILES_DIRS = ( os.path.join(BASE_DIR, 'static'), )/g" ${PROJECT_NAME}/settings.py
	fi
		mkdir static
	if [ `cat $PROJECT_NAME/settings.py | grep 'django-insecure'` ]; then
		sed -i -e "s/SECRET_KEY = */SECRET_KEY = os.environ\['DJANGO_SECRET_KEY'\]/g" ${PROJECT_NAME}/settings.py
	fi
	rm -f $PROJECT_NAME/settings.py-e
	echo "Please setting DJANGO_SECRET_KEY"
	sleep 10
	python3 manage.py createsuperuser
}

function ft_image(){
	echo "Project name: "
	read PROJECT_NAME
	source bin/activate
	pip3 install pillow
	pip3 freeze > requirements.txt
	mkdir media
	if [ ! -d $PROJECT_NAME ]; then
		echo "Plase try \"source ./django/init.sh\""
		exit 1
	fi
	if [ ! `cat $PROJECT_NAME/settings.py | grep 'MEDIA_ROOT'` ]; then
		cat django/init_modules/image/settings.txt >> $PROJECT_NAME/settings.py
		chmod 644 $PROJECT_NAME/settings.py
	fi
	if [ ! `cat $PROJECT_NAME/urls.py | grep 'import settings'` ]; then
		sed -i -e '16s/^/from django.conf import settings\nfrom django.conf.urls.static import static\n/g' ${PROJECT_NAME}/urls.py
		cat django/init_modules/image/urls_tail.txt >> $PROJECT_NAME/urls.py
		rm -f $PROJECT_NAME/urls.py-e
	fi
}

function ft_ja(){
	echo "Project name: "
	read PROJECT_NAME
	sed -i -e "s/LANGUAGE_CODE = 'en-us'/LANGUAGE_CODE = 'ja'/g" ${PROJECT_NAME}/settings.py
	sed -i -e "s/TIME_ZONE = 'UTC'/TIME_ZONE = 'Asia\/tokyo'/" ${PROJECT_NAME}/settings.py
	rm -f $PROJECT_NAME/settings.py-e
}

function ft_appyaml(){
	echo "Plese select instance"
	select instance in "F1" "F2" "cancel"
	do
		touch app.yaml
		case $instance in
		"F1")
			cat django/init_modules/appyaml/appyaml.txt > app.yaml
			break;;
		"F2")
			sed -e '3s/F1/F2/g' django/init_modules/appyaml/appyaml.txt > app.yaml
			break;;
		"cancel")
			if [ -f app.yaml ]; then
				rm app.yaml
			fi
			break;;
		esac
	done
}

function ft_delete(){
	echo "Are you sure you want to delete django"
	select ans in "yes" "no"
	do
		case $ans in
		"yes")
			if [ -f django ]; then
				rm -rf django
				break;;
			else
				echo "django not found"
				exit 1
			fi;;
		"no")
			break;;
		esac
	done
}

if [ $# -ne 1 ]; then
	ft_init

elif [ $1 = "image" ]; then
	ft_image

elif [ $1 = "appyaml" ]; then
	ft_appyaml

elif [ $1 = "ja" ]; then
	ft_ja

elif [ $1 = "delete" ]; then
	ft_delete

else
	echo "This argument is a not setting"
	exit 1
fi

exit 0