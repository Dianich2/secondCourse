import { connect } from 'react-redux';
import { setVisibilityFilter, TodoActionTypes } from '../actions';
import Link from '../components/Link';
import { Dispatch } from 'react';


interface OwnProps {
  filter: string;
}

interface StateProps {
  visibilityFilter: string;
}

const mapStateToProps = (state: StateProps, ownProps: OwnProps) => {
  console.log('Current state:', state);
  console.log('Own props:', ownProps);
 
  return {
    active: ownProps.filter === state.visibilityFilter,
  };
};


const mapDispatchToProps = (dispatch: Dispatch<TodoActionTypes>, ownProps: OwnProps) => { return {
  onClick: () =>
    dispatch(setVisibilityFilter(ownProps.filter)),
};};


export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Link);