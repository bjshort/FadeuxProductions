module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        sass: {
            build: {
                files: {
                    'assets/production/application.css' : 'assets/application.scss'
                }
            }
        },
        watch: {
            css: {
                files: '**/*.scss',
                tasks: ['sass']
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.registerTask('default',['watch']);
    grunt.registerTask('buildcss',  ['sass']);

};