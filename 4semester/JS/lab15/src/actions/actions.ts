

export const handleCell = (rowIndex: number, colIndex: number, square: number, value: number|null) => ({
    type: 'HANDLE_CELL',
    rowIndex: rowIndex,
    colIndex: colIndex,
    square: square,
    newValue: value
}) as const;

export const getAHint = () => ({
    type: 'GET_A_HINT',
}) as const;

export const checkSolution = () => ({
    type: 'CHECK_SOLUTION',
}) as const;


export type SudokuActions = ReturnType<typeof handleCell> | ReturnType<typeof getAHint> | ReturnType<typeof checkSolution>;