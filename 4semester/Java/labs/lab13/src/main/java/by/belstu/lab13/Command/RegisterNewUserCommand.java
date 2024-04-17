package by.belstu.lab13.Command;

import by.belstu.lab13.Exceptions.IncorrectDataException;
import by.belstu.lab13.Exceptions.ServiceException;
import by.belstu.lab13.Models.User;
import by.belstu.lab13.services.UserService;
import by.belstu.lab13.util.HashPassword;
import by.belstu.lab13.util.Page;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Optional;

import static by.belstu.lab13.Command.AuthConstants.*;

public class RegisterNewUserCommand  implements Command {
    private CommandResult forwardToRegisterWithError(HttpServletRequest request, String ERROR, String ERROR_MESSAGE) {
        request.setAttribute(ERROR, ERROR_MESSAGE);
        return new CommandResult(Page.REGISTER_PAGE.getPage(), false);
    }
    private CommandResult forwardToLogin(HttpServletRequest request) {
        return new CommandResult(Page.LOGIN_PAGE.getPage(), false);
    }
    @Override
    public CommandResult execute(HttpServletRequest request, HttpServletResponse response) throws ServiceException,
            IncorrectDataException {
        Optional<String> login = Optional.ofNullable(request.getParameter(NAME_FOR_REGISTER));
        Optional<String> password = Optional.ofNullable(request.getParameter(PASSWORD_FOR_REGISTER));
        if (isEmpty(login.get()) || isEmpty(password.get())) {
            System.out.println("invalid login or password format was received:" + login + " " + password);
            return forwardToRegisterWithError(request, REGISTER_ERROR, ERROR_MESSAGE_TEXT);
        }
        byte[] pass = HashPassword.getHash(password.get());
        User user = new User(login.get(), pass);
        UserService userService = new UserService();
        int userCount = userService.save(user);
        if (userCount != 0) {
            System.out.println("user was registered: login:" + login);
            return forwardToLogin(request);
        } else {
            System.out.println("invalid login or password format was received:" + login);
            return forwardToRegisterWithError(request, REGISTER_ERROR, REGISTER_ERROR_MESSAGE_IF_EXIST);
        }
    }
    private boolean isEmpty(String s) {
        return s == null || s.length() == 0;
    }
}
