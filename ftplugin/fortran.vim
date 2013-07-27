"fortran
let s:extfname= expand("%:e")
if s:extfname==? "f90"
	let fortran_free_source  = 1
	"let fortran_fixed_source = 0
elseif s:extfname==? "f95"
	let fortran_free_source  = 1
elseif s:extfname==? "f03"
	let fortran_free_source  = 1
elseif s:extfname==? "f08"
	let fortran_free_source  = 1
else
	let fortran_free_source  = 0
endif

if (fortran_free_source==1)
	setlocal tw=80
	setlocal cc=80
	setlocal ts=4 
	setlocal sts=4
	setlocal sw=4
	setlocal noexpandtab
	setlocal list
else
	setlocal tw=72
	setlocal cc=72
endif
let fortran_more_precise=1
"去掉固定格式每行开头的红色填充
let fortran_have_tabs=1
let fortran_do_enddo=1
let fortran_fold=1
let fortran_fold_conditionals=1

