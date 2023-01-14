
;(use-modules (guix packages)
             ;(gnu packages gdb)               ;for 'gdb'
             ;(gnu packages version-control))  ;for 'git'

;;; Define a variant of GDB without a dependency on Guile.
;(define gdb-sans-guile
  ;(package
    ;(inherit gdb)
    ;(inputs (modify-inputs (package-inputs gdb)
              ;(delete "guile")))))

;;; Return a manifest containing that one package plus Git.
;(packages->manifest (list gdb-sans-guile git))

(use-modules (guix packages)
             (guix download)
             (guix build-system python)
             (gnu packages python)
             (gnu packages python-xyz)
             (gnu packages check)
             (guix licenses))

(define-public python-pseudoflow
  (package
    (name "python-pseudoflow")
    (version "2022.12.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pseudoflow" version))
              (sha256
               (base32
                "0izdnb7xgiangvipcy0k0lbgwn3wkn4ld1ca21gy9mjp1dkisxc3"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (native-inputs (list python-pytest))
    (home-page "https://github.com/quic0/pseudoflow")
    (synopsis "Pseudoflow algorithm for the parametric minimum cut problem.")
    (description
     "Pseudoflow algorithm for the parametric minimum cut problem.")
    (license #f)))

(packages->manifest (list python python-pseudoflow))
