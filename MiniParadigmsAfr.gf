resource MiniParadigmsAfr = open MiniResAfr, MiniGrammarAfr, Prelude in {

oper
  mkN : N = overload {
    mkN : (muis : Str) -> N  = \n -> lin N (regNoun n) ** {g = Neuter} ;   -- "thing" nouns
    mkN : (gat,gate : Str) -> N = \ns,np -> lin N (mkNoun ns np) ** {g = Neuter} ; -- "thing" nouns
    mkN : (meisie : Str) -> Gender -> N  = \n,gd -> lin N (regNoun n) ** {g = gd} ;   -- "gendered" nouns (die meisie verbeel haar)
    mkN : (vrou,vrouens : Str) -> Gender -> N = \ns,np,gd -> lin N (mkNoun ns np) ** {g = gd} ; -- "gendered" nouns"
    mkN : N -> N -> N = CompoundN ;
  } ;

  mkPN = overload {
    mkPN : Str -> PN = \name -> lin PN ({ s = name ; a = Ag Sg Per3 Masc }); -- proper name
  } ;

  mkA = overload {
    mkA : (vars : Str) -> A = \a -> lin A (regAdj a) ; -- regular adjective
    --mkA : (sag, sagte : Str) -> A ; --"semi-irregular"
    mkA : (goed,goeie,goeds : Str) -> A  = \ap,aa,ag -> lin A (mkAdj ap aa ag) ; -- irregular adjective
  } ;

  mkV = overload {
    mkV : (loop : Str) -> V  = \loop -> lin V (regVerb loop) ;
    mkV : (hou,op : Str) -> V = \hou,op -> lin V (regVerbPart hou op) ;
    mkV : (wees,is1,is2,was,gewees : Str) -> V = \wees,is1,is2,was,gewees -> lin V (mkVerb wees is1 is2 was gewees) ; -- worst-case verb
    mkV : (wees,is1,is2,was,gewees,part : Str) -> V = \wees,is1,is2,was,gewees,part -> lin V (mkVerbPart wees is1 is2 was gewees part)  -- worst-case verb
  } ;

  preV = overload {
    preV : (bereken : Str) -> V = \bereken -> lin V (mkVerb bereken bereken bereken bereken bereken) ;
  } ;

  mkV2 = overload {
    mkV2 : (sien : Str) -> V2  = \sien -> lin V2 { v = (regVerb sien) ; c = [] ; hasC = False } ;
    mkV2 : (gluur,aan : Str) -> V2 = \gluur,aan -> lin V2 { v = (regVerbPart gluur aan) ; c = [] ; hasC = False }  ;
    mkV2 : V -> V2 = \v -> lin V2 { v = v ; c = "" ; hasC = False } ;
    mkV2 : V -> Str -> V2 = \kyk,na -> lin V2 { v = kyk ; c = na ; hasC = True } ;
  } ;

  mkV2V = overload {
    mkV2V : (sien : Str) -> V2V  = \sien -> lin V2V { v = (regVerb sien) ** {vtype = VComp} ; c = [] ; hasC = False  } ;
    mkV2V : (gluur,aan : Str) -> V2V = \gluur,aan -> lin V2V { v = (regVerbPart gluur aan) ** {vtype = VComp} ; c = [] ; hasC = False }  ;
    mkV2V : V -> Str -> V2V = \kyk,na -> lin V2V { v = kyk ** {vtype = VComp} ; c = na ; hasC = True } ;
  } ;

  mkVV = overload {
    mkVV : V -> VV = \v -> lin VV (v ** { vtype = VComp } ) ;
  } ;

  mkVS = overload {
    mkVS : V -> VS = \weet -> lin VS { v = weet ; c = "dat" } ;
  } ;

  mkVQ = overload {
    mkVQ : V -> VS = \wonder -> lin VS { v = wonder ; c = "of" } ;
  } ;
  --
  -- mkV2 = overload {
  --   mkV2 : Str -> V2 = \s -> lin V2 (v2vv (regVerb s) ** {c2 = []}) ;
  --   mkV2 : V -> V2 = \s -> lin V2 (s ** {c2 = []}) ;
  --   mkV2 : V -> Prep -> V2  = \s,p -> lin V2 (s ** {c2 = p.s}) ;
  --   } ;

  mkAdv = overload {
    mkAdv : Str -> Adv = \adv -> lin Adv (regAdv adv TPos) ;
    mkAdv : Str -> TPol -> Adv = \adv,p -> lin Adv (regAdv adv p) ;
  } ;

  mkPrep = overload {
    mkPrep : Str -> Prep = \s -> lin Prep (ss s) ;
  } ;

  mkDet = overload {
    mkDet : Str -> Det = \det -> lin Det ({s = det ; n = Sg ; p = TPos }) ;
  } ;

}
