import React from 'react';
import { render } from '@testing-library/react';
import { Provider } from 'react-redux';
import App from './components/App';

test('renders learn react link', () => {
  const { getByText } = render(
    //@ts-ignore
    <Provider store={store}>
    <App />
  </Provider>,
  );

  
  //expect(getByText(/learn/i)).toBeInTheDocument();
});
