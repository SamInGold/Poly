.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        
        mov 8(%ebp), %edx /* %edx contiendra l'adresse mémoire de l'objet*/
        fld 4(%edx) /* le premier côté sera dans st[0]*/
        fld 8(%edx) /* le deuxième côté sera dans st[0] et le premier dans st[1]*/
        faddp		/*additionne les deux premier côté*/
        fld 12(%edx) /* le troisième côté sera dans st[0] et l'addition des deux premiers dans st[1]*/
        faddp  		/*addition des trois côtés*/
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

