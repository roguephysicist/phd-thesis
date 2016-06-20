#!/bin/bash

MODE="$1"

declare -a FILELIST=(
3D-Si1x1-RpP.pdf
3D-Si1x1-RpS.pdf
3D-Si1x1-RsP.pdf
# 3D-Si1x1-RsS.pdf
# 3D-Si2x1-RpP.pdf
# 3D-Si2x1-RpS.pdf
# 3D-Si2x1-RsP.pdf
# 3D-Si2x1-RsS.pdf
# diag-3layer_MR_1w.pdf
diag-3layer_MR_2w.pdf
# diag-3layer.pdf
diag-slab.pdf
diag-system.pdf
fig-Si1x1-Hofer_Xxxx.pdf
fig-Si1x1-Mejia_RpP_models.pdf
fig-Si1x1-Mejia_RpP.pdf
# fig-Si1x1-Mejia_RpS_improvements.pdf
fig-Si1x1-Mejia_RpS.pdf
fig-Si1x1-Mejia_RsP.pdf
# fig-Si1x1-Mitchell_RpP.pdf
# fig-Si1x1-Mitchell_RpS.pdf
fig-Si1x1-MRdepth.pdf
# fig-Si1x1-MRno1w.pdf
# fig-Si1x1-MRthickness.pdf
fig-Si2x1-hsvsfs.pdf
# fig-Si2x1-layerconv.pdf
fig-Si2x1-scissors.pdf
fig-Si2x1-topvbottom.pdf
fig-Si2x1-vnl.pdf
struc-Si2x1-rot.pdf
struc-Si1x1-front.png
# struc-Si1x1-side.png
# struc-Si1x1-top.png
struc-Si2x1-front.png
# struc-Si2x1-side.png
# struc-Si2x1-top.png
)

if [[ ${MODE} == "link" ]]; then
    for FILE in ${FILELIST[@]}; do
        ln -sf ../../thesis/content/figures/${FILE} .
    done
elif [[ ${MODE} == "unlink" ]]; then
    for FILE in ${FILELIST[@]}; do
        unlink ${FILE}
    done
else
    printf "Invalid option.\nValid options: [link] or [unlink]\n"
fi
