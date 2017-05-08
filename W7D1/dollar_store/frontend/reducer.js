import merge from 'lodash/merge';

const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case 'SWITCH_CURRENCY':
      let newState = merge({}, state);
      newState.baseCurrency = action.baseCurrency;
      newState.rates = action.rates;
      return newState;
    default:
      return state;
  }
};

export default reducer;
