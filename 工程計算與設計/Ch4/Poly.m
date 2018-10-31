classdef Poly
    properties
        coef = zeros(1,99);
    end
    methods
        function p = Poly(varargin)
            for k = 1:nargin
                p.coef(nargin-k+1) = varargin{k};
            end
        end
        function disp(p)
            for k = 99:-1:3
                if p.coef(k)
                    fprintf('%+fx^%d', p.coef(k), k-1);
                end
            end
            if p.coef(2)
                fprintf('%+fx', p.coef(2));
            end
            fprintf('%+f\n', p.coef(1))
        end
        function p = plus(p1, p2)
            p = Poly;
            p.coef = p1.coef+p2.coef;
        end
        function p = minus(p1, p2)
            p = Poly;
            p.coef = p1.coef-p2.coef;
        end
        function p = uminus(p1)
            p = Poly;
            p.coef = -p1.coef;
        end
        function p = uplus(p1)
            p = Poly;
            p.coef = p1.coef;
        end
        function p = mtimes(p1, p2)
            p = Poly;
            for i = 1:99
                for j = 1:99
                    if p1.coef(i) && p2.coef(j)
                        p.coef(i+j-1) = p.coef(i+j-1)+p1.coef(i)*p2.coef(j);
                    end
                end
            end
        end
        function output = value(p, x)
            output = zeros(1,length(x));
            for k = 1:99
                if p.coef(k)
                    output = output + p.coef(k)*x.^(k-1);
                end
            end
        end
    end
end