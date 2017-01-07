'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('build', ['sass', 'images', 'favicons', 'fonts']);

gulp.task('fonts', function () {
  gulp.src(['assets/fonts/**/*'])
    .pipe(gulp.dest('public/assets/fonts'));
});

gulp.task('images', function () {
  gulp.src(['assets/images/**/*'])
    .pipe(gulp.dest('public/assets/images'));
});

gulp.task('favicons', function () {
  gulp.src(['assets/favicons/**/*'])
    // Favicons are supposed to be accessible from the root.
    .pipe(gulp.dest('public'));
});

gulp.task('sass', function () {
  gulp.src('./assets/css/**/*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./public/assets/css'));
});

gulp.task('sass:watch', function () {
  gulp.watch('./assets/css/**/*.scss', ['sass']);
});
