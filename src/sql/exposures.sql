DELETE FROM dev.dbdemos_aibi_hls_genomics.exposures;
INSERT INTO dev.dbdemos_aibi_hls_genomics.exposures SELECT * FROM dev.dbdemos_aibi_hls_genomics.exposures_stg;