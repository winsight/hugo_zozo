cd "Github repo"/Blog/zozo_hugo
now=$(date "+%Y-%m-%d")
git add .
git commit -m "$now"
git pull
git push
exec /bin/zsh