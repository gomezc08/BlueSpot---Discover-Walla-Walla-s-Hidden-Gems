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
          <Photo1 />
          <div className='Image-caption'>Fields</div>
          <div className='Image-author'>Shahrom Dehoti</div>
        </div>
        <div className='Image-container'>
          <Photo2 />
          <div className='Image-caption'>The Blues</div>
          <div className='Image-author'>Chris Gomez</div>
        </div>
        <div className='Image-container'>
          <Photo3 />
          <div className='Image-caption'>Walla Walla</div>
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

function Photo1() {
  return (
    <img className='Image' src="https://assets.vogue.com/photos/5ac7f427f7e0937aae45b143/master/w_2560%2Cc_limit/00-story-image-washington-state-wine-country-guide.jpg" /> 
  );
}

function Photo2() {
  return (
    <img className='Image' src="https://www.ocregister.com/wp-content/uploads/2023/05/OCR-L-TR-WALLAWALLA-0528-01.jpg?w=1024" />
  );
}

function Photo3() {
  return (
    <img className='Image' src="https://a.travel-assets.com/findyours-php/viewfinder/images/res70/193000/193737-Walla-Walla-And-Vicinity.jpg" />
  );
}