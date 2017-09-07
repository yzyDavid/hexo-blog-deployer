#!/bin/bash

# clone and replace script.
# need to run with permission controlling web directory. 

repo_url="https://github.com/yzyDavid/blog.yuzhenyun.me.git"
deploy_dir="/var/www/hexoblog"
repo_name="blog.yuzhenyun.me"

echo "working directory: $(pwd)"
echo "cloning from $repo_url"
git clone $repo_url
if [ $? -eq 0 ]; then
    echo "clone finished"
else
    echo "clone failed, exit!"
    exit 1
fi

echo "generating static files"
cd $repo_name
echo "working directory: $(pwd)"
hexo g
if [ $? -eq 0 ]; then
    echo "generation finished"
else
    echo "generation failed, exit!"
    exit 1
fi

echo "replacing"
rm -rf $deploy_dir
if [ $? -eq 0 ]; then
    echo "replacement finished"
else
    echo "replacement failed, exit!"
    exit 1
fi
mv "public" $deploy_dir

echo "cleaning"
cd ".."
echo "working directory: $(pwd)"
rm -rf $repo_name

echo "finished!"
