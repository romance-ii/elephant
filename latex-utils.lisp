(in-package :oliphaunt)

(defvar *tex-escape* '(("\\&" . "\\\\&")
                       ("\\$" . "\\\\$")
                       ("\\x92" . "'")
                       ("\\x93" . " ``")
                       ("\\x94" . "'' ")
                       ("\\223" . " ``")
                       ("\\224" . "'' ")
                       ("—" . "---")
                       ("_" . "\\_")
                       ("\\x96" . "---")
                       ("“" . "``")
                       ("”" . "''")
                       ("‘" . "`")
                       ("’" . "'")
                       ("#" . "\\#")
                       ("№" . "\\textnumero")
                       ("1½" . "$1\\\\frac{1}{2}$")
                       ("(https?://[^\\s]+)" . "\\url{\\1}")
                       ("(https?://[^\\s]+)/([^\\\\])" . "\\1/\\hspace{0pt}\\2")
                       ("(https?://[^\\s]+)/([^\\\\])" . "\\1/\\hspace{0pt}\\2")
                       ("(https?://[^\\s]+)/([^\\\\])" . "\\1/\\hspace{0pt}\\2")
                       ("\\s([a-zA-Z][^\\s]@[a-zA-Z0-9.-]+\\.[a-zA-Z0-9.-]+)"  . " \\texttt{\\1}"))
  "A set of things that need to be specially marked-up to look nice in LaTeΧ output. Regex replacements.")

(defun cl-user::tex (stream object colonp atp &rest parameters)
  "`FORMAT' printer for LaTeΧ output. Convert an Unicode string into a LaTeΧ-friendly output sequence."
  (assert (not colonp))
  (assert (not atp))
  (assert (null parameters))
  (write (regex-replace-pairs *tex-escape* (string object)) :stream stream))
