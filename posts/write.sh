cd "Github repo"/Blog/zozo_hugo
now=$(date "+%Y-%m-%d")
hugo new posts/"$now.md"
open /Users/wangshuai/GitHub\ repo/Blog/zozo_hugo/content/posts/$now.md
cd content/posts
mkdir "$now"