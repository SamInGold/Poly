.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        mov $0, %ecx
		push %ecx         /* r dans la pile (mais on commence à 0) utiliser (%esp)  */
		push %ecx /* mettre c sur la pile c est à 4(%esp)*/
		push %ecx /* mettre i sur la pile i est à 8(%esp)*/
		push %ecx /* mettre elem sur la pile elem est à 12(%esp)*/
		jmp test_for_r
		boucle_for_r:
		
			mov $0, %edx
			mov %edx,4(%esp) /* c dans la pile (idem) utilise 4(%esp) */ 
			
			jmp test_for_c
			
			boucle_for_c:

				
				mov $0, %edx
				mov %edx,8(%esp) /* mettre i à 0  */ 
				mov %edx,12(%esp) /* mettre elem à 0  */ 
				
				jmp test_for_i
				
				boucle_for_i:
				
					/*Prendre inmatdata1[i + r * matorder]*/
					mov (%esp),%edx  /*mettre r dans edx*/
					imul 20(%ebp), %edx     /*r*matorder*/
					add 8(%esp), %edx /* r*matorder+i dans edx*/
					imul $4,%edx /*Pour bouger de sizeof int*/
					mov 8(%ebp), %esi /* get le tableau inmatdata1 */ 
					mov (%edx,%esi,1), %ebx /*inmatdata1[i+r* matorder] dans ebx*/
					
					/*Prendre inmatdata2[c + i * matorder]*/
					mov 8(%esp),%edx  /*mettre i dans edx*/
					imul 20(%ebp), %edx     /*i*matorder*/
					add 4(%esp), %edx /* i*matorder+c dans edx*/
					imul $4,%edx /*Pour bouger de sizeof int*/
					mov 12(%ebp), %esi /* get le tableau inmatdata2 */ 
					mov (%edx,%esi,1), %edx /*inmatdata2[c + i* matorder] dans edx*/
					
					
					imul %edx,%ebx /* faire la multiplication*/
					
					add %ebx,12(%esp) /* ajouter la multiplication à elem*/
				
			
			
				add $1, 8(%esp) /* incrémenter i de 1*/
				
				test_for_i:
					mov 8(%esp), %esi /* mettre i dans %esi pour la comparaison*/
					cmp  %esi,20(%ebp)
					ja boucle_for_i
			
			/*Prendre outmatdata[c + r * matorder]*/
			mov (%esp),%edx  /*mettre r dans edx*/
			imul 20(%ebp), %edx     /*r*matorder*/
			add 4(%esp), %edx /* r*matorder+c dans edx*/
			imul $4,%edx /*Pour bouger de sizeof int*/
			mov 16(%ebp), %esi /* get le tableau outmatdata */
			mov 12(%esp),%ebx /*mettre elem dans %ebx*/
			mov %ebx, (%edx,%esi,1) /*mettre elem dans outmatdata[c + r * matorder]*/
				
			add $1, 4(%esp) /* incrémenter c de 1*/
			
			test_for_c:
				mov 4(%esp), %esi /* mettre c dans %esi pour la comparaison*/
				cmp  %esi,20(%ebp)
				ja boucle_for_c
				
		add $1, (%esp) /* incrémenter r de 1 a %esp car on a pop esp*/
		
		test_for_r:
			mov (%esp), %esi
			cmp %esi,20(%ebp)
			ja boucle_for_r
			
		
		
			
ending:
/*enlever r,c,i,elem de la pile*/
	pop %edx
	pop %edx
	pop %edx
	pop %edx
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
