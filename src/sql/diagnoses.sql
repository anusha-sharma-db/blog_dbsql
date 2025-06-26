DELETE FROM dev.dbdemos_aibi_hls_genomics.diagnoses;
INSERT INTO dev.dbdemos_aibi_hls_genomics.diagnoses SELECT * FROM dev.dbdemos_aibi_hls_genomics.diagnoses_stg;