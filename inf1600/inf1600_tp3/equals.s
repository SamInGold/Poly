.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */
        
        /* Write your solution here */
		mov $0, %ecx
		push %ecx         /* r dans la pile (mais on commence à 0) utiliser (%esp)  */
		push %ecx /* mettre c sur la pile c est à 4(%esp)*/
		jmp test_for_r
		boucle_for_r:
		
			mov $0, %edx
			mov %edx,4(%esp) /* mettre c à 0 */ 
			
			jmp test_for_c
			
			boucle_for_c:

				/*prendre inmatdata1[c + r * matorder] */ 
				mov (%esp),%edx  /*mettre r dans edx*/
				imul 16(%ebp), %edx     /*r*matorder*/
				add 4(%esp), %edx /* r*matorder+c dans edx*/
				imul $4,%edx /*Pour bouger de sizeof int*/
				mov 8(%ebp), %esi /* get le tableau inmatdata1 */
				mov (%edx,%esi,1), %ebx /*inmatdata1[r+c * matorder] dans ebx*/
				
				/*prendre inmatdata2[c + r * matorder] */ 
				mov (%esp),%edx  /*mettre r dans edx*/
				imul 16(%ebp), %edx     /*r*matorder*/
				add 4(%esp), %edx /* r*matorder+c dans edx*/
				imul $4,%edx /*Pour bouger de sizeof int*/
				mov 12(%ebp), %esi /* get le tableau inmatdata2 */
				mov (%edx,%esi,1), %edx /*inmatdata2[r+c * matorder] dans edx*/
				
				/*comparaison des deux éléments */
				
				cmp %edx,%ebx
				jne if_not_equals
			
					
			
			
			
			add $1, 4(%esp) /* incrémenter c de 1*/
			
			test_for_c:
				mov 4(%esp), %esi /* mettre c dans %esi pour la comparaison*/
				cmp  %esi,16(%ebp)
				ja boucle_for_c
				
		add $1, (%esp) /* incrémenter r de 1*/
		
		test_for_r:
			mov (%esp), %esi
			cmp %esi,16(%ebp)
			ja boucle_for_r
		
		
		
		/*return 1 alors on mets 1 dans %eax*/
		if_equals:
			mov $1,%eax	
			jmp ending
		
		if_not_equals:
			mov $0,%eax	
			jmp ending	
			
ending:
	pop %edx
	pop %edx
	leave
	ret
