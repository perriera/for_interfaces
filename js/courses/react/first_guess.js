import logo from "./logo.svg";
import "./App.css";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        <form>
          <label for="name">Name</label>
          <input
            type="text"
            class="w-input"
            maxlength="256"
            name="name"
            data-name="Name"
            placeholder
            id="name"
          ></input>
          <input
            type="submit"
            value="Submit"
            data-wait="Please wait..."
            class="w-button"
          ></input>
          <div class="w-form-done">
            <div>Thank you! Your submission has been received!</div>
          </div>
          <div class="w-form-fail">
            <div>Oops! Something went wrong while submitting the form.</div>
          </div>
        </form>
      </header>
    </div>
  );
}

export default App;
