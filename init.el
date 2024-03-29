;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is the minimal config needed to get org-mode from melpa and
;; get it up and running so that we can load our emacs config from a
;; .org file in a literate manner. The basis for this can be found
;; here:
;;
;; http://orgmode.org/worg/org-contrib/babel/intro.html
(require 'package)

;; All but melpa commented out at the moment. You may decide to go
;; with some of the other repositories later
(setq package-archives '(;; ("gnu" . "http://elpa.gnu.org/packages/")
			 ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ;; ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; This means we prefer things from ~/.emacs.d/elpa over the standard packages.
(package-initialize)

;; This bootstraps us if we don't have anything
(when (not package-archive-contents)
  (package-refresh-contents))

;; This installs elpa packages if we haven't done that yet
(defun maybe-install-and-require (p)
  (when (not (package-installed-p p))
    (package-install p))
  (require p))

;; org-mode always needs to be installed in an emacs where it isn't loaded.
(when (not (package-installed-p 'org))
  (package-install 'org))
(require 'org)

(org-babel-load-file (concat user-emacs-directory "org/config.org"))
