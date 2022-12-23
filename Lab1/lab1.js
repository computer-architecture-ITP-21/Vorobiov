function toBinary(num) {
    let result = [];

	while (num / 2 != 0)
    {
        result.push(num % 2);

        num = Math.floor(num / 2);
    }

    return result.reverse().join("");
}