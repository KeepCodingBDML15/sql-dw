-- JSON VALUES
WITH my_table
  AS (SELECT '{"squadName":"Super hero squad","homeTown":"Metro City","formed":2016,"secretBase":"Super tower","active":true,"members":[{"name":"Molecule Man","age":29,"secretIdentity":"Dan Jukes","powers":["Radiation resistance","Turning tiny","Radiation blast"]},{"name":"Madame Uppercut","age":39,"secretIdentity":"Jane Wilson","powers":["Million tonne punch","Damage resistance","Superhuman reflexes"]},{"name":"Eternal Flame","age":1000000,"secretIdentity":"Unknown","powers":["Immortality","Heat Immunity","Inferno","Teleportation","Interdimensional travel"]}]}' AS text)

SELECT JSON_VALUE(text, '$.squadName') AS squadName
     , JSON_VALUE(text, '$.formed') AS formed
     , JSON_VALUE(text, '$.active') AS active
     , JSON_EXTRACT_ARRAY(my_table.text, '$.members') AS members
  FROM my_table

-- ARRAYS
WITH my_table
  AS (SELECT '{"squadName":"Super hero squad","homeTown":"Metro City","formed":2016,"secretBase":"Super tower","active":true,"members":[{"name":"Molecule Man","age":29,"secretIdentity":"Dan Jukes","powers":["Radiation resistance","Turning tiny","Radiation blast"]},{"name":"Madame Uppercut","age":39,"secretIdentity":"Jane Wilson","powers":["Million tonne punch","Damage resistance","Superhuman reflexes"]},{"name":"Eternal Flame","age":1000000,"secretIdentity":"Unknown","powers":["Immortality","Heat Immunity","Inferno","Teleportation","Interdimensional travel"]}]}' AS text)

SELECT JSON_VALUE(text, '$.squadName') AS squadName
     , JSON_VALUE(text, '$.formed') AS formed
     , JSON_VALUE(text, '$.active') AS active
     , JSON_VALUE(members, '$.name') AS members
     , JSON_VALUE_ARRAY(members, '$.powers') AS powers
  FROM my_table
  LEFT 
  JOIN UNNEST (JSON_EXTRACT_ARRAY(my_table.text, '$.members')) AS members

WITH my_table
  AS (SELECT '{"squadName":"Super hero squad","homeTown":"Metro City","formed":2016,"secretBase":"Super tower","active":true,"members":[{"name":"Molecule Man","age":29,"secretIdentity":"Dan Jukes","powers":["Radiation resistance","Turning tiny","Radiation blast"]},{"name":"Madame Uppercut","age":39,"secretIdentity":"Jane Wilson","powers":["Million tonne punch","Damage resistance","Superhuman reflexes"]},{"name":"Eternal Flame","age":1000000,"secretIdentity":"Unknown","powers":["Immortality","Heat Immunity","Inferno","Teleportation","Interdimensional travel"]}]}' AS text)

SELECT JSON_VALUE(text, '$.squadName') AS squadName
     , JSON_VALUE(text, '$.formed') AS formed
     , JSON_VALUE(text, '$.active') AS active
     , JSON_VALUE(members, '$.name') AS members
     , JSON_VALUE_ARRAY(members, '$.powers') AS powers
  FROM my_table
  LEFT 
  JOIN UNNEST (JSON_EXTRACT_ARRAY(my_table.text, '$.members')) AS members

----------------------------------------

WITH my_table
  AS (SELECT '{"squadName":"Super hero squad","homeTown":"Metro City","formed":2016,"secretBase":"Super tower","active":true,"members":[{"name":"Molecule Man","age":29,"secretIdentity":"Dan Jukes","powers":["Radiation resistance","Turning tiny","Radiation blast"]},{"name":"Madame Uppercut","age":39,"secretIdentity":"Jane Wilson","powers":["Million tonne punch","Damage resistance","Superhuman reflexes"]},{"name":"Eternal Flame","age":1000000,"secretIdentity":"Unknown","powers":["Immortality","Heat Immunity","Inferno","Teleportation","Interdimensional travel"]}]}' AS text)

SELECT JSON_VALUE(text, '$.squadName') AS squadName
     , JSON_VALUE(text, '$.formed') AS formed
     , JSON_VALUE(text, '$.active') AS active
     , JSON_VALUE(members, '$.name') AS members
     , JSON_VALUE_ARRAY(members, '$.powers')[OFFSET(0)] AS powers
     , ARRAY_TO_STRING(JSON_VALUE_ARRAY(members, '$.powers'), '; ') AS powers_agg 
  FROM my_table
  LEFT 
  JOIN UNNEST (JSON_EXTRACT_ARRAY(my_table.text, '$.members')) AS members


