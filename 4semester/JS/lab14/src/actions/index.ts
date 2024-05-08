
let nextTodoId: number = 0;

export const addTodo = (text: string) => ({
  type: 'ADD_TODO',
  id: nextTodoId++,
  text,
}) as const;


export const setVisibilityFilter = (filter: string) => ({
  type: 'SET_VISIBILITY_FILTER',
  filter,
})as const;


export const toggleTodo = (id: number) => ({
  type: 'TOGGLE_TODO',
  id,
}) as const;

export const VisibilityFilters = {
  SHOW_ALL: 'SHOW_ALL',
  SHOW_COMPLETED: 'SHOW_COMPLETED',
  SHOW_ACTIVE: 'SHOW_ACTIVE',
};


export type TodoActionTypes = ReturnType<typeof addTodo> | ReturnType<typeof setVisibilityFilter> | ReturnType<typeof toggleTodo>

