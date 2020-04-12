pragma solidity ^0.5.16;

contract Election {

	//model a candidate

	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	// store candidates
	// store with mapping
	// fetch candidates
	// Store accounts that have voted
    mapping(address => bool) public voters;


	mapping(uint => Candidate) public candidates;

	// store candidate's count
	// use counter cache to keep track of how many candidates there are
	// state variable
	uint public candidatesCount;

	event votedEvent (
        uint indexed _candidateId
    );
	

	constructor () public {

		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
		
	}

	function addCandidate( string memory _name) private {

		candidatesCount++;
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

        // trigger voted event
        emit votedEvent(_candidateId);
    }

}
