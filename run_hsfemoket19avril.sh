## pour mémoire: lancement de HSF sur is154039 par: cd /drf/local/HSF/venv_py310/bin/ 

## Il faut les autorisations pour créer un dossier output, c'est ok dans mon volatile ar278096 donc faire cd /volatile/ar278096

## puis source activate hsf

hsf files.path=/volatile/ar278096/EMOKET files.pattern="**/*T1w.nii.gz" files.output_dir=/volatile/ar278096/EMOKET/output_19avril roiloc.contrast="t1" roiloc.margin=[16,16,16] segmentation=bagging_accurate segmentation.ca_mode="1/23"
