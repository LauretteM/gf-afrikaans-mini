abstract MiniGrammar = MiniCat ** {

  flags startcat = Utt ;

  fun
    UttS  : S -> Utt ;
    UttQS : QS -> Utt ;

    UttImpSg  : Pol -> Imp -> Utt ;

    UseCl  : Tense -> Pol -> Cl -> S ;
    UseRCl : Tense -> Pol -> RCl -> RS ;
    UseQCl : Tense -> Pol -> QCl -> QS ;

    AdvS     : Adv -> S  -> S ;

    PredVP  : NP -> VP -> Cl ;
    ExistCl : NP -> Cl ;
    RelVP : RP -> VP -> RCl ;
    -- SubjCl : Cl -> Subj -> S -> Cl ;     -- she walks because we run

    QuestCl    : Cl -> QCl ;             -- does she walk
    QuestVP    : IP -> VP -> QCl ;       -- who walks
  --   QuestSlash : IP -> ClSlash -> QCl ;  -- who does she walk with
    QuestIAdv  : IAdv -> Cl -> QCl ;     -- why does she walk

  --   SlashV2   : NP -> V2 -> ClSlash ;   -- she loves
  --   SlashPrep : Cl -> Prep -> ClSlash ; -- she walks with

    ImpVP     : VP -> Imp ; 

    IdRP : RP ;

    ComplV2 : V2 -> NP -> VP ;
    CompAP  : AP -> VP ;
    CompNP  : NP -> VP ;
    CompAdv : Adv -> VP ;         -- be here
    ComplVS : VS -> S  -> VP ;  -- know that she walks
    ComplVQ : VQ -> QS -> VP ;  -- wonder who walks
    ComplVV : VV -> VP -> VP ;  -- want to walk
    ComplV2V : V2V -> NP -> VP -> VP ;  -- use X to Y
    AdvVP : VP -> Adv -> VP ; -- walk in the city
    UseV    : V -> VP ;

    DetCN   : Det -> CN -> NP ;
    MassNP : CN -> NP ;
    ModCN   : AP -> CN -> CN ;
    ApposCN : N -> CN -> CN ;
    UsePron : Pron -> NP ;
    RelNP : NP -> RS -> NP ;

    PronDet : Pron -> Det ;

    UsePN : PN -> NP ;        -- John
    AdvNP : NP -> Adv -> NP ; -- the man in the city

    PrepNP  : Prep -> NP -> Adv ; -- in the house
    AdAP    : AdA -> AP -> AP ;

    ConjS   : Conj -> S  -> S  -> S ;
    ConjAP  : Conj -> AP -> AP -> AP ;
    ConjNP  : Conj -> NP -> NP -> NP ;

    UseN    : N -> CN ;
    CompoundN : N -> N -> N ;
    UseA    : A -> AP ;

    aSg_Det, aPl_Det, theSg_Det, thePl_Det, every_Det : Det ;
    this_Det, these_Det : Det ;
    that_Det, those_Det : Det ;
    noSg_Det : Det ;
    noPl_Det : Det ;

    i_Pron : Pron ;
    youSg_Pron : Pron ;
    she_Pron : Pron ;
    he_Pron : Pron ;
    we_Pron : Pron ;
    they_Pron : Pron ;
    youPl_Pron : Pron ;

    -- i_NP, youSg_NP, he_NP, she_NP, we_NP, youPl_NP, they_NP
    it_NP : NP ;
    no_one_NP : NP ;
    nothing_NP : NP ;
    very_AdA : AdA ;

    who_IP  : IP ;
    here_Adv : Adv ;
    at_Prep, in_Prep, of_Prep, with_Prep, to_Prep, on_Prep, from_Prep, by_Prep : Prep ;
    can_VV, must_VV, want_VV : VV ;
    although_Subj, because_Subj, when_Subj : Subj ;
    when_IAdv, where_IAdv, why_IAdv : IAdv ;

    Pos, Neg : Pol ;
    Pres, Past, Fut, Perf : Tense ;

    and_Conj, or_Conj : Conj ;

 }
