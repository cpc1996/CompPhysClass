## CompPhysClass
This is a simple latex class for typing lecture notes and problems in Computational Physics. It provides the most basic utilities for you to conduct your documents. Try to look at file `CompPhysClass.cls`!

## Quick start
`compile.tex` is used to marginal configurations and compiling. The main content is included into this file from other locations such as `archive/` and `code/`.

For the fist example (`archive/test1.tex`), just compile `compile.tex` and the result will look like `test1.pdf`.

For the second example (`archive/test2.tex`), try typesetting `compile.tex` with the following lines:

	\documentclass[codeC]{CompPhysClass}
	\usepackage[utf8]{vietnam}

	\graphicspath{{./images}}

	\subject{Lập trình C}

	\begin{document}
		\infohead
		\input{archive/test2}
	\end{document}

The result should look like `test2.pdf`.

## Some useful commands

	\documentclass[LANGUAGE]{CompPhysClass}

where `LANGUAGE` is the default programming language used for code listing. `LANGUAGE` can be `codeC`, `codeMatlab`, `codePython`, `console`, or `plaintext`. The default is `codeC`.
Besides, there are some style-related options: `hidecodecomment`, `hidelastediteddate`, and `showcodenumber`.

	\infohead

creates header: logo and information of your department/university. You should change it before use.

	\subject{ SUBJECT }

shows subject name in footer.

	\head{ DOCUMENT TITLE }

shows the title of the document.

	\link{ URL }{ CONTENT }

similar to `\href` command but with style.

	\memo{ CLASSIFIER }{ CONTENT }

shows important remark. Command `\note` is similar to `\memo` but with customizable mark symbol. In `\memo`, 'hand' symbol (`\hand`) is default.

	\m{ 1 & 2 \\ 3 & 4 }

makes matrix. Similar commands: `\mb`, `\mv`.

	\np{ SIZE }{ CONTENT }

creates minipage. Default `SIZE` is `.47` (textwidth).
