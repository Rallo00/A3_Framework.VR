/* Set to 1 to make east and west allies */
_value = param[0];
west setFriend [east, _value];
east setFriend [west, _value];
