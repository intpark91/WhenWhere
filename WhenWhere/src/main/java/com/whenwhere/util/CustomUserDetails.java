package com.whenwhere.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
 
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
 
public class CustomUserDetails implements UserDetails {
 
    private static final long serialVersionUID = -4450269958885980297L;
    private String username;
    private String password;
    private GrantedAuthority grantedAuthority;
    public CustomUserDetails(String userName, String password, GrantedAuthority grantedAuthority)
    {
        this.username = userName;
        this.password = password;
        this.grantedAuthority = grantedAuthority;
        System.out.println("CustomUserDetails userName"+userName);
    }
     
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();   
        authorities.add(new SimpleGrantedAuthority(String.valueOf(grantedAuthority)));  
        System.out.println("CustomUserDetails 의 authorities" + authorities);
        /*CustomAuthenticationProvider의 값이 여기서 리턴이 되서 컨트롤러로 들어감*/
        return authorities;
    }
  
    @Override
    public String getPassword() {
        return password;
    }
  
    @Override
    public String getUsername() {
        return username;
    }
  
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
  
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
  
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
  
    @Override
    public boolean isEnabled() {
        return true;
    }
 }
