/*
* generated by Xtext
*/
grammar InternalPlanificacionConferencia;

options {
	superClass=AbstractInternalAntlrParser;
	
}

@lexer::header {
package edu.unq.objetos3.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package edu.unq.objetos3.parser.antlr.internal; 

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import edu.unq.objetos3.services.PlanificacionConferenciaGrammarAccess;

}

@parser::members {

 	private PlanificacionConferenciaGrammarAccess grammarAccess;
 	
    public InternalPlanificacionConferenciaParser(TokenStream input, PlanificacionConferenciaGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }
    
    @Override
    protected String getFirstRuleName() {
    	return "Model";	
   	}
   	
   	@Override
   	protected PlanificacionConferenciaGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}
}

@rulecatch { 
    catch (RecognitionException re) { 
        recover(input,re); 
        appendSkippedTokens();
    } 
}




// Entry rule entryRuleModel
entryRuleModel returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getModelRule()); }
	 iv_ruleModel=ruleModel 
	 { $current=$iv_ruleModel.current; } 
	 EOF 
;

// Rule Model
ruleModel returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
(
		{ 
	        newCompositeNode(grammarAccess.getModelAccess().getCharlasCharlaParserRuleCall_0()); 
	    }
		lv_charlas_0_0=ruleCharla		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getModelRule());
	        }
       		add(
       			$current, 
       			"charlas",
        		lv_charlas_0_0, 
        		"Charla");
	        afterParserOrEnumRuleCall();
	    }

)
)*
;





// Entry rule entryRuleCharla
entryRuleCharla returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getCharlaRule()); }
	 iv_ruleCharla=ruleCharla 
	 { $current=$iv_ruleCharla.current; } 
	 EOF 
;

// Rule Charla
ruleCharla returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='Charla' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getCharlaAccess().getCharlaKeyword_0());
    }
(
(
		lv_titulo_1_0=RULE_STRING
		{
			newLeafNode(lv_titulo_1_0, grammarAccess.getCharlaAccess().getTituloSTRINGTerminalRuleCall_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getCharlaRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"titulo",
        		lv_titulo_1_0, 
        		"STRING");
	    }

)
)	otherlv_2='por' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getCharlaAccess().getPorKeyword_2());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getCharlaAccess().getOradoresOradorParserRuleCall_3_0()); 
	    }
		lv_oradores_3_0=ruleOrador		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getCharlaRule());
	        }
       		add(
       			$current, 
       			"oradores",
        		lv_oradores_3_0, 
        		"Orador");
	        afterParserOrEnumRuleCall();
	    }

)
)+	otherlv_4='durante' 
    {
    	newLeafNode(otherlv_4, grammarAccess.getCharlaAccess().getDuranteKeyword_4());
    }
(
(
		lv_duracion_5_0=RULE_INT
		{
			newLeafNode(lv_duracion_5_0, grammarAccess.getCharlaAccess().getDuracionINTTerminalRuleCall_5_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getCharlaRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"duracion",
        		lv_duracion_5_0, 
        		"INT");
	    }

)
))
;





// Entry rule entryRuleOrador
entryRuleOrador returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getOradorRule()); }
	 iv_ruleOrador=ruleOrador 
	 { $current=$iv_ruleOrador.current; } 
	 EOF 
;

// Rule Orador
ruleOrador returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_nombre_0_0=RULE_STRING
		{
			newLeafNode(lv_nombre_0_0, grammarAccess.getOradorAccess().getNombreSTRINGTerminalRuleCall_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getOradorRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"nombre",
        		lv_nombre_0_0, 
        		"STRING");
	    }

)
)	otherlv_1='de' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getOradorAccess().getDeKeyword_1());
    }
(
(
		lv_organizacion_2_0=RULE_STRING
		{
			newLeafNode(lv_organizacion_2_0, grammarAccess.getOradorAccess().getOrganizacionSTRINGTerminalRuleCall_2_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getOradorRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"organizacion",
        		lv_organizacion_2_0, 
        		"STRING");
	    }

)
))
;





RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;


