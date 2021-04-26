;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Oskar Philipsson"
      user-mail-address "oskph717@student.liu.se")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16 :weight 'semi-light)
       doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 17))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;;(setq display-line-numbers-type 'relative) /relative,visual,t
(add-hook! 'evil-normal-state-entry-hook (setq display-line-numbers 'visual))
(add-hook! 'evil-insert-state-entry-hook (setq display-line-numbers t))


(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")

(auto-fill-mode 1)
(setq comment-auto-fill-only-comments t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.



;; ----------------------------Oskar test ------------------------------------
;;(pyenv-mode)

(add-hook 'org-mode-hook 'org-fragtog-mode)     ; Hook for fragtog
;;(add-hook 'latex-mode-hook 'org-fragtog-mode)     ; Hook for fragtog
(add-hook 'latex-mode-hook #'xenops-mode)
(add-hook 'LaTeX-mode-hook #'xenops-mode)

(setq xenops-math-image-scale-factor 2)
(setq xenops-reveal-on-entry 1)
(setq org-latex-create-formula-image-program 'dvisvgm)
(setq org-image-actual-width (/ (display-pixel-width) 3)) ; Sätter preview bilder i orgmode till lämplig storlek. Ska denna igentligen ligga bakom någon hook för just org-mode?
;Lägga till så att bilder visas som standard i org mode också?
(add-hook! 'org-mode-hook (setq org-image-actual-width (/ (display-pixel-width) 3)))
(add-hook! 'org-mode-hook (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))
(add-hook! 'org-mode-hook (add-to-list 'org-latex-packages-alist
             '("AUTO" "babel" t ("pdflatex"))))
(add-hook! 'org-mode-hook (add-to-list 'org-latex-packages-alist
             '("AUTO" "polyglossia" t ("xelatex" "lualatex"))))
(add-hook! 'org-mode-hook (add-to-list 'org-latex-packages-alist '("" "minted")))
(add-hook! 'org-mode-hook (setq org-latex-listings 'minted)) ; Install pygments (pip)

(add-hook! 'org-mode-hook (setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))

;(add-hook! 'org-mode-hook (setq org-src-fontify-natively t))
(require 'lsp-python-ms)
(setq lsp-python-ms-auto-install-server t)
(add-hook! 'python-mode-hook #'lsp) ; or lsp-deferred



(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.


(setq-default history-length 1000)
(setq-default prescient-history-length 1000)


(after! ccls
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
  (set-lsp-priority! 'ccls 2)) ; optional as ccls is the default in Doom

(setq
  global-whitespace-mode t
  whitespace-style '(face tab-mark trailing newline-mark)
  whitespace-display-mappings '(
    (newline-mark ?\n    [?﬋ ?\n])
    (tab-mark     ?\t    [?\ ?\ ?\ ?┋])))
(global-whitespace-mode +1)

(setq tab-width 4)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (matlab . t)
   (cpp . t)
   (python . t)))
