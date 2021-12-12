# build_enviroment
![](https://img.shields.io/badge/Bash-708090?style=for-the-badge&logo=gnubash)

Set up the build environment with shell script.

## Next.js(nextjs)
![](https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=nextdotjs)

### install packages
- Next.js(latest ver.)
- Gulp.js(sass gulp-sass gulp-autoprefixer gulp-rename)
- Tailwind.css
- Swiper.js
### Others
#### add
- new README.md
- componets(directory)
- gulpfile.js
- styles/global.scss
- styles/modules/_reset.scss
#### remove
- styles/Home.module.css
- public/*
- pages/api
#### settings
- pages/_app.tsx => import new stylesheets
- pages/index.tsx => reset
- tsconfig.json set baseUrl => "."
### Usage
1. install build_enviroment
```
git clone https://github.com/HaruyaSuzuki/build_enviroment.git .
```

2. copy build_enviroment/nextjs/init.sh to your project

3. Enter the command below
```
chmod +x init.sh || ./init.sh [your project name]
```

4. Answer the question(Do you use tailwind.css? (if you answer "n/N" => install sass, gulp-sass, gulp-autoprefixer, gulp-rename and that settings.) [y/N])

if you answer "y/Y" => install taiwnd.css and that settings.
if you answer "n/N" => install sass, gulp-sass, gulp-autoprefixer, gulp-rename and that settings.

5. Answer the question(Do you use Swiper.js? [y/N])

if you answer "y/Y" => install swiper.js
if you answer "n/N" => skip

6. Complete!

## Django(django) => created at 2021.7.18
![](https://img.shields.io/badge/Django-092e20?style=for-the-badge&logo=django)

### install packages
1. install build_enviroment
```
git clone https://github.com/HaruyaSuzuki/build_enviroment.git .
```

2. copy build_enviroment/django to your project

3. Enter the command below
```
chmod +x django/init.sh || django/init.sh [argument]
```

#### if argument is nothing => install django and that settings.
- After entering the project name and application name, create a virtual environment with virtualenv and activate it.
- Exclude bin, lib, etc. directories in the created .gitignore file.
- Install frequently used modules.
- Create requirements.txt.
- Create a directory for static, templates, media, and pass it through the path.
- Make migrations, migrate and exit on the createsuperuser execution screen.
#### if argument is "image" => install pillow and that settings.
#### if argument is "appyaml" => make app.yaml and gcp settings.
#### if argument is "ja" => django language setting be japanese.
#### if argument is "delete" => delete init_modules

4. Complete!
