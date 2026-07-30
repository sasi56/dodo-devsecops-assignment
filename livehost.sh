while read url; do
 ./whatweb "$url" >> whatweb-results.txt
done < live-hosts.txt
