#!/bin/bash
HF_TOKEN="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"


url="https://huggingface.co/xey/sldr_flux_nsfw_v2-studio/blob/main/sldr_flux_nsfw_v2-studio.safetensors"
dest="."
if [[ -n $HF_TOKEN && $url =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
    src_type="HF"
    hg_repo=$(echo $url | awk -F'/' '{print $4"/"$5}')
    hg_model=$(echo $url | awk -F'/' '{print $NF}')
    huggingface-cli download  --repo-type model  "$hg_repo" "$hg_model"  --local-dir "$dest"
fi   