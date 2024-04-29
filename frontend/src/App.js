import './App.css';
import {useState, useEffect} from 'react';

// The logic required to separate between registered and nonregistered users
// let content;
// if (isLoggedIn) {
//   content = <AdminPanel />;
// } else {
//   content = <LoginForm />;
// }

// return (
//   <div>
//     {content}
//   </div>
// )

export default function App() {

  const [count, setCount] = useState(0)

  function handleClick() {
    setCount(count + 1)
    alert('You clicked me ' + count + " times")
  }

  return (
    <div className="App">
      <header className="App-header">
        <h2 className='top-left'>BlueSpot</h2>
        <div class="top-right">
          <LoginButton count={count} onClick={handleClick} />
          <SignUpButton count={count} onClick={handleClick} />
        </div>
      </header>

      <body>
        <div className='Image-container'>
          <Photo />
          <div className='Image-caption'>Walla Walla</div>
          <div className='Image-author'>Shahrom Dehoti</div>
        </div>
        <div className='Image-container'>
          <Photo />
          <div className='Image-caption'>Wheat Fields</div>
          <div className='Image-author'>Chris Gomez</div>
        </div>
        <div className='Image-container'>
          <Photo />
          <div className='Image-caption'>The Blues</div>
          <div className='Image-author'>Christian</div>
        </div>
      </body>
    </div>
  );
}

function LoginButton({onClick}) {
  return (
    <button onClick = {onClick}>Login</button>
  );
}

function SignUpButton({onClick}) {
  return (
    <button onClick={onClick}>Sign Up</button>
  );
}

function Photo() {
  return (
    <img className='Image' src="https://assets.vogue.com/photos/5ac7f427f7e0937aae45b143/master/w_2560%2Cc_limit/00-story-image-washington-state-wine-country-guide.jpg" /> 
  );
}