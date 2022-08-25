// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

contract TodoList {
    struct Todo {
        string name;
        uint256 timeline;
        bool completed;
    }

    Todo[] public todos;

    uint256 ID = 1;

    function createTodo(string memory _name, uint256 _timeline) public {
        require(_timeline > block.timestamp, "Not time yet");
        Todo memory T;
        T.name = _name;
        T.timeline = _timeline;
        T.completed = false;

        todos.push(T);

        ID++;
    }

    function get(uint256 _ID)
        public
        view
        returns (
            string memory name,
            uint256 timeline,
            bool completed
        )
    {
        Todo storage T = todos[_ID];
        name = T.name;
        timeline = T.timeline;
        completed = true;
    }
}
