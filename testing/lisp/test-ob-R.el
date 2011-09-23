;;; test-ob-R.el --- tests for ob-R.el

;; Copyright (c) 2011 Eric Schulte
;; Authors: Eric Schulte

;; Released under the GNU General Public License version 3
;; see: http://www.gnu.org/licenses/gpl-3.0.html

(org-test-for-executable "R")
(unless (featurep 'ess)
  (signal 'org-test-lib-not-found "ess"))

(let ((load-path (cons (expand-file-name
			".." (file-name-directory
			      (or load-file-name buffer-file-name)))
		       load-path)))
  (require 'org-test)
  (require 'org-test-ob-consts))

(require 'ob-R)

(ert-deftest test-ob-R/simple-session ()
  (if (and (featurep 'ess)
	   (eql 0 (shell-command org-babel-R-command)))
      (org-test-with-temp-text
	  "#+begin_src R :session R\n  paste(\"Yep!\")\n#+end_src\n"
	(should (string= "Yep!" (org-babel-execute-src-block))))
    (message "NOTE: =test-ob-R/simple-session= NOT run!
 R and ESS are required to run =test-ob-R/simple-session=")))

(provide 'test-ob-R)

;;; test-ob-R.el ends here
 
