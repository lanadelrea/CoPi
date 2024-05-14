#!/usr/bin/env nextflow

process virstrain {
        tag "Identifying lineage assignment for ${fastqPath.baseName} using Virstrain"
        container 'lanadelrea/virstrain:latest'

        publishDir (
        path: "${params.out_dir}/03-Virstrain",
        mode: 'copy',
        overwrite: 'true'
        )    

        input:
        path fastqPath

        script:
        """
        virstrain \
        -i ${fastqPath} \
        -d $PWD/CoPi/bin/Custom_DB \
        -o 03-Virstrain/${fastqPath.baseName}
        """
}