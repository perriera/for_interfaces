import './Card.css';

const Card = (props) => {
    // all css styles in use by props are inherited 
    // all 'child' html include with props are inherited 
    const classes = 'card ' + props.className;
    return <div className={classes}>{props.children}</div>
}

export default Card;
