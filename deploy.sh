#!/bin/bash

bundle exec jekyll clean
bundle exec jekyll build

aws s3 sync ./_site/ s3://kollektiv-oradea.com

aws cloudfront create-invalidation --distribution-id "E2NPT1RU6XBFU3" --paths "/*"
