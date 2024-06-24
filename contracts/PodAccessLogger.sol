// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PodAccessLogger {
    // Evento emesso quando il FS accede a un POD
    event PodAccessRecorded(address indexed server, string podUrl, uint256 timestamp);

    // Struttura per memorizzare gli accessi
    struct Access {
        address server; // Chi ha effettuato l'accesso
        uint256 timestamp; // Quando è stato effettuato
    }

    // Mappatura per memorizzare gli accessi per ogni POD
    mapping(string => Access[]) public podAccesses;

    // Metodo per registrare un accesso al POD
    function recordAccess(string memory podUrl) public {
        Access memory newAccess = Access(
            msg.sender,
            block.timestamp
        );

        podAccesses[podUrl].push(newAccess);

        // Emette l'evento di accesso
        emit PodAccessRecorded(msg.sender, podUrl, block.timestamp);
    }

    function getAccesses(string memory podUrl) public view returns (Access[] memory) {
        return podAccesses[podUrl];
    }
}
