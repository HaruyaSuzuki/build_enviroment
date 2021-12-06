# build_enviroment(nextjs)
## install packages
- Next.js(latest ver.)
- Gulp.js(sass gulp-sass gulp-autoprefixer gulp-rename)
- Swiper.js
## Others
- touch New README.md
- add components(directory)
- remove styles/Home.module.css & pages/api
- tsconfig.json set baseUrl => "."
## Usage
1. install build_enviroment
```
git clone https://github.com/HaruyaSuzuki/threejs.git .
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