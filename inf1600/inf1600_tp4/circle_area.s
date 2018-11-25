.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
         mov 8(%ebp), %edx /* %ebx contiendra l'adresse mémoire de l'objet*/
        fld 4(%edx) /* le rayon du cercle sera dans st[0]*/
        fld 4(%edx)	/* le rayon sera dans st[0] et st[1]*/
        fmulp 		/* multiplier par rayon par rayon */
        fldpi		/*ajoute pi sur la pile*/
        fmulp  		/*multiplie pi par rayon* rayon */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
