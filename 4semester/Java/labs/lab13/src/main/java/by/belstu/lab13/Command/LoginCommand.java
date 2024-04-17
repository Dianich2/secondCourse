package by.belstu.lab13.Command;

import by.belstu.lab13.Exceptions.IncorrectDataException;
import by.belstu.lab13.Exceptions.ServiceException;
import by.belstu.lab13.Models.User;
import by.belstu.lab13.services.UserService;
import by.belstu.lab13.util.HashPassword;
import by.belstu.lab13.util.Page;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Optional;

import static by.belstu.lab13.Command.AuthConstants.*;


public class LoginCommand implements Command {

    private void setAttributesToSession(String name, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("NAME", name);
    }

    @Override
    public CommandResult execute(HttpServletRequest request, HttpServletResponse response) throws ServiceException,
            IncorrectDataException, ServletException, IOException {
        boolean isUserFind = false;

        Optional<String> login = Optional.ofNullable(request.getParameter(LOGIN));
        Optional<String> password = Optional.ofNullable(request.getParameter(PASSWORD));
        if (isEmpty(login.get()) || isEmpty(password.get())) {
            return forwardLoginWithError(request, ERROR_MESSAGE, ERROR_MESSAGE_TEXT);
        }
        byte[] pass = HashPassword.getHash(password.get());
        isUserFind = initializeUserIfExist(login.get(), pass, request);
        if (!isUserFind) {
            System.out.println("user with such login and password doesn't exist");
            return forwardLoginWithError(request, ERROR_MESSAGE, AUTHENTICATION_ERROR_TEXT);
        } else {
            System.out.println("user has been authorized: login:" + login + " password:" + password);
            return new CommandResult(COMMAND_WELCOME, false);
        }
    }

    public boolean initializeUserIfExist(String login, byte[] password, HttpServletRequest request) throws ServiceException {
        UserService userService = new UserService();
        Optional<User> user = userService.login(login, password);
        boolean userExist = false;
        if (user.isPresent()) {
            setAttributesToSession(user.get().getLogin(), request);
            userExist = true;
        }
        return userExist;
    }

    private CommandResult forwardLoginWithError(HttpServletRequest request, final String ERROR, final String ERROR_MESSAGE) {
        request.setAttribute(ERROR, ERROR_MESSAGE);
        return new CommandResult(Page.LOGIN_PAGE.getPage(), false);
    }

    private boolean isEmpty(String s) {
        return s == null || s.length() == 0;
    }
}
