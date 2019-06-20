#!/bin/bash

time ~/tesseract/src/training/tesstrain.sh \
--fonts_dir ~/.fonts \
--lang eng \
--langdata_dir ./langdata \
--tessdata_dir ~/tessdata_best \
--exposures "0" \
--fontlist \
"Noto Color Emoji" \
"Noto Emoji" \
"Quivira" \
"FreeSerif" \
'Symbola Semi-Condensed' \
--training_text ./eng.emojitest.training_text \
--workspace_dir ~/tmp \
--save_box_tiff  \
--overwrite \
--output_dir ./emojitest

time ~/tesseract/src/training/tesstrain.sh \
--fonts_dir ~/.fonts \
--lang eng \
--langdata_dir ./langdata \
--tessdata_dir ~/tessdata_best \
--exposures "0" \
--fontlist \
"Noto Color Emoji" \
"Noto Emoji" \
"Quivira" \
"FreeSerif" \
'Symbola Semi-Condensed' \
--training_text ./eng.emojilegacy.training_text \
--workspace_dir ~/tmp \
--save_box_tiff  \
--overwrite \
--output_dir ./emojilegacy

mv  ./emojilegacy/eng.traineddata  ./emojilegacy/emoji.traineddata 

cd emojitest
time tesseract eng.FreeSerif.exp0.tif eng.FreeSerif.exp0.tif --tessdata-dir ../emojilegacy --psm 6 -l emoji
time tesseract eng.Quivira.exp0.tif eng.Quivira.exp0.tif --tessdata-dir ../emojilegacy --psm 6 -l emoji
time tesseract eng.Noto_Emoji.exp0.tif eng.Noto_Emoji.exp0.tif --tessdata-dir ../emojilegacy --psm 6 -l emoji
time tesseract eng.Noto_Color_Emoji.exp0.tif eng.Noto_Color_Emoji.exp0.tif --tessdata-dir ../emojilegacy --psm 6 -l emoji
time tesseract eng.Symbola_Semi-Condensed.exp0.tif eng.Symbola_Semi-Condensed.exp0.tif --tessdata-dir ../emojilegacy --psm 6 -l emoji

