Install latest stable version of hugo:

    https://github.com/gohugoio/hugo/releases

Then run

    hugo server -D

Make changes, etc. When you're happy with your changes commit them, then run

    hugo server --renderToDisk
    cd public

Commit changes from public directory and push. Changes from public directory is content of repository gdgszczecin.github.io

Optionally (mostly untested):
run deploy.sh script
