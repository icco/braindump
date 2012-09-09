module Mail
  class Address

    def valid?
      begin
        # We must check that value contains a domain and that value is an email address
        r = self.domain && self.address
        t = self.__send__(:tree)
        # We need to dig into treetop
        # A valid domain must have dot_atom_text elements size > 1
        # user@localhost is excluded
        # treetop must respond to domain
        # We exclude valid email values like <user@localhost.com>
        # Hence we use self.__send__(tree).domain
        r &&= (t.domain.dot_atom_text.elements.size > 1)
      rescue Exception => e
        r = false
      end

      return r
    end
  end
end
