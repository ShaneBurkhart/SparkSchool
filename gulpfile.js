'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('build', ['sass', 'fonts']);

gulp.task('sass', function () {
  return gulp.src('./assets/css/**/*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./public/assets/css'));
});

gulp.task('sass:watch', function () {
  gulp.watch('./assets/css/**/*.scss', ['sass']);
});
