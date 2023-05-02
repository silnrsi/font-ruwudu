#!/bin/sh

# This script rebuilds the algorithmically-generated ftml files. See README.md

# Copyright (c) 2020-2023 SIL International  (https://www.sil.org)
# Released under the MIT License (https://opensource.org/licenses/

# Assumes we're in the root folder, i.e., font-Ruwudu

set -e

if [ ! -e OFL.txt ] 
then
	echo "Please cd to root of font project to use this script"
	exit 2
fi

echo "Rebuilding ftml files..."
tools/absgenftml.py -q -t 'AllChars (auto)'         source/masters/Ruwudu-Regular.ufo  tests/AllChars-auto.ftml        -l tests/logs/AllChars-auto.log         -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../results/Ruwudu-Regular.ttf)=Reg' -s 'url(../results/Ruwudu-Medium.ttf)=Med' -s 'url(../results/Ruwudu-SemiBold.ttf)=SBo' -s 'url(../results/Ruwudu-Bold.ttf)=Bo' &
tools/absgenftml.py -q -t 'AL Sorted (auto)'        source/masters/Ruwudu-Regular.ufo  tests/ALsorted-auto.ftml        -l tests/logs/ALsorted-auto.log         -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../results/Ruwudu-Regular.ttf)=Reg' -s 'url(../results/Ruwudu-Medium.ttf)=Med' -s 'url(../results/Ruwudu-SemiBold.ttf)=SBo' -s 'url(../results/Ruwudu-Bold.ttf)=Bo' &
tools/absgenftml.py -q -t 'DiacTest1 (auto)'        source/masters/Ruwudu-Regular.ufo  tests/DiacTest1-auto.ftml       -l tests/logs/DiacTest1-auto.log        -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../results/Ruwudu-Regular.ttf)=Reg' -s 'url(../results/Ruwudu-Medium.ttf)=Med' -s 'url(../results/Ruwudu-SemiBold.ttf)=SBo' -s 'url(../results/Ruwudu-Bold.ttf)=Bo' & 
tools/absgenftml.py -q -t 'DiacTest1 Short (auto)'  source/masters/Ruwudu-Regular.ufo  tests/DiacTest1-short-auto.ftml -l tests/logs/DiacTest1-short-auto.log  -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../results/Ruwudu-Regular.ttf)=Reg' -s 'url(../results/Ruwudu-Medium.ttf)=Med' -s 'url(../results/Ruwudu-SemiBold.ttf)=SBo' -s 'url(../results/Ruwudu-Bold.ttf)=Bo' &
tools/absgenftml.py -q -t 'Subtending Marks (auto)' source/masters/Ruwudu-Regular.ufo  tests/SubtendingMarks-auto.ftml -l tests/logs/SubtendingMarks-auto.log       -s 'local(Alkalami)=Alk (inst)' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv -s 'url(../results/Ruwudu-Regular.ttf)=Reg' -s 'url(../results/Ruwudu-Medium.ttf)=Med' -s 'url(../results/Ruwudu-SemiBold.ttf)=SBo' -s 'url(../results/Ruwudu-Bold.ttf)=Bo' &
wait
echo done.
