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
    constant _16* vp_c1 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_27 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_24 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _451 = false;
    bool _225 = false;
    bool _223 = false;
    bool _219 = false;
    bool _215 = false;
    bool _211 = false;
    bool _207 = false;
    bool _203 = false;
    bool _199 = false;
    bool _195 = false;
    bool _191 = false;
    bool _187 = false;
    bool _183 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_24.x;
    float _43 = in.m_24.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    float _108 = _87;
    float _110 = _65;
    float _112 = _85;
    float _114 = _67;
    if (_106)
    {
        _108 = 255.0;
    }
    float _116 = _108;
    float _118 = _116;
    if (_106)
    {
        _110 = 255.0;
    }
    float _120 = _110;
    float _122 = _120;
    if (_106)
    {
        _112 = 255.0;
    }
    float _124 = _112;
    float _126 = _124;
    if (_106)
    {
        _114 = 255.0;
    }
    float _128 = _114;
    float _130 = _128;
    if (!_106)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        uint _137 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _139 = int(_137) & 15;
        bool _141 = !_134;
        if (!_141)
        {
            uint _143 = min(uint(_139), 13u);
            float _145 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _147 = int(_143) << 2;
            uint _149 = uint(int(uint(_147) >> uint(2)));
            uint _151 = uint(int(uint(int(_149)) >> uint(2)));
            int _153 = int(_149) & 3;
            float _155 = (*spvDescriptorSet0.vp_c1)._m0[int(_151)][_153];
            float _157 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _159 = _145 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _161 = _145 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _163 = _157 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _165 = _157 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _167 = as_type<int>(_155) >> 31;
            bool _169 = as_type<int>(_155) == 848;
            float _171 = _159;
            float _173 = _161;
            float _175 = _155;
            float _177 = as_type<float>(_167);
            float _179 = _165;
            if (!_169)
            {
                bool _181 = as_type<int>(_155) == 896;
                _183 = _181;
                if (!_183)
                {
                    bool _185 = as_type<int>(_155) == 960;
                    _187 = _185;
                    if (!_187)
                    {
                        bool _189 = as_type<int>(_155) == 1024;
                        _191 = _189;
                        if (!_191)
                        {
                            bool _193 = as_type<int>(_155) == 1104;
                            _195 = _193;
                            if (!_195)
                            {
                                bool _197 = as_type<int>(_155) == 1184;
                                _199 = _197;
                                if (!_199)
                                {
                                    bool _201 = as_type<int>(_155) == 1280;
                                    _203 = _201;
                                    if (!_203)
                                    {
                                        bool _205 = as_type<int>(_155) == 1360;
                                        _207 = _205;
                                        if (!_207)
                                        {
                                            bool _209 = as_type<int>(_155) == 1456;
                                            _211 = _209;
                                            if (!_211)
                                            {
                                                bool _213 = as_type<int>(_155) == 1520;
                                                _215 = _213;
                                                if (!_215)
                                                {
                                                    bool _217 = as_type<int>(_155) == 1600;
                                                    _219 = _217;
                                                    if (!_219)
                                                    {
                                                        bool _221 = as_type<int>(_155) == 1664;
                                                        _223 = _221;
                                                        if (!_223)
                                                        {
                                                            _225 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _231;
            float _233;
            if (!_183)
            {
                if (!_187)
                {
                    if (!_191)
                    {
                        if (!_195)
                        {
                            if (!_199)
                            {
                                if (!_203)
                                {
                                    if (!_207)
                                    {
                                        if (!_211)
                                        {
                                            if (!_215)
                                            {
                                                if (!_219)
                                                {
                                                    if (!_223)
                                                    {
                                                        if (!_225)
                                                        {
                                                            float _227 = _159 * _41;
                                                            float _229 = _163 * _43;
                                                            _231 = _229;
                                                            _233 = _227;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195) || _191) || _187) || _183)
            {
                if ((!_187) || _183)
                {
                    if ((!_191) || _183)
                    {
                        if ((!_195) || _183)
                        {
                            if ((!_199) || _183)
                            {
                                if ((!_203) || _183)
                                {
                                    if ((!_207) || _183)
                                    {
                                        if ((!_211) || _183)
                                        {
                                            if ((!_215) || _183)
                                            {
                                                if ((!_219) || _183)
                                                {
                                                    if ((!_223) || _183)
                                                    {
                                                        if ((!_225) || _183)
                                                        {
                                                            _183 = false;
                                                            float _235 = -_161;
                                                            float _237 = _235 + 1.0;
                                                            float _239 = _163 * _43;
                                                            float _241 = fma(_161, _41, _237);
                                                            _231 = _239;
                                                            _233 = _241;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195) || _191) || _187)
                {
                    if ((!_191) || _187)
                    {
                        if ((!_195) || _187)
                        {
                            if ((!_199) || _187)
                            {
                                if ((!_203) || _187)
                                {
                                    if ((!_207) || _187)
                                    {
                                        if ((!_211) || _187)
                                        {
                                            if ((!_215) || _187)
                                            {
                                                if ((!_219) || _187)
                                                {
                                                    if ((!_223) || _187)
                                                    {
                                                        if ((!_225) || _187)
                                                        {
                                                            _187 = false;
                                                            float _243 = -_165;
                                                            float _245 = _243 + 1.0;
                                                            float _247 = _159 * _41;
                                                            float _249 = fma(_165, _43, _245);
                                                            _231 = _249;
                                                            _233 = _247;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195) || _191)
                    {
                        if ((!_195) || _191)
                        {
                            if ((!_199) || _191)
                            {
                                if ((!_203) || _191)
                                {
                                    if ((!_207) || _191)
                                    {
                                        if ((!_211) || _191)
                                        {
                                            if ((!_215) || _191)
                                            {
                                                if ((!_219) || _191)
                                                {
                                                    if ((!_223) || _191)
                                                    {
                                                        if ((!_225) || _191)
                                                        {
                                                            _191 = false;
                                                            float _251 = -_161;
                                                            float _253 = _251 + 1.0;
                                                            float _255 = -_165;
                                                            float _257 = _255 + 1.0;
                                                            float _259 = fma(_161, _41, _253);
                                                            float _261 = fma(_165, _43, _257);
                                                            _231 = _261;
                                                            _233 = _259;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195)
                        {
                            if ((!_199) || _195)
                            {
                                if ((!_203) || _195)
                                {
                                    if ((!_207) || _195)
                                    {
                                        if ((!_211) || _195)
                                        {
                                            if ((!_215) || _195)
                                            {
                                                if ((!_219) || _195)
                                                {
                                                    if ((!_223) || _195)
                                                    {
                                                        if ((!_225) || _195)
                                                        {
                                                            _195 = false;
                                                            float _263 = -_163;
                                                            float _265 = _263 + 1.0;
                                                            float _267 = -_165;
                                                            float _269 = _267 + _265;
                                                            float _271 = _159 * _41;
                                                            float _273 = fma(_269, _43, _163);
                                                            _231 = _273;
                                                            _233 = _271;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199)
                            {
                                if ((!_203) || _199)
                                {
                                    if ((!_207) || _199)
                                    {
                                        if ((!_211) || _199)
                                        {
                                            if ((!_215) || _199)
                                            {
                                                if ((!_219) || _199)
                                                {
                                                    if ((!_223) || _199)
                                                    {
                                                        if ((!_225) || _199)
                                                        {
                                                            _199 = false;
                                                            float _275 = -_163;
                                                            float _277 = _275 + 1.0;
                                                            float _279 = -_161;
                                                            float _281 = _279 + 1.0;
                                                            float _283 = -_165;
                                                            float _285 = _283 + _277;
                                                            float _287 = fma(_161, _41, _281);
                                                            float _289 = fma(_285, _43, _163);
                                                            _231 = _289;
                                                            _233 = _287;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203)
                                {
                                    if ((!_207) || _203)
                                    {
                                        if ((!_211) || _203)
                                        {
                                            if ((!_215) || _203)
                                            {
                                                if ((!_219) || _203)
                                                {
                                                    if ((!_223) || _203)
                                                    {
                                                        if ((!_225) || _203)
                                                        {
                                                            _203 = false;
                                                            float _291 = -_159;
                                                            float _293 = _291 + 1.0;
                                                            float _295 = -_161;
                                                            float _297 = _295 + _293;
                                                            float _299 = _163 * _43;
                                                            float _301 = fma(_297, _41, _159);
                                                            _231 = _299;
                                                            _233 = _301;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _225) || _223) || _219) || _215) || _211) || _207)
                                    {
                                        if ((!_211) || _207)
                                        {
                                            if ((!_215) || _207)
                                            {
                                                if ((!_219) || _207)
                                                {
                                                    if ((!_223) || _207)
                                                    {
                                                        if ((!_225) || _207)
                                                        {
                                                            _207 = false;
                                                            float _303 = -_159;
                                                            float _305 = _303 + 1.0;
                                                            float _307 = -_165;
                                                            float _309 = _307 + 1.0;
                                                            float _311 = -_161;
                                                            float _313 = _311 + _305;
                                                            float _315 = fma(_165, _43, _309);
                                                            float _317 = fma(_313, _41, _159);
                                                            _231 = _315;
                                                            _233 = _317;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _225) || _223) || _219) || _215) || _211)
                                        {
                                            if ((!_215) || _211)
                                            {
                                                if ((!_219) || _211)
                                                {
                                                    if ((!_223) || _211)
                                                    {
                                                        if ((!_225) || _211)
                                                        {
                                                            _211 = false;
                                                            float _319 = -_161;
                                                            float _321 = _319 + 1.0;
                                                            float _323 = _163 * _43;
                                                            float _325 = _321 * _41;
                                                            _231 = _323;
                                                            _233 = _325;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _225) || _223) || _219) || _215)
                                            {
                                                if ((!_219) || _215)
                                                {
                                                    if ((!_223) || _215)
                                                    {
                                                        if ((!_225) || _215)
                                                        {
                                                            _215 = false;
                                                            float _327 = -_161;
                                                            float _329 = _327 + 1.0;
                                                            float _331 = -_165;
                                                            float _333 = _331 + 1.0;
                                                            float _335 = fma(_161, _41, _329);
                                                            float _337 = _333 * _43;
                                                            _231 = _337;
                                                            _233 = _335;
                                                        }
                                                    }
                                                }
                                                if (((false || _225) || _223) || _219)
                                                {
                                                    if ((!_223) || _219)
                                                    {
                                                        if ((!_225) || _219)
                                                        {
                                                            _219 = false;
                                                            float _339 = -_163;
                                                            float _341 = _339 + 1.0;
                                                            float _343 = _159 * _41;
                                                            float _345 = fma(_341, _43, _163);
                                                            _231 = _345;
                                                            _233 = _343;
                                                        }
                                                    }
                                                    if ((false || _225) || _223)
                                                    {
                                                        if ((!_225) || _223)
                                                        {
                                                            _223 = false;
                                                            float _347 = -_159;
                                                            float _349 = _347 + 1.0;
                                                            float _351 = -_165;
                                                            float _353 = _351 + 1.0;
                                                            float _355 = fma(_349, _41, _159);
                                                            float _357 = fma(_165, _43, _353);
                                                            _231 = _357;
                                                            _233 = _355;
                                                        }
                                                        if (false || _225)
                                                        {
                                                            _225 = false;
                                                            bool _359 = _139 != 12;
                                                            if (!_359)
                                                            {
                                                                float _361 = -_163;
                                                                float _363 = _361 + 1.0;
                                                                _171 = _363;
                                                            }
                                                            float _365 = _171;
                                                            if (!_359)
                                                            {
                                                                float _367 = -_161;
                                                                float _369 = _367 + 1.0;
                                                                _173 = _369;
                                                            }
                                                            float _371 = _173;
                                                            if (_359)
                                                            {
                                                                _175 = 0.0;
                                                                _177 = 0.0;
                                                            }
                                                            float _373 = _175;
                                                            float _375 = _177;
                                                            float _377 = _375;
                                                            _231 = _373;
                                                            if (!_359)
                                                            {
                                                                float _379 = -_165;
                                                                float _381 = _379 + _365;
                                                                _179 = _381;
                                                            }
                                                            float _383 = _179;
                                                            if (!_359)
                                                            {
                                                                float _385 = _41 * _371;
                                                                _377 = _385;
                                                            }
                                                            float _387 = _377;
                                                            _233 = _387;
                                                            if (!_359)
                                                            {
                                                                float _389 = _43 * _383;
                                                                _231 = _389;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _391 = _231;
            float _393 = _233;
            float _395 = -_391;
            float _397 = _395 + 1.0;
            float _399 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _401 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _403 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _405 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _407 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _409 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _411 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _413 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _415 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].x, _399);
            float _417 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].y, _401);
            float _419 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].z, _403);
            float _421 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].w, _405);
            float _423 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].x, _407);
            float _425 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].y, _409);
            float _427 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].z, _411);
            float _429 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].w, _413);
            float _431 = _415 * _393;
            float _433 = -_393;
            float _435 = _433 + 1.0;
            float _437 = _417 * _393;
            float _439 = _419 * _393;
            float _441 = _421 * _393;
            float _443 = fma(_435, _423, _431);
            float _445 = fma(_435, _425, _437);
            float _447 = fma(_435, _427, _439);
            float _449 = fma(_435, _429, _441);
            _118 = _443;
            _122 = _445;
            _126 = _447;
            _130 = _449;
            _451 = true;
        }
        else
        {
            bool _453 = _139 != 13;
            if (!_453)
            {
                float _455 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _457 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _459 = _455 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _461 = -_459;
                float _463 = _461 + 1.0;
                float _465 = _457 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _467 = -_455;
                float _469 = fma(_467, (*spvDescriptorSet0.vp_c3)._m0[26].w, _463);
                float _471 = -_465;
                float _473 = _471 + 1.0;
                float _475 = fma(_469, _43, _459);
                float _477 = -_457;
                float _479 = fma(_477, (*spvDescriptorSet0.vp_c3)._m0[26].y, _473);
                float _481 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _483 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _485 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _487 = fma(_479, _41, _465);
                float _489 = -_475;
                float _491 = _489 + 1.0;
                float _493 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _495 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _497 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _499 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _501 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _503 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].x, _481);
                float _505 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].y, _483);
                float _507 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].z, _485);
                float _509 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].w, _493);
                float _511 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].x, _495);
                float _513 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].y, _497);
                float _515 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].z, _499);
                float _517 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].w, _501);
                float _519 = _487 * _503;
                float _521 = -_487;
                float _523 = _521 + 1.0;
                float _525 = _487 * _505;
                float _527 = _487 * _507;
                float _529 = _487 * _509;
                float _531 = fma(_523, _511, _519);
                float _533 = fma(_523, _513, _525);
                float _535 = fma(_523, _515, _527);
                float _537 = fma(_523, _517, _529);
                _118 = _531;
                _122 = _533;
                _126 = _535;
                _130 = _537;
                _451 = true;
            }
            else
            {
                float _539 = trunc(_43);
                int _541 = int(_539);
                float _543 = trunc(_41);
                int _545 = int(_543);
                int _547 = _541 << 1;
                int _549 = _547 + _545;
                int _551 = _549 << 4;
                int _553 = _551 + 464;
                uint _555 = uint(int(uint(_553) >> uint(2)));
                uint _557 = uint(int(uint(int(_555)) >> uint(2)));
                int _559 = int(_555) & 3;
                float _561 = (*spvDescriptorSet0.vp_c3)._m0[int(_557)][_559];
                int _563 = int(_555) + 1;
                uint _565 = uint(int(uint(_563) >> uint(2)));
                int _567 = _563 & 3;
                float _569 = (*spvDescriptorSet0.vp_c3)._m0[int(_565)][_567];
                int _571 = _553 + 8;
                uint _573 = uint(int(uint(_571) >> uint(2)));
                uint _575 = uint(int(uint(int(_573)) >> uint(2)));
                int _577 = int(_573) & 3;
                float _579 = (*spvDescriptorSet0.vp_c3)._m0[int(_575)][_577];
                int _581 = int(_573) + 1;
                uint _583 = uint(int(uint(_581) >> uint(2)));
                int _585 = _581 & 3;
                float _587 = (*spvDescriptorSet0.vp_c3)._m0[int(_583)][_585];
                _118 = _561;
                _122 = _569;
                _126 = _579;
                _130 = _587;
            }
        }
    }
    _451 = false;
    float _589 = _118;
    float _591 = _122;
    float _593 = _126;
    float _595 = _130;
    float _597 = _589 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _599 = _591 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _601 = _593 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _603 = _595 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_27.x = _597;
    out.m_27.y = _599;
    out.m_27.z = _601;
    out.m_27.w = _603;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _451 = false;
    bool _225 = false;
    bool _223 = false;
    bool _219 = false;
    bool _215 = false;
    bool _211 = false;
    bool _207 = false;
    bool _203 = false;
    bool _199 = false;
    bool _195 = false;
    bool _191 = false;
    bool _187 = false;
    bool _183 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_24.x;
    float _43 = in.m_24.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    float _108 = _87;
    float _110 = _65;
    float _112 = _85;
    float _114 = _67;
    if (_106)
    {
        _108 = 255.0;
    }
    float _116 = _108;
    float _118 = _116;
    if (_106)
    {
        _110 = 255.0;
    }
    float _120 = _110;
    float _122 = _120;
    if (_106)
    {
        _112 = 255.0;
    }
    float _124 = _112;
    float _126 = _124;
    if (_106)
    {
        _114 = 255.0;
    }
    float _128 = _114;
    float _130 = _128;
    if (!_106)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        uint _137 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _139 = int(_137) & 15;
        bool _141 = !_134;
        if (!_141)
        {
            uint _143 = min(uint(_139), 13u);
            float _145 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _147 = int(_143) << 2;
            uint _149 = uint(int(uint(_147) >> uint(2)));
            uint _151 = uint(int(uint(int(_149)) >> uint(2)));
            int _153 = int(_149) & 3;
            float _155 = (*spvDescriptorSet0.vp_c1)._m0[int(_151)][_153];
            float _157 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _159 = _145 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _161 = _145 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _163 = _157 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _165 = _157 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _167 = as_type<int>(_155) >> 31;
            bool _169 = as_type<int>(_155) == 848;
            float _171 = _159;
            float _173 = _161;
            float _175 = _155;
            float _177 = as_type<float>(_167);
            float _179 = _165;
            if (!_169)
            {
                bool _181 = as_type<int>(_155) == 896;
                _183 = _181;
                if (!_183)
                {
                    bool _185 = as_type<int>(_155) == 960;
                    _187 = _185;
                    if (!_187)
                    {
                        bool _189 = as_type<int>(_155) == 1024;
                        _191 = _189;
                        if (!_191)
                        {
                            bool _193 = as_type<int>(_155) == 1104;
                            _195 = _193;
                            if (!_195)
                            {
                                bool _197 = as_type<int>(_155) == 1184;
                                _199 = _197;
                                if (!_199)
                                {
                                    bool _201 = as_type<int>(_155) == 1280;
                                    _203 = _201;
                                    if (!_203)
                                    {
                                        bool _205 = as_type<int>(_155) == 1360;
                                        _207 = _205;
                                        if (!_207)
                                        {
                                            bool _209 = as_type<int>(_155) == 1456;
                                            _211 = _209;
                                            if (!_211)
                                            {
                                                bool _213 = as_type<int>(_155) == 1520;
                                                _215 = _213;
                                                if (!_215)
                                                {
                                                    bool _217 = as_type<int>(_155) == 1600;
                                                    _219 = _217;
                                                    if (!_219)
                                                    {
                                                        bool _221 = as_type<int>(_155) == 1664;
                                                        _223 = _221;
                                                        if (!_223)
                                                        {
                                                            _225 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _231;
            float _233;
            if (!_183)
            {
                if (!_187)
                {
                    if (!_191)
                    {
                        if (!_195)
                        {
                            if (!_199)
                            {
                                if (!_203)
                                {
                                    if (!_207)
                                    {
                                        if (!_211)
                                        {
                                            if (!_215)
                                            {
                                                if (!_219)
                                                {
                                                    if (!_223)
                                                    {
                                                        if (!_225)
                                                        {
                                                            float _227 = _159 * _41;
                                                            float _229 = _163 * _43;
                                                            _231 = _229;
                                                            _233 = _227;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195) || _191) || _187) || _183)
            {
                if ((!_187) || _183)
                {
                    if ((!_191) || _183)
                    {
                        if ((!_195) || _183)
                        {
                            if ((!_199) || _183)
                            {
                                if ((!_203) || _183)
                                {
                                    if ((!_207) || _183)
                                    {
                                        if ((!_211) || _183)
                                        {
                                            if ((!_215) || _183)
                                            {
                                                if ((!_219) || _183)
                                                {
                                                    if ((!_223) || _183)
                                                    {
                                                        if ((!_225) || _183)
                                                        {
                                                            _183 = false;
                                                            float _235 = -_161;
                                                            float _237 = _235 + 1.0;
                                                            float _239 = _163 * _43;
                                                            float _241 = fma(_161, _41, _237);
                                                            _231 = _239;
                                                            _233 = _241;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195) || _191) || _187)
                {
                    if ((!_191) || _187)
                    {
                        if ((!_195) || _187)
                        {
                            if ((!_199) || _187)
                            {
                                if ((!_203) || _187)
                                {
                                    if ((!_207) || _187)
                                    {
                                        if ((!_211) || _187)
                                        {
                                            if ((!_215) || _187)
                                            {
                                                if ((!_219) || _187)
                                                {
                                                    if ((!_223) || _187)
                                                    {
                                                        if ((!_225) || _187)
                                                        {
                                                            _187 = false;
                                                            float _243 = -_165;
                                                            float _245 = _243 + 1.0;
                                                            float _247 = _159 * _41;
                                                            float _249 = fma(_165, _43, _245);
                                                            _231 = _249;
                                                            _233 = _247;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195) || _191)
                    {
                        if ((!_195) || _191)
                        {
                            if ((!_199) || _191)
                            {
                                if ((!_203) || _191)
                                {
                                    if ((!_207) || _191)
                                    {
                                        if ((!_211) || _191)
                                        {
                                            if ((!_215) || _191)
                                            {
                                                if ((!_219) || _191)
                                                {
                                                    if ((!_223) || _191)
                                                    {
                                                        if ((!_225) || _191)
                                                        {
                                                            _191 = false;
                                                            float _251 = -_161;
                                                            float _253 = _251 + 1.0;
                                                            float _255 = -_165;
                                                            float _257 = _255 + 1.0;
                                                            float _259 = fma(_161, _41, _253);
                                                            float _261 = fma(_165, _43, _257);
                                                            _231 = _261;
                                                            _233 = _259;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195)
                        {
                            if ((!_199) || _195)
                            {
                                if ((!_203) || _195)
                                {
                                    if ((!_207) || _195)
                                    {
                                        if ((!_211) || _195)
                                        {
                                            if ((!_215) || _195)
                                            {
                                                if ((!_219) || _195)
                                                {
                                                    if ((!_223) || _195)
                                                    {
                                                        if ((!_225) || _195)
                                                        {
                                                            _195 = false;
                                                            float _263 = -_163;
                                                            float _265 = _263 + 1.0;
                                                            float _267 = -_165;
                                                            float _269 = _267 + _265;
                                                            float _271 = _159 * _41;
                                                            float _273 = fma(_269, _43, _163);
                                                            _231 = _273;
                                                            _233 = _271;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199)
                            {
                                if ((!_203) || _199)
                                {
                                    if ((!_207) || _199)
                                    {
                                        if ((!_211) || _199)
                                        {
                                            if ((!_215) || _199)
                                            {
                                                if ((!_219) || _199)
                                                {
                                                    if ((!_223) || _199)
                                                    {
                                                        if ((!_225) || _199)
                                                        {
                                                            _199 = false;
                                                            float _275 = -_163;
                                                            float _277 = _275 + 1.0;
                                                            float _279 = -_161;
                                                            float _281 = _279 + 1.0;
                                                            float _283 = -_165;
                                                            float _285 = _283 + _277;
                                                            float _287 = fma(_161, _41, _281);
                                                            float _289 = fma(_285, _43, _163);
                                                            _231 = _289;
                                                            _233 = _287;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203)
                                {
                                    if ((!_207) || _203)
                                    {
                                        if ((!_211) || _203)
                                        {
                                            if ((!_215) || _203)
                                            {
                                                if ((!_219) || _203)
                                                {
                                                    if ((!_223) || _203)
                                                    {
                                                        if ((!_225) || _203)
                                                        {
                                                            _203 = false;
                                                            float _291 = -_159;
                                                            float _293 = _291 + 1.0;
                                                            float _295 = -_161;
                                                            float _297 = _295 + _293;
                                                            float _299 = _163 * _43;
                                                            float _301 = fma(_297, _41, _159);
                                                            _231 = _299;
                                                            _233 = _301;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _225) || _223) || _219) || _215) || _211) || _207)
                                    {
                                        if ((!_211) || _207)
                                        {
                                            if ((!_215) || _207)
                                            {
                                                if ((!_219) || _207)
                                                {
                                                    if ((!_223) || _207)
                                                    {
                                                        if ((!_225) || _207)
                                                        {
                                                            _207 = false;
                                                            float _303 = -_159;
                                                            float _305 = _303 + 1.0;
                                                            float _307 = -_165;
                                                            float _309 = _307 + 1.0;
                                                            float _311 = -_161;
                                                            float _313 = _311 + _305;
                                                            float _315 = fma(_165, _43, _309);
                                                            float _317 = fma(_313, _41, _159);
                                                            _231 = _315;
                                                            _233 = _317;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _225) || _223) || _219) || _215) || _211)
                                        {
                                            if ((!_215) || _211)
                                            {
                                                if ((!_219) || _211)
                                                {
                                                    if ((!_223) || _211)
                                                    {
                                                        if ((!_225) || _211)
                                                        {
                                                            _211 = false;
                                                            float _319 = -_161;
                                                            float _321 = _319 + 1.0;
                                                            float _323 = _163 * _43;
                                                            float _325 = _321 * _41;
                                                            _231 = _323;
                                                            _233 = _325;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _225) || _223) || _219) || _215)
                                            {
                                                if ((!_219) || _215)
                                                {
                                                    if ((!_223) || _215)
                                                    {
                                                        if ((!_225) || _215)
                                                        {
                                                            _215 = false;
                                                            float _327 = -_161;
                                                            float _329 = _327 + 1.0;
                                                            float _331 = -_165;
                                                            float _333 = _331 + 1.0;
                                                            float _335 = fma(_161, _41, _329);
                                                            float _337 = _333 * _43;
                                                            _231 = _337;
                                                            _233 = _335;
                                                        }
                                                    }
                                                }
                                                if (((false || _225) || _223) || _219)
                                                {
                                                    if ((!_223) || _219)
                                                    {
                                                        if ((!_225) || _219)
                                                        {
                                                            _219 = false;
                                                            float _339 = -_163;
                                                            float _341 = _339 + 1.0;
                                                            float _343 = _159 * _41;
                                                            float _345 = fma(_341, _43, _163);
                                                            _231 = _345;
                                                            _233 = _343;
                                                        }
                                                    }
                                                    if ((false || _225) || _223)
                                                    {
                                                        if ((!_225) || _223)
                                                        {
                                                            _223 = false;
                                                            float _347 = -_159;
                                                            float _349 = _347 + 1.0;
                                                            float _351 = -_165;
                                                            float _353 = _351 + 1.0;
                                                            float _355 = fma(_349, _41, _159);
                                                            float _357 = fma(_165, _43, _353);
                                                            _231 = _357;
                                                            _233 = _355;
                                                        }
                                                        if (false || _225)
                                                        {
                                                            _225 = false;
                                                            bool _359 = _139 != 12;
                                                            if (!_359)
                                                            {
                                                                float _361 = -_163;
                                                                float _363 = _361 + 1.0;
                                                                _171 = _363;
                                                            }
                                                            float _365 = _171;
                                                            if (!_359)
                                                            {
                                                                float _367 = -_161;
                                                                float _369 = _367 + 1.0;
                                                                _173 = _369;
                                                            }
                                                            float _371 = _173;
                                                            if (_359)
                                                            {
                                                                _175 = 0.0;
                                                                _177 = 0.0;
                                                            }
                                                            float _373 = _175;
                                                            float _375 = _177;
                                                            float _377 = _375;
                                                            _231 = _373;
                                                            if (!_359)
                                                            {
                                                                float _379 = -_165;
                                                                float _381 = _379 + _365;
                                                                _179 = _381;
                                                            }
                                                            float _383 = _179;
                                                            if (!_359)
                                                            {
                                                                float _385 = _41 * _371;
                                                                _377 = _385;
                                                            }
                                                            float _387 = _377;
                                                            _233 = _387;
                                                            if (!_359)
                                                            {
                                                                float _389 = _43 * _383;
                                                                _231 = _389;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _391 = _231;
            float _393 = _233;
            float _395 = -_391;
            float _397 = _395 + 1.0;
            float _399 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _401 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _403 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _405 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _407 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _409 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _411 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _413 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _415 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].x, _399);
            float _417 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].y, _401);
            float _419 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].z, _403);
            float _421 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].w, _405);
            float _423 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].x, _407);
            float _425 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].y, _409);
            float _427 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].z, _411);
            float _429 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].w, _413);
            float _431 = _415 * _393;
            float _433 = -_393;
            float _435 = _433 + 1.0;
            float _437 = _417 * _393;
            float _439 = _419 * _393;
            float _441 = _421 * _393;
            float _443 = fma(_435, _423, _431);
            float _445 = fma(_435, _425, _437);
            float _447 = fma(_435, _427, _439);
            float _449 = fma(_435, _429, _441);
            _118 = _443;
            _122 = _445;
            _126 = _447;
            _130 = _449;
            _451 = true;
        }
        else
        {
            bool _453 = _139 != 13;
            if (!_453)
            {
                float _455 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _457 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _459 = _455 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _461 = -_459;
                float _463 = _461 + 1.0;
                float _465 = _457 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _467 = -_455;
                float _469 = fma(_467, (*spvDescriptorSet0.vp_c3)._m0[26].w, _463);
                float _471 = -_465;
                float _473 = _471 + 1.0;
                float _475 = fma(_469, _43, _459);
                float _477 = -_457;
                float _479 = fma(_477, (*spvDescriptorSet0.vp_c3)._m0[26].y, _473);
                float _481 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _483 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _485 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _487 = fma(_479, _41, _465);
                float _489 = -_475;
                float _491 = _489 + 1.0;
                float _493 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _495 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _497 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _499 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _501 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _503 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].x, _481);
                float _505 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].y, _483);
                float _507 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].z, _485);
                float _509 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].w, _493);
                float _511 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].x, _495);
                float _513 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].y, _497);
                float _515 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].z, _499);
                float _517 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].w, _501);
                float _519 = _487 * _503;
                float _521 = -_487;
                float _523 = _521 + 1.0;
                float _525 = _487 * _505;
                float _527 = _487 * _507;
                float _529 = _487 * _509;
                float _531 = fma(_523, _511, _519);
                float _533 = fma(_523, _513, _525);
                float _535 = fma(_523, _515, _527);
                float _537 = fma(_523, _517, _529);
                _118 = _531;
                _122 = _533;
                _126 = _535;
                _130 = _537;
                _451 = true;
            }
            else
            {
                float _539 = trunc(_43);
                int _541 = int(_539);
                float _543 = trunc(_41);
                int _545 = int(_543);
                int _547 = _541 << 1;
                int _549 = _547 + _545;
                int _551 = _549 << 4;
                int _553 = _551 + 464;
                uint _555 = uint(int(uint(_553) >> uint(2)));
                uint _557 = uint(int(uint(int(_555)) >> uint(2)));
                int _559 = int(_555) & 3;
                float _561 = (*spvDescriptorSet0.vp_c3)._m0[int(_557)][_559];
                int _563 = int(_555) + 1;
                uint _565 = uint(int(uint(_563) >> uint(2)));
                int _567 = _563 & 3;
                float _569 = (*spvDescriptorSet0.vp_c3)._m0[int(_565)][_567];
                int _571 = _553 + 8;
                uint _573 = uint(int(uint(_571) >> uint(2)));
                uint _575 = uint(int(uint(int(_573)) >> uint(2)));
                int _577 = int(_573) & 3;
                float _579 = (*spvDescriptorSet0.vp_c3)._m0[int(_575)][_577];
                int _581 = int(_573) + 1;
                uint _583 = uint(int(uint(_581) >> uint(2)));
                int _585 = _581 & 3;
                float _587 = (*spvDescriptorSet0.vp_c3)._m0[int(_583)][_585];
                _118 = _561;
                _122 = _569;
                _126 = _579;
                _130 = _587;
            }
        }
    }
    _451 = false;
    float _589 = _118;
    float _591 = _122;
    float _593 = _126;
    float _595 = _130;
    float _597 = _589 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _599 = _591 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _601 = _593 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _603 = _595 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_27.x = _597;
    out.m_27.y = _599;
    out.m_27.z = _601;
    out.m_27.w = _603;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _451 = false;
    bool _225 = false;
    bool _223 = false;
    bool _219 = false;
    bool _215 = false;
    bool _211 = false;
    bool _207 = false;
    bool _203 = false;
    bool _199 = false;
    bool _195 = false;
    bool _191 = false;
    bool _187 = false;
    bool _183 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_24.x;
    float _43 = in.m_24.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    float _108 = _87;
    float _110 = _65;
    float _112 = _85;
    float _114 = _67;
    if (_106)
    {
        _108 = 255.0;
    }
    float _116 = _108;
    float _118 = _116;
    if (_106)
    {
        _110 = 255.0;
    }
    float _120 = _110;
    float _122 = _120;
    if (_106)
    {
        _112 = 255.0;
    }
    float _124 = _112;
    float _126 = _124;
    if (_106)
    {
        _114 = 255.0;
    }
    float _128 = _114;
    float _130 = _128;
    if (!_106)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        uint _137 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _139 = int(_137) & 15;
        bool _141 = !_134;
        if (!_141)
        {
            uint _143 = min(uint(_139), 13u);
            float _145 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _147 = int(_143) << 2;
            uint _149 = uint(int(uint(_147) >> uint(2)));
            uint _151 = uint(int(uint(int(_149)) >> uint(2)));
            int _153 = int(_149) & 3;
            float _155 = (*spvDescriptorSet0.vp_c1)._m0[int(_151)][_153];
            float _157 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _159 = _145 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _161 = _145 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _163 = _157 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _165 = _157 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _167 = as_type<int>(_155) >> 31;
            bool _169 = as_type<int>(_155) == 848;
            float _171 = _159;
            float _173 = _161;
            float _175 = _155;
            float _177 = as_type<float>(_167);
            float _179 = _165;
            if (!_169)
            {
                bool _181 = as_type<int>(_155) == 896;
                _183 = _181;
                if (!_183)
                {
                    bool _185 = as_type<int>(_155) == 960;
                    _187 = _185;
                    if (!_187)
                    {
                        bool _189 = as_type<int>(_155) == 1024;
                        _191 = _189;
                        if (!_191)
                        {
                            bool _193 = as_type<int>(_155) == 1104;
                            _195 = _193;
                            if (!_195)
                            {
                                bool _197 = as_type<int>(_155) == 1184;
                                _199 = _197;
                                if (!_199)
                                {
                                    bool _201 = as_type<int>(_155) == 1280;
                                    _203 = _201;
                                    if (!_203)
                                    {
                                        bool _205 = as_type<int>(_155) == 1360;
                                        _207 = _205;
                                        if (!_207)
                                        {
                                            bool _209 = as_type<int>(_155) == 1456;
                                            _211 = _209;
                                            if (!_211)
                                            {
                                                bool _213 = as_type<int>(_155) == 1520;
                                                _215 = _213;
                                                if (!_215)
                                                {
                                                    bool _217 = as_type<int>(_155) == 1600;
                                                    _219 = _217;
                                                    if (!_219)
                                                    {
                                                        bool _221 = as_type<int>(_155) == 1664;
                                                        _223 = _221;
                                                        if (!_223)
                                                        {
                                                            _225 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _231;
            float _233;
            if (!_183)
            {
                if (!_187)
                {
                    if (!_191)
                    {
                        if (!_195)
                        {
                            if (!_199)
                            {
                                if (!_203)
                                {
                                    if (!_207)
                                    {
                                        if (!_211)
                                        {
                                            if (!_215)
                                            {
                                                if (!_219)
                                                {
                                                    if (!_223)
                                                    {
                                                        if (!_225)
                                                        {
                                                            float _227 = _159 * _41;
                                                            float _229 = _163 * _43;
                                                            _231 = _229;
                                                            _233 = _227;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195) || _191) || _187) || _183)
            {
                if ((!_187) || _183)
                {
                    if ((!_191) || _183)
                    {
                        if ((!_195) || _183)
                        {
                            if ((!_199) || _183)
                            {
                                if ((!_203) || _183)
                                {
                                    if ((!_207) || _183)
                                    {
                                        if ((!_211) || _183)
                                        {
                                            if ((!_215) || _183)
                                            {
                                                if ((!_219) || _183)
                                                {
                                                    if ((!_223) || _183)
                                                    {
                                                        if ((!_225) || _183)
                                                        {
                                                            _183 = false;
                                                            float _235 = -_161;
                                                            float _237 = _235 + 1.0;
                                                            float _239 = _163 * _43;
                                                            float _241 = fma(_161, _41, _237);
                                                            _231 = _239;
                                                            _233 = _241;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195) || _191) || _187)
                {
                    if ((!_191) || _187)
                    {
                        if ((!_195) || _187)
                        {
                            if ((!_199) || _187)
                            {
                                if ((!_203) || _187)
                                {
                                    if ((!_207) || _187)
                                    {
                                        if ((!_211) || _187)
                                        {
                                            if ((!_215) || _187)
                                            {
                                                if ((!_219) || _187)
                                                {
                                                    if ((!_223) || _187)
                                                    {
                                                        if ((!_225) || _187)
                                                        {
                                                            _187 = false;
                                                            float _243 = -_165;
                                                            float _245 = _243 + 1.0;
                                                            float _247 = _159 * _41;
                                                            float _249 = fma(_165, _43, _245);
                                                            _231 = _249;
                                                            _233 = _247;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195) || _191)
                    {
                        if ((!_195) || _191)
                        {
                            if ((!_199) || _191)
                            {
                                if ((!_203) || _191)
                                {
                                    if ((!_207) || _191)
                                    {
                                        if ((!_211) || _191)
                                        {
                                            if ((!_215) || _191)
                                            {
                                                if ((!_219) || _191)
                                                {
                                                    if ((!_223) || _191)
                                                    {
                                                        if ((!_225) || _191)
                                                        {
                                                            _191 = false;
                                                            float _251 = -_161;
                                                            float _253 = _251 + 1.0;
                                                            float _255 = -_165;
                                                            float _257 = _255 + 1.0;
                                                            float _259 = fma(_161, _41, _253);
                                                            float _261 = fma(_165, _43, _257);
                                                            _231 = _261;
                                                            _233 = _259;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199) || _195)
                        {
                            if ((!_199) || _195)
                            {
                                if ((!_203) || _195)
                                {
                                    if ((!_207) || _195)
                                    {
                                        if ((!_211) || _195)
                                        {
                                            if ((!_215) || _195)
                                            {
                                                if ((!_219) || _195)
                                                {
                                                    if ((!_223) || _195)
                                                    {
                                                        if ((!_225) || _195)
                                                        {
                                                            _195 = false;
                                                            float _263 = -_163;
                                                            float _265 = _263 + 1.0;
                                                            float _267 = -_165;
                                                            float _269 = _267 + _265;
                                                            float _271 = _159 * _41;
                                                            float _273 = fma(_269, _43, _163);
                                                            _231 = _273;
                                                            _233 = _271;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203) || _199)
                            {
                                if ((!_203) || _199)
                                {
                                    if ((!_207) || _199)
                                    {
                                        if ((!_211) || _199)
                                        {
                                            if ((!_215) || _199)
                                            {
                                                if ((!_219) || _199)
                                                {
                                                    if ((!_223) || _199)
                                                    {
                                                        if ((!_225) || _199)
                                                        {
                                                            _199 = false;
                                                            float _275 = -_163;
                                                            float _277 = _275 + 1.0;
                                                            float _279 = -_161;
                                                            float _281 = _279 + 1.0;
                                                            float _283 = -_165;
                                                            float _285 = _283 + _277;
                                                            float _287 = fma(_161, _41, _281);
                                                            float _289 = fma(_285, _43, _163);
                                                            _231 = _289;
                                                            _233 = _287;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _225) || _223) || _219) || _215) || _211) || _207) || _203)
                                {
                                    if ((!_207) || _203)
                                    {
                                        if ((!_211) || _203)
                                        {
                                            if ((!_215) || _203)
                                            {
                                                if ((!_219) || _203)
                                                {
                                                    if ((!_223) || _203)
                                                    {
                                                        if ((!_225) || _203)
                                                        {
                                                            _203 = false;
                                                            float _291 = -_159;
                                                            float _293 = _291 + 1.0;
                                                            float _295 = -_161;
                                                            float _297 = _295 + _293;
                                                            float _299 = _163 * _43;
                                                            float _301 = fma(_297, _41, _159);
                                                            _231 = _299;
                                                            _233 = _301;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _225) || _223) || _219) || _215) || _211) || _207)
                                    {
                                        if ((!_211) || _207)
                                        {
                                            if ((!_215) || _207)
                                            {
                                                if ((!_219) || _207)
                                                {
                                                    if ((!_223) || _207)
                                                    {
                                                        if ((!_225) || _207)
                                                        {
                                                            _207 = false;
                                                            float _303 = -_159;
                                                            float _305 = _303 + 1.0;
                                                            float _307 = -_165;
                                                            float _309 = _307 + 1.0;
                                                            float _311 = -_161;
                                                            float _313 = _311 + _305;
                                                            float _315 = fma(_165, _43, _309);
                                                            float _317 = fma(_313, _41, _159);
                                                            _231 = _315;
                                                            _233 = _317;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _225) || _223) || _219) || _215) || _211)
                                        {
                                            if ((!_215) || _211)
                                            {
                                                if ((!_219) || _211)
                                                {
                                                    if ((!_223) || _211)
                                                    {
                                                        if ((!_225) || _211)
                                                        {
                                                            _211 = false;
                                                            float _319 = -_161;
                                                            float _321 = _319 + 1.0;
                                                            float _323 = _163 * _43;
                                                            float _325 = _321 * _41;
                                                            _231 = _323;
                                                            _233 = _325;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _225) || _223) || _219) || _215)
                                            {
                                                if ((!_219) || _215)
                                                {
                                                    if ((!_223) || _215)
                                                    {
                                                        if ((!_225) || _215)
                                                        {
                                                            _215 = false;
                                                            float _327 = -_161;
                                                            float _329 = _327 + 1.0;
                                                            float _331 = -_165;
                                                            float _333 = _331 + 1.0;
                                                            float _335 = fma(_161, _41, _329);
                                                            float _337 = _333 * _43;
                                                            _231 = _337;
                                                            _233 = _335;
                                                        }
                                                    }
                                                }
                                                if (((false || _225) || _223) || _219)
                                                {
                                                    if ((!_223) || _219)
                                                    {
                                                        if ((!_225) || _219)
                                                        {
                                                            _219 = false;
                                                            float _339 = -_163;
                                                            float _341 = _339 + 1.0;
                                                            float _343 = _159 * _41;
                                                            float _345 = fma(_341, _43, _163);
                                                            _231 = _345;
                                                            _233 = _343;
                                                        }
                                                    }
                                                    if ((false || _225) || _223)
                                                    {
                                                        if ((!_225) || _223)
                                                        {
                                                            _223 = false;
                                                            float _347 = -_159;
                                                            float _349 = _347 + 1.0;
                                                            float _351 = -_165;
                                                            float _353 = _351 + 1.0;
                                                            float _355 = fma(_349, _41, _159);
                                                            float _357 = fma(_165, _43, _353);
                                                            _231 = _357;
                                                            _233 = _355;
                                                        }
                                                        if (false || _225)
                                                        {
                                                            _225 = false;
                                                            bool _359 = _139 != 12;
                                                            if (!_359)
                                                            {
                                                                float _361 = -_163;
                                                                float _363 = _361 + 1.0;
                                                                _171 = _363;
                                                            }
                                                            float _365 = _171;
                                                            if (!_359)
                                                            {
                                                                float _367 = -_161;
                                                                float _369 = _367 + 1.0;
                                                                _173 = _369;
                                                            }
                                                            float _371 = _173;
                                                            if (_359)
                                                            {
                                                                _175 = 0.0;
                                                                _177 = 0.0;
                                                            }
                                                            float _373 = _175;
                                                            float _375 = _177;
                                                            float _377 = _375;
                                                            _231 = _373;
                                                            if (!_359)
                                                            {
                                                                float _379 = -_165;
                                                                float _381 = _379 + _365;
                                                                _179 = _381;
                                                            }
                                                            float _383 = _179;
                                                            if (!_359)
                                                            {
                                                                float _385 = _41 * _371;
                                                                _377 = _385;
                                                            }
                                                            float _387 = _377;
                                                            _233 = _387;
                                                            if (!_359)
                                                            {
                                                                float _389 = _43 * _383;
                                                                _231 = _389;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _391 = _231;
            float _393 = _233;
            float _395 = -_391;
            float _397 = _395 + 1.0;
            float _399 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _401 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _403 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _405 = _391 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _407 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _409 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _411 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _413 = _391 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _415 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].x, _399);
            float _417 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].y, _401);
            float _419 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].z, _403);
            float _421 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[30].w, _405);
            float _423 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].x, _407);
            float _425 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].y, _409);
            float _427 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].z, _411);
            float _429 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[29].w, _413);
            float _431 = _415 * _393;
            float _433 = -_393;
            float _435 = _433 + 1.0;
            float _437 = _417 * _393;
            float _439 = _419 * _393;
            float _441 = _421 * _393;
            float _443 = fma(_435, _423, _431);
            float _445 = fma(_435, _425, _437);
            float _447 = fma(_435, _427, _439);
            float _449 = fma(_435, _429, _441);
            _118 = _443;
            _122 = _445;
            _126 = _447;
            _130 = _449;
            _451 = true;
        }
        else
        {
            bool _453 = _139 != 13;
            if (!_453)
            {
                float _455 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _457 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _459 = _455 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _461 = -_459;
                float _463 = _461 + 1.0;
                float _465 = _457 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _467 = -_455;
                float _469 = fma(_467, (*spvDescriptorSet0.vp_c3)._m0[26].w, _463);
                float _471 = -_465;
                float _473 = _471 + 1.0;
                float _475 = fma(_469, _43, _459);
                float _477 = -_457;
                float _479 = fma(_477, (*spvDescriptorSet0.vp_c3)._m0[26].y, _473);
                float _481 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _483 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _485 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _487 = fma(_479, _41, _465);
                float _489 = -_475;
                float _491 = _489 + 1.0;
                float _493 = _475 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _495 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _497 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _499 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _501 = _475 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _503 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].x, _481);
                float _505 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].y, _483);
                float _507 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].z, _485);
                float _509 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[30].w, _493);
                float _511 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].x, _495);
                float _513 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].y, _497);
                float _515 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].z, _499);
                float _517 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[29].w, _501);
                float _519 = _487 * _503;
                float _521 = -_487;
                float _523 = _521 + 1.0;
                float _525 = _487 * _505;
                float _527 = _487 * _507;
                float _529 = _487 * _509;
                float _531 = fma(_523, _511, _519);
                float _533 = fma(_523, _513, _525);
                float _535 = fma(_523, _515, _527);
                float _537 = fma(_523, _517, _529);
                _118 = _531;
                _122 = _533;
                _126 = _535;
                _130 = _537;
                _451 = true;
            }
            else
            {
                float _539 = trunc(_43);
                int _541 = int(_539);
                float _543 = trunc(_41);
                int _545 = int(_543);
                int _547 = _541 << 1;
                int _549 = _547 + _545;
                int _551 = _549 << 4;
                int _553 = _551 + 464;
                uint _555 = uint(int(uint(_553) >> uint(2)));
                uint _557 = uint(int(uint(int(_555)) >> uint(2)));
                int _559 = int(_555) & 3;
                float _561 = (*spvDescriptorSet0.vp_c3)._m0[int(_557)][_559];
                int _563 = int(_555) + 1;
                uint _565 = uint(int(uint(_563) >> uint(2)));
                int _567 = _563 & 3;
                float _569 = (*spvDescriptorSet0.vp_c3)._m0[int(_565)][_567];
                int _571 = _553 + 8;
                uint _573 = uint(int(uint(_571) >> uint(2)));
                uint _575 = uint(int(uint(int(_573)) >> uint(2)));
                int _577 = int(_573) & 3;
                float _579 = (*spvDescriptorSet0.vp_c3)._m0[int(_575)][_577];
                int _581 = int(_573) + 1;
                uint _583 = uint(int(uint(_581) >> uint(2)));
                int _585 = _581 & 3;
                float _587 = (*spvDescriptorSet0.vp_c3)._m0[int(_583)][_585];
                _118 = _561;
                _122 = _569;
                _126 = _579;
                _130 = _587;
            }
        }
    }
    _451 = false;
    float _589 = _118;
    float _591 = _122;
    float _593 = _126;
    float _595 = _130;
    float _597 = _589 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _599 = _591 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _601 = _593 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _603 = _595 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_27.x = _597;
    out.m_27.y = _599;
    out.m_27.z = _601;
    out.m_27.w = _603;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

