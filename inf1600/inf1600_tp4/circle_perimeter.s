.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */
        
        
        mov 8(%ebp), %edx /* %ebx contiendra l'adresse mémoire de l'objet*/
        fld 4(%edx) /* le rayon du cercle sera dans st[0]*/
        fldpi		/*ajoute pi sur la pile*/
        fmulp  		/*multiplie pi par rayon*/
        fld factor	/* ajouter 2 sur la pile*/
        fmulp 		/* multiplier par 2 le rayon*pi*/
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
