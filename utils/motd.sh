#!/bin/bash

COWPATH="/usr/share/cowsay/cows/"
SEPARATOR=" || "
DEF_MSG="Welcome back"
PRIOR_SECOND=true
CENTER=true

COLS=$(tput cols)
LINES=$(tput lines)


if [ -d $COWPATH -a -f $(command -v cowsay) -a -f $(command -v fortune) ]; then
    cowfile=$( ls $COWPATH | shuf -n 1 )

    paste <(fortune | cowsay -f $cowfile) <(screenfetch -N) | awk -v nb_cols=$COLS -v nb_lines=$LINES -v sep="$SEPARATOR" -v def_msg="$DEF_MSG" -v prior2=$PRIOR_SECOND -v center=$CENTER -F'\t' '
    {
        if ($1 != "") {height_txt1=NR};
        if ($2 != "") {height_txt2=NR};
        if (length($1)>width_txt1) {width_txt1=length($1)};
        if (length($2)>width_txt2) {width_txt2=length($2)};
        col1[NR] = $1; col2[NR] = $2;
    } END {
        A = width_txt1 + width_txt2 + length(sep) < nb_cols;
        B = width_txt1 < nb_cols;
        C = width_txt2 < nb_cols;
        D = height_txt1 < nb_lines;
        E = height_txt2 < nb_lines;
        F = prior2 == "true";

        if (A && D && E) {
            if (center == "true") {
                nb_spaces = (nb_cols - width_txt1 - width_txt2 - sep)/2
            } else {
                nb_spaces = 0
            };
            for (i = 1; i<=NR; i++) {printf ("%*s%-*s%s%s\n", nb_spaces, "", width_txt1, col1[i], sep, col2[i])}
        } else if (B && !C && D || B && D && !E || !A && B && D && !F) {
            if (center == "true") {nb_spaces = (nb_cols - width_txt1)/2} else {nb_spaces = 0};
            for (i = 1; i<=height_txt1; i++) {printf ("%*s%s\n", nb_spaces, "", col1[i])}
        } else if (!B && C && E || C && D && !E || !A && C && E && F) {
            if (center == "true") {nb_spaces = (nb_cols - width_txt2)/2} else {nb_spaces = 0};
            for (i = 1; i<=height_txt2; i++) {printf ("%*s%s\n", nb_spaces, "", col2[i])}
        } else {
            if (center == "true") {nb_spaces = (nb_cols - length(def_msg))/2} else {nb_spaces = 0};
            printf ("%*s%s\n", nb_spaces, "", def_msg)
        };
    }'
fi
