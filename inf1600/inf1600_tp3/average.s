.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
		        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
		mov $0, %ecx
		push %ecx         /* r dans la pile (mais on commence à 0) utiliser (%esp)  */
		push %ecx /* mettre c sur la pile c est à 4(%esp)*/
		push %ecx /* mettre elem sur la pile elem est a 8(%esp)*/
		jmp test_for_r
		boucle_for_r:
		
			mov $0, %edx
			mov %edx,4(%esp) /* Mettre c à 0 sur la pile chaque nouvelle boucle extérieur */ 
			mov %edx,8(%esp) /* Mettre elem à 0 sur la pile chaque nouvelle boucle extérieur */ 
			
			jmp test_for_c
			
			boucle_for_c:

					
				mov (%esp),%edx  /*mettre r dans edx*/
				imul 16(%ebp), %edx     /*r*matorder*/
				add 4(%esp), %edx /* r*matorder+c dans edx*/
				imul $4,%edx /*Pour bouger de sizeof int*/
				mov 8(%ebp), %esi /* get le tableau inmatdata */ 
				mov (%edx,%esi,1), %ebx /*inmatdata[c+r * matorder] dans ebx*/
				
				add %ebx,8(%esp) /* ajout de inmatdata[c+r * matorder] dans elem*/
		
					
			
			
			
			add $1, 4(%esp) /* incrémenter c de 1*/
			
			test_for_c:
				mov 4(%esp), %esi /* mettre c dans %esi pour la comparaison*/
				cmp  %esi,16(%ebp)
				ja boucle_for_c
			
			/*elem/matorder -­> outmatdata[r]*/
			mov $0,%eax
			mov $0,%edx/*mettre %edx et %eax à 0 pour bien faire la division*/
			
			mov 8(%esp),%eax /* get total mettre dans ax */ 
			mov 16(%ebp),%ebx /* mettre matorder dans %ebx*/
			div %ebx  /*divise ax/matorder resultat dans al*/
			mov %eax,%ebx /* mettre %eax dans %ebx */
			
			/* mettre la division dans outmatdata[r]*/
			mov (%esp),%edx /* mettre r dans %edx*/
			imul $4,%edx /*Pour bouger de sizeof int*/
			mov 12(%ebp), %esi /* get le tableau outmatdata */ 
			mov %ebx,(%edx,%esi,1) /*mettre la moyenne dans le outTable*/
				
		add $1, (%esp) /* incrémenter r de 1*/
		
		test_for_r:
			mov (%esp), %esi
			cmp %esi,16(%ebp)
			ja boucle_for_r
			
		
		
			
ending:
/*pop r,c,elem de la pile*/
	pop %edx
	pop %edx
	pop %edx
        leave          			/* Restore ebp and esp */
        ret           			/* Return to the caller */
		
