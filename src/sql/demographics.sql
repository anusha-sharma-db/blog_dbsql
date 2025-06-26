DELETE FROM dev.dbdemos_aibi_hls_genomics.demographics;
INSERT INTO dev.dbdemos_aibi_hls_genomics.demographics SELECT * FROM dev.dbdemos_aibi_hls_genomics.demographics_stg;