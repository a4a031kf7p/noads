#!/usr/bin/env bash

# Getting youtube url
yt_url=$1

# Grab the id of the Youtube video and replace the new id in the iframe.
if yt_url=$(echo "$yt_url" | grep -E '\?v='); then
	yt_id=$(echo "$yt_url" | sed -n 's/.*?v=\([A-Za-z0-9_-]\{11\}\).*/\1/p')
else
	yt_url=$1
	yt_id=$(echo $yt_url | grep -oE '[^/]+$')
fi
echo "var newVideoId = \"$yt_id\"; var iframe = document.getElementById('_ytplayer1610'); if (iframe) { iframe.src = \"https://www.youtube.com/embed/\" + newVideoId + \"?autoplay=1&enablejsapi=1&origin=https://www.bing.com&rel=0&mute=0\"; console.log(\"Iframe video has been replaced.\"); } else { console.log(\"Iframe not found.\"); }" | xclip -selection clipboard
