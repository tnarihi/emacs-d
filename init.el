(setq package-enable-at-startup nil)
(package-initialize)

(require 'package)
  (add-to-list 'package-archives
  ;; The 't' means to append, so that MELPA comes after the more
  ;; stable ELPA archive.
    '("melpa" . "http://melpa.org/packages/") t)

; (normal-erase-is-backspace-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company : Code completion altanative to Auto-complete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
;; Use C-{p,n} to move selection in company mode.
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
;; Color theme for dark background : https://www.emacswiki.org/emacs/CompanyMode
;; (require 'color)
;; (let ((bg (face-attribute 'default :background)))
;;   (custom-set-faces
;;    `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
;;    `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
;;    `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
;;    `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
;;    `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; b yuskel's settings
;; Auto-complete, Yasnippet, etc.
;; https://www.youtube.com/watch?v=HTUE03LnaXA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Auto-complete
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (ac-config-default)

;; auto-complete-c-headers
;; (defun my:ac-c-header-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-sources-c-headers))
;;   ;; (!!!!!!!Need to add header paths )
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; iedit : Edit multiple regions
(require 'iedit)
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;;;;;;;;;;;;;;;;;;;;;
;; Helm and Projectile
;;;;;;;;;;;;;;;;;;;;;;
(require 'helm)
(require 'projectile)
(require 'helm-projectile)

;; Trying to open with projectile if possible, otherwise with helm-for-files
(defun open-file-with-projectile-or-helm ()
  "Open file with helm-projectile or helm-for-files"
  (interactive)
  (if (projectile-project-p) (helm-projectile-find-file) (helm-for-files)))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-g m") 'helm-mini)
(global-set-key (kbd "M-g o") 'open-file-with-projectile-or-helm)
(global-set-key (kbd "M-g s") 'helm-swoop)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CMake-IDE : Enable compilete, jump etc in CMake project using RTags 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'rtags)
;;(cmake-ide-setup)

;; windmove
(global-set-key (kbd "M-g j") 'windmove-left)
(global-set-key (kbd "M-g l") 'windmove-right)
(global-set-key (kbd "M-g i") 'windmove-up)
(global-set-key (kbd "M-g k") 'windmove-down)


;; magit
(global-set-key (kbd "M-g G") 'magit-status)
