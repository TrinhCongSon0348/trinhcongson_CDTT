import CartItem from "./CartItem";


function CartList(props) {
    const {carts, onClickRemove}= props;
    // console.log("props", props);

    function cartRenderList()
    {
        const cartListRender = carts && carts.map((cartItem) =>{
            // console.log("CartItem", CartItem);
            return (
                <CartItem cartItem={cartItem} key={cartItem.id} onClickRemove={onClickRemove}/>
            )
        })
        return cartListRender;
    }
    

    return (
        <div>
            {cartRenderList()}
            {/* <CartItem/>
            <CartItem/>
            <CartItem/> */}
        </div>

    );
}

export default CartList;