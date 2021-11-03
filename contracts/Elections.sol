pragma solidity >=0.4.22 <0.8.0;

contract Elections {
    
    // model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // store accounts that have voted
    mapping(address => bool) public voters;
    // read/write candidates
    mapping(uint => Candidate) public candidates;
    // store candidates Count
    uint public candidatesCount;

    // constructor
    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
    
    function addCandidate (string memory _name) private {
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