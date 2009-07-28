(require 'un-define)
(coding-system-put 'utf-8 'category 'utf-8)
(set-coding-category-system 'utf-8 'utf-8)
(set-language-info
 "Japanese" 
 'coding-priority (cons 'utf-8
                        (get-language-info "Japanese" 'coding-priority)))
(set-language-environment "Japanese")
