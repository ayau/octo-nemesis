module RushesHelper
    def get_rank(chill, pull)
        if chill > 4.5
            return 'thisguymadchillbro'
        end
        if chill + pull > 7.5 || chill > 4
            return 'toprush'
        end
        if pull > 4.5
            return 'hepulls'
        end
        if chill + pull == 0
            return 'notrated'
        end
        if chill + pull < 3
            return 'fuckthiskid'
        end
        return 'seemsnice'
    end

    def get_average_pull(cpratings)
        total = 0.0
        for cp in cpratings
            if !cp.pull.nil?
                total += cp.pull
            end
        end
        if cpratings.length != 0
            return total/cpratings.length
        else 
            return 0.0
        end
    end

    def get_average_chill(cpratings)
        total = 0.0
        for cp in cpratings
            if !cp.pull.nil?
                total += cp.chill
            end
        end
        if cpratings.length != 0
            return total/cpratings.length
        else
            return 0.0
        end
    end
end
