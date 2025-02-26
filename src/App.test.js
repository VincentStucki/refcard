import { render, screen, act } from '@testing-library/react';
import App from './App';

test('renders architecture refcard title', () => {
  render(<App />);
  const titleElement = screen.getByText(/Architecture Ref. Card/i);
  expect(titleElement).toBeInTheDocument();
});

