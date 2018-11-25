.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
		mov $0, %ecx
		push %ecx         /* r dans la pile (mais on commence à 0) utiliser (%esp)  */
		push %ecx /* mettre c sur la pile c est à 4(%esp)*/
		
		
		jmp test_for_r
		boucle_for_r:
		
			mov $0, %edx
			mov %edx,4(%esp) /* mettre 0 dans c (à 4(%esp)) */ 
			
			jmp test_for_c
			
			boucle_for_c:

				/* mettre inmatdata[r + c * matorder] dans %ebx*/ 
				mov 4(%esp),%edx  /*mettre c dans eax*/
				imul 16(%ebp), %edx     /*c*matorder*/
				
				add (%esp), %edx /*c*matorder+r dans eax*/
				imul $4,%edx /*Pour bouger de sizeof int*/
				mov 8(%ebp), %esi /* get le tableau inmatdata */ 
				mov (%edx,%esi,1), %ebx /*inmatdata[r+c * matorder] dans ebx*/
				
				
				/* mettre %ebx outmatdata[c + r * matorder]*/ 
				mov (%esp),%edx  /*mettre r dans eax*/
				imul 16(%ebp), %edx     /*r*matorder*/
				add 4(%esp), %edx /* r*matorder+c dans eax*/
				imul $4,%edx /*Pour bouger de sizeof int*/
				mov 12(%ebp), %esi /* get le tableau outmatdata */ 
				mov %ebx,(%edx,%esi,1) /* %ebx dans outmatdata[r+c * matorder]*/
						
				
				
				
				add $1, 4(%esp) /* incrémenter c de 1*/
			
			test_for_c:
				mov 4(%esp), %esi /* mettre c dans %esi pour la comparaison*/
				cmp  %esi,16(%ebp)
				ja boucle_for_c
				
		add $1, (%esp) /* incrémenter r de 1 */
		
		test_for_r:
			mov (%esp), %esi /*mettre r dans %esi*/
			cmp %esi,16(%ebp) /*comparer r à matorder*/
			ja boucle_for_r
			
		
		
			
ending:
	/*enlever r, c de la pile */
	pop %edx
	pop %edx
        leave          /* restore ebp and esp */
        ret            /* return to the caller */


