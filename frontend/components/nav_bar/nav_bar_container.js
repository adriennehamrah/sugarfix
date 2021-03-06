import { connect } from 'react-redux';
import { login } from '../../actions/session_actions';
import NavBar from './nav_bar';

const mapStateToProps = ({session}) => ({
  currentUser: session.currentUser
});

const mapDispatchToProps = (dispatch) => ({
  login: () => dispatch(login())
});

export default connect(mapStateToProps, mapDispatchToProps)(NavBar);
