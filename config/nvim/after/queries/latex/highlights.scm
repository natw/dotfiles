;; extends

(brack_group_key_value) @number

(curly_group_path) @keyword
(curly_group_path_list) @string.special

((word) @number
  (#match? @number "^[0-9,.]+(bp|cc|cm|dd|em|ex|in|mm|pc|pt|sp)$"))
