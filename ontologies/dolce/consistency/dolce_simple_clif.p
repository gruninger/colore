

/*****************************************DOLCE SIMPLE
*DOLCE SIMPLE in CLIF
*
*by D. Porello, S. Borgo, L. Vieu.
*
*
*Based on the axioms of DOLCE (D18) proved consistent in
*(v. DolceSimple) https://github.com/spechub/Hets-lib/blob/master/Ontology/Dolce/DolceSimpl.dol
*
*NOTE: The names of the axioms and theorems of DOLCE SIMPLE are those from DOLCE D18 for direct comparison.
*(http://www.loa.istc.cnr.it/wp-content/uploads/2020/03/D18inv.31-12-03.pdf)
*Also proved consistent with Darwin 1.4.4 within Hets.
*
*
*Simplifications of DOLCE SIMPLE with respect to DOLCE D18
*
*
*1. Instead of a General Extensional Mereology, we have only a weak mereology. So (Ad9) and (Ad15) are weakened assuming only the existence of binary sums and (Ad8) (strong supplementation) is weakened by assuming the existence of binary differences.
*2. The predicate PRE (being present) defined in D18 by means of the mereological fusion is here introduced as a primitive relation.
*3. The ''spatial inclusion'' relation is not defined here (originally it needs fusion) therefore axioms (Ad19),(Ad28), and (Ad68) are not expressed.
*4. The quality relation (qt) is simplified considering only ''direct qualities''(dQt).
*5.	Axioms (Ad56),(Ad57),(Ad63), and (Ad64) are instantiated only by temporal and spatial locations (TL and SL) and by Time intervals (T) and Space Regions (S), i.e. all the leaves present in DOLCE D18.
*6. There are no modalities in DOLCE SIMPLE. D18 was in fact a first-order modal theory (in modal logic QS5 with constant domain). Here we omit the modal structure and accordingly the definitions of the ''dependencies'', besides "specific dependence" (sd).
*7. To obtain more populated models, we omit the existence of sums and (Ad29).


*****************************************/


/*****************************************
*Taxonomy:
*We explicitly list the taxnomy and disjointness axioms according to D18.
*****************************************/


/*****************************************
*Inclusion Axioms
*****************************************/


(forall (x)
	(iff (or (AB x)(ED x)(PD x)(Q x))
		(PT x)))

(forall (x)
	(iff (or (AS x)(NPED x)(PED x))
		(ED x)))

(forall (x)
	(iff (or (PRO x)(ST x))
		(STV x)))

(forall (x)
	(iff (or (EV x)(STV x))
		(PD x)))

(forall (x)
	(iff (or (AQ x)(PQ x)(TQ x))
		(Q x)))

(forall (x)
	(iff (or (ACC x)(ACH x))
		(EV x)))

(forall (x)
	(iff (or (APO x)(NAPO x))
		(POB x)))

(forall (x)
	(iff (or (SAG x)(SC x))
		(ASO x)))

(forall (x)
	(iff (or (ASO x)(NASO x))
		(SOB x)))

(forall (x)
	(iff (or (SOB x)(MOB x))
		(NPOB x)))

(forall (x)
	(iff (or (AR x)(PR x)(TR x))
		(R x)))

(forall (x)
	(if (R x)
		(AB x)))

(forall (x)
	(iff (or(F x)(M x)(POB x))
		(PED x)))

(forall (x)
	(if (NPOB x)
		(NPED x)))

(forall (x)
	(if (S x)
		(PR x)))

(forall (x)
	(if (SL x)
		(PQ x)))

(forall (x)
	(if (T x)
		(TR x)))

(forall (x)
	(if (TL x)
		(TQ x)))




/*****************************************
*Disjointness Axioms
*****************************************/

(not (exists (x)
    (and (AB x)(ED x))))

(not (exists (x)
    (and (AB x)(PD x))))

(not (exists (x)
    (and (AB x)(Q x))))

(not (exists (x)
    (and (ED x)(PD x))))

(not (exists (x)
    (and (PD x)(Q x))))

(not (exists (x)
    (and (ED x)(Q x))))

/****************************************ED*/



(not (exists (x)
    (and (PED x)(NPED x))))

(not (exists (x)
    (and (PED x)(AS x))))

(not (exists (x)
    (and (NPED x)(AS x))))

(not (exists (x)
    (and (M x)(F x))))

(not (exists (x)
    (and (F x)(POB x))))

(not (exists (x)
    (and (M x)(POB x))))

(not (exists (x)
    (and (MOB x)(SOB x))))

(not (exists (x)
    (and (ASO x)(NASO x))))

(not (exists (x)
    (and (SAG x)(SC x))))

(not (exists (x)
    (and (APO x)(NAPO x))))

/****************************************PD*/

(not (exists (x)
    (and (EV x)(STV x))))

(not (exists (x)
    (and (ACH x)(ACC x))))

(not (exists (x)
    (and (ST x)(PRO x))))

/****************************************Q*/

(not (exists (x)
    (and (TQ x)(PQ x))))

(not (exists (x)
	(and (PQ x)(AQ x))))

(not (exists (x)
    (and (TQ x)(AQ x))))

/****************************************AB*/

(not (exists (x)
    (and (TR x)(PR x))))

(not (exists (x)
    (and (PR x)(AR x))))

(not (exists (x)
    (and (TR x)(AR x))))




/*****************************************

*Classical Extensional Mereology (Parthood (p)

*****************************************/

(cl-comment 'Argument restrictions Ad1')

(forall (x y)
(if (p x y)
    (and (or (AB x)(PD x))(or (AB y)(PD y)))))


(cl-comment 'Argument restrictions Ad2')

(forall (x y)
(if (p x y)
    (iff (PD x)(PD y))))

(cl-comment 'Argument restrictions Ad3')

(forall (x y)
(if (p x y)
    (iff (AB x)(AB y))))

(cl-comment 'Argument restrictions, instances of Ad4')

(forall (x y)
(if (p x y)
    (iff (T x)(T y))))

(forall (x y)
(if (p x y)
    (iff (S x)(S y))))

(forall (x y)
(if (p x y)
    (iff (AR x)(AR y))))


/*****************************************/

(cl-comment 'Reflexivity Ad5')

(forall (x)
(if (or (AB x)(PD x))
     (p x x)))

(cl-comment 'Antysymmetry Ad6')

(forall (x y)
    (if (and (p x y)(p y x))
    (= x y)))

(cl-comment 'Transitivity Ad7')

(forall (x y z)
    (if (and (p x y)(p y z))
    (p x z)))

/*****************************************/

(cl-comment 'Proper part definition (pp) Dd14')

(forall (x y)
    (iff (pp x y)
    (and (p x y) (not (p y x)))))

(cl-comment 'Overlap definition (ov) Dd15')

(forall (x y)
    (iff (ov x y)
    (exists (z)(and (p z x)(p z y)))))

(cl-comment 'Atom definition (At) Dd16 corrected')

(forall (x)
    (iff (at x)
    (and (or (PD x)(AB x))(not (exists (y) ((pp y x)))))))

(cl-comment 'Atomic Part definition (AtP) Dd17')

(forall (x y)
    (iff (atP x y)
    (and (p x y)(at x))))


(cl-comment 'Binary sum definition (sum) Dd18')

(forall (x y z)
				(iff (sum z x y)
				(and (or (and (AB z)(AB x)(AB y))(and (PD z)(PD x)(PD y))) (forall (w) (iff (ov w z)(or (ov w x)(ov w y)))))))


(cl-comment 'Binary difference definition (dif)')

(forall (x y z)
				(iff (dif z x y)
				(and (or (and (AB z)(AB x)(AB y))(and (PD z)(PD x)(PD y))) (forall (w) (iff (p w z)(and (p w x)(not (ov w y))))))))


(cl-comment 'Extensionality plus existence of the difference (v DolceSimpl comments: simplification of supplementation Ad8_1)')

(forall (x y)
				(if (and ((AB x)(AB y)(not (p x y)))
						(exists (z) (dif z x y))))


(cl-comment 'Extensionality plus existence of the difference (v DolceSimpl comments: simplification of supplementation Ad8_2)')

(forall (x y)
					(if (and ((PD x)(PD y)(not (p x y)))
							(exists (z) (dif z x y))))

/**************Omitted for the prover:


(cl-comment 'Existence of the sum (v. DolceSimpl comments: restriction of Ad9 to the existence of binary sums of ABs and PDs)')

(forall (x y)
	(if (and (AB x)(AB y))
	(exists (z) (sum z x y))))

(forall (x y)
	(if (and (PD x)(PD y))
	(exists (z) (sum z x y))))

*************/


/*****************************************COMMENT

*In DolceSimple, time mereology is defined by:

%%---------------
%% Time_Mereology
%%---------------
%% Time_Mereology is needed in oder to specify the properties of perdurants

spec Time_Mereology =
     Classical_Extensional_Parthood with s |-> T
end

Here we are defining mereology for AB, so it includes T.
*****************************************/



/******************

PRESENT AT (pre)
In Dolce Simple "present at" is primitive.

******************/

(cl-comment 'Present at. Argument restriction')

(forall (x t)
				(if (pre x t)
					(and (or (ED x)(PD x)(Q x))(T t))))

(cl-comment 'Present at. Dissectivity. Theorem Td17 in D18')

(forall (x t1 t2)
				(if (and (pre x t1)(p t2 t1))
					(pre x t2)))

/********************************************************
TEMPORAL_PART in DolceSimple (temporalPart)

**************************************************/



(cl-comment 'Temporal part. Simplification of Dd54')

(forall (x y)
      (iff (temporalPart x y)
			(and (PD x)(PD y)(p x y)(forall (z)(if (and (PD z)(p z y)
						(forall (t)(if (pre z t)(pre x t))))(p z x))))))



/****************************************

TEMPORARY PARTHOOD (tP):

*Note that in DolceSimple the antisymmetry of temporal parthood is assumed, we have to drop it here, it is wrong wrt. D18.
*We restate here explicitly the axioms of temporary parthood from D18 used in DolceSimple.

**************/

(cl-comment 'Temporary parthood. Argument restrictions. Ad10')


(forall (x y t)
	(if (tP x y t)
     		(and (ED x)(ED y)(T t))))

(cl-comment 'Temporary parthood. Argument restrictions. Ad11')


(forall (x y t)
	(if (tP x y t)
     		(iff (PED x)(PED y))))

(cl-comment 'Temporary parthood. Argument restrictions. Ad12')


(forall (x y t)
	(if (tP x y t)
     		(iff (NPED x)(NPED y))))

(cl-comment 'Temporary parthood. Ground Axioms. Ad13')

(forall (x y z t)
	(if (and (tP x y t)(tP y z t))
     		(tP x z t)))

(cl-comment 'Temporary parthood. Definition of temporary overlap(tOv). Dd21')


(forall (x y t)
    (iff (tOv x y t)
    (exists (z)(and (tP z x t)(tP z y t)))))


(cl-comment 'Temporary parthood. Definition of temporary proper part (tPp). Dd20')


(forall (x y t)
    (iff (tPp x y t)
    (and (tP x y t)(not (tP y x t)))))


(cl-comment 'Temporary Atom definition (tAt). Dd22 corrected')

(forall (x t)
    (iff (tAt x t)
    (and (ED x)(T t)(not (exists (y) (tPp y x t))))))

(cl-comment 'Temporart Atomic Part definition (tAtP). Dd23')

(forall (x y)
    (iff (tAtP x y t)
    (and (tP x y t)(tAt x t))))


(cl-comment 'Temporary sum (tSum) definition. See also Dd26')


(forall (x y z)
	(iff (tSum z x y)
		(or (and (PED z)(PED x)(PED y)) (and (NPED z)(NPED x)(NPED y))) (forall (w t) (iff (tOv w z t)(or (tOv w x t)(tOv w y t)))))))


/**************Omitted for the prover


(cl-comment 'Existence of tSum restricted to ED. Part of the axiom Ad15.')


(forall (x y)
	(if (and (PED x)(PED y))(exists (z) (tSum z x y))))

	(forall (x y)
	(if (and (NPED x)(NPED y))(exists (z) (tSum z x y))))

	*************/



(cl-comment 'Temporary parthood. Ad16.')

(forall (x t)
	(if (and (ED x)(pre x t))(tP x x t)))

(cl-comment 'Temporary parthood. Ad17.')

(forall (x y t)
	(if (tP x y t)
     		(and (pre x t)(pre y t))))

(cl-comment 'Temporary parthood. Ad18.')

(forall (x t)
	(if (tP x y t)
     		(forall (w)(if (p w t)(tP x y w)))))




/**************

CONSTITUTION (k)

**************/

(cl-comment 'Constitution. Argument restrictions. Ad20')

(forall (x y t)
	(if (k x y t)
     		(and (or(ED x)(PD x))(or(ED y)(PD y))(T t))))


(cl-comment 'Constitution. Argument restrictions. Ad21')

(forall (x y t)
	(if (k x y t)
     		(iff (PED x)(PED y))))

(cl-comment 'Constitution. Argument restrictions. Ad22')

(forall (x y t)
	(if (k x y t)
     		(iff (NPED x)(NPED y))))

(cl-comment 'Constitution. Argument restrictions. Ad23')

(forall (x y t)
	(if (k x y t)
     		(iff (PD x)(PD y))))

(cl-comment 'Constiution. Ground axioms. Strict order on k in DolceSimple. Ad24')

(forall (x y t)
	(if (k x y t)
     		(not (k y x t))))

(cl-comment 'Constitution. Ground axioms. Strict order on k in DolceSimple. Ad25')

(forall (x y t)
	(if (and (k x y t)(k y z t))
     		((k x z t))))

(cl-comment 'Constitution. Ad26')

(forall (x y t)
	(if (k x y t)
     		(and (pre x t)(pre y t))))



(cl-comment 'Constitution. Ad27 weakened')

(forall (x y t)
	(if (k x y t)
     		(forall (w) (if (p w t)(k x y w)))))

%Check without this for larger models:

(cl-comment 'Constitution. Ad29')

(forall (x y v t)
	(if (and(k x y t)(tP v y t))
     		(exists (w) (and(tP w x t)(k w v t)))))



/**************

PARTICIPATION (pc)

**************/


(cl-comment 'Participation. Argument restrictions. Ad33')

(forall (x y t)
	(if (pc x y t)
     		(and (ED x)(PD y)(T t))))

(cl-comment 'Participation. Existential axioms. Ad34')

(forall (x t)
	(if (and (PD x)(pre x t))
     		(exists (y) (pc y x t))))

(cl-comment 'Participation. Existential axioms. Ad35')

(forall (x)
	(if (ED x)
     		(exists (y t) (pc x y t))))

(cl-comment 'Participation. Ad36')

(forall (x y t)
	(if (pc x y t)
     		(and (pre x)(pre y))))

(cl-comment 'Participation. Ad37')

(forall (x y t)
	(if (pc x y t)
     		(forall (w) (if (p w t)(pc x y w)))))

*/


/**************

DIRECT QUALITY (dQt)

We simplify the D18 only considering direct qualities and not qualities in general (qt in D18),
we shall rephrase the axioms of qt for dQt.

**************/

(cl-comment 'Direct quality. Argument restrictions. Ad38 or dQt')

(forall (x y)
	(if (dQt x y)
     		(and (Q x)(or (ED y)(PD y)))))

(cl-comment 'Direct quality. Argument restrictions. Ad39 or dQt')

(forall (x y)
	(if (dQt x y)
     		(iff (TQ x)(PD y))))

(cl-comment 'Direct quality. Argument restrictions. Ad40 or dQt')

(forall (x y)
	(if (dQt x y)
     		(iff (PQ x)(PED y))))

(cl-comment 'Direct quality. Argument restrictions. Ad41 or dQt')

(forall (x y)
	(if (dQt x y)
     		(iff (AQ x)(NPED y))))

(cl-comment 'Direct quality. No transitivity for dQt Ad42')

(cl-comment 'Direct quality. Ad43')

(forall (x y v)
	(if (and (dQt x y)(dQt x v))
     		(= y v)))

/**************/

(cl-comment 'Direct quality. Ad44')

		(forall (x y w)
			(if (and (dQt x y)(dQt w y)(TL x)(TL w))
     				(= x w)))
		(forall (x y w)
			(if (and (dQt x y)(dQt w y)(SL x)(SL w))
     				(= x w)))

/**************/

(cl-comment 'Direct quality. Existential axioms. Ad46')

(forall (x)
	(if (TQ x)(exists (y) (and (dQt x y)(PD y)))))

(cl-comment 'Direct quality. Existential axioms. Ad47')

(forall (x)
	(if (PQ x)(exists (y) (and (dQt x y)(PED y)))))

(cl-comment 'Direct quality. Existential axioms. Ad48')

(forall (x)
	(if (AQ x)(exists (y) (and (dQt x y)(NPED y)))))

(cl-comment 'Direct quality. Existential axioms. Approximation of Ad49')

(forall (x)
	(if (PD x)(exists (y) (and (dQt y x)(TL y)))))

(cl-comment 'Direct quality. Existential axioms. Approximation of Ad50')

(forall (x)
	(if (PED x)(exists (y) (and (dQt y x)(SL y)))))

(cl-comment 'Direct quality. Existential axioms. Approximation of Ad51')

(forall (x)
	(if (NPED x)(exists (y) (and (dQt y x)(AQ y)))))


/**************

IMMEDIATE QUALE (ql)

**************/

(cl-comment 'Immediate quale. Argument restrictions. Ad52')

(forall (x y)
	(if (ql x y)
     		(and (TR x)(TQ y))))

(cl-comment 'Immediate quale. Argument restrictions. Ad53')

(forall (x y)
	(if (and(ql x y)(TL y))
     		(T x)))

(cl-comment 'Immediate quale. Ground axiom. Ad54')

(forall (x w y)
	(if (and(ql x y)(ql w y))
     		(= x w)))

(cl-comment 'Immediate quale. Existential Axiom. Ad55')

(forall (x)
	(if (TQ x)
     		(exists (y) (ql y x))))

(cl-comment 'Immediate quale. Existential Axiom. Ad56 and Ad57 in general are missing from DolceSimple')



/**************

TEMPORARY QUALE (tql)

**************/

(cl-comment 'Temporary quale. Argument restrictions. Ad58')

(forall (x y t)
	(if (tql x y t)
     		(and (or(PR x)(AR x))(or(PQ y)(AQ y))(T t))))

(cl-comment 'Temporary quale. Argument restrictions. Ad59')

(forall (x y t)
	(if (tql x y t)
     		(iff (PR x)(PQ y))))

(cl-comment 'Temporary quale. Argument restrictions. Ad60')

(forall (x y t)
	(if (tql x y t)
     		(iff (AR x)(AQ y))))

(cl-comment 'Temporary quale. Argument restrictions. Ad61')

(forall (x y t)
	(if (and (tql x y t)(SL y))
     		(S x)))

(cl-comment 'Temporary quale. Existential axioms. Ad62')

(forall (x t)
	(if (and (or (PQ x)(AQ x))(pre x t))
     		(exists (y)(tql y x t))))

(cl-comment 'Temporary quale. Existential axioms. Ad63 and Ad64 in general are not present in DolceSimple')

(cl-comment 'Temporary quale. Ad65')

(forall (x y t)
	(if (tql x y t)
     		(pre y t)))

(cl-comment 'Temporary quale. Binary temporal dissectivity. Ad66')

(forall (x y t)
	(if (tql x y t)
     		(forall (w) (if (p w t)(tql x y w)))))



 /**************

 SPECIFIC CONSTANT DEPENDENCE (sd)

 **************/

 (cl-comment 'Specific constant dependence. Dd69')


(forall (x y)
	(iff (sd x y)
     		(and(exists (t) (pre x t))(forall (t) (if (pre x t)(pre y t))))))
