import { connect } from 'react-redux';
import { TodoActionTypes, toggleTodo } from '../actions';
import TodoList from '../components/TodoList';
import { VisibilityFilters } from '../actions';
import { Dispatch } from 'react';
import { TodoType } from '../reducers/todos';


const getVisibleTodos = (todos: TodoType[], filter: string) => {
  switch (filter) {
    case VisibilityFilters.SHOW_ALL:
      return todos;
    case VisibilityFilters.SHOW_COMPLETED:
      return todos.filter((t) => t.completed);
    case VisibilityFilters.SHOW_ACTIVE:
      return todos.filter((t) => !t.completed);
    default:
      throw new Error('Unknown filter: ' + filter);
  }
};


interface Props {
  todos: TodoType[];
  visibilityFilter: string;
}

const mapStateToProps = (state: Props) => ({
  todos: getVisibleTodos(
    state.todos,
    state.visibilityFilter
  ),
});


const mapDispatchToProps = (dispatch: Dispatch<TodoActionTypes>) => ({
  toggleTodo: (id: number) => dispatch(toggleTodo(id)),
});


export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);