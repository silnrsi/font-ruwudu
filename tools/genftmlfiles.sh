#!/bin/sh

# This script rebuilds the algorithmically-generated ftml files. See README.md

# Copyright (c) 2020-2022 SIL International  (http://www.sil.org)
# Released under the MIT License (http://opensource.org/licenses/

# Assumes we're in the root folder, i.e., font-Ruwudu

set -e

if [ ! -e OFL.txt ] 
then
	echo "Please cd to root of font project to use this script"
	exit 2
fi

echo "Rebuilding ftml files..."
tools/absgenftml.py -q -t 'AllChars (auto)'         source/masters/Ruwudu-Regular.ufo  tests/AllChars.ftml        -l tests/logs/AllChars.log         -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../references/Alkalami-Light-1_300.ttf)=1.3' -s 'url(../results/Ruwudu-Regular.ttf)=Reg'  &
tools/absgenftml.py -q -t 'AL Sorted (auto)'        source/masters/Ruwudu-Regular.ufo  tests/ALsorted.ftml        -l tests/logs/ALsorted.log         -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../references/Alkalami-Light-1_300.ttf)=1.3' -s 'url(../results/Ruwudu-Regular.ttf)=Reg'  &
tools/absgenftml.py -q -t 'DiacTest1 (auto)'        source/masters/Ruwudu-Regular.ufo  tests/DiacTest1.ftml       -l tests/logs/DiacTest1.log        -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../references/Alkalami-Light-1_300.ttf)=1.3' -s 'url(../results/Ruwudu-Regular.ttf)=Reg'  & 
tools/absgenftml.py -q -t 'DiacTest1 Short (auto)'  source/masters/Ruwudu-Regular.ufo  tests/DiacTest1-short.ftml -l tests/logs/DiacTest1-short.log  -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../references/Alkalami-Light-1_300.ttf)=1.3' -s 'url(../results/Ruwudu-Regular.ttf)=Reg'  &
tools/absgenftml.py -q -t 'Subtending Marks (auto)' source/masters/Ruwudu-Regular.ufo  tests/SubtendingMarks.ftml -l tests/logs/Subtending.log       -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../references/Alkalami-Light-1_300.ttf)=1.3' -s 'url(../results/Ruwudu-Regular.ttf)=Reg'  &
wait
echo done.

