pragma solidity ^0.5.7;

contract Election {
    // model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // read/write candidate
    mapping(uint => Candidate) public candidates;

    //store Candidates Count
    uint public candidatesCount;

    // Constructor
    function Election () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
    
    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

}