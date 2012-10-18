class SessionsController < ApplicationController

    def approved_uids
        [
        '517855187', # 1 Akhilesh Goswami
        '608428950', # 2 Brandon Krieger
        '1332742841', # 3 Chris Bessette
        '1787109043', # 4 Cruz Vargas
        '714175343', # 5 Dinesh Chugani
        '1013892457', # 6 Drew Schaub
        '100000073113298', # 7 Eric Yang
        '560894871', # 8 Gavriel Fineberg
        '100001413797691', # 9 Harper Robinson
        '1420720777', # 10 Hunter Schlacks
        '585230982', # 11 Ian Lachow
        '1308812550', # 12 Ian Wenik
        '100001012009866', # 13 Jake Albano
        '1068945562', # 14 Jordan Holmes
        '1348312902', # 15 Joshua Chilcote
        '100000714600399', # 16 Manuel Sainz de la Pena
        '1435351869', # 17 Paul Calhoun
        '694802694', # 18 Peter Tian
        '1198811257', # 19 Raul Zablah
        '558174137', # 20 Shaun Ayrton
        '519585436', # 21 Alex Yau
        '541470542', # 22 Dan Friend
        '601010414', # 23 David Stahl
        '1270697133', # 24 Devin Scanlon
        '1019979726', # 25 Jared Slipman
        '100000571522014', # 26 Jason Littman
        '501828475', # 27 Jay Shin
        '724185253', # 28 Sam Blumenthal
        '100000558622713', # 29 Sam Verdugo
        '1333170178', # 30 Andrew Staniforth
        '1035718607', # 31 Brady Sullivan
        '608622867', # 32 David Schwartz
        '833646664', # 33 Johnathan Mell
        '1357770612', # 34 Josh Bolgar
        '643310379', # 35 Markus Beissinger
        '1380120373', # 36 Mike Carajohn
        '639560517', # 37 Sam Ware
        '1380090105', # 38 Sebastien Issa
        '1012833159', # 39 Zack Kleinbart
        '100001771947914', # 40 Dennis Harte
        ]
    end

    def new
    end

    def create
        auth = request.env["omniauth.auth"]
        # Only allow approved user_ids to make an account/login
        if approved_uids.include? auth["uid"]
            user = User.find_by_uid_and_token(auth["uid"],auth["credentials"]["token"]) || User.create_with_omniauth(auth)
            session[:user_id] = user.id
            if user
                sign_in user
                redirect_to root_url
            else
                redirect_to 'new'
            end
        else
            redirect_to '/401.html'
        end
    end

    def destroy
        session[:user_id] = nil
        sign_out
        redirect_to root_url
    end

end
