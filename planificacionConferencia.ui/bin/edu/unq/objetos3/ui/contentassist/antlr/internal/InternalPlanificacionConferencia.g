/*
* generated by Xtext
*/
grammar InternalPlanificacionConferencia;

options {
	superClass=AbstractInternalContentAssistParser;
	
}

@lexer::header {
package edu.unq.objetos3.ui.contentassist.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.Lexer;
}

@parser::header {
package edu.unq.objetos3.ui.contentassist.antlr.internal; 

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.DFA;
import edu.unq.objetos3.services.PlanificacionConferenciaGrammarAccess;

}

@parser::members {
 
 	private PlanificacionConferenciaGrammarAccess grammarAccess;
 	
    public void setGrammarAccess(PlanificacionConferenciaGrammarAccess grammarAccess) {
    	this.grammarAccess = grammarAccess;
    }
    
    @Override
    protected Grammar getGrammar() {
    	return grammarAccess.getGrammar();
    }
    
    @Override
    protected String getValueForTokenName(String tokenName) {
    	return tokenName;
    }

}




// Entry rule entryRuleModel
entryRuleModel 
:
{ before(grammarAccess.getModelRule()); }
	 ruleModel
{ after(grammarAccess.getModelRule()); } 
	 EOF 
;

// Rule Model
ruleModel
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getModelAccess().getCharlasAssignment()); }
(rule__Model__CharlasAssignment)*
{ after(grammarAccess.getModelAccess().getCharlasAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleCharla
entryRuleCharla 
:
{ before(grammarAccess.getCharlaRule()); }
	 ruleCharla
{ after(grammarAccess.getCharlaRule()); } 
	 EOF 
;

// Rule Charla
ruleCharla
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getCharlaAccess().getGroup()); }
(rule__Charla__Group__0)
{ after(grammarAccess.getCharlaAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleOrador
entryRuleOrador 
:
{ before(grammarAccess.getOradorRule()); }
	 ruleOrador
{ after(grammarAccess.getOradorRule()); } 
	 EOF 
;

// Rule Orador
ruleOrador
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getOradorAccess().getGroup()); }
(rule__Orador__Group__0)
{ after(grammarAccess.getOradorAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}






rule__Charla__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Charla__Group__0__Impl
	rule__Charla__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Charla__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCharlaAccess().getCharlaKeyword_0()); }

	'Charla' 

{ after(grammarAccess.getCharlaAccess().getCharlaKeyword_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Charla__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Charla__Group__1__Impl
	rule__Charla__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Charla__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCharlaAccess().getTituloAssignment_1()); }
(rule__Charla__TituloAssignment_1)
{ after(grammarAccess.getCharlaAccess().getTituloAssignment_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Charla__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Charla__Group__2__Impl
	rule__Charla__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__Charla__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCharlaAccess().getPorKeyword_2()); }

	'por' 

{ after(grammarAccess.getCharlaAccess().getPorKeyword_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Charla__Group__3
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Charla__Group__3__Impl
	rule__Charla__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__Charla__Group__3__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
(
{ before(grammarAccess.getCharlaAccess().getOradoresAssignment_3()); }
(rule__Charla__OradoresAssignment_3)
{ after(grammarAccess.getCharlaAccess().getOradoresAssignment_3()); }
)
(
{ before(grammarAccess.getCharlaAccess().getOradoresAssignment_3()); }
(rule__Charla__OradoresAssignment_3)*
{ after(grammarAccess.getCharlaAccess().getOradoresAssignment_3()); }
)
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Charla__Group__4
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Charla__Group__4__Impl
	rule__Charla__Group__5
;
finally {
	restoreStackSize(stackSize);
}

rule__Charla__Group__4__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCharlaAccess().getDuranteKeyword_4()); }

	'durante' 

{ after(grammarAccess.getCharlaAccess().getDuranteKeyword_4()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Charla__Group__5
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Charla__Group__5__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Charla__Group__5__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCharlaAccess().getDuracionAssignment_5()); }
(rule__Charla__DuracionAssignment_5)
{ after(grammarAccess.getCharlaAccess().getDuracionAssignment_5()); }
)

;
finally {
	restoreStackSize(stackSize);
}














rule__Orador__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Orador__Group__0__Impl
	rule__Orador__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Orador__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getOradorAccess().getNombreAssignment_0()); }
(rule__Orador__NombreAssignment_0)
{ after(grammarAccess.getOradorAccess().getNombreAssignment_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Orador__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Orador__Group__1__Impl
	rule__Orador__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Orador__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getOradorAccess().getDeKeyword_1()); }

	'de' 

{ after(grammarAccess.getOradorAccess().getDeKeyword_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Orador__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Orador__Group__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Orador__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getOradorAccess().getOrganizacionAssignment_2()); }
(rule__Orador__OrganizacionAssignment_2)
{ after(grammarAccess.getOradorAccess().getOrganizacionAssignment_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}









rule__Model__CharlasAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getModelAccess().getCharlasCharlaParserRuleCall_0()); }
	ruleCharla{ after(grammarAccess.getModelAccess().getCharlasCharlaParserRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Charla__TituloAssignment_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCharlaAccess().getTituloSTRINGTerminalRuleCall_1_0()); }
	RULE_STRING{ after(grammarAccess.getCharlaAccess().getTituloSTRINGTerminalRuleCall_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Charla__OradoresAssignment_3
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCharlaAccess().getOradoresOradorParserRuleCall_3_0()); }
	ruleOrador{ after(grammarAccess.getCharlaAccess().getOradoresOradorParserRuleCall_3_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Charla__DuracionAssignment_5
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCharlaAccess().getDuracionINTTerminalRuleCall_5_0()); }
	RULE_INT{ after(grammarAccess.getCharlaAccess().getDuracionINTTerminalRuleCall_5_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Orador__NombreAssignment_0
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getOradorAccess().getNombreSTRINGTerminalRuleCall_0_0()); }
	RULE_STRING{ after(grammarAccess.getOradorAccess().getNombreSTRINGTerminalRuleCall_0_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Orador__OrganizacionAssignment_2
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getOradorAccess().getOrganizacionSTRINGTerminalRuleCall_2_0()); }
	RULE_STRING{ after(grammarAccess.getOradorAccess().getOrganizacionSTRINGTerminalRuleCall_2_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;


