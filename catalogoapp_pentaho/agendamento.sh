#!/bin/bash
cd /opt/pentaho/data-integration/
./pan.sh /file=/app/pentaho_pdi/tb_copia_setores_hades_tb_stakeholders_catalogo_local.ktr /level:Detailed /logfile:"/app/pentaho_pdi/log/pentahoJob_HADES_stakeholders_log.txt"
#./kitchen.sh /file=/home/jorge/Projetos/TRT1/catalogo_aplicacao/pentaho_pdi/jb_copia_setores_hades_tb_stakeholders_catalogo_local.kjb /level:Detailed /logfile:"/home/jorge/Projetos/TRT1/catalogo_aplicacao/pentaho_pdi/my-job.txt"