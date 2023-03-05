;;; info.el -*- lexical-binding: t; -*-

(use-package! file-info
  :config
  (setq hydra-hint-display-type 'posframe)
  (setq hydra-posframe-show-params `(:poshandler posframe-poshandler-frame-center
                                               :internal-border-width 2
                                               :left-fringe 16
                                               :right-fringe 16)))
(map! :leader
      :desc "Show file information" "f i" #'file-info-show)
