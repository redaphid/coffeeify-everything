gulp       = require 'gulp'
gitignore  = require 'gulp-gitignore'
js2cs      = require 'gulp-javascript-to-coffeescript'
del        = require 'del'
debug      = require('debug-stream')('coffeeify-everything')

gulp.task 'clean', ->
  del('dist/**/*')

gulp.task 'copy-non-js', ['clean'], ->
  gulp.src ['./**/*', '!./**/*.js']
    .pipe gitignore()
    .pipe gulp.dest 'dist'

gulp.task 'coffeeify-everything', ['clean'], ->
  gulp.src './**/*.js'
    .pipe gitignore()
    .pipe debug('start')
    .pipe js2cs()
    .pipe debug('end')
    .pipe gulp.dest 'dist'

gulp.task 'default', [ 'copy-non-js', 'coffeeify-everything' ]

gulp.start 'default'
