(define-module (python-pseudoflow)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages check)
  #:use-module (guix licenses))

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
