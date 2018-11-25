.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
		        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
		mov $0, %ecx
		push %ecx         /* r dans la pile (mais on commence à 0) utiliser (%esp)  */
		push %ecx 		/* mettre c sur la pile c est à 4(%esp)*/
		jmp test_for_r
		boucle_for_r:
		
			mov $0, %edx
			mov %edx,4(%esp) /* Mettre c à 0 sur la pile chaque nouvelle boucle extérieur */  
			
			jmp test_for_c
			
			boucle_for_c:

				mov (%esp),%edx  /*mettre r dans edx*/
				cmp 4(%esp),%edx /* comparaison de c et r*/
				je if_Equal
					mov $0,%ebx/*Mettre 0 dans %ebx pour que le out table =0 à cette élément*/
				
				
				jmp end_if
				
				if_Equal: 
					/*viens ici si r==c*/
					imul 16(%ebp), %edx     /* r*matorder*/
					add 4(%esp), %edx /* r*matorder+c dans edx*/
					imul $4,%edx /*Pour bouger de sizeof int*/
					mov 8(%ebp), %esi /* get le tableau inmatdata */ 
					mov (%edx,%esi,1), %ebx /*inmatdata[c+r * matorder] dans ebx*/
					/*Contenue de inmatdata est dans %ebx*/
				
				
				end_if:
				
					/*mettre ce que l'on veut dans outmatdata[c + r * matorder]*/
					mov (%esp),%edx  /*mettre r dans edx*/
					imul 16(%ebp), %edx     /*r*matorder*/
					add 4(%esp), %edx /* r*matorder+c dans eax*/
					imul $4,%edx /*Pour bouger de sizeof int*/
					mov 12(%ebp), %esi /* get le tableau outmatdata */ 
					mov %ebx,(%edx,%esi,1) /* %ebx dans outmatdata[c+r * matorder]*/
					
			
			
			
			add $1, 4(%esp) /* incrémenter c de 1*/
			
			test_for_c:
				mov 4(%esp), %esi /* mettre c dans %esi pour la comparaison*/
				cmp  %esi,16(%ebp)
				ja boucle_for_c
				
		add $1, (%esp) /* incrémenter r de 1 a %esp */
		
		test_for_r:
			mov (%esp), %esi
			cmp %esi,16(%ebp)
			ja boucle_for_r
			
		
		
			
ending:
	pop %edx
	pop %edx
        leave          			/* Restore ebp and esp */
        ret            			/* Return to the caller */

