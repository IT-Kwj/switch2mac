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
    float4 m_29 [[user(locn0)]];
    float4 m_27 [[user(locn4)]];
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _453 = false;
    bool _227 = false;
    bool _225 = false;
    bool _221 = false;
    bool _217 = false;
    bool _213 = false;
    bool _209 = false;
    bool _205 = false;
    bool _201 = false;
    bool _197 = false;
    bool _193 = false;
    bool _189 = false;
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_24.x;
    float _45 = in.m_24.y;
    float _47 = -_45;
    float _49 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _51 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _53 = _49 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _59 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _53);
    float _61 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].x, _55);
    float _63 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _57);
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _71 = _65 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _73 = _65 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _65 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _77 = _65 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].x, _71);
    float _81 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].z, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].z, _85);
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _95;
    out.gl_Position.y = _97;
    out.gl_Position.z = _99;
    out.gl_Position.w = _101;
    int _104 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _108 = _104 != 0;
    float _110 = _89;
    float _112 = _67;
    float _114 = _87;
    float _116 = _69;
    if (_108)
    {
        _110 = 255.0;
    }
    float _118 = _110;
    float _120 = _118;
    if (_108)
    {
        _112 = 255.0;
    }
    float _122 = _112;
    float _124 = _122;
    if (_108)
    {
        _114 = 255.0;
    }
    float _126 = _114;
    float _128 = _126;
    if (_108)
    {
        _116 = 255.0;
    }
    float _130 = _116;
    float _132 = _130;
    if (!_108)
    {
        int _134 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _136 = _134 != 0;
        uint _139 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _141 = int(_139) & 15;
        bool _143 = !_136;
        if (!_143)
        {
            uint _145 = min(uint(_141), 13u);
            float _147 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _149 = int(_145) << 2;
            uint _151 = uint(int(uint(_149) >> uint(2)));
            uint _153 = uint(int(uint(int(_151)) >> uint(2)));
            int _155 = int(_151) & 3;
            float _157 = (*spvDescriptorSet0.vp_c1)._m0[int(_153)][_155];
            float _159 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _161 = _147 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _163 = _147 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _165 = _159 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _167 = _159 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _169 = as_type<int>(_157) >> 31;
            bool _171 = as_type<int>(_157) == 848;
            float _173 = _161;
            float _175 = _163;
            float _177 = _157;
            float _179 = as_type<float>(_169);
            float _181 = _167;
            if (!_171)
            {
                bool _183 = as_type<int>(_157) == 896;
                _185 = _183;
                if (!_185)
                {
                    bool _187 = as_type<int>(_157) == 960;
                    _189 = _187;
                    if (!_189)
                    {
                        bool _191 = as_type<int>(_157) == 1024;
                        _193 = _191;
                        if (!_193)
                        {
                            bool _195 = as_type<int>(_157) == 1104;
                            _197 = _195;
                            if (!_197)
                            {
                                bool _199 = as_type<int>(_157) == 1184;
                                _201 = _199;
                                if (!_201)
                                {
                                    bool _203 = as_type<int>(_157) == 1280;
                                    _205 = _203;
                                    if (!_205)
                                    {
                                        bool _207 = as_type<int>(_157) == 1360;
                                        _209 = _207;
                                        if (!_209)
                                        {
                                            bool _211 = as_type<int>(_157) == 1456;
                                            _213 = _211;
                                            if (!_213)
                                            {
                                                bool _215 = as_type<int>(_157) == 1520;
                                                _217 = _215;
                                                if (!_217)
                                                {
                                                    bool _219 = as_type<int>(_157) == 1600;
                                                    _221 = _219;
                                                    if (!_221)
                                                    {
                                                        bool _223 = as_type<int>(_157) == 1664;
                                                        _225 = _223;
                                                        if (!_225)
                                                        {
                                                            _227 = true;
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
            float _233;
            float _235;
            if (!_185)
            {
                if (!_189)
                {
                    if (!_193)
                    {
                        if (!_197)
                        {
                            if (!_201)
                            {
                                if (!_205)
                                {
                                    if (!_209)
                                    {
                                        if (!_213)
                                        {
                                            if (!_217)
                                            {
                                                if (!_221)
                                                {
                                                    if (!_225)
                                                    {
                                                        if (!_227)
                                                        {
                                                            float _229 = _161 * _43;
                                                            float _231 = _165 * _45;
                                                            _233 = _231;
                                                            _235 = _229;
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
            if ((((((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197) || _193) || _189) || _185)
            {
                if ((!_189) || _185)
                {
                    if ((!_193) || _185)
                    {
                        if ((!_197) || _185)
                        {
                            if ((!_201) || _185)
                            {
                                if ((!_205) || _185)
                                {
                                    if ((!_209) || _185)
                                    {
                                        if ((!_213) || _185)
                                        {
                                            if ((!_217) || _185)
                                            {
                                                if ((!_221) || _185)
                                                {
                                                    if ((!_225) || _185)
                                                    {
                                                        if ((!_227) || _185)
                                                        {
                                                            _185 = false;
                                                            float _237 = -_163;
                                                            float _239 = _237 + 1.0;
                                                            float _241 = _165 * _45;
                                                            float _243 = fma(_163, _43, _239);
                                                            _233 = _241;
                                                            _235 = _243;
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
                if (((((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197) || _193) || _189)
                {
                    if ((!_193) || _189)
                    {
                        if ((!_197) || _189)
                        {
                            if ((!_201) || _189)
                            {
                                if ((!_205) || _189)
                                {
                                    if ((!_209) || _189)
                                    {
                                        if ((!_213) || _189)
                                        {
                                            if ((!_217) || _189)
                                            {
                                                if ((!_221) || _189)
                                                {
                                                    if ((!_225) || _189)
                                                    {
                                                        if ((!_227) || _189)
                                                        {
                                                            _189 = false;
                                                            float _245 = -_167;
                                                            float _247 = _245 + 1.0;
                                                            float _249 = _161 * _43;
                                                            float _251 = fma(_167, _45, _247);
                                                            _233 = _251;
                                                            _235 = _249;
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
                    if ((((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197) || _193)
                    {
                        if ((!_197) || _193)
                        {
                            if ((!_201) || _193)
                            {
                                if ((!_205) || _193)
                                {
                                    if ((!_209) || _193)
                                    {
                                        if ((!_213) || _193)
                                        {
                                            if ((!_217) || _193)
                                            {
                                                if ((!_221) || _193)
                                                {
                                                    if ((!_225) || _193)
                                                    {
                                                        if ((!_227) || _193)
                                                        {
                                                            _193 = false;
                                                            float _253 = -_163;
                                                            float _255 = _253 + 1.0;
                                                            float _257 = -_167;
                                                            float _259 = _257 + 1.0;
                                                            float _261 = fma(_163, _43, _255);
                                                            float _263 = fma(_167, _45, _259);
                                                            _233 = _263;
                                                            _235 = _261;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197)
                        {
                            if ((!_201) || _197)
                            {
                                if ((!_205) || _197)
                                {
                                    if ((!_209) || _197)
                                    {
                                        if ((!_213) || _197)
                                        {
                                            if ((!_217) || _197)
                                            {
                                                if ((!_221) || _197)
                                                {
                                                    if ((!_225) || _197)
                                                    {
                                                        if ((!_227) || _197)
                                                        {
                                                            _197 = false;
                                                            float _265 = -_165;
                                                            float _267 = _265 + 1.0;
                                                            float _269 = -_167;
                                                            float _271 = _269 + _267;
                                                            float _273 = _161 * _43;
                                                            float _275 = fma(_271, _45, _165);
                                                            _233 = _275;
                                                            _235 = _273;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201)
                            {
                                if ((!_205) || _201)
                                {
                                    if ((!_209) || _201)
                                    {
                                        if ((!_213) || _201)
                                        {
                                            if ((!_217) || _201)
                                            {
                                                if ((!_221) || _201)
                                                {
                                                    if ((!_225) || _201)
                                                    {
                                                        if ((!_227) || _201)
                                                        {
                                                            _201 = false;
                                                            float _277 = -_165;
                                                            float _279 = _277 + 1.0;
                                                            float _281 = -_163;
                                                            float _283 = _281 + 1.0;
                                                            float _285 = -_167;
                                                            float _287 = _285 + _279;
                                                            float _289 = fma(_163, _43, _283);
                                                            float _291 = fma(_287, _45, _165);
                                                            _233 = _291;
                                                            _235 = _289;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205)
                                {
                                    if ((!_209) || _205)
                                    {
                                        if ((!_213) || _205)
                                        {
                                            if ((!_217) || _205)
                                            {
                                                if ((!_221) || _205)
                                                {
                                                    if ((!_225) || _205)
                                                    {
                                                        if ((!_227) || _205)
                                                        {
                                                            _205 = false;
                                                            float _293 = -_161;
                                                            float _295 = _293 + 1.0;
                                                            float _297 = -_163;
                                                            float _299 = _297 + _295;
                                                            float _301 = _165 * _45;
                                                            float _303 = fma(_299, _43, _161);
                                                            _233 = _301;
                                                            _235 = _303;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _227) || _225) || _221) || _217) || _213) || _209)
                                    {
                                        if ((!_213) || _209)
                                        {
                                            if ((!_217) || _209)
                                            {
                                                if ((!_221) || _209)
                                                {
                                                    if ((!_225) || _209)
                                                    {
                                                        if ((!_227) || _209)
                                                        {
                                                            _209 = false;
                                                            float _305 = -_161;
                                                            float _307 = _305 + 1.0;
                                                            float _309 = -_167;
                                                            float _311 = _309 + 1.0;
                                                            float _313 = -_163;
                                                            float _315 = _313 + _307;
                                                            float _317 = fma(_167, _45, _311);
                                                            float _319 = fma(_315, _43, _161);
                                                            _233 = _317;
                                                            _235 = _319;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _227) || _225) || _221) || _217) || _213)
                                        {
                                            if ((!_217) || _213)
                                            {
                                                if ((!_221) || _213)
                                                {
                                                    if ((!_225) || _213)
                                                    {
                                                        if ((!_227) || _213)
                                                        {
                                                            _213 = false;
                                                            float _321 = -_163;
                                                            float _323 = _321 + 1.0;
                                                            float _325 = _165 * _45;
                                                            float _327 = _323 * _43;
                                                            _233 = _325;
                                                            _235 = _327;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _227) || _225) || _221) || _217)
                                            {
                                                if ((!_221) || _217)
                                                {
                                                    if ((!_225) || _217)
                                                    {
                                                        if ((!_227) || _217)
                                                        {
                                                            _217 = false;
                                                            float _329 = -_163;
                                                            float _331 = _329 + 1.0;
                                                            float _333 = -_167;
                                                            float _335 = _333 + 1.0;
                                                            float _337 = fma(_163, _43, _331);
                                                            float _339 = _335 * _45;
                                                            _233 = _339;
                                                            _235 = _337;
                                                        }
                                                    }
                                                }
                                                if (((false || _227) || _225) || _221)
                                                {
                                                    if ((!_225) || _221)
                                                    {
                                                        if ((!_227) || _221)
                                                        {
                                                            _221 = false;
                                                            float _341 = -_165;
                                                            float _343 = _341 + 1.0;
                                                            float _345 = _161 * _43;
                                                            float _347 = fma(_343, _45, _165);
                                                            _233 = _347;
                                                            _235 = _345;
                                                        }
                                                    }
                                                    if ((false || _227) || _225)
                                                    {
                                                        if ((!_227) || _225)
                                                        {
                                                            _225 = false;
                                                            float _349 = -_161;
                                                            float _351 = _349 + 1.0;
                                                            float _353 = -_167;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = fma(_351, _43, _161);
                                                            float _359 = fma(_167, _45, _355);
                                                            _233 = _359;
                                                            _235 = _357;
                                                        }
                                                        if (false || _227)
                                                        {
                                                            _227 = false;
                                                            bool _361 = _141 != 12;
                                                            if (!_361)
                                                            {
                                                                float _363 = -_165;
                                                                float _365 = _363 + 1.0;
                                                                _173 = _365;
                                                            }
                                                            float _367 = _173;
                                                            if (!_361)
                                                            {
                                                                float _369 = -_163;
                                                                float _371 = _369 + 1.0;
                                                                _175 = _371;
                                                            }
                                                            float _373 = _175;
                                                            if (_361)
                                                            {
                                                                _177 = 0.0;
                                                                _179 = 0.0;
                                                            }
                                                            float _375 = _177;
                                                            float _377 = _179;
                                                            float _379 = _377;
                                                            _233 = _375;
                                                            if (!_361)
                                                            {
                                                                float _381 = -_167;
                                                                float _383 = _381 + _367;
                                                                _181 = _383;
                                                            }
                                                            float _385 = _181;
                                                            if (!_361)
                                                            {
                                                                float _387 = _43 * _373;
                                                                _379 = _387;
                                                            }
                                                            float _389 = _379;
                                                            _235 = _389;
                                                            if (!_361)
                                                            {
                                                                float _391 = _45 * _385;
                                                                _233 = _391;
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
            float _393 = _233;
            float _395 = _235;
            float _397 = -_393;
            float _399 = _397 + 1.0;
            float _401 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _403 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _405 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _407 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _409 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _411 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _413 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _415 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _417 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].x, _401);
            float _419 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].x, _403);
            float _421 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].y, _405);
            float _423 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].y, _407);
            float _425 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].z, _409);
            float _427 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].z, _411);
            float _429 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].w, _413);
            float _431 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].w, _415);
            float _433 = -_395;
            float _435 = _433 + 1.0;
            float _437 = _417 * _395;
            float _439 = _421 * _395;
            float _441 = _425 * _395;
            float _443 = _431 * _395;
            float _445 = fma(_435, _419, _437);
            float _447 = fma(_435, _423, _439);
            float _449 = fma(_435, _427, _441);
            float _451 = fma(_435, _429, _443);
            _120 = _445;
            _124 = _447;
            _128 = _449;
            _132 = _451;
            _453 = true;
        }
        else
        {
            float _455 = trunc(_43);
            int _457 = int(_455);
            bool _459 = _141 != 13;
            float _461 = trunc(_45);
            int _463 = int(_461);
            int _465 = _463 << 1;
            int _467 = _465 + _457;
            if (!_459)
            {
                float _469 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _471 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _473 = _469 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _475 = -_473;
                float _477 = _475 + 1.0;
                float _479 = _471 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _481 = -_469;
                float _483 = fma(_481, (*spvDescriptorSet0.vp_c3)._m0[26].w, _477);
                float _485 = -_479;
                float _487 = _485 + 1.0;
                float _489 = fma(_483, _45, _473);
                float _491 = -_471;
                float _493 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[26].y, _487);
                float _495 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _497 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _499 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _501 = fma(_493, _43, _479);
                float _503 = -_489;
                float _505 = _503 + 1.0;
                float _507 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _509 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _511 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _513 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _515 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _517 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].x, _495);
                float _519 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].x, _497);
                float _521 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].y, _499);
                float _523 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].y, _507);
                float _525 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].z, _509);
                float _527 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].z, _511);
                float _529 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].w, _513);
                float _531 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].w, _515);
                float _533 = -_501;
                float _535 = _533 + 1.0;
                float _537 = _501 * _517;
                float _539 = _501 * _521;
                float _541 = _501 * _525;
                float _543 = _501 * _531;
                float _545 = fma(_535, _519, _537);
                float _547 = fma(_535, _523, _539);
                float _549 = fma(_535, _527, _541);
                float _551 = fma(_535, _529, _543);
                _120 = _545;
                _124 = _547;
                _128 = _549;
                _132 = _551;
                _453 = true;
            }
            else
            {
                int _553 = _467 << 4;
                int _555 = _553 + 464;
                uint _557 = uint(int(uint(_555) >> uint(2)));
                uint _559 = uint(int(uint(int(_557)) >> uint(2)));
                int _561 = int(_557) & 3;
                float _563 = (*spvDescriptorSet0.vp_c3)._m0[int(_559)][_561];
                int _565 = int(_557) + 1;
                uint _567 = uint(int(uint(_565) >> uint(2)));
                int _569 = _565 & 3;
                float _571 = (*spvDescriptorSet0.vp_c3)._m0[int(_567)][_569];
                int _573 = _555 + 8;
                uint _575 = uint(int(uint(_573) >> uint(2)));
                uint _577 = uint(int(uint(int(_575)) >> uint(2)));
                int _579 = int(_575) & 3;
                float _581 = (*spvDescriptorSet0.vp_c3)._m0[int(_577)][_579];
                int _583 = int(_575) + 1;
                uint _585 = uint(int(uint(_583) >> uint(2)));
                int _587 = _583 & 3;
                float _589 = (*spvDescriptorSet0.vp_c3)._m0[int(_585)][_587];
                _120 = _563;
                _124 = _571;
                _128 = _581;
                _132 = _589;
            }
        }
    }
    _453 = false;
    float _591 = _120;
    float _593 = _124;
    float _595 = _128;
    float _597 = _132;
    float _599 = _591 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _601 = _593 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _603 = _595 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _605 = _597 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_27.x = _43;
    out.m_27.y = _45;
    out.m_29.x = _599;
    out.m_29.y = _601;
    out.m_29.z = _603;
    out.m_29.w = _605;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _453 = false;
    bool _227 = false;
    bool _225 = false;
    bool _221 = false;
    bool _217 = false;
    bool _213 = false;
    bool _209 = false;
    bool _205 = false;
    bool _201 = false;
    bool _197 = false;
    bool _193 = false;
    bool _189 = false;
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_24.x;
    float _45 = in.m_24.y;
    float _47 = -_45;
    float _49 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _51 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _53 = _49 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _59 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _53);
    float _61 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].x, _55);
    float _63 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _57);
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _71 = _65 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _73 = _65 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _65 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _77 = _65 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].x, _71);
    float _81 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].z, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].z, _85);
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _95;
    out.gl_Position.y = _97;
    out.gl_Position.z = _99;
    out.gl_Position.w = _101;
    int _104 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _108 = _104 != 0;
    float _110 = _89;
    float _112 = _67;
    float _114 = _87;
    float _116 = _69;
    if (_108)
    {
        _110 = 255.0;
    }
    float _118 = _110;
    float _120 = _118;
    if (_108)
    {
        _112 = 255.0;
    }
    float _122 = _112;
    float _124 = _122;
    if (_108)
    {
        _114 = 255.0;
    }
    float _126 = _114;
    float _128 = _126;
    if (_108)
    {
        _116 = 255.0;
    }
    float _130 = _116;
    float _132 = _130;
    if (!_108)
    {
        int _134 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _136 = _134 != 0;
        uint _139 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _141 = int(_139) & 15;
        bool _143 = !_136;
        if (!_143)
        {
            uint _145 = min(uint(_141), 13u);
            float _147 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _149 = int(_145) << 2;
            uint _151 = uint(int(uint(_149) >> uint(2)));
            uint _153 = uint(int(uint(int(_151)) >> uint(2)));
            int _155 = int(_151) & 3;
            float _157 = (*spvDescriptorSet0.vp_c1)._m0[int(_153)][_155];
            float _159 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _161 = _147 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _163 = _147 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _165 = _159 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _167 = _159 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _169 = as_type<int>(_157) >> 31;
            bool _171 = as_type<int>(_157) == 848;
            float _173 = _161;
            float _175 = _163;
            float _177 = _157;
            float _179 = as_type<float>(_169);
            float _181 = _167;
            if (!_171)
            {
                bool _183 = as_type<int>(_157) == 896;
                _185 = _183;
                if (!_185)
                {
                    bool _187 = as_type<int>(_157) == 960;
                    _189 = _187;
                    if (!_189)
                    {
                        bool _191 = as_type<int>(_157) == 1024;
                        _193 = _191;
                        if (!_193)
                        {
                            bool _195 = as_type<int>(_157) == 1104;
                            _197 = _195;
                            if (!_197)
                            {
                                bool _199 = as_type<int>(_157) == 1184;
                                _201 = _199;
                                if (!_201)
                                {
                                    bool _203 = as_type<int>(_157) == 1280;
                                    _205 = _203;
                                    if (!_205)
                                    {
                                        bool _207 = as_type<int>(_157) == 1360;
                                        _209 = _207;
                                        if (!_209)
                                        {
                                            bool _211 = as_type<int>(_157) == 1456;
                                            _213 = _211;
                                            if (!_213)
                                            {
                                                bool _215 = as_type<int>(_157) == 1520;
                                                _217 = _215;
                                                if (!_217)
                                                {
                                                    bool _219 = as_type<int>(_157) == 1600;
                                                    _221 = _219;
                                                    if (!_221)
                                                    {
                                                        bool _223 = as_type<int>(_157) == 1664;
                                                        _225 = _223;
                                                        if (!_225)
                                                        {
                                                            _227 = true;
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
            float _233;
            float _235;
            if (!_185)
            {
                if (!_189)
                {
                    if (!_193)
                    {
                        if (!_197)
                        {
                            if (!_201)
                            {
                                if (!_205)
                                {
                                    if (!_209)
                                    {
                                        if (!_213)
                                        {
                                            if (!_217)
                                            {
                                                if (!_221)
                                                {
                                                    if (!_225)
                                                    {
                                                        if (!_227)
                                                        {
                                                            float _229 = _161 * _43;
                                                            float _231 = _165 * _45;
                                                            _233 = _231;
                                                            _235 = _229;
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
            if ((((((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197) || _193) || _189) || _185)
            {
                if ((!_189) || _185)
                {
                    if ((!_193) || _185)
                    {
                        if ((!_197) || _185)
                        {
                            if ((!_201) || _185)
                            {
                                if ((!_205) || _185)
                                {
                                    if ((!_209) || _185)
                                    {
                                        if ((!_213) || _185)
                                        {
                                            if ((!_217) || _185)
                                            {
                                                if ((!_221) || _185)
                                                {
                                                    if ((!_225) || _185)
                                                    {
                                                        if ((!_227) || _185)
                                                        {
                                                            _185 = false;
                                                            float _237 = -_163;
                                                            float _239 = _237 + 1.0;
                                                            float _241 = _165 * _45;
                                                            float _243 = fma(_163, _43, _239);
                                                            _233 = _241;
                                                            _235 = _243;
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
                if (((((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197) || _193) || _189)
                {
                    if ((!_193) || _189)
                    {
                        if ((!_197) || _189)
                        {
                            if ((!_201) || _189)
                            {
                                if ((!_205) || _189)
                                {
                                    if ((!_209) || _189)
                                    {
                                        if ((!_213) || _189)
                                        {
                                            if ((!_217) || _189)
                                            {
                                                if ((!_221) || _189)
                                                {
                                                    if ((!_225) || _189)
                                                    {
                                                        if ((!_227) || _189)
                                                        {
                                                            _189 = false;
                                                            float _245 = -_167;
                                                            float _247 = _245 + 1.0;
                                                            float _249 = _161 * _43;
                                                            float _251 = fma(_167, _45, _247);
                                                            _233 = _251;
                                                            _235 = _249;
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
                    if ((((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197) || _193)
                    {
                        if ((!_197) || _193)
                        {
                            if ((!_201) || _193)
                            {
                                if ((!_205) || _193)
                                {
                                    if ((!_209) || _193)
                                    {
                                        if ((!_213) || _193)
                                        {
                                            if ((!_217) || _193)
                                            {
                                                if ((!_221) || _193)
                                                {
                                                    if ((!_225) || _193)
                                                    {
                                                        if ((!_227) || _193)
                                                        {
                                                            _193 = false;
                                                            float _253 = -_163;
                                                            float _255 = _253 + 1.0;
                                                            float _257 = -_167;
                                                            float _259 = _257 + 1.0;
                                                            float _261 = fma(_163, _43, _255);
                                                            float _263 = fma(_167, _45, _259);
                                                            _233 = _263;
                                                            _235 = _261;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197)
                        {
                            if ((!_201) || _197)
                            {
                                if ((!_205) || _197)
                                {
                                    if ((!_209) || _197)
                                    {
                                        if ((!_213) || _197)
                                        {
                                            if ((!_217) || _197)
                                            {
                                                if ((!_221) || _197)
                                                {
                                                    if ((!_225) || _197)
                                                    {
                                                        if ((!_227) || _197)
                                                        {
                                                            _197 = false;
                                                            float _265 = -_165;
                                                            float _267 = _265 + 1.0;
                                                            float _269 = -_167;
                                                            float _271 = _269 + _267;
                                                            float _273 = _161 * _43;
                                                            float _275 = fma(_271, _45, _165);
                                                            _233 = _275;
                                                            _235 = _273;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201)
                            {
                                if ((!_205) || _201)
                                {
                                    if ((!_209) || _201)
                                    {
                                        if ((!_213) || _201)
                                        {
                                            if ((!_217) || _201)
                                            {
                                                if ((!_221) || _201)
                                                {
                                                    if ((!_225) || _201)
                                                    {
                                                        if ((!_227) || _201)
                                                        {
                                                            _201 = false;
                                                            float _277 = -_165;
                                                            float _279 = _277 + 1.0;
                                                            float _281 = -_163;
                                                            float _283 = _281 + 1.0;
                                                            float _285 = -_167;
                                                            float _287 = _285 + _279;
                                                            float _289 = fma(_163, _43, _283);
                                                            float _291 = fma(_287, _45, _165);
                                                            _233 = _291;
                                                            _235 = _289;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205)
                                {
                                    if ((!_209) || _205)
                                    {
                                        if ((!_213) || _205)
                                        {
                                            if ((!_217) || _205)
                                            {
                                                if ((!_221) || _205)
                                                {
                                                    if ((!_225) || _205)
                                                    {
                                                        if ((!_227) || _205)
                                                        {
                                                            _205 = false;
                                                            float _293 = -_161;
                                                            float _295 = _293 + 1.0;
                                                            float _297 = -_163;
                                                            float _299 = _297 + _295;
                                                            float _301 = _165 * _45;
                                                            float _303 = fma(_299, _43, _161);
                                                            _233 = _301;
                                                            _235 = _303;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _227) || _225) || _221) || _217) || _213) || _209)
                                    {
                                        if ((!_213) || _209)
                                        {
                                            if ((!_217) || _209)
                                            {
                                                if ((!_221) || _209)
                                                {
                                                    if ((!_225) || _209)
                                                    {
                                                        if ((!_227) || _209)
                                                        {
                                                            _209 = false;
                                                            float _305 = -_161;
                                                            float _307 = _305 + 1.0;
                                                            float _309 = -_167;
                                                            float _311 = _309 + 1.0;
                                                            float _313 = -_163;
                                                            float _315 = _313 + _307;
                                                            float _317 = fma(_167, _45, _311);
                                                            float _319 = fma(_315, _43, _161);
                                                            _233 = _317;
                                                            _235 = _319;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _227) || _225) || _221) || _217) || _213)
                                        {
                                            if ((!_217) || _213)
                                            {
                                                if ((!_221) || _213)
                                                {
                                                    if ((!_225) || _213)
                                                    {
                                                        if ((!_227) || _213)
                                                        {
                                                            _213 = false;
                                                            float _321 = -_163;
                                                            float _323 = _321 + 1.0;
                                                            float _325 = _165 * _45;
                                                            float _327 = _323 * _43;
                                                            _233 = _325;
                                                            _235 = _327;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _227) || _225) || _221) || _217)
                                            {
                                                if ((!_221) || _217)
                                                {
                                                    if ((!_225) || _217)
                                                    {
                                                        if ((!_227) || _217)
                                                        {
                                                            _217 = false;
                                                            float _329 = -_163;
                                                            float _331 = _329 + 1.0;
                                                            float _333 = -_167;
                                                            float _335 = _333 + 1.0;
                                                            float _337 = fma(_163, _43, _331);
                                                            float _339 = _335 * _45;
                                                            _233 = _339;
                                                            _235 = _337;
                                                        }
                                                    }
                                                }
                                                if (((false || _227) || _225) || _221)
                                                {
                                                    if ((!_225) || _221)
                                                    {
                                                        if ((!_227) || _221)
                                                        {
                                                            _221 = false;
                                                            float _341 = -_165;
                                                            float _343 = _341 + 1.0;
                                                            float _345 = _161 * _43;
                                                            float _347 = fma(_343, _45, _165);
                                                            _233 = _347;
                                                            _235 = _345;
                                                        }
                                                    }
                                                    if ((false || _227) || _225)
                                                    {
                                                        if ((!_227) || _225)
                                                        {
                                                            _225 = false;
                                                            float _349 = -_161;
                                                            float _351 = _349 + 1.0;
                                                            float _353 = -_167;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = fma(_351, _43, _161);
                                                            float _359 = fma(_167, _45, _355);
                                                            _233 = _359;
                                                            _235 = _357;
                                                        }
                                                        if (false || _227)
                                                        {
                                                            _227 = false;
                                                            bool _361 = _141 != 12;
                                                            if (!_361)
                                                            {
                                                                float _363 = -_165;
                                                                float _365 = _363 + 1.0;
                                                                _173 = _365;
                                                            }
                                                            float _367 = _173;
                                                            if (!_361)
                                                            {
                                                                float _369 = -_163;
                                                                float _371 = _369 + 1.0;
                                                                _175 = _371;
                                                            }
                                                            float _373 = _175;
                                                            if (_361)
                                                            {
                                                                _177 = 0.0;
                                                                _179 = 0.0;
                                                            }
                                                            float _375 = _177;
                                                            float _377 = _179;
                                                            float _379 = _377;
                                                            _233 = _375;
                                                            if (!_361)
                                                            {
                                                                float _381 = -_167;
                                                                float _383 = _381 + _367;
                                                                _181 = _383;
                                                            }
                                                            float _385 = _181;
                                                            if (!_361)
                                                            {
                                                                float _387 = _43 * _373;
                                                                _379 = _387;
                                                            }
                                                            float _389 = _379;
                                                            _235 = _389;
                                                            if (!_361)
                                                            {
                                                                float _391 = _45 * _385;
                                                                _233 = _391;
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
            float _393 = _233;
            float _395 = _235;
            float _397 = -_393;
            float _399 = _397 + 1.0;
            float _401 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _403 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _405 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _407 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _409 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _411 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _413 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _415 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _417 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].x, _401);
            float _419 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].x, _403);
            float _421 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].y, _405);
            float _423 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].y, _407);
            float _425 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].z, _409);
            float _427 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].z, _411);
            float _429 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].w, _413);
            float _431 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].w, _415);
            float _433 = -_395;
            float _435 = _433 + 1.0;
            float _437 = _417 * _395;
            float _439 = _421 * _395;
            float _441 = _425 * _395;
            float _443 = _431 * _395;
            float _445 = fma(_435, _419, _437);
            float _447 = fma(_435, _423, _439);
            float _449 = fma(_435, _427, _441);
            float _451 = fma(_435, _429, _443);
            _120 = _445;
            _124 = _447;
            _128 = _449;
            _132 = _451;
            _453 = true;
        }
        else
        {
            float _455 = trunc(_43);
            int _457 = int(_455);
            bool _459 = _141 != 13;
            float _461 = trunc(_45);
            int _463 = int(_461);
            int _465 = _463 << 1;
            int _467 = _465 + _457;
            if (!_459)
            {
                float _469 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _471 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _473 = _469 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _475 = -_473;
                float _477 = _475 + 1.0;
                float _479 = _471 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _481 = -_469;
                float _483 = fma(_481, (*spvDescriptorSet0.vp_c3)._m0[26].w, _477);
                float _485 = -_479;
                float _487 = _485 + 1.0;
                float _489 = fma(_483, _45, _473);
                float _491 = -_471;
                float _493 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[26].y, _487);
                float _495 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _497 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _499 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _501 = fma(_493, _43, _479);
                float _503 = -_489;
                float _505 = _503 + 1.0;
                float _507 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _509 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _511 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _513 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _515 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _517 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].x, _495);
                float _519 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].x, _497);
                float _521 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].y, _499);
                float _523 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].y, _507);
                float _525 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].z, _509);
                float _527 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].z, _511);
                float _529 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].w, _513);
                float _531 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].w, _515);
                float _533 = -_501;
                float _535 = _533 + 1.0;
                float _537 = _501 * _517;
                float _539 = _501 * _521;
                float _541 = _501 * _525;
                float _543 = _501 * _531;
                float _545 = fma(_535, _519, _537);
                float _547 = fma(_535, _523, _539);
                float _549 = fma(_535, _527, _541);
                float _551 = fma(_535, _529, _543);
                _120 = _545;
                _124 = _547;
                _128 = _549;
                _132 = _551;
                _453 = true;
            }
            else
            {
                int _553 = _467 << 4;
                int _555 = _553 + 464;
                uint _557 = uint(int(uint(_555) >> uint(2)));
                uint _559 = uint(int(uint(int(_557)) >> uint(2)));
                int _561 = int(_557) & 3;
                float _563 = (*spvDescriptorSet0.vp_c3)._m0[int(_559)][_561];
                int _565 = int(_557) + 1;
                uint _567 = uint(int(uint(_565) >> uint(2)));
                int _569 = _565 & 3;
                float _571 = (*spvDescriptorSet0.vp_c3)._m0[int(_567)][_569];
                int _573 = _555 + 8;
                uint _575 = uint(int(uint(_573) >> uint(2)));
                uint _577 = uint(int(uint(int(_575)) >> uint(2)));
                int _579 = int(_575) & 3;
                float _581 = (*spvDescriptorSet0.vp_c3)._m0[int(_577)][_579];
                int _583 = int(_575) + 1;
                uint _585 = uint(int(uint(_583) >> uint(2)));
                int _587 = _583 & 3;
                float _589 = (*spvDescriptorSet0.vp_c3)._m0[int(_585)][_587];
                _120 = _563;
                _124 = _571;
                _128 = _581;
                _132 = _589;
            }
        }
    }
    _453 = false;
    float _591 = _120;
    float _593 = _124;
    float _595 = _128;
    float _597 = _132;
    float _599 = _591 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _601 = _593 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _603 = _595 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _605 = _597 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_27.x = _43;
    out.m_27.y = _45;
    out.m_29.x = _599;
    out.m_29.y = _601;
    out.m_29.z = _603;
    out.m_29.w = _605;
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _453 = false;
    bool _227 = false;
    bool _225 = false;
    bool _221 = false;
    bool _217 = false;
    bool _213 = false;
    bool _209 = false;
    bool _205 = false;
    bool _201 = false;
    bool _197 = false;
    bool _193 = false;
    bool _189 = false;
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_24.x;
    float _45 = in.m_24.y;
    float _47 = -_45;
    float _49 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _51 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _53 = _49 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _59 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _53);
    float _61 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].x, _55);
    float _63 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _57);
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _71 = _65 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _73 = _65 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _65 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _77 = _65 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].x, _71);
    float _81 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].z, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].z, _85);
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _95;
    out.gl_Position.y = _97;
    out.gl_Position.z = _99;
    out.gl_Position.w = _101;
    int _104 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _108 = _104 != 0;
    float _110 = _89;
    float _112 = _67;
    float _114 = _87;
    float _116 = _69;
    if (_108)
    {
        _110 = 255.0;
    }
    float _118 = _110;
    float _120 = _118;
    if (_108)
    {
        _112 = 255.0;
    }
    float _122 = _112;
    float _124 = _122;
    if (_108)
    {
        _114 = 255.0;
    }
    float _126 = _114;
    float _128 = _126;
    if (_108)
    {
        _116 = 255.0;
    }
    float _130 = _116;
    float _132 = _130;
    if (!_108)
    {
        int _134 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _136 = _134 != 0;
        uint _139 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _141 = int(_139) & 15;
        bool _143 = !_136;
        if (!_143)
        {
            uint _145 = min(uint(_141), 13u);
            float _147 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _149 = int(_145) << 2;
            uint _151 = uint(int(uint(_149) >> uint(2)));
            uint _153 = uint(int(uint(int(_151)) >> uint(2)));
            int _155 = int(_151) & 3;
            float _157 = (*spvDescriptorSet0.vp_c1)._m0[int(_153)][_155];
            float _159 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _161 = _147 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _163 = _147 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _165 = _159 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _167 = _159 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _169 = as_type<int>(_157) >> 31;
            bool _171 = as_type<int>(_157) == 848;
            float _173 = _161;
            float _175 = _163;
            float _177 = _157;
            float _179 = as_type<float>(_169);
            float _181 = _167;
            if (!_171)
            {
                bool _183 = as_type<int>(_157) == 896;
                _185 = _183;
                if (!_185)
                {
                    bool _187 = as_type<int>(_157) == 960;
                    _189 = _187;
                    if (!_189)
                    {
                        bool _191 = as_type<int>(_157) == 1024;
                        _193 = _191;
                        if (!_193)
                        {
                            bool _195 = as_type<int>(_157) == 1104;
                            _197 = _195;
                            if (!_197)
                            {
                                bool _199 = as_type<int>(_157) == 1184;
                                _201 = _199;
                                if (!_201)
                                {
                                    bool _203 = as_type<int>(_157) == 1280;
                                    _205 = _203;
                                    if (!_205)
                                    {
                                        bool _207 = as_type<int>(_157) == 1360;
                                        _209 = _207;
                                        if (!_209)
                                        {
                                            bool _211 = as_type<int>(_157) == 1456;
                                            _213 = _211;
                                            if (!_213)
                                            {
                                                bool _215 = as_type<int>(_157) == 1520;
                                                _217 = _215;
                                                if (!_217)
                                                {
                                                    bool _219 = as_type<int>(_157) == 1600;
                                                    _221 = _219;
                                                    if (!_221)
                                                    {
                                                        bool _223 = as_type<int>(_157) == 1664;
                                                        _225 = _223;
                                                        if (!_225)
                                                        {
                                                            _227 = true;
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
            float _233;
            float _235;
            if (!_185)
            {
                if (!_189)
                {
                    if (!_193)
                    {
                        if (!_197)
                        {
                            if (!_201)
                            {
                                if (!_205)
                                {
                                    if (!_209)
                                    {
                                        if (!_213)
                                        {
                                            if (!_217)
                                            {
                                                if (!_221)
                                                {
                                                    if (!_225)
                                                    {
                                                        if (!_227)
                                                        {
                                                            float _229 = _161 * _43;
                                                            float _231 = _165 * _45;
                                                            _233 = _231;
                                                            _235 = _229;
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
            if ((((((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197) || _193) || _189) || _185)
            {
                if ((!_189) || _185)
                {
                    if ((!_193) || _185)
                    {
                        if ((!_197) || _185)
                        {
                            if ((!_201) || _185)
                            {
                                if ((!_205) || _185)
                                {
                                    if ((!_209) || _185)
                                    {
                                        if ((!_213) || _185)
                                        {
                                            if ((!_217) || _185)
                                            {
                                                if ((!_221) || _185)
                                                {
                                                    if ((!_225) || _185)
                                                    {
                                                        if ((!_227) || _185)
                                                        {
                                                            _185 = false;
                                                            float _237 = -_163;
                                                            float _239 = _237 + 1.0;
                                                            float _241 = _165 * _45;
                                                            float _243 = fma(_163, _43, _239);
                                                            _233 = _241;
                                                            _235 = _243;
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
                if (((((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197) || _193) || _189)
                {
                    if ((!_193) || _189)
                    {
                        if ((!_197) || _189)
                        {
                            if ((!_201) || _189)
                            {
                                if ((!_205) || _189)
                                {
                                    if ((!_209) || _189)
                                    {
                                        if ((!_213) || _189)
                                        {
                                            if ((!_217) || _189)
                                            {
                                                if ((!_221) || _189)
                                                {
                                                    if ((!_225) || _189)
                                                    {
                                                        if ((!_227) || _189)
                                                        {
                                                            _189 = false;
                                                            float _245 = -_167;
                                                            float _247 = _245 + 1.0;
                                                            float _249 = _161 * _43;
                                                            float _251 = fma(_167, _45, _247);
                                                            _233 = _251;
                                                            _235 = _249;
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
                    if ((((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197) || _193)
                    {
                        if ((!_197) || _193)
                        {
                            if ((!_201) || _193)
                            {
                                if ((!_205) || _193)
                                {
                                    if ((!_209) || _193)
                                    {
                                        if ((!_213) || _193)
                                        {
                                            if ((!_217) || _193)
                                            {
                                                if ((!_221) || _193)
                                                {
                                                    if ((!_225) || _193)
                                                    {
                                                        if ((!_227) || _193)
                                                        {
                                                            _193 = false;
                                                            float _253 = -_163;
                                                            float _255 = _253 + 1.0;
                                                            float _257 = -_167;
                                                            float _259 = _257 + 1.0;
                                                            float _261 = fma(_163, _43, _255);
                                                            float _263 = fma(_167, _45, _259);
                                                            _233 = _263;
                                                            _235 = _261;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201) || _197)
                        {
                            if ((!_201) || _197)
                            {
                                if ((!_205) || _197)
                                {
                                    if ((!_209) || _197)
                                    {
                                        if ((!_213) || _197)
                                        {
                                            if ((!_217) || _197)
                                            {
                                                if ((!_221) || _197)
                                                {
                                                    if ((!_225) || _197)
                                                    {
                                                        if ((!_227) || _197)
                                                        {
                                                            _197 = false;
                                                            float _265 = -_165;
                                                            float _267 = _265 + 1.0;
                                                            float _269 = -_167;
                                                            float _271 = _269 + _267;
                                                            float _273 = _161 * _43;
                                                            float _275 = fma(_271, _45, _165);
                                                            _233 = _275;
                                                            _235 = _273;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205) || _201)
                            {
                                if ((!_205) || _201)
                                {
                                    if ((!_209) || _201)
                                    {
                                        if ((!_213) || _201)
                                        {
                                            if ((!_217) || _201)
                                            {
                                                if ((!_221) || _201)
                                                {
                                                    if ((!_225) || _201)
                                                    {
                                                        if ((!_227) || _201)
                                                        {
                                                            _201 = false;
                                                            float _277 = -_165;
                                                            float _279 = _277 + 1.0;
                                                            float _281 = -_163;
                                                            float _283 = _281 + 1.0;
                                                            float _285 = -_167;
                                                            float _287 = _285 + _279;
                                                            float _289 = fma(_163, _43, _283);
                                                            float _291 = fma(_287, _45, _165);
                                                            _233 = _291;
                                                            _235 = _289;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _227) || _225) || _221) || _217) || _213) || _209) || _205)
                                {
                                    if ((!_209) || _205)
                                    {
                                        if ((!_213) || _205)
                                        {
                                            if ((!_217) || _205)
                                            {
                                                if ((!_221) || _205)
                                                {
                                                    if ((!_225) || _205)
                                                    {
                                                        if ((!_227) || _205)
                                                        {
                                                            _205 = false;
                                                            float _293 = -_161;
                                                            float _295 = _293 + 1.0;
                                                            float _297 = -_163;
                                                            float _299 = _297 + _295;
                                                            float _301 = _165 * _45;
                                                            float _303 = fma(_299, _43, _161);
                                                            _233 = _301;
                                                            _235 = _303;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _227) || _225) || _221) || _217) || _213) || _209)
                                    {
                                        if ((!_213) || _209)
                                        {
                                            if ((!_217) || _209)
                                            {
                                                if ((!_221) || _209)
                                                {
                                                    if ((!_225) || _209)
                                                    {
                                                        if ((!_227) || _209)
                                                        {
                                                            _209 = false;
                                                            float _305 = -_161;
                                                            float _307 = _305 + 1.0;
                                                            float _309 = -_167;
                                                            float _311 = _309 + 1.0;
                                                            float _313 = -_163;
                                                            float _315 = _313 + _307;
                                                            float _317 = fma(_167, _45, _311);
                                                            float _319 = fma(_315, _43, _161);
                                                            _233 = _317;
                                                            _235 = _319;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _227) || _225) || _221) || _217) || _213)
                                        {
                                            if ((!_217) || _213)
                                            {
                                                if ((!_221) || _213)
                                                {
                                                    if ((!_225) || _213)
                                                    {
                                                        if ((!_227) || _213)
                                                        {
                                                            _213 = false;
                                                            float _321 = -_163;
                                                            float _323 = _321 + 1.0;
                                                            float _325 = _165 * _45;
                                                            float _327 = _323 * _43;
                                                            _233 = _325;
                                                            _235 = _327;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _227) || _225) || _221) || _217)
                                            {
                                                if ((!_221) || _217)
                                                {
                                                    if ((!_225) || _217)
                                                    {
                                                        if ((!_227) || _217)
                                                        {
                                                            _217 = false;
                                                            float _329 = -_163;
                                                            float _331 = _329 + 1.0;
                                                            float _333 = -_167;
                                                            float _335 = _333 + 1.0;
                                                            float _337 = fma(_163, _43, _331);
                                                            float _339 = _335 * _45;
                                                            _233 = _339;
                                                            _235 = _337;
                                                        }
                                                    }
                                                }
                                                if (((false || _227) || _225) || _221)
                                                {
                                                    if ((!_225) || _221)
                                                    {
                                                        if ((!_227) || _221)
                                                        {
                                                            _221 = false;
                                                            float _341 = -_165;
                                                            float _343 = _341 + 1.0;
                                                            float _345 = _161 * _43;
                                                            float _347 = fma(_343, _45, _165);
                                                            _233 = _347;
                                                            _235 = _345;
                                                        }
                                                    }
                                                    if ((false || _227) || _225)
                                                    {
                                                        if ((!_227) || _225)
                                                        {
                                                            _225 = false;
                                                            float _349 = -_161;
                                                            float _351 = _349 + 1.0;
                                                            float _353 = -_167;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = fma(_351, _43, _161);
                                                            float _359 = fma(_167, _45, _355);
                                                            _233 = _359;
                                                            _235 = _357;
                                                        }
                                                        if (false || _227)
                                                        {
                                                            _227 = false;
                                                            bool _361 = _141 != 12;
                                                            if (!_361)
                                                            {
                                                                float _363 = -_165;
                                                                float _365 = _363 + 1.0;
                                                                _173 = _365;
                                                            }
                                                            float _367 = _173;
                                                            if (!_361)
                                                            {
                                                                float _369 = -_163;
                                                                float _371 = _369 + 1.0;
                                                                _175 = _371;
                                                            }
                                                            float _373 = _175;
                                                            if (_361)
                                                            {
                                                                _177 = 0.0;
                                                                _179 = 0.0;
                                                            }
                                                            float _375 = _177;
                                                            float _377 = _179;
                                                            float _379 = _377;
                                                            _233 = _375;
                                                            if (!_361)
                                                            {
                                                                float _381 = -_167;
                                                                float _383 = _381 + _367;
                                                                _181 = _383;
                                                            }
                                                            float _385 = _181;
                                                            if (!_361)
                                                            {
                                                                float _387 = _43 * _373;
                                                                _379 = _387;
                                                            }
                                                            float _389 = _379;
                                                            _235 = _389;
                                                            if (!_361)
                                                            {
                                                                float _391 = _45 * _385;
                                                                _233 = _391;
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
            float _393 = _233;
            float _395 = _235;
            float _397 = -_393;
            float _399 = _397 + 1.0;
            float _401 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _403 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _405 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _407 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _409 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _411 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _413 = _393 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _415 = _393 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _417 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].x, _401);
            float _419 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].x, _403);
            float _421 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].y, _405);
            float _423 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].y, _407);
            float _425 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].z, _409);
            float _427 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].z, _411);
            float _429 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[29].w, _413);
            float _431 = fma(_399, (*spvDescriptorSet0.vp_c3)._m0[30].w, _415);
            float _433 = -_395;
            float _435 = _433 + 1.0;
            float _437 = _417 * _395;
            float _439 = _421 * _395;
            float _441 = _425 * _395;
            float _443 = _431 * _395;
            float _445 = fma(_435, _419, _437);
            float _447 = fma(_435, _423, _439);
            float _449 = fma(_435, _427, _441);
            float _451 = fma(_435, _429, _443);
            _120 = _445;
            _124 = _447;
            _128 = _449;
            _132 = _451;
            _453 = true;
        }
        else
        {
            float _455 = trunc(_43);
            int _457 = int(_455);
            bool _459 = _141 != 13;
            float _461 = trunc(_45);
            int _463 = int(_461);
            int _465 = _463 << 1;
            int _467 = _465 + _457;
            if (!_459)
            {
                float _469 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _471 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _473 = _469 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _475 = -_473;
                float _477 = _475 + 1.0;
                float _479 = _471 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _481 = -_469;
                float _483 = fma(_481, (*spvDescriptorSet0.vp_c3)._m0[26].w, _477);
                float _485 = -_479;
                float _487 = _485 + 1.0;
                float _489 = fma(_483, _45, _473);
                float _491 = -_471;
                float _493 = fma(_491, (*spvDescriptorSet0.vp_c3)._m0[26].y, _487);
                float _495 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _497 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _499 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _501 = fma(_493, _43, _479);
                float _503 = -_489;
                float _505 = _503 + 1.0;
                float _507 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _509 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _511 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _513 = _489 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _515 = _489 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _517 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].x, _495);
                float _519 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].x, _497);
                float _521 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].y, _499);
                float _523 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].y, _507);
                float _525 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].z, _509);
                float _527 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].z, _511);
                float _529 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[29].w, _513);
                float _531 = fma(_505, (*spvDescriptorSet0.vp_c3)._m0[30].w, _515);
                float _533 = -_501;
                float _535 = _533 + 1.0;
                float _537 = _501 * _517;
                float _539 = _501 * _521;
                float _541 = _501 * _525;
                float _543 = _501 * _531;
                float _545 = fma(_535, _519, _537);
                float _547 = fma(_535, _523, _539);
                float _549 = fma(_535, _527, _541);
                float _551 = fma(_535, _529, _543);
                _120 = _545;
                _124 = _547;
                _128 = _549;
                _132 = _551;
                _453 = true;
            }
            else
            {
                int _553 = _467 << 4;
                int _555 = _553 + 464;
                uint _557 = uint(int(uint(_555) >> uint(2)));
                uint _559 = uint(int(uint(int(_557)) >> uint(2)));
                int _561 = int(_557) & 3;
                float _563 = (*spvDescriptorSet0.vp_c3)._m0[int(_559)][_561];
                int _565 = int(_557) + 1;
                uint _567 = uint(int(uint(_565) >> uint(2)));
                int _569 = _565 & 3;
                float _571 = (*spvDescriptorSet0.vp_c3)._m0[int(_567)][_569];
                int _573 = _555 + 8;
                uint _575 = uint(int(uint(_573) >> uint(2)));
                uint _577 = uint(int(uint(int(_575)) >> uint(2)));
                int _579 = int(_575) & 3;
                float _581 = (*spvDescriptorSet0.vp_c3)._m0[int(_577)][_579];
                int _583 = int(_575) + 1;
                uint _585 = uint(int(uint(_583) >> uint(2)));
                int _587 = _583 & 3;
                float _589 = (*spvDescriptorSet0.vp_c3)._m0[int(_585)][_587];
                _120 = _563;
                _124 = _571;
                _128 = _581;
                _132 = _589;
            }
        }
    }
    _453 = false;
    float _591 = _120;
    float _593 = _124;
    float _595 = _128;
    float _597 = _132;
    float _599 = _591 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _601 = _593 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _603 = _595 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _605 = _597 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_27.x = _43;
    out.m_27.y = _45;
    out.m_29.x = _599;
    out.m_29.y = _601;
    out.m_29.z = _603;
    out.m_29.w = _605;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

