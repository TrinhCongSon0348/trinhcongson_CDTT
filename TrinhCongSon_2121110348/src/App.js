import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import LayoutSite from "./layouts/layoutSite";
import RouterPublic from "./router/RouterPublic";
import RouterPrivate from "./router/RouterPrivate";
import LayoutAdmin from "./layouts/layoutAdmin";
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
// import Login from "./component/Login/Login";
// import Register from "./RegisterAccount/RegisterAccount";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<LayoutSite />}>
          {RouterPublic.map(function (router, index) {
            const Page = router.component;
            return <Route path={router.path} element={<Page />} />
          })}
        </Route>
        <Route path="/admin" element={<LayoutAdmin />}>
          {RouterPrivate.map(function (router, index) {
            const Page = router.component;
            return <Route path={router.path} element={<Page />} />
          })}
        </Route>
        {/* <Route path="/login">
          <Login/>
        </Route>
        <Route path="/register">
          <Register/>
        </Route> */}
      </Routes>
      {/* <ToastContainer
          position="bottom-center"
          autoClose={5000}
          hideProgressBar={false}
          newestOnTop={false}
          closeOnClick
          rtl={false}
          pauseOnFocusLoss
          draggable
          pauseOnHover
          theme="light"
        /> */}
    </BrowserRouter>
  );
}

export default App;
