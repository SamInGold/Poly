.data
        factor: .float 2.0 /* use this to multiply by two */
.text
.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov   8(%ebp), %eax
		push  %eax # this
		mov   (%eax), %eax  # table virtuelle
		call   *20(%eax)    # appel la fonction areaASM
		/*Maintenant, l'aire du triangle est dans st[0]*/
		
        fld factor /* j'ajoute 2 sur la pile */ 
        fmulp /* 2.0f*A*/
        
        mov 8(%ebp), %edx /* %edx contiendra l'adresse mémoire de l'objet*/
        fld 12(%edx) /* ajout du côté 3 du triangle sur la pile */ 
        
        fdivrp /*2.0f*A/mSides[2]*/
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

