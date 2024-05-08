import { setVisibilityFilter, VisibilityFilters } from '../actions';


const visibilityFilter = (
  state = VisibilityFilters.SHOW_ALL,
  action: ReturnType<typeof setVisibilityFilter>
) => {
  switch (action.type) {
    case 'SET_VISIBILITY_FILTER':
      return action.filter;
    default:
      return state;
  }
};

export default visibilityFilter;