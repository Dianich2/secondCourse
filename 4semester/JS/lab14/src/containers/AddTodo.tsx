import { connect} from 'react-redux';
import { addTodo, TodoActionTypes } from '../actions/index';
import { Dispatch } from 'redux';

interface AddTodoOnwProps {
  dispatch: Dispatch<TodoActionTypes>;
}

const AddTodo: React.FC<AddTodoOnwProps> = ({dispatch}) => {
  
  let input: HTMLInputElement

  return (
    <div>
      <form
        onSubmit={(e) => {
          e.preventDefault();
          
          if (!input.value.trim()) {
            return;
          }
          dispatch(addTodo(input.value));
          input.value = '';
        }}
      >
        <input ref={(node: HTMLInputElement) => (input = node)} />
        <button type="submit">Add Todo</button>
      </form>
    </div>
  );
};

export default connect()(AddTodo);