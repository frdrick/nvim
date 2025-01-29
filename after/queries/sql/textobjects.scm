; extends
;full statement
(statement) @query
;subquery inner
(subquery) @subquery
;subquery outer
[
 (subquery)
 [";"]
] @subquery.outer

;[
; ";"
; ] @statement.end
