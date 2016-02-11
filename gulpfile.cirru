
var
  gulp $ require :gulp

gulp.task :coffee $ \ ()
  var
    coffee $ require :gulp-coffee
  ... gulp
    src :./src/**/*
    pipe $ coffee $ {} (:bare true)
    pipe $ gulp.dest :./lib
