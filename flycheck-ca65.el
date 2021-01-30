;;; flycheck-ca65.el --- Flycheck for ca65 assembly files      -*- lexical-binding: t; -*-

;; Copyright (C) 2021 Wendel Scardua

;; Author: Wendel Scardua <wendel@scardua.net>
;; Keywords: languages, assembly, ca65, 6502, lint, flycheck
;; Version: 0.1
;; Homepage: https://github.com/wendelscardua/ca65-mode
;; Package-Requires: ((emacs "26.1") (flycheck "31"))

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU Affero General Public License
;; as published by the Free Software Foundation, either version 3 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU Affero General Public
;; License along with this program.  If not, see
;; <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Configures Flycheck for ca65 assembly files.

;;;; Setup:

;; (add-hook 'ca65-mode-hook #'flycheck-ca65-setup)

;;; Code:

(require 'flycheck)

(flycheck-define-checker ca65
  "A ca65 syntax checker and validator using the ca65 compiler.

See URL `https://cc65.github.io/'."
  :command ("ca65" "-o" "/dev/null" source-inplace)
  :error-patterns
  ((error line-start (file-name) "(" line "): " (message) line-end))
  :modes (ca65-mode))

;;;###autoload
(defun flycheck-ca65-setup ()
  "Setup Flycheck ca65.

Adds ca65 to `flycheck-checkers'."
  (interactive)
  (add-to-list 'flycheck-checkers 'ca65))

(provide 'flycheck-ca65)
;;; flycheck-ca65.el ends here
