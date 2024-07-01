### special image processing
[How to Sort and Remove Duplicate Photos in Linux](https://www.linux.com/training-tutorials/how-sort-and-remove-duplicate-photos-linux/)
[fdupes – A Command Line Tool to Find and Delete Duplicate Files in Linux](https://www.tecmint.com/fdupes-find-and-delete-duplicate-files-in-linux/)
### how to compress images from command line

```
sudo apt install graphicsmagick-imagemagick-compat  # version 1.4+really1.3.38-1ubuntu0.1, or
sudo apt install imagemagick-6.q16                  # version 8:6.9.11.60+dfsg-1.3ubuntu0.22.04.3
sudo apt install imagemagick-6.q16hdri              # version 8:6.9.11.60+dfsg-1.3ubuntu0.22.04.3

```

### codecs

        sudo apt install ubuntu-restricted-extras 
        sudo snap install vlc


```
mogrify -format jpg *.png

mogrify -format jpg *.png
rm *.png
find . -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > dupes.txt 
cat dupes.txt
fdupes -d -N .
find . -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > dupres.txt 
cat dupres.txt


```
### compress movies
```
for f in Videos/*.mov; do ffmpeg -i "$f" -vcodec libx265 -crf 22 "Videos/$(basename "${f%.*}").mkv"; done 
for f in *.mov; do ffmpeg -i "$f" -vcodec libx265 -crf 22 "$(basename "${f%.*}").mkv"; done 

```

### compress images
```
for i in *.png ; do convert "$i" "${i%.*}.jpg" ; done
```
