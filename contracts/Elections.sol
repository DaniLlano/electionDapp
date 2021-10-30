pragma solidity ^0.5.7;

contract Election {
    
    // model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // store accounts that have voted
    mapping(address => bool) public voters;

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

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);
        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        // record that voter has voted
        voters[msg.sender] = true;
        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }

}