package me.beltyukov.combinations

import org.paukov.combinatorics.Factory

class Combination {

    public static void main(String[] args) {
        if (!args || args.size() != 2) {
            println "Usage: `./combinations <initial set> <desired combination length>`"
        } else {
            def initialSet = args?.first()?.split(',')
            def combinationLength = args[1] as Integer

            generatePossibleSimpleCombinations(initialSet, combinationLength)
        }
    }

    static List generatePossibleSimpleCombinations(String[] initialSet, Integer combinationLength) {
        def combinatoricsVector = Factory.createVector(initialSet)
        def generator = Factory.createSimpleCombinationGenerator(combinatoricsVector, combinationLength)
        println "SUCCESS! Total simple combinations generated: ${generator.size()}"
        generator.collect {
            println it.vector
            it.vector
        }
    }
}