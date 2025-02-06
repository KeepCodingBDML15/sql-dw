CREATE OR REPLACE FUNCTION Z99_FUNCTIONS.fnc_chk_length_string(p_string STRING) RETURNS STRING AS
(( SELECT CASE WHEN LENGTH(p_string)=0 THEN 'UNKNOWN' ELSE p_string END ))


CREATE OR REPLACE FUNCTION Z99_FUNCTIONS.fnc_cleaning_string(p_string STRING) RETURNS STRING AS
((SELECT CASE WHEN REGEXP_CONTAINS(UPPER(TRIM(p_string)), r"[ÀÁÂÄÅÈÉÊËÌÍÎÏÒÓÔÖØÙÚÛÜ]") 
              THEN IFNULL( REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE( 
                           UPPER(TRIM( Z99_FUNCTIONS.fnc_chk_length_string(p_string))) 
                         , r"[ÙÚÛÜ]", 'U'), r"[ÒÓÔÖØ]", 'O'), r"[ÌÍÎÏ]", 'I'), r"[ÈÉÊË]", 'E'), r"[ÀÁÂÄÅ]", 'A'),'UNKNOWN')
              WHEN UPPER(TRIM(Z99_FUNCTIONS.fnc_chk_length_string(p_string))) = '?' THEN 'UNKNOWN'
              ELSE IFNULL(UPPER(TRIM(Z99_FUNCTIONS.fnc_chk_length_string(p_string))),'UNKNOWN')
            END ))

CREATE OR REPLACE FUNCTION Z99_FUNCTIONS.fnc_customer_weight(p_string STRING) RETURNS INT64 AS
((SELECT CASE WHEN state='NEW' THEN 1
                  WHEN state='PENDINGACTIVE' THEN 2
                  WHEN state='ACTIVE' THEN 3
                  WHEN state='PENDINGDISCONNECT' THEN 4
                  WHEN state='DISCONNECTED' THEN 5
                  WHEN state='CLOSED' THEN 6
                  ELSE 0
                  END ))

CREATE OR REPLACE FUNCTION Z99_FUNCTIONS.fnc_cleaning_timestamp(p_timestamp TIMESTAMP) RETURNS DATETIME AS
(( SELECT DATETIME(IFNULL(p_timestamp, '9999-12-31'), 'Europe/Madrid') ))

