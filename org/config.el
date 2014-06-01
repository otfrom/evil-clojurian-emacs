
(maybe-install-and-require 'evil)

(maybe-install-and-require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(maybe-install-and-require 'clojure-mode)

(maybe-install-and-require 'cider)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)

(setq lisp-hooks (lambda ()
                   (eldoc-mode +1)
                   (diminish 'eldoc-mode)))

(add-hook 'clojure-mode-hook lisp-hooks)

(maybe-install-and-require 'cyberpunk-theme)
