package lemma2jolie

import de.fhdo.lemma.model_processing.AbstractModelProcessor

class Lemma2Jolie extends AbstractModelProcessor {
	new() {
		super("lemma2jolie")
	}

	def static void main(String[] args) {
        new Lemma2Jolie().run(args)
    }
}