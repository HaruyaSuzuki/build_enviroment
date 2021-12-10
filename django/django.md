# Django(django) => created at 2021.7.18
## install packages
1. install build_enviroment
```
git clone https://github.com/HaruyaSuzuki/build_enviroment.git .
```

2. copy build_enviroment/django to your project

3. Enter the command below
```
chmod +x django/init.sh || django/init.sh [argument]
```

### if argument is nothing => install django and that settings.
- After entering the project name and application name, create a virtual environment with virtualenv and activate it.
- Exclude bin, lib, etc. directories in the created .gitignore file.
- Install frequently used modules.
- Create requirements.txt.
- Create a directory for static, templates, media, and pass it through the path.
- Make migrations, migrate and exit on the createsuperuser execution screen.
### if argument is "image" => install pillow and that settings.
### if argument is "appyaml" => make app.yaml and gcp settings.
### if argument is "ja" => django language setting be japanese.
### if argument is "delete" => delete init_modules

4. Complete!