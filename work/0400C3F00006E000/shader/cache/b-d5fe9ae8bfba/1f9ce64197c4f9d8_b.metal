#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_27 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0), flat]];
    float4 m_24 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _151 = false;
    float _36 = gl_FragCoord.w;
    float _38 = in.m_24.y;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_24.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = 1.0 / _36;
    float _52 = _50 * _42;
    float _54 = _50 * _48;
    float _56 = fma(_52, 2.0, -1.0);
    float _58 = fma(_54, 2.0, -1.0);
    float _60 = _56 * _56;
    float _62 = fma(_58, _58, _60);
    bool _66 = _62 > 1.0;
    int _69 = as_type<int>(_54);
    int _71 = as_type<int>(_52);
    int _73 = as_type<int>(_50);
    int _75 = as_type<int>(_48);
    if (_66)
    {
        _69 = 0;
        _71 = 0;
    }
    int _77 = _69;
    int _79 = _71;
    if (_66)
    {
        _73 = 0;
        _75 = 0;
    }
    int _81 = _73;
    int _83 = _75;
    float _85 = as_type<float>(_83);
    if (_66)
    {
        out.m_27.x = as_type<float>(_77);
        out.m_27.y = as_type<float>(_79);
        out.m_27.z = as_type<float>(_81);
        out.m_27.w = as_type<float>(_83);
        return out;
    }
    float _87 = sqrt(_62);
    float _89 = fma(_62, -2.0, 1.0);
    float _91 = precise::max(0.0, _89);
    float _93 = _91 * _91;
    bool _95 = _87 > 9.9999997473787516355514526367188e-05;
    float _97 = _93;
    if (!_95)
    {
        _85 = 0.0;
    }
    float _99 = _85;
    bool _101 = !_95;
    float _103 = _99;
    if (!_101)
    {
        bool _105 = _58 != 0.0;
        bool _107 = isnan(_58);
        bool _109 = _105 || _107;
        bool _111 = isnan(0.0);
        bool _113 = _109 || _111;
        float _149;
        if (!_113)
        {
            bool _115 = _56 >= 0.0;
            bool _117 = isnan(_56);
            bool _119 = _115 || _117;
            bool _121 = isnan(0.0);
            bool _123 = _119 || _121;
            bool _125 = _56 > 0.0;
            bool _127 = !_125;
            int _129 = _127 ? 0 : 1;
            int _131 = ~_129;
            int _133 = _131 + 1;
            int _135 = _133 + 1;
            int _137 = _135;
            if (_123)
            {
                int _139 = ~_129;
                int _141 = _139 + 1;
                _137 = _141;
            }
            int _143 = _137;
            float _145 = float(_143);
            float _147 = _145 * 1.57079637050628662109375;
            _149 = _147;
            _151 = true;
        }
        else
        {
            float _153 = abs(_58);
            float _155 = abs(_56);
            float _157 = precise::max(_153, _155);
            float _159 = _56 * (-0.0625);
            bool _161 = _157 >= 16.0;
            float _163 = _58 * (-0.0625);
            float _165 = -_56;
            float _167 = _161 ? _159 : _165;
            float _169 = -_58;
            float _171 = _161 ? _163 : _169;
            float _173 = abs(_167);
            bool _175 = _173 != 0.0;
            bool _177 = isnan(_173);
            bool _179 = _175 || _177;
            bool _181 = isnan(0.0);
            bool _183 = _179 || _181;
            float _185 = abs(_171);
            bool _187 = _185 == 0.0;
            float _189 = abs(_171);
            bool _191 = _189 == 0.0;
            bool _193 = !_183;
            bool _195 = _191 && _193;
            bool _197 = false;
            int _199 = as_type<int>(_163);
            if (_195)
            {
                bool _201 = as_type<int>(_171) >= 0;
                _197 = _201;
            }
            bool _203 = _197;
            int _205 = _203 ? (-1) : 0;
            if (_195)
            {
                int _207 = _203 ? 0 : 1078530011;
                _199 = _207;
            }
            int _209 = _199;
            int _211 = _209;
            if (_195)
            {
                int _213 = int(0x80000000) & as_type<int>(_167);
                int _215 = _209 | _213;
                _211 = _215;
            }
            int _217 = _211;
            bool _219 = !_183;
            bool _221 = _219 && _187;
            int _223 = _217;
            _149 = as_type<float>(_217);
            if (!_221)
            {
                float _225 = abs(_167);
                bool _227 = _225 != as_type<float>(0x7f800000u /* inf */);
                bool _229 = isnan(_225);
                bool _231 = _227 || _229;
                bool _233 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _235 = _231 || _233;
                float _237 = abs(_171);
                bool _239 = _237 == as_type<float>(0x7f800000u /* inf */);
                float _241 = abs(_171);
                bool _243 = _241 == as_type<float>(0x7f800000u /* inf */);
                bool _245 = !_235;
                bool _247 = _243 && _245;
                if (_247)
                {
                    _223 = 1075235812;
                }
                int _249 = _223;
                int _251 = _249;
                if (_247)
                {
                    bool _253 = as_type<int>(_171) >= 0;
                    _205 = _253 ? (-1) : 0;
                }
                int _255 = _205;
                if (_247)
                {
                    int _257 = ~_255;
                    int _259 = (_257 != 0) ? _249 : 1061752795;
                    _251 = _259;
                }
                int _261 = _251;
                float _263 = as_type<float>(_261);
                if (_247)
                {
                    int _265 = int(0x80000000) & as_type<int>(_167);
                    int _267 = _261 | _265;
                    _263 = as_type<float>(_267);
                }
                float _269 = _263;
                bool _271 = !_235;
                bool _273 = _271 && _239;
                _149 = _269;
                if (!_273)
                {
                    float _275 = abs(_167);
                    float _277 = abs(_171);
                    float _279 = precise::max(_275, _277);
                    float _281 = abs(_167);
                    float _283 = abs(_171);
                    float _285 = precise::min(_281, _283);
                    float _287 = 1.0 / _279;
                    float _289 = abs(_167);
                    float _291 = abs(_171);
                    bool _293 = _289 > _291;
                    bool _295 = as_type<int>(_171) >= 0;
                    float _297 = _285 * _287;
                    float _299 = abs(_167);
                    float _301 = abs(_171);
                    float _303 = _299 + _301;
                    int _305 = as_type<int>(_167) & int(0x80000000);
                    float _307 = _297 * _297;
                    bool _309 = _303 > as_type<float>(0x7f800000u /* inf */);
                    bool _311 = isnan(_303);
                    bool _313 = _309 || _311;
                    bool _315 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _317 = _313 || _315;
                    float _319 = _307 + 11.33538818359375;
                    float _321 = fma(_307, _319, 28.84246826171875);
                    float _323 = fma(_307, _321, 19.6966705322265625);
                    float _325 = fma(_307, -0.82336294651031494140625, -5.674867153167724609375);
                    float _327 = fma(_307, _325, -6.565555095672607421875);
                    float _329 = 1.0 / _323;
                    float _331 = _307 * _327;
                    float _333 = _297 * _331;
                    float _335 = fma(_333, _329, _297);
                    float _337 = _335;
                    _149 = _303;
                    if (_293)
                    {
                        float _339 = -_335;
                        float _341 = _339 + 1.57079637050628662109375;
                        _337 = _341;
                    }
                    float _343 = _337;
                    int _345 = as_type<int>(_343);
                    if (!_295)
                    {
                        float _347 = -_343;
                        float _349 = _347 + 3.1415927410125732421875;
                        _345 = as_type<int>(_349);
                    }
                    int _351 = _345;
                    if (!_317)
                    {
                        int _353 = _305 | _351;
                        _149 = as_type<float>(_353);
                    }
                }
            }
        }
        _151 = false;
        float _355 = _149;
        float _357 = -_62;
        float _359 = _357 + 1.0;
        float _361 = fma(_87, -2.400000095367431640625, 2.400000095367431640625);
        float _363 = _361 + _355;
        float _365 = fma(_363, 0.15915493667125701904296875, 1.0);
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        float _373 = _371 * 43.9822998046875;
        float _375 = _373 * 0.15915493667125701904296875;
        float _377 = _375 * 6.283185482025146484375;
        float _379 = sin(_377);
        float _381 = _379 * _359;
        float _383 = _62 * _381;
        float _385 = _383 * (-1.5);
        float _387 = fma(_383, 0.300000011920928955078125, _93);
        float _389 = precise::max(0.0, _385);
        float _391 = fma(_87, 0.5, _389);
        _103 = _391;
        _97 = _387;
    }
    float _393 = _103;
    float _395 = _97;
    float _397 = in.m_29.x;
    float _399 = _393 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _401 = -_397;
    float _403 = fma(_401, _395, -0.0);
    out.m_27.x = 0.0;
    out.m_27.y = _403;
    out.m_27.z = 0.0;
    out.m_27.w = _399;
    return out;
}


struct main0_out_u
{
    uint4 m_27 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _151 = false;
    float _36 = gl_FragCoord.w;
    float _38 = in.m_24.y;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_24.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = 1.0 / _36;
    float _52 = _50 * _42;
    float _54 = _50 * _48;
    float _56 = fma(_52, 2.0, -1.0);
    float _58 = fma(_54, 2.0, -1.0);
    float _60 = _56 * _56;
    float _62 = fma(_58, _58, _60);
    bool _66 = _62 > 1.0;
    int _69 = as_type<int>(_54);
    int _71 = as_type<int>(_52);
    int _73 = as_type<int>(_50);
    int _75 = as_type<int>(_48);
    if (_66)
    {
        _69 = 0;
        _71 = 0;
    }
    int _77 = _69;
    int _79 = _71;
    if (_66)
    {
        _73 = 0;
        _75 = 0;
    }
    int _81 = _73;
    int _83 = _75;
    float _85 = as_type<float>(_83);
    if (_66)
    {
        out.m_27.x = as_type<float>(_77);
        out.m_27.y = as_type<float>(_79);
        out.m_27.z = as_type<float>(_81);
        out.m_27.w = as_type<float>(_83);
        return main0_out_u{as_type<uint4>(out.m_27)};
    }
    float _87 = sqrt(_62);
    float _89 = fma(_62, -2.0, 1.0);
    float _91 = precise::max(0.0, _89);
    float _93 = _91 * _91;
    bool _95 = _87 > 9.9999997473787516355514526367188e-05;
    float _97 = _93;
    if (!_95)
    {
        _85 = 0.0;
    }
    float _99 = _85;
    bool _101 = !_95;
    float _103 = _99;
    if (!_101)
    {
        bool _105 = _58 != 0.0;
        bool _107 = isnan(_58);
        bool _109 = _105 || _107;
        bool _111 = isnan(0.0);
        bool _113 = _109 || _111;
        float _149;
        if (!_113)
        {
            bool _115 = _56 >= 0.0;
            bool _117 = isnan(_56);
            bool _119 = _115 || _117;
            bool _121 = isnan(0.0);
            bool _123 = _119 || _121;
            bool _125 = _56 > 0.0;
            bool _127 = !_125;
            int _129 = _127 ? 0 : 1;
            int _131 = ~_129;
            int _133 = _131 + 1;
            int _135 = _133 + 1;
            int _137 = _135;
            if (_123)
            {
                int _139 = ~_129;
                int _141 = _139 + 1;
                _137 = _141;
            }
            int _143 = _137;
            float _145 = float(_143);
            float _147 = _145 * 1.57079637050628662109375;
            _149 = _147;
            _151 = true;
        }
        else
        {
            float _153 = abs(_58);
            float _155 = abs(_56);
            float _157 = precise::max(_153, _155);
            float _159 = _56 * (-0.0625);
            bool _161 = _157 >= 16.0;
            float _163 = _58 * (-0.0625);
            float _165 = -_56;
            float _167 = _161 ? _159 : _165;
            float _169 = -_58;
            float _171 = _161 ? _163 : _169;
            float _173 = abs(_167);
            bool _175 = _173 != 0.0;
            bool _177 = isnan(_173);
            bool _179 = _175 || _177;
            bool _181 = isnan(0.0);
            bool _183 = _179 || _181;
            float _185 = abs(_171);
            bool _187 = _185 == 0.0;
            float _189 = abs(_171);
            bool _191 = _189 == 0.0;
            bool _193 = !_183;
            bool _195 = _191 && _193;
            bool _197 = false;
            int _199 = as_type<int>(_163);
            if (_195)
            {
                bool _201 = as_type<int>(_171) >= 0;
                _197 = _201;
            }
            bool _203 = _197;
            int _205 = _203 ? (-1) : 0;
            if (_195)
            {
                int _207 = _203 ? 0 : 1078530011;
                _199 = _207;
            }
            int _209 = _199;
            int _211 = _209;
            if (_195)
            {
                int _213 = int(0x80000000) & as_type<int>(_167);
                int _215 = _209 | _213;
                _211 = _215;
            }
            int _217 = _211;
            bool _219 = !_183;
            bool _221 = _219 && _187;
            int _223 = _217;
            _149 = as_type<float>(_217);
            if (!_221)
            {
                float _225 = abs(_167);
                bool _227 = _225 != as_type<float>(0x7f800000u /* inf */);
                bool _229 = isnan(_225);
                bool _231 = _227 || _229;
                bool _233 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _235 = _231 || _233;
                float _237 = abs(_171);
                bool _239 = _237 == as_type<float>(0x7f800000u /* inf */);
                float _241 = abs(_171);
                bool _243 = _241 == as_type<float>(0x7f800000u /* inf */);
                bool _245 = !_235;
                bool _247 = _243 && _245;
                if (_247)
                {
                    _223 = 1075235812;
                }
                int _249 = _223;
                int _251 = _249;
                if (_247)
                {
                    bool _253 = as_type<int>(_171) >= 0;
                    _205 = _253 ? (-1) : 0;
                }
                int _255 = _205;
                if (_247)
                {
                    int _257 = ~_255;
                    int _259 = (_257 != 0) ? _249 : 1061752795;
                    _251 = _259;
                }
                int _261 = _251;
                float _263 = as_type<float>(_261);
                if (_247)
                {
                    int _265 = int(0x80000000) & as_type<int>(_167);
                    int _267 = _261 | _265;
                    _263 = as_type<float>(_267);
                }
                float _269 = _263;
                bool _271 = !_235;
                bool _273 = _271 && _239;
                _149 = _269;
                if (!_273)
                {
                    float _275 = abs(_167);
                    float _277 = abs(_171);
                    float _279 = precise::max(_275, _277);
                    float _281 = abs(_167);
                    float _283 = abs(_171);
                    float _285 = precise::min(_281, _283);
                    float _287 = 1.0 / _279;
                    float _289 = abs(_167);
                    float _291 = abs(_171);
                    bool _293 = _289 > _291;
                    bool _295 = as_type<int>(_171) >= 0;
                    float _297 = _285 * _287;
                    float _299 = abs(_167);
                    float _301 = abs(_171);
                    float _303 = _299 + _301;
                    int _305 = as_type<int>(_167) & int(0x80000000);
                    float _307 = _297 * _297;
                    bool _309 = _303 > as_type<float>(0x7f800000u /* inf */);
                    bool _311 = isnan(_303);
                    bool _313 = _309 || _311;
                    bool _315 = isnan(as_type<float>(0x7f800000u /* inf */));
                    bool _317 = _313 || _315;
                    float _319 = _307 + 11.33538818359375;
                    float _321 = fma(_307, _319, 28.84246826171875);
                    float _323 = fma(_307, _321, 19.6966705322265625);
                    float _325 = fma(_307, -0.82336294651031494140625, -5.674867153167724609375);
                    float _327 = fma(_307, _325, -6.565555095672607421875);
                    float _329 = 1.0 / _323;
                    float _331 = _307 * _327;
                    float _333 = _297 * _331;
                    float _335 = fma(_333, _329, _297);
                    float _337 = _335;
                    _149 = _303;
                    if (_293)
                    {
                        float _339 = -_335;
                        float _341 = _339 + 1.57079637050628662109375;
                        _337 = _341;
                    }
                    float _343 = _337;
                    int _345 = as_type<int>(_343);
                    if (!_295)
                    {
                        float _347 = -_343;
                        float _349 = _347 + 3.1415927410125732421875;
                        _345 = as_type<int>(_349);
                    }
                    int _351 = _345;
                    if (!_317)
                    {
                        int _353 = _305 | _351;
                        _149 = as_type<float>(_353);
                    }
                }
            }
        }
        _151 = false;
        float _355 = _149;
        float _357 = -_62;
        float _359 = _357 + 1.0;
        float _361 = fma(_87, -2.400000095367431640625, 2.400000095367431640625);
        float _363 = _361 + _355;
        float _365 = fma(_363, 0.15915493667125701904296875, 1.0);
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        float _373 = _371 * 43.9822998046875;
        float _375 = _373 * 0.15915493667125701904296875;
        float _377 = _375 * 6.283185482025146484375;
        float _379 = sin(_377);
        float _381 = _379 * _359;
        float _383 = _62 * _381;
        float _385 = _383 * (-1.5);
        float _387 = fma(_383, 0.300000011920928955078125, _93);
        float _389 = precise::max(0.0, _385);
        float _391 = fma(_87, 0.5, _389);
        _103 = _391;
        _97 = _387;
    }
    float _393 = _103;
    float _395 = _97;
    float _397 = in.m_29.x;
    float _399 = _393 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _401 = -_397;
    float _403 = fma(_401, _395, -0.0);
    out.m_27.x = 0.0;
    out.m_27.y = _403;
    out.m_27.z = 0.0;
    out.m_27.w = _399;
    return main0_out_u{as_type<uint4>(out.m_27)};
}

