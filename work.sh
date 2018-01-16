#!/bin/bash

# clone and replace script.
# need to run with permission controlling web directory. 
# need yarn installed.

repo_url="https://github.com/yzyDavid/blog.yuzhenyun.me.git"
deploy_dir="/var/www/hexoblog"
repo_name="blog.yuzhenyun.me"

echo "pulling upstream"
cd $repo_name
echo "working directory: $(pwd)"
git pull

echo "replacing"
rm -rf $deploy_dir
cp -r "public" $deploy_dir
if [ $? -eq 0 ]; then
    echo "replacement finished"
else
    echo "replacement failed, exit!"
    exit 1
fi

echo "finished!"
