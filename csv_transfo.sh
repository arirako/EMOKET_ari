#!/bin/bash

# Emplacement du fichier source
input_file="/volatile/ar278096/EMOKET/derivates/volumes_transfo.csv"

# Répertoire de sortie pour les fichiers générés
output_dir="/volatile/ar278096/EMOKET/derivates"

# Crée un fichier CSV pour chaque session
for session in 1 2; do
    # Utilisation de awk pour filtrer la session et ajuster le format
    awk -v s="Session $session" -F"," 'BEGIN {OFS=","; print "Subject","Region","Volume"}
        NR > 1 && $2 == s {print $1, ($4" "$3), $5}' "$input_file" > "$output_dir/session_${session}.csv"
done

