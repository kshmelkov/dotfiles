;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(rust
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; helm
     ivy
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     yaml
     markdown
     tmux
     (org :variables
       org-want-todo-bindings t
       org-enable-org-journal-support t
       org-journal-dir "~/org/journal/"
       org-journal-file-format "%Y%m%d"
       org-journal-date-prefix "#+TITLE: "
       ;; org-journal-time-prefix "* "
       ;; org-journal-time-format ""
       org-journal-date-format "%A, %d %B %Y"
       org-journal-enable-encryption nil)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     pass
     fasd
     finance
     ;; nlinum
     systemd
     evil-commentary
     evil-snipe
     evil-russian
     python
     haskell
     latex
     ;; pdf-tools
     search-engine
     ipython-notebook
     (mu4e :variables
           mu4e-enable-notifications t
           mu4e-enable-mode-line t)
     ;; spotify
     (geolocation :variables
                  geolocation-enable-osx-location-service-support nil
                  geolocation-enable-weather-forecast t
                  geolocation-enable-automatic-theme-changer nil)
     (elfeed :variables rmh-elfeed-org-files (list "~/org/rss.org"))
     ;; themes-megapack
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   dotspacemacs-additional-packages '(bbdb
                                      solarized-theme
                                      material-theme
                                      cyberpunk-theme
                                      writeroom-mode
                                      wc-mode
                                      tidal
                                      olivetti
                                     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup

   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         solarized-light
                         spacemacs-dark
                         spacemacs-light
                         leuven
                         monokai
                         zenburn)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size
   dotspacemacs-default-font '("InconsolataLGC"
                               :size 23
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom

   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (desktop-save-mode 0)
  (setq inhibit-splash-screen t)
  (with-eval-after-load 'org
    (require 'org-habit)
    (require 'org-mu4e)
    ;; (setq org-mu4e-link-query-in-headers-mode nil)
    )
  ;; (add-to-list 'org-modules "org-habit")
  ;; (require 'org-habit)
  ;; (require 'org)
  ;; (require 'org-install)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "APPT(a)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c)")))
  (setq org-agenda-start-on-weekday nil
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t)
  (setq org-default-notes-file "~/org/inbox.org")
  '(org-refile-targets (quote (("~/org/todo.org" :maxlevel . 1)
                               ("~/org/archive.org" :level . 1))))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("m" "Mail" entry (file+headline "~/org/inbox.org" "Tasks")
           "* TODO %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")
          ("a" "Appointment" entry (file "~/org/calendar.org")
           "* APPT %?\n SCHEDULED: %^T\n  %i\n  %a")
          ("n" "Note" entry (file "~/org/inbox.org")
           "* %?\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")))

  (setq org-tag-alist '(("home" . ?h) ("laptop" . ?l) ("grenoble" . ?g) ("phone" . ?p) ("inria" . ?i)))
  (setq-default flycheck-disabled-checkers '(python-pylint))

  ;; (setq bbdb-file "~/.emacs.d/bbdb")
  ;; (bbdb-initialize 'mu4e)
  ;; (setq bbdb-mail-user-agent (quote message-user-agent))
  ;; (setq mu4e-view-mode-hook (quote (bbdb-mua-auto-update visual-line-mode)))
  ;; (setq mu4e-compose-complete-addresses nil)
  ;; (setq bbdb-mua-pop-up t)
  ;; (setq bbdb-mua-pop-up-window-size 5)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (set-language-environment "UTF-8")
  ;; Global visual-line-mode is like Vim's breakindent
  (global-visual-line-mode)
  (setq-default evil-ex-substitute-global t)
  (require 'mu4e-contrib)
  (setq mu4e-html2text-command 'mu4e-shr2text)
  (evil-leader/set-key
    "oc" 'org-capture
    "oa" 'org-agenda
    "op" 'org-set-property)
  ;; mu4e-html2text-command "w3m -T text/html"
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((gnuplot . t)
     (python . t)))

  (with-eval-after-load 'mu4e-alert
    ;; Enable Desktop notifications
    (mu4e-alert-set-default-style 'notifications)) ; For linux
  ;; (mu4e-alert-set-default-style 'libnotify))  ; Alternative for linux

  (add-hook 'mu4e-view-mode-hook
            (lambda()
              ;; try to emulate some of the eww key-bindings
              (local-set-key (kbd "<tab>") 'shr-next-link)
              (local-set-key (kbd "<backtab>") 'shr-previous-link)))

  (setq mu4e-maildir "~/mail"
        mu4e-trash-folder "/Trash"
        mu4e-sent-folder "/Sent"
        mu4e-drafts-folder "/Drafts"
        mu4e-refile-folder "/Archive"
        mu4e-get-mail-command "mbsync -a"
        sendmail-program "/usr/bin/msmtp"
        message-send-mail-function 'message-send-mail-with-sendmail
        mu4e-change-filenames-when-moving t
        mu4e-compose-format-flowed t
        mu4e-update-interval 60
        mu4e-compose-dont-reply-to-self t
        message-kill-buffer-on-exit t
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        mu4e-use-fancy-chars t
        org-mu4e-convert-to-html t
        mu4e-compose-complete-only-personal t
        mu4e-headers-date-format "%d.%m.%Y"
        mu4e-headers-time-format "%H:%M"
        mu4e-compose-signature-auto-include t
        mu4e-headers-auto-update t
        )

  ;; use imagemagick, if available
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))
  (setq mu4e-reply-to-address "konstantin@shmelkov.net"
        user-mail-address "konstantin@shmelkov.net"
        user-full-name  "Konstantin Shmelkov"
        mu4e-user-mail-address-list '("konstantin@shmelkov.net" "shmel39@gmail.com"))
  (setq mu4e-compose-signature
        "Yours sincerely, Konstantin Shmelkov.\n")
  ;; Mail directory shortcuts
  (setq mu4e-maildir-shortcuts
        '(("/INBOX" . ?i)
          ("/Archive" . ?a)
          ("/Drafts"        . ?d)
          ("/Sent"        . ?s)))

  (setq calendar-week-start-day 1
        calendar-date-style 'european
        calendar-mark-holidays-flag nil)

  (setq calendar-location-name "Grenoble, France"
        calendar-latitude 45.2
        calendar-longitude 5.72)

  (setq sunshine-location "Grenoble, France"
        sunshine-show-icons t
        sunshine-units 'metric
        sunshine-appid "4e881db29c902ae1a112ec76ee9490b4")

  (add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
  (add-hook 'mail-mode-hook
            (lambda ()
              (set-fill-column 80)))
  (add-hook 'mail-mode-hook 'turn-on-auto-fill)
  ;; (add-hook 'org-mode-hook 'spacemacs/toggle-line-numbers-off 'append)
  (add-hook 'org-mode-hook 'turn-on-auto-fill 'append)
  (global-set-key "\C-cw" 'wc-mode)

  (add-to-list 'load-path "~/sound/tidal")
  (setq tidal-interpreter "/usr/bin/ghci")

  (add-hook 'mu4e-compose-mode-hook
            (defun my-do-compose-stuff ()
              "My settings for message composition."
              (set-fill-column 72)
              (flyspell-mode)))

  ;; (require 'org-crypt)
  ;; (setq org-crypt-key "A9A135B1CFAECE35")
  ;; (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  ;; (org-crypt-use-before-save-magic)
  ;; (setq epa-file-encrypt-to "A9A135B1CFAECE35")
  (define-key evil-normal-state-map (kbd "Q") (kbd "gqip"))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(evil-want-Y-yank-to-eol t)
 '(org-agenda-files
   (quote
    ("~/org/doudizhu.org" "~/org/todo.org" "~/org/sport.org" "~/org/wishlist.org" "~/org/calendar.org")))
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "https://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (org-mime hackernews ghub let-alist nov esxml dash-functional novice+ org-category-capture request-deferred skewer-mode js2-mode auth-password-store deferred helm-spotify helm-spotify-plus winum fuzzy writeroom-mode visual-fill-column wc-mode org-journal pcache hide-comnt spinner nlinum ht alert log4e gntp markdown-mode hydra parent-mode password-store fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flycheck flx grizzl magit-popup iedit anzu evil goto-chg undo-tree highlight simple-httpd org ace-jump-mode noflet powerline popwin elfeed request websocket diminish pkg-info epl counsel swiper ivy company bind-map bind-key yasnippet packed auctex async anaconda-mode pythonic f dash s avy auto-complete popup package-build base16-3024-dark-theme persp-mode neotree help-fns+ evil-unimpaired smartparens helm projectile magit git-commit yapfify xterm-color ws-butler with-editor window-numbering which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org theme-changer systemd sunshine spacemacs-theme spaceline solarized-theme smex smeargle shell-pop restart-emacs rase rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pip-requirements pcre2el paradox osx-location orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file nlinum-relative multi-term mu4e-maildirs-extension mu4e-alert move-text mmm-mode material-theme markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode link-hint ledger-mode ivy-hydra info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-pass helm-make helm-core google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md flyspell-correct-ivy flycheck-pos-tip flycheck-ledger flx-ido fill-column-indicator fasd fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help engine-mode elisp-slime-nav elfeed-web elfeed-org elfeed-goodies ein dumb-jump diff-hl define-word cython-mode cyberpunk-theme counsel-projectile company-statistics company-auctex company-anaconda column-enforce-mode clean-aindent-mode bbdb base16-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ac-ispell)))
 '(send-mail-function (quote sendmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(evil-want-Y-yank-to-eol t)
 '(org-agenda-files
   (quote
    ("~/org/todo.org" "~/org/sport.org" "~/org/wishlist.org" "~/org/calendar.org")))
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "https://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet-snippets yaml-mode treemacs-projectile treemacs-evil treemacs pfuture toml-mode tidal symon string-inflection spaceline-all-the-icons racer pippel pipenv password-generator overseer org-brain olivetti ob-ipython nameless monokai-theme ivy-yasnippet ivy-xref ivy-purpose window-purpose imenu-list ivy-pass importmagic epc ctable concurrent hlint-refactor hindent haskell-snippets gitignore-templates flycheck-rust flycheck-haskell evil-org transient evil-lion evil-ledger evil-goggles evil-cleverparens paredit polymode editorconfig doom-modeline eldoc-eval shrink-path all-the-icons memoize company-ghci haskell-mode company-cabal cmm-mode centered-cursor-mode cargo rust-mode browse-at-remote lv font-lock+ dotenv-mode org-mime hackernews ghub let-alist nov esxml dash-functional novice+ org-category-capture request-deferred skewer-mode js2-mode auth-password-store deferred helm-spotify helm-spotify-plus winum fuzzy writeroom-mode visual-fill-column wc-mode org-journal pcache hide-comnt spinner nlinum ht alert log4e gntp markdown-mode hydra parent-mode password-store fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flycheck flx grizzl magit-popup iedit anzu evil goto-chg undo-tree highlight simple-httpd org ace-jump-mode noflet powerline popwin elfeed request websocket diminish pkg-info epl counsel swiper ivy company bind-map bind-key yasnippet packed auctex async anaconda-mode pythonic f dash s avy auto-complete popup package-build base16-3024-dark-theme persp-mode neotree help-fns+ evil-unimpaired smartparens helm projectile magit git-commit yapfify xterm-color ws-butler with-editor window-numbering which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org theme-changer systemd sunshine spacemacs-theme spaceline solarized-theme smex smeargle shell-pop restart-emacs rase rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pip-requirements pcre2el paradox osx-location orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file nlinum-relative multi-term mu4e-maildirs-extension mu4e-alert move-text mmm-mode material-theme markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode link-hint ledger-mode ivy-hydra info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-pass helm-make helm-core google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md flyspell-correct-ivy flycheck-pos-tip flycheck-ledger flx-ido fill-column-indicator fasd fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help engine-mode elisp-slime-nav elfeed-web elfeed-org elfeed-goodies ein dumb-jump diff-hl define-word cython-mode cyberpunk-theme counsel-projectile company-statistics company-auctex company-anaconda column-enforce-mode clean-aindent-mode bbdb base16-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ac-ispell)))
 '(send-mail-function (quote sendmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
