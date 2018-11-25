.data
        divider: .float 2.0 /* use this to multiply by two */
        perimeterDividedBy2: .float 2.0 /* pour sauvegarder le périmètre/2 */
.text
.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov   8(%ebp), %eax
		push  %eax # this
		mov   (%eax), %eax  # table virtuelle
		call   *12(%eax)    # appel la première fonction virtuelle
		
		fld divider /* mettre 2.0 dans st[0] */
        fdivrp /* périmètre/2 */
        fstp perimeterDividedBy2
        
        /* p-mSides[0] */
        fld perimeterDividedBy2
        mov 8(%ebp), %edx /* %edx contiendra l'adresse mémoire de l'objet*/
        fld 4(%edx) /* ajout du côté 1 du triangle sur la pile */ 
        fsubrp /* p-mSides[0] dans st[0] */
        
        /* p-mSides[1] */
        fld perimeterDividedBy2
        mov 8(%ebp), %edx /* %edx contiendra l'adresse mémoire de l'objet*/
        fld 8(%edx) /* ajout du côté 2 du triangle sur la pile */ 
        fsubrp /* p-mSides[1] dans st[0] */
        
        
        fmulp /* p-mSides[0] * p-mSides[1]*/
        
        
        /* p-mSides[2] */
        fld perimeterDividedBy2
        mov 8(%ebp), %edx /* %edx contiendra l'adresse mémoire de l'objet*/
        fld 12(%edx) /* ajout du côté 3 du triangle sur la pile */ 
        fsubrp /* p-mSides[2] dans st[0] */
        
        
        fmulp /* p-mSides[0] * p-mSides[1]  * p-mSides[2]*/
        
        /*ajoutons perimeterDividedBy2 sur la pile */ 
        fld perimeterDividedBy2
        fmulp /* p*(p-mSides[0])*(p-mSides[1])*(p-mSides[2]) */
        
        fsqrt /* sqrt(p*(p-mSides[0])*(p-mSides[1])*(p-mSides[2]))*/
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

