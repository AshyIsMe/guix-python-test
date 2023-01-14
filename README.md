# guix python packaging expirements

Attempting to package a currently missing python module for guix.

Initial import:

```bash
$ guix import pypi  pseudoflow -r | tee python-pseudoflow2.scm

Starting download of /tmp/guix-file.RCsRgZ
From https://files.pythonhosted.org/packages/7f/73/3026ba04192286d1caa9415d669ece7fe77469f3fe4ef245a9fbaa8b1101/pseudoflow-2022.12.0.tar.gz...
 …22.12.0.tar.gz  85KiB               8.5MiB/s 00:00 [##################] 100.0%

Starting download of /tmp/guix-file.BUz2uZ
From https://files.pythonhosted.org/packages/c3/41/58cf145137ecd083088eee309316e7b5c75524545d601010775dbe7d209c/pseudoflow-2022.12.0-cp38-cp38-win_amd64.whl...
 …p38-cp38-win_amd64.whl  20KiB      21.8MiB/s 00:00 [##################] 100.0%
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
    (home-page "https://github.com/quic0/pseudoflow")
    (synopsis "Pseudoflow algorithm for the parametric minimum cut problem.")
    (description
     "Pseudoflow algorithm for the parametric minimum cut problem.")
    (license #f)))

```

Then manually adding the module definition at the top and native-inputs:

```scheme
(define-module (python-pseudoflow)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages check)
  #:use-module (guix licenses))

    ...
    (native-inputs (list python-pytest))
    ...
```

Results in this error currently:

```bash
$ guix shell -L . python-pseudoflow
The following derivation will be built:
  /gnu/store/sp7diivi5iw78rhmx1rq3sn4ywy61jjr-python-pseudoflow-2022.12.0.drv

building /gnu/store/sp7diivi5iw78rhmx1rq3sn4ywy61jjr-python-pseudoflow-2022.12.0.drv...
\ 'check' phasebuilder for `/gnu/store/sp7diivi5iw78rhmx1rq3sn4ywy61jjr-python-pseudoflow-2022.12.0.drv' failed with exit code 1
build of /gnu/store/sp7diivi5iw78rhmx1rq3sn4ywy61jjr-python-pseudoflow-2022.12.0.drv failed
View build log at '/var/log/guix/drvs/sp/7diivi5iw78rhmx1rq3sn4ywy61jjr-python-pseudoflow-2022.12.0.drv.bz2'.
guix shell: error: build of `/gnu/store/sp7diivi5iw78rhmx1rq3sn4ywy61jjr-python-pseudoflow-2022.12.0.drv' failed

```

Extracting that log file shows that pytest seems to be failing.
