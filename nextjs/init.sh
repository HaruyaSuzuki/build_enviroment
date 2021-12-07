#!/bin/bash

function ft_sass(){
	# gulpfile.js
	npm install --save-dev sass gulp-sass gulp-autoprefixer gulp-rename
	echo "const gulp = require(\"gulp\");
const rename = require(\"gulp-rename\");
const autoprefixer = require(\"gulp-autoprefixer\")
const sass = require(\"gulp-sass\")(require(\"sass\"));

// npx gulp
gulp.task(\"default\", () => {
return gulp.watch(\"./styles/**/*.scss\", () => {
	return (
	gulp
		.src(\"./styles/**/*.scss\")
		.pipe(
		sass({
			outputStyle: \"compressed\"
		})
		.on(\"error\", sass.logError)
		)
		.pipe(
		autoprefixer({
			cascade: false,
			grid: true
		})
		)
		.pipe(
		rename({
			suffix: \".min\"
		})
		)
		.pipe(
		gulp.dest(\"./styles\")
		)
	);
});
});

// doesn't minify
gulp.task(\"sass\", () => {
return (
	gulp
	.src(\"./styles/**/*.scss\")
	.pipe(sass())
	.pipe(gulp.dest(\"./styles\"))
);
});
" > gulpfile.js

	# _reset.scss
	mkdir styles/modules
	touch styles/modules/_reset.scss
	echo "html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote,
a, abbr, acronym, address, big, cite,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: inherit;
    font-weight: inherit;
    font-family: 'Noto Sans JP', sans-serif;
    vertical-align: baseline;
}

article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section, main { display: block; }

*,
::before,
::after {
    text-decoration: inherit;
    vertical-align: inherit;
    background-repeat: no-repeat;
    box-sizing: inherit;
    border-width: 0;
    border-style: solid;
    border-color: theme('borderColor.default', currentColor);
}


html {
    box-sizing: border-box;
    -webkit-text-size-adjust: 100%;
    word-break: normal;
    tab-size: 4;
}



// image styles

// input(form item) styles
input { border-radius: 0; }

[disabled] { cursor: default; }

[type='number']::-webkit-inner-spin-button,
[type='number']::-webkit-outer-spin-button { height: auto; }

[type='search'] {
    -webkit-appearance: textfield;
    outline-offset: -2px;
    &:-webkit-search-decoration {
      -webkit-appearance: none;
    }
}
textarea {
    overflow: auto;
    resize: vertical;
}

button,
input,
optgroup,
select,
textarea { font: inherit; }

optgroup { font-weight: bold; }

progress { vertical-align: baseline; }

select {
  -moz-appearance: none;
  -webkit-appearance: none;
  &:-ms-expand {
    display: none;
  }
  &:-ms-value {
    color: currentColor;
  }
}

::-webkit-file-upload-button {
  -webkit-appearance: button;
  color: inherit;
  font: inherit;
}



// button styles
button { overflow: visible; }

button,
select { text-transform: none; }

button,
[type='button'],
[type='reset'],
[type='submit'],
[role='button'] {
  cursor: pointer;
  color: inherit;
}

button::-moz-focus-inner,
[type='button']::-moz-focus-inner,
[type='reset']::-moz-focus-inner,
[type='submit']::-moz-focus-inner {
  border-style: none;
  padding: 0;
}

button:-moz-focusring,
[type='button']::-moz-focus-inner,
[type='reset']::-moz-focus-inner,
[type='submit']::-moz-focus-inner {
  outline: 1px dotted ButtonText;
}

button,
html[type='button'],
[type='reset'],
[type='submit'] {
    -webkit-appearance: button;
}

button,
input,
select,
textarea {
    background-color: transparent;
    border-style: none;
}



// a styles
a {
  background-color: transparent;
  &:active,
  &:hover { outline-width: 0; }
}



// ol, ul styles
ol, ul { list-style: none; }



// table styles
table {
    text-indent: 0;
    border-color: inherit;
    border-collapse: collapse;
    border-spacing: 0;
}



// text styles
small { font-size: .8rem; }

b,
strong { font-weight: bolder; }


legend {
  border: 0;
  color: inherit;
  display: table;
  max-width: 100%;
  max-width: 100%;
  white-space: normal;
}

pre { font-size: 1rem; }

summary { display: list-item; }

blockquote, q {
  quotes: none;
  &:after, &:before {
      content: '';
      content: none;
  }
}



// hr styles
hr {
    color: inherit;
    overflow: visible;
    height: 0;
    border-width: 1px;
}



// focus styles
a:focus,
button:focus,
input:focus,
select:focus,
textarea:focus { outline-width: 0; }

img,
svg,
video,
canvas,
audio,
iframe,
embed,
object { display: block; }
" > styles/modules/_reset.scss

	# globals.scss
	touch styles/globals.scss
	echo "// Develop Settings
\$sizes: sm, md, lg, xl;
\$per_page: 12;

\$breakpoint: (
	'sm': 'screen and (min-width: 640px)',// 	640px ~ 	width(iPhone)
	'md': 'screen and (min-width: 768px)',//	768px ~  	width(iPad)
	'lg': 'screen and (min-width: 1024px)',// 	1024px ~ 	width(iPad Pro) height(iPad)
	'xl': 'screen and (min-width: 1280px)',//	1280px ~ 	width(HD)
) !default;

@mixin media-queries(\$size) {
	@media #{map-get(\$breakpoint, \$size)} {
		@content;
	}
}

@mixin responsive-width {// Screen Size Settings
	@include media-queries('sm') { max-width: 640px; }
	@include media-queries('md') { max-width: 768px; }
	@include media-queries('lg') { max-width: 1024px; }
	@include media-queries('xl') { max-width: 1280px; }
}

// Import files
@import \"modules/reset\";

// Container
.container {
	width: 100%;
	margin: 0 auto;
	padding: 0 7px;
	box-sizing: border-box;
	@include responsive-width;
}
" > styles/globals.scss
}

function ft_tailwind(){
	npm install tailwindcss
	npm install -D tailwindcss@latest postcss@latest autoprefixer@latest

	npx tailwindcss init -p

	sed -i -e "2s/purge: \[\],/purge: \['\.\/pages\/\*\*\/\*\.{js,ts,jsx,tsx}', '\.\/components\/\*\*\/\*\.{js,ts,jsx,tsx}'\],/g" tailwind.config.js
	if [ -f tailwind.config.js-e ]; then
		rm -f tailwind.config.js-e
	fi
	sed -i '' "2s/^/import 'tailwindcss\/tailwind.css'\n/g" pages/_app.js
	cat next_init/init_modules/tailwind/grobals.txt > styles/globals.css
}

function ft_gulp(){
	npm install --save-dev gulp
	touch gulpfile.js
}

function ft_reset(){
	# Remove files
	rm -f styles/Home.module.css
	rm -rf pages/api
	rm -f styles/globals.css
	rm -f public/*
	# Fix files
	sed -i '' -e 'd' README.md
	echo "# $1" > README.md
	sed -i '' -e 'd' pages/index.tsx
	echo "import type { NextPage } from 'next'
const Home: NextPage = () => {
	return (
		<>
		</>
	)
}

export default Home" > pages/index.tsx
	sed -i '' -e '1d' pages/_app.tsx
	sed -i '' -e '1s/^/import \"styles\/globals.min.css\";\n/' pages/_app.tsx
}

function ft_init(){
	ft_reset $1
	mkdir components
	# baseUrl
	sed -i "" "3s/^/\t\t\"baseUrl\": \".\",\n/" tsconfig.json
	# install packages
	ft_gulp
	read -p "Do you use tailwind.css? (if you answer \"n/N\" => install sass, gulp-sass, gulp-autoprefixer, gulp-rename and that settings.) [y/N]" ans
	case $ans in
		y|Y) ft_tailwind ;;
		n|N) ft_sass ;;
		*) echo skip ;;
	esac
	read -p "Do you use Swiper.js? [y/N]" ans
	case $ans in
		y|Y) npm install --save swiper ;;
		n|N) ;;
		*) echo skip ;;
	esac
	echo "successfuly!"
}

if [ $# -gt 1 ]; then
	echo "too many arguments"
	exit 1

elif [ $1 ]; then
	npx create-next-app@latest $1  --ts
	cd $1
	ft_init $1

else
	echo "please enter argument"
	exit 1
fi

exit 0