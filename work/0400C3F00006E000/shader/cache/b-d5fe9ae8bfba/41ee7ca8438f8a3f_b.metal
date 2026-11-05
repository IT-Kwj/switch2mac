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
    constant _16* vp_c3 [[id(0)]];
    constant _16* vp_c1 [[id(1)]];
};

struct main0_out
{
    float4 m_27 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _727 = false;
    bool _158 = false;
    bool _285 = false;
    bool _283 = false;
    bool _279 = false;
    bool _275 = false;
    bool _271 = false;
    bool _267 = false;
    bool _263 = false;
    bool _259 = false;
    bool _255 = false;
    bool _251 = false;
    bool _247 = false;
    bool _243 = false;
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
    bool _110 = !_108;
    float _112 = _95;
    float _114 = _97;
    float _116 = _99;
    float _118 = _101;
    float _120 = _65;
    float _122 = _89;
    float _124 = _45;
    float _126 = _43;
    bool _132;
    float _136;
    float _140;
    float _144;
    float _148;
    float _152;
    float _156;
    if (!_110)
    {
        int _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _130 = _128 != 0;
        _132 = _130;
        if (_130)
        {
            _112 = 255.0;
        }
        float _134 = _112;
        _136 = _134;
        if (_130)
        {
            _114 = 255.0;
        }
        float _138 = _114;
        _140 = _138;
        if (_130)
        {
            _116 = 255.0;
        }
        float _142 = _116;
        _144 = _142;
        if (_130)
        {
            _118 = 255.0;
        }
        float _146 = _118;
        _148 = _146;
        if (_130)
        {
            _120 = _43;
        }
        float _150 = _120;
        _152 = _150;
        if (_130)
        {
            _122 = _45;
        }
        float _154 = _122;
        _156 = _154;
        _158 = _130;
        if (!_158)
        {
            float _160 = trunc(_43);
            int _162 = int(_160);
            float _164 = trunc(_45);
            int _166 = int(_164);
            int _168 = _166 << 1;
            int _170 = _168 + _162;
            int _172 = _170 << 4;
            int _174 = _172 + 224;
            uint _177 = uint(int(uint(_174) >> uint(2)));
            uint _179 = uint(int(uint(int(_177)) >> uint(2)));
            int _181 = int(_177) & 3;
            float _183 = (*spvDescriptorSet0.vp_c3)._m0[int(_179)][_181];
            int _185 = int(_177) + 1;
            uint _187 = uint(int(uint(_185) >> uint(2)));
            int _189 = _185 & 3;
            float _191 = (*spvDescriptorSet0.vp_c3)._m0[int(_187)][_189];
            _152 = _183;
            _156 = _191;
            _124 = as_type<float>(_166);
            _126 = as_type<float>(_162);
            _136 = 255.0;
            _140 = 255.0;
            _144 = 255.0;
            _148 = 255.0;
            _158 = true;
        }
    }
    else
    {
        int _193 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _195 = _193 != 0;
        uint _197 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _199 = int(_197) & 15;
        bool _201 = !_195;
        float _203 = as_type<float>(_199);
        _132 = _195;
        if (!_201)
        {
            uint _205 = min(uint(_199), 13u);
            float _207 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _209 = int(_205) << 2;
            uint _211 = uint(int(uint(_209) >> uint(2)));
            uint _213 = uint(int(uint(int(_211)) >> uint(2)));
            int _215 = int(_211) & 3;
            float _217 = (*spvDescriptorSet0.vp_c1)._m0[int(_213)][_215];
            float _219 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _221 = _207 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _223 = _207 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _225 = _219 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _227 = _219 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _229 = as_type<int>(_217) >> 31;
            bool _231 = as_type<int>(_217) == 1072;
            float _233 = as_type<float>(_229);
            float _235 = _223;
            float _237 = _217;
            float _239 = _227;
            if (!_231)
            {
                bool _241 = as_type<int>(_217) == 1120;
                _243 = _241;
                if (!_243)
                {
                    bool _245 = as_type<int>(_217) == 1184;
                    _247 = _245;
                    if (!_247)
                    {
                        bool _249 = as_type<int>(_217) == 1248;
                        _251 = _249;
                        if (!_251)
                        {
                            bool _253 = as_type<int>(_217) == 1328;
                            _255 = _253;
                            if (!_255)
                            {
                                bool _257 = as_type<int>(_217) == 1408;
                                _259 = _257;
                                if (!_259)
                                {
                                    bool _261 = as_type<int>(_217) == 1504;
                                    _263 = _261;
                                    if (!_263)
                                    {
                                        bool _265 = as_type<int>(_217) == 1584;
                                        _267 = _265;
                                        if (!_267)
                                        {
                                            bool _269 = as_type<int>(_217) == 1680;
                                            _271 = _269;
                                            if (!_271)
                                            {
                                                bool _273 = as_type<int>(_217) == 1744;
                                                _275 = _273;
                                                if (!_275)
                                                {
                                                    bool _277 = as_type<int>(_217) == 1824;
                                                    _279 = _277;
                                                    if (!_279)
                                                    {
                                                        bool _281 = as_type<int>(_217) == 1888;
                                                        _283 = _281;
                                                        if (!_283)
                                                        {
                                                            _285 = true;
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
            float _291;
            float _293;
            if (!_243)
            {
                if (!_247)
                {
                    if (!_251)
                    {
                        if (!_255)
                        {
                            if (!_259)
                            {
                                if (!_263)
                                {
                                    if (!_267)
                                    {
                                        if (!_271)
                                        {
                                            if (!_275)
                                            {
                                                if (!_279)
                                                {
                                                    if (!_283)
                                                    {
                                                        if (!_285)
                                                        {
                                                            float _287 = _221 * _43;
                                                            float _289 = _225 * _45;
                                                            _291 = _289;
                                                            _293 = _287;
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
            if ((((((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255) || _251) || _247) || _243)
            {
                if ((!_247) || _243)
                {
                    if ((!_251) || _243)
                    {
                        if ((!_255) || _243)
                        {
                            if ((!_259) || _243)
                            {
                                if ((!_263) || _243)
                                {
                                    if ((!_267) || _243)
                                    {
                                        if ((!_271) || _243)
                                        {
                                            if ((!_275) || _243)
                                            {
                                                if ((!_279) || _243)
                                                {
                                                    if ((!_283) || _243)
                                                    {
                                                        if ((!_285) || _243)
                                                        {
                                                            _243 = false;
                                                            float _295 = -_223;
                                                            float _297 = _295 + 1.0;
                                                            float _299 = _225 * _45;
                                                            float _301 = fma(_223, _43, _297);
                                                            _291 = _299;
                                                            _293 = _301;
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
                if (((((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255) || _251) || _247)
                {
                    if ((!_251) || _247)
                    {
                        if ((!_255) || _247)
                        {
                            if ((!_259) || _247)
                            {
                                if ((!_263) || _247)
                                {
                                    if ((!_267) || _247)
                                    {
                                        if ((!_271) || _247)
                                        {
                                            if ((!_275) || _247)
                                            {
                                                if ((!_279) || _247)
                                                {
                                                    if ((!_283) || _247)
                                                    {
                                                        if ((!_285) || _247)
                                                        {
                                                            _247 = false;
                                                            float _303 = -_227;
                                                            float _305 = _303 + 1.0;
                                                            float _307 = _221 * _43;
                                                            float _309 = fma(_227, _45, _305);
                                                            _291 = _309;
                                                            _293 = _307;
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
                    if ((((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255) || _251)
                    {
                        if ((!_255) || _251)
                        {
                            if ((!_259) || _251)
                            {
                                if ((!_263) || _251)
                                {
                                    if ((!_267) || _251)
                                    {
                                        if ((!_271) || _251)
                                        {
                                            if ((!_275) || _251)
                                            {
                                                if ((!_279) || _251)
                                                {
                                                    if ((!_283) || _251)
                                                    {
                                                        if ((!_285) || _251)
                                                        {
                                                            _251 = false;
                                                            float _311 = -_223;
                                                            float _313 = _311 + 1.0;
                                                            float _315 = -_227;
                                                            float _317 = _315 + 1.0;
                                                            float _319 = fma(_223, _43, _313);
                                                            float _321 = fma(_227, _45, _317);
                                                            _291 = _321;
                                                            _293 = _319;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255)
                        {
                            if ((!_259) || _255)
                            {
                                if ((!_263) || _255)
                                {
                                    if ((!_267) || _255)
                                    {
                                        if ((!_271) || _255)
                                        {
                                            if ((!_275) || _255)
                                            {
                                                if ((!_279) || _255)
                                                {
                                                    if ((!_283) || _255)
                                                    {
                                                        if ((!_285) || _255)
                                                        {
                                                            _255 = false;
                                                            float _323 = -_225;
                                                            float _325 = _323 + 1.0;
                                                            float _327 = _221 * _43;
                                                            float _329 = -_227;
                                                            float _331 = _329 + _325;
                                                            float _333 = fma(_331, _45, _225);
                                                            _291 = _333;
                                                            _293 = _327;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259)
                            {
                                if ((!_263) || _259)
                                {
                                    if ((!_267) || _259)
                                    {
                                        if ((!_271) || _259)
                                        {
                                            if ((!_275) || _259)
                                            {
                                                if ((!_279) || _259)
                                                {
                                                    if ((!_283) || _259)
                                                    {
                                                        if ((!_285) || _259)
                                                        {
                                                            _259 = false;
                                                            float _335 = -_225;
                                                            float _337 = _335 + 1.0;
                                                            float _339 = -_223;
                                                            float _341 = _339 + 1.0;
                                                            float _343 = -_227;
                                                            float _345 = _343 + _337;
                                                            float _347 = fma(_223, _43, _341);
                                                            float _349 = fma(_345, _45, _225);
                                                            _291 = _349;
                                                            _293 = _347;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263)
                                {
                                    if ((!_267) || _263)
                                    {
                                        if ((!_271) || _263)
                                        {
                                            if ((!_275) || _263)
                                            {
                                                if ((!_279) || _263)
                                                {
                                                    if ((!_283) || _263)
                                                    {
                                                        if ((!_285) || _263)
                                                        {
                                                            _263 = false;
                                                            float _351 = -_221;
                                                            float _353 = _351 + 1.0;
                                                            float _355 = _225 * _45;
                                                            float _357 = -_223;
                                                            float _359 = _357 + _353;
                                                            float _361 = fma(_359, _43, _221);
                                                            _291 = _355;
                                                            _293 = _361;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _285) || _283) || _279) || _275) || _271) || _267)
                                    {
                                        if ((!_271) || _267)
                                        {
                                            if ((!_275) || _267)
                                            {
                                                if ((!_279) || _267)
                                                {
                                                    if ((!_283) || _267)
                                                    {
                                                        if ((!_285) || _267)
                                                        {
                                                            _267 = false;
                                                            float _363 = -_221;
                                                            float _365 = _363 + 1.0;
                                                            float _367 = -_227;
                                                            float _369 = _367 + 1.0;
                                                            float _371 = -_223;
                                                            float _373 = _371 + _365;
                                                            float _375 = fma(_227, _45, _369);
                                                            float _377 = fma(_373, _43, _221);
                                                            _291 = _375;
                                                            _293 = _377;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _285) || _283) || _279) || _275) || _271)
                                        {
                                            if ((!_275) || _271)
                                            {
                                                if ((!_279) || _271)
                                                {
                                                    if ((!_283) || _271)
                                                    {
                                                        if ((!_285) || _271)
                                                        {
                                                            _271 = false;
                                                            float _379 = -_223;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _225 * _45;
                                                            float _385 = _381 * _43;
                                                            _291 = _383;
                                                            _293 = _385;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _285) || _283) || _279) || _275)
                                            {
                                                if ((!_279) || _275)
                                                {
                                                    if ((!_283) || _275)
                                                    {
                                                        if ((!_285) || _275)
                                                        {
                                                            _275 = false;
                                                            float _387 = -_223;
                                                            float _389 = _387 + 1.0;
                                                            float _391 = -_227;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = fma(_223, _43, _389);
                                                            float _397 = _393 * _45;
                                                            _291 = _397;
                                                            _293 = _395;
                                                        }
                                                    }
                                                }
                                                if (((false || _285) || _283) || _279)
                                                {
                                                    if ((!_283) || _279)
                                                    {
                                                        if ((!_285) || _279)
                                                        {
                                                            _279 = false;
                                                            float _399 = -_225;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = _221 * _43;
                                                            float _405 = fma(_401, _45, _225);
                                                            _291 = _405;
                                                            _293 = _403;
                                                        }
                                                    }
                                                    if ((false || _285) || _283)
                                                    {
                                                        if ((!_285) || _283)
                                                        {
                                                            _283 = false;
                                                            float _407 = -_221;
                                                            float _409 = _407 + 1.0;
                                                            float _411 = -_227;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = fma(_409, _43, _221);
                                                            float _417 = fma(_227, _45, _413);
                                                            _291 = _417;
                                                            _293 = _415;
                                                        }
                                                        if (false || _285)
                                                        {
                                                            _285 = false;
                                                            bool _419 = _199 != 12;
                                                            if (!_419)
                                                            {
                                                                float _421 = -_225;
                                                                float _423 = _421 + 1.0;
                                                                _233 = _423;
                                                            }
                                                            float _425 = _233;
                                                            if (!_419)
                                                            {
                                                                float _427 = -_223;
                                                                float _429 = _427 + 1.0;
                                                                _235 = _429;
                                                            }
                                                            float _431 = _235;
                                                            if (_419)
                                                            {
                                                                _237 = 0.0;
                                                            }
                                                            float _433 = _237;
                                                            float _435 = _433;
                                                            if (!_419)
                                                            {
                                                                float _437 = -_227;
                                                                float _439 = _437 + _425;
                                                                _239 = _439;
                                                            }
                                                            float _441 = _239;
                                                            if (_419)
                                                            {
                                                                _203 = 0.0;
                                                            }
                                                            float _443 = _203;
                                                            _291 = _443;
                                                            if (!_419)
                                                            {
                                                                float _445 = _43 * _431;
                                                                _435 = _445;
                                                            }
                                                            float _447 = _435;
                                                            _293 = _447;
                                                            if (!_419)
                                                            {
                                                                float _449 = _45 * _441;
                                                                _291 = _449;
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
            float _451 = _291;
            float _453 = _293;
            float _455 = -_451;
            float _457 = _455 + 1.0;
            float _459 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _461 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _463 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _465 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _467 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _469 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _471 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _473 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _475 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].y, _459);
            float _477 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].x, _461);
            float _479 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].x, _463);
            float _481 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].y, _465);
            float _483 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].z, _467);
            float _485 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].z, _469);
            float _487 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].w, _471);
            float _489 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].w, _473);
            float _491 = -_453;
            float _493 = _491 + 1.0;
            float _495 = _475 * _453;
            float _497 = _477 * _453;
            float _499 = _483 * _453;
            float _501 = _489 * _453;
            float _503 = fma(_493, _481, _495);
            float _505 = fma(_493, _479, _497);
            float _507 = fma(_493, _485, _499);
            float _509 = fma(_493, _487, _501);
            _152 = _43;
            _156 = _45;
            _136 = _505;
            _140 = _503;
            _144 = _507;
            _148 = _509;
            _158 = true;
        }
        else
        {
            float _511 = trunc(_43);
            int _513 = int(_511);
            bool _515 = _199 != 13;
            float _517 = trunc(_45);
            int _519 = int(_517);
            int _521 = _519 << 1;
            int _523 = _521 + _513;
            int _525 = _523 << 4;
            int _527 = _525 + 224;
            if (!_515)
            {
                float _529 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                uint _531 = uint(int(uint(_527) >> uint(2)));
                uint _533 = uint(int(uint(int(_531)) >> uint(2)));
                int _535 = int(_531) & 3;
                float _537 = (*spvDescriptorSet0.vp_c3)._m0[int(_533)][_535];
                int _539 = int(_531) + 1;
                uint _541 = uint(int(uint(_539) >> uint(2)));
                int _543 = _539 & 3;
                float _545 = (*spvDescriptorSet0.vp_c3)._m0[int(_541)][_543];
                float _547 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _549 = _529 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _551 = -_549;
                float _553 = _551 + 1.0;
                float _555 = _547 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _557 = -_529;
                float _559 = fma(_557, (*spvDescriptorSet0.vp_c3)._m0[26].w, _553);
                float _561 = -_555;
                float _563 = _561 + 1.0;
                float _565 = fma(_559, _45, _549);
                float _567 = -_547;
                float _569 = fma(_567, (*spvDescriptorSet0.vp_c3)._m0[26].y, _563);
                float _571 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _573 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _575 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _577 = fma(_569, _43, _555);
                float _579 = -_565;
                float _581 = _579 + 1.0;
                float _583 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _585 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _587 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _589 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _591 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _593 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].y, _571);
                float _595 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].x, _573);
                float _597 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].x, _575);
                float _599 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].y, _583);
                float _601 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].z, _585);
                float _603 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].z, _587);
                float _605 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].w, _589);
                float _607 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].w, _591);
                float _609 = -_577;
                float _611 = _609 + 1.0;
                float _613 = _577 * _593;
                float _615 = _577 * _595;
                float _617 = _577 * _601;
                float _619 = _577 * _607;
                float _621 = fma(_611, _599, _613);
                float _623 = fma(_611, _597, _615);
                float _625 = fma(_611, _603, _617);
                float _627 = fma(_611, _605, _619);
                _152 = _537;
                _156 = _545;
                _124 = _617;
                _126 = _607;
                _136 = _623;
                _140 = _621;
                _144 = _625;
                _148 = _627;
                _158 = true;
            }
            else
            {
                int _629 = _527 + 240;
                uint _631 = uint(int(uint(_629) >> uint(2)));
                uint _633 = uint(int(uint(int(_631)) >> uint(2)));
                int _635 = int(_631) & 3;
                float _637 = (*spvDescriptorSet0.vp_c3)._m0[int(_633)][_635];
                int _639 = int(_631) + 1;
                uint _641 = uint(int(uint(_639) >> uint(2)));
                int _643 = _639 & 3;
                float _645 = (*spvDescriptorSet0.vp_c3)._m0[int(_641)][_643];
                int _647 = _527 + 248;
                uint _649 = uint(int(uint(_647) >> uint(2)));
                uint _651 = uint(int(uint(int(_649)) >> uint(2)));
                int _653 = int(_649) & 3;
                float _655 = (*spvDescriptorSet0.vp_c3)._m0[int(_651)][_653];
                int _657 = int(_649) + 1;
                uint _659 = uint(int(uint(_657) >> uint(2)));
                int _661 = _657 & 3;
                float _663 = (*spvDescriptorSet0.vp_c3)._m0[int(_659)][_661];
                uint _665 = uint(int(uint(_527) >> uint(2)));
                uint _667 = uint(int(uint(int(_665)) >> uint(2)));
                int _669 = int(_665) & 3;
                float _671 = (*spvDescriptorSet0.vp_c3)._m0[int(_667)][_669];
                int _673 = int(_665) + 1;
                uint _675 = uint(int(uint(_673) >> uint(2)));
                int _677 = _673 & 3;
                float _679 = (*spvDescriptorSet0.vp_c3)._m0[int(_675)][_677];
                _152 = _671;
                _156 = _679;
                _136 = _637;
                _140 = _645;
                _144 = _655;
                _148 = _663;
            }
        }
    }
    _158 = false;
    float _681 = _152;
    float _683 = _156;
    bool _685 = _132;
    float _687 = _124;
    float _689 = _126;
    float _691 = _136;
    float _693 = _140;
    float _695 = _144;
    float _697 = _148;
    bool _699 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _701 = !_699;
    float _703 = _687;
    float _705 = _689;
    float _707 = _681;
    float _709 = _683;
    float _723;
    float _725;
    if (!_701)
    {
        float _711 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _713 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _715 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _711);
        float _717 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _713);
        float _719 = _715 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _721 = _717 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _723 = _721;
        _725 = _719;
        _727 = true;
    }
    else
    {
        int _729 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _731 = _729 != 0;
        if (!_731)
        {
            _703 = _681;
        }
        float _733 = _703;
        float _735 = _733;
        _725 = _733;
        if (!_731)
        {
            _705 = _683;
        }
        float _737 = _705;
        bool _739 = !_731;
        float _741 = _737;
        _723 = _737;
        if (!_739)
        {
            if (!_685)
            {
                _735 = _681;
            }
            float _743 = _735;
            float _745 = _743;
            int _747 = as_type<int>(_743);
            if (!_685)
            {
                _741 = _683;
            }
            float _749 = _741;
            bool _751 = !_685;
            float _753 = _749;
            float _755 = _749;
            if (!_751)
            {
                int _757 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _759 = _757 != 0;
                int _761 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _763 = _761 != 0;
                int _765 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _767 = _765 != 0;
                int _769 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _771 = _769 != 0;
                int _773 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _775 = _773 != 0;
                if (_759)
                {
                    _745 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _777 = _745;
                float _779 = _777;
                if (_759)
                {
                    _753 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _781 = _753;
                float _783 = _781;
                if (!_759)
                {
                    _779 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _785 = _779;
                if (!_759)
                {
                    _783 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _787 = _783;
                float _789 = _785 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _791 = _787 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_771)
                {
                    float _793 = _789 * _681;
                    _707 = _793;
                }
                float _795 = _707;
                float _797 = -_789;
                float _799 = _797 + 1.0;
                int _801 = as_type<int>(_795);
                if (_775)
                {
                    float _803 = _791 * _683;
                    _709 = _803;
                }
                float _805 = _709;
                float _807 = -_791;
                float _809 = _807 + 1.0;
                float _811 = _805;
                if (_763)
                {
                    float _813 = _795 + _799;
                    _801 = as_type<int>(_813);
                }
                int _815 = _801;
                if (_767)
                {
                    float _817 = _805 + _809;
                    _811 = _817;
                }
                float _819 = _811;
                _747 = _815;
                _755 = _819;
            }
            int _821 = _747;
            float _823 = _755;
            int _825 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _827 = _825 != 0;
            int _829 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _831 = _829 != 0;
            int _833 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _835 = _833 != 0;
            int _837 = _821;
            int _839 = as_type<int>(_823);
            if (_831)
            {
                float _841 = -as_type<float>(_821);
                float _843 = _841 + 1.0;
                _837 = as_type<int>(_843);
            }
            int _845 = _837;
            if (_835)
            {
                float _847 = -_823;
                float _849 = _847 + 1.0;
                _839 = as_type<int>(_849);
            }
            int _851 = _839;
            bool _853 = !_827;
            float _855 = _853 ? as_type<float>(_845) : as_type<float>(_851);
            bool _857 = !_827;
            float _859 = _857 ? as_type<float>(_851) : as_type<float>(_845);
            _723 = _859;
            _725 = _855;
        }
    }
    _727 = false;
    float _861 = _723;
    float _863 = _725;
    float _865 = _861 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _867 = _861 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _869 = _691 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _871 = _693 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _873 = fma(_863, (*spvDescriptorSet0.vp_c3)._m0[8].x, _865);
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c3)._m0[7].x, _867);
    float _877 = _695 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _879 = _697 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _881 = _873 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _883 = _875 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _885 = -_881;
    float _887 = _885 + 1.0;
    out.m_27.x = _869;
    out.m_27.y = _871;
    out.m_27.z = _877;
    out.m_27.w = _879;
    out.m_29.x = _883;
    out.m_29.y = _887;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _727 = false;
    bool _158 = false;
    bool _285 = false;
    bool _283 = false;
    bool _279 = false;
    bool _275 = false;
    bool _271 = false;
    bool _267 = false;
    bool _263 = false;
    bool _259 = false;
    bool _255 = false;
    bool _251 = false;
    bool _247 = false;
    bool _243 = false;
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
    bool _110 = !_108;
    float _112 = _95;
    float _114 = _97;
    float _116 = _99;
    float _118 = _101;
    float _120 = _65;
    float _122 = _89;
    float _124 = _45;
    float _126 = _43;
    bool _132;
    float _136;
    float _140;
    float _144;
    float _148;
    float _152;
    float _156;
    if (!_110)
    {
        int _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _130 = _128 != 0;
        _132 = _130;
        if (_130)
        {
            _112 = 255.0;
        }
        float _134 = _112;
        _136 = _134;
        if (_130)
        {
            _114 = 255.0;
        }
        float _138 = _114;
        _140 = _138;
        if (_130)
        {
            _116 = 255.0;
        }
        float _142 = _116;
        _144 = _142;
        if (_130)
        {
            _118 = 255.0;
        }
        float _146 = _118;
        _148 = _146;
        if (_130)
        {
            _120 = _43;
        }
        float _150 = _120;
        _152 = _150;
        if (_130)
        {
            _122 = _45;
        }
        float _154 = _122;
        _156 = _154;
        _158 = _130;
        if (!_158)
        {
            float _160 = trunc(_43);
            int _162 = int(_160);
            float _164 = trunc(_45);
            int _166 = int(_164);
            int _168 = _166 << 1;
            int _170 = _168 + _162;
            int _172 = _170 << 4;
            int _174 = _172 + 224;
            uint _177 = uint(int(uint(_174) >> uint(2)));
            uint _179 = uint(int(uint(int(_177)) >> uint(2)));
            int _181 = int(_177) & 3;
            float _183 = (*spvDescriptorSet0.vp_c3)._m0[int(_179)][_181];
            int _185 = int(_177) + 1;
            uint _187 = uint(int(uint(_185) >> uint(2)));
            int _189 = _185 & 3;
            float _191 = (*spvDescriptorSet0.vp_c3)._m0[int(_187)][_189];
            _152 = _183;
            _156 = _191;
            _124 = as_type<float>(_166);
            _126 = as_type<float>(_162);
            _136 = 255.0;
            _140 = 255.0;
            _144 = 255.0;
            _148 = 255.0;
            _158 = true;
        }
    }
    else
    {
        int _193 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _195 = _193 != 0;
        uint _197 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _199 = int(_197) & 15;
        bool _201 = !_195;
        float _203 = as_type<float>(_199);
        _132 = _195;
        if (!_201)
        {
            uint _205 = min(uint(_199), 13u);
            float _207 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _209 = int(_205) << 2;
            uint _211 = uint(int(uint(_209) >> uint(2)));
            uint _213 = uint(int(uint(int(_211)) >> uint(2)));
            int _215 = int(_211) & 3;
            float _217 = (*spvDescriptorSet0.vp_c1)._m0[int(_213)][_215];
            float _219 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _221 = _207 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _223 = _207 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _225 = _219 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _227 = _219 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _229 = as_type<int>(_217) >> 31;
            bool _231 = as_type<int>(_217) == 1072;
            float _233 = as_type<float>(_229);
            float _235 = _223;
            float _237 = _217;
            float _239 = _227;
            if (!_231)
            {
                bool _241 = as_type<int>(_217) == 1120;
                _243 = _241;
                if (!_243)
                {
                    bool _245 = as_type<int>(_217) == 1184;
                    _247 = _245;
                    if (!_247)
                    {
                        bool _249 = as_type<int>(_217) == 1248;
                        _251 = _249;
                        if (!_251)
                        {
                            bool _253 = as_type<int>(_217) == 1328;
                            _255 = _253;
                            if (!_255)
                            {
                                bool _257 = as_type<int>(_217) == 1408;
                                _259 = _257;
                                if (!_259)
                                {
                                    bool _261 = as_type<int>(_217) == 1504;
                                    _263 = _261;
                                    if (!_263)
                                    {
                                        bool _265 = as_type<int>(_217) == 1584;
                                        _267 = _265;
                                        if (!_267)
                                        {
                                            bool _269 = as_type<int>(_217) == 1680;
                                            _271 = _269;
                                            if (!_271)
                                            {
                                                bool _273 = as_type<int>(_217) == 1744;
                                                _275 = _273;
                                                if (!_275)
                                                {
                                                    bool _277 = as_type<int>(_217) == 1824;
                                                    _279 = _277;
                                                    if (!_279)
                                                    {
                                                        bool _281 = as_type<int>(_217) == 1888;
                                                        _283 = _281;
                                                        if (!_283)
                                                        {
                                                            _285 = true;
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
            float _291;
            float _293;
            if (!_243)
            {
                if (!_247)
                {
                    if (!_251)
                    {
                        if (!_255)
                        {
                            if (!_259)
                            {
                                if (!_263)
                                {
                                    if (!_267)
                                    {
                                        if (!_271)
                                        {
                                            if (!_275)
                                            {
                                                if (!_279)
                                                {
                                                    if (!_283)
                                                    {
                                                        if (!_285)
                                                        {
                                                            float _287 = _221 * _43;
                                                            float _289 = _225 * _45;
                                                            _291 = _289;
                                                            _293 = _287;
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
            if ((((((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255) || _251) || _247) || _243)
            {
                if ((!_247) || _243)
                {
                    if ((!_251) || _243)
                    {
                        if ((!_255) || _243)
                        {
                            if ((!_259) || _243)
                            {
                                if ((!_263) || _243)
                                {
                                    if ((!_267) || _243)
                                    {
                                        if ((!_271) || _243)
                                        {
                                            if ((!_275) || _243)
                                            {
                                                if ((!_279) || _243)
                                                {
                                                    if ((!_283) || _243)
                                                    {
                                                        if ((!_285) || _243)
                                                        {
                                                            _243 = false;
                                                            float _295 = -_223;
                                                            float _297 = _295 + 1.0;
                                                            float _299 = _225 * _45;
                                                            float _301 = fma(_223, _43, _297);
                                                            _291 = _299;
                                                            _293 = _301;
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
                if (((((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255) || _251) || _247)
                {
                    if ((!_251) || _247)
                    {
                        if ((!_255) || _247)
                        {
                            if ((!_259) || _247)
                            {
                                if ((!_263) || _247)
                                {
                                    if ((!_267) || _247)
                                    {
                                        if ((!_271) || _247)
                                        {
                                            if ((!_275) || _247)
                                            {
                                                if ((!_279) || _247)
                                                {
                                                    if ((!_283) || _247)
                                                    {
                                                        if ((!_285) || _247)
                                                        {
                                                            _247 = false;
                                                            float _303 = -_227;
                                                            float _305 = _303 + 1.0;
                                                            float _307 = _221 * _43;
                                                            float _309 = fma(_227, _45, _305);
                                                            _291 = _309;
                                                            _293 = _307;
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
                    if ((((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255) || _251)
                    {
                        if ((!_255) || _251)
                        {
                            if ((!_259) || _251)
                            {
                                if ((!_263) || _251)
                                {
                                    if ((!_267) || _251)
                                    {
                                        if ((!_271) || _251)
                                        {
                                            if ((!_275) || _251)
                                            {
                                                if ((!_279) || _251)
                                                {
                                                    if ((!_283) || _251)
                                                    {
                                                        if ((!_285) || _251)
                                                        {
                                                            _251 = false;
                                                            float _311 = -_223;
                                                            float _313 = _311 + 1.0;
                                                            float _315 = -_227;
                                                            float _317 = _315 + 1.0;
                                                            float _319 = fma(_223, _43, _313);
                                                            float _321 = fma(_227, _45, _317);
                                                            _291 = _321;
                                                            _293 = _319;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255)
                        {
                            if ((!_259) || _255)
                            {
                                if ((!_263) || _255)
                                {
                                    if ((!_267) || _255)
                                    {
                                        if ((!_271) || _255)
                                        {
                                            if ((!_275) || _255)
                                            {
                                                if ((!_279) || _255)
                                                {
                                                    if ((!_283) || _255)
                                                    {
                                                        if ((!_285) || _255)
                                                        {
                                                            _255 = false;
                                                            float _323 = -_225;
                                                            float _325 = _323 + 1.0;
                                                            float _327 = _221 * _43;
                                                            float _329 = -_227;
                                                            float _331 = _329 + _325;
                                                            float _333 = fma(_331, _45, _225);
                                                            _291 = _333;
                                                            _293 = _327;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259)
                            {
                                if ((!_263) || _259)
                                {
                                    if ((!_267) || _259)
                                    {
                                        if ((!_271) || _259)
                                        {
                                            if ((!_275) || _259)
                                            {
                                                if ((!_279) || _259)
                                                {
                                                    if ((!_283) || _259)
                                                    {
                                                        if ((!_285) || _259)
                                                        {
                                                            _259 = false;
                                                            float _335 = -_225;
                                                            float _337 = _335 + 1.0;
                                                            float _339 = -_223;
                                                            float _341 = _339 + 1.0;
                                                            float _343 = -_227;
                                                            float _345 = _343 + _337;
                                                            float _347 = fma(_223, _43, _341);
                                                            float _349 = fma(_345, _45, _225);
                                                            _291 = _349;
                                                            _293 = _347;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263)
                                {
                                    if ((!_267) || _263)
                                    {
                                        if ((!_271) || _263)
                                        {
                                            if ((!_275) || _263)
                                            {
                                                if ((!_279) || _263)
                                                {
                                                    if ((!_283) || _263)
                                                    {
                                                        if ((!_285) || _263)
                                                        {
                                                            _263 = false;
                                                            float _351 = -_221;
                                                            float _353 = _351 + 1.0;
                                                            float _355 = _225 * _45;
                                                            float _357 = -_223;
                                                            float _359 = _357 + _353;
                                                            float _361 = fma(_359, _43, _221);
                                                            _291 = _355;
                                                            _293 = _361;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _285) || _283) || _279) || _275) || _271) || _267)
                                    {
                                        if ((!_271) || _267)
                                        {
                                            if ((!_275) || _267)
                                            {
                                                if ((!_279) || _267)
                                                {
                                                    if ((!_283) || _267)
                                                    {
                                                        if ((!_285) || _267)
                                                        {
                                                            _267 = false;
                                                            float _363 = -_221;
                                                            float _365 = _363 + 1.0;
                                                            float _367 = -_227;
                                                            float _369 = _367 + 1.0;
                                                            float _371 = -_223;
                                                            float _373 = _371 + _365;
                                                            float _375 = fma(_227, _45, _369);
                                                            float _377 = fma(_373, _43, _221);
                                                            _291 = _375;
                                                            _293 = _377;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _285) || _283) || _279) || _275) || _271)
                                        {
                                            if ((!_275) || _271)
                                            {
                                                if ((!_279) || _271)
                                                {
                                                    if ((!_283) || _271)
                                                    {
                                                        if ((!_285) || _271)
                                                        {
                                                            _271 = false;
                                                            float _379 = -_223;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _225 * _45;
                                                            float _385 = _381 * _43;
                                                            _291 = _383;
                                                            _293 = _385;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _285) || _283) || _279) || _275)
                                            {
                                                if ((!_279) || _275)
                                                {
                                                    if ((!_283) || _275)
                                                    {
                                                        if ((!_285) || _275)
                                                        {
                                                            _275 = false;
                                                            float _387 = -_223;
                                                            float _389 = _387 + 1.0;
                                                            float _391 = -_227;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = fma(_223, _43, _389);
                                                            float _397 = _393 * _45;
                                                            _291 = _397;
                                                            _293 = _395;
                                                        }
                                                    }
                                                }
                                                if (((false || _285) || _283) || _279)
                                                {
                                                    if ((!_283) || _279)
                                                    {
                                                        if ((!_285) || _279)
                                                        {
                                                            _279 = false;
                                                            float _399 = -_225;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = _221 * _43;
                                                            float _405 = fma(_401, _45, _225);
                                                            _291 = _405;
                                                            _293 = _403;
                                                        }
                                                    }
                                                    if ((false || _285) || _283)
                                                    {
                                                        if ((!_285) || _283)
                                                        {
                                                            _283 = false;
                                                            float _407 = -_221;
                                                            float _409 = _407 + 1.0;
                                                            float _411 = -_227;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = fma(_409, _43, _221);
                                                            float _417 = fma(_227, _45, _413);
                                                            _291 = _417;
                                                            _293 = _415;
                                                        }
                                                        if (false || _285)
                                                        {
                                                            _285 = false;
                                                            bool _419 = _199 != 12;
                                                            if (!_419)
                                                            {
                                                                float _421 = -_225;
                                                                float _423 = _421 + 1.0;
                                                                _233 = _423;
                                                            }
                                                            float _425 = _233;
                                                            if (!_419)
                                                            {
                                                                float _427 = -_223;
                                                                float _429 = _427 + 1.0;
                                                                _235 = _429;
                                                            }
                                                            float _431 = _235;
                                                            if (_419)
                                                            {
                                                                _237 = 0.0;
                                                            }
                                                            float _433 = _237;
                                                            float _435 = _433;
                                                            if (!_419)
                                                            {
                                                                float _437 = -_227;
                                                                float _439 = _437 + _425;
                                                                _239 = _439;
                                                            }
                                                            float _441 = _239;
                                                            if (_419)
                                                            {
                                                                _203 = 0.0;
                                                            }
                                                            float _443 = _203;
                                                            _291 = _443;
                                                            if (!_419)
                                                            {
                                                                float _445 = _43 * _431;
                                                                _435 = _445;
                                                            }
                                                            float _447 = _435;
                                                            _293 = _447;
                                                            if (!_419)
                                                            {
                                                                float _449 = _45 * _441;
                                                                _291 = _449;
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
            float _451 = _291;
            float _453 = _293;
            float _455 = -_451;
            float _457 = _455 + 1.0;
            float _459 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _461 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _463 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _465 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _467 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _469 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _471 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _473 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _475 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].y, _459);
            float _477 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].x, _461);
            float _479 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].x, _463);
            float _481 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].y, _465);
            float _483 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].z, _467);
            float _485 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].z, _469);
            float _487 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].w, _471);
            float _489 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].w, _473);
            float _491 = -_453;
            float _493 = _491 + 1.0;
            float _495 = _475 * _453;
            float _497 = _477 * _453;
            float _499 = _483 * _453;
            float _501 = _489 * _453;
            float _503 = fma(_493, _481, _495);
            float _505 = fma(_493, _479, _497);
            float _507 = fma(_493, _485, _499);
            float _509 = fma(_493, _487, _501);
            _152 = _43;
            _156 = _45;
            _136 = _505;
            _140 = _503;
            _144 = _507;
            _148 = _509;
            _158 = true;
        }
        else
        {
            float _511 = trunc(_43);
            int _513 = int(_511);
            bool _515 = _199 != 13;
            float _517 = trunc(_45);
            int _519 = int(_517);
            int _521 = _519 << 1;
            int _523 = _521 + _513;
            int _525 = _523 << 4;
            int _527 = _525 + 224;
            if (!_515)
            {
                float _529 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                uint _531 = uint(int(uint(_527) >> uint(2)));
                uint _533 = uint(int(uint(int(_531)) >> uint(2)));
                int _535 = int(_531) & 3;
                float _537 = (*spvDescriptorSet0.vp_c3)._m0[int(_533)][_535];
                int _539 = int(_531) + 1;
                uint _541 = uint(int(uint(_539) >> uint(2)));
                int _543 = _539 & 3;
                float _545 = (*spvDescriptorSet0.vp_c3)._m0[int(_541)][_543];
                float _547 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _549 = _529 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _551 = -_549;
                float _553 = _551 + 1.0;
                float _555 = _547 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _557 = -_529;
                float _559 = fma(_557, (*spvDescriptorSet0.vp_c3)._m0[26].w, _553);
                float _561 = -_555;
                float _563 = _561 + 1.0;
                float _565 = fma(_559, _45, _549);
                float _567 = -_547;
                float _569 = fma(_567, (*spvDescriptorSet0.vp_c3)._m0[26].y, _563);
                float _571 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _573 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _575 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _577 = fma(_569, _43, _555);
                float _579 = -_565;
                float _581 = _579 + 1.0;
                float _583 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _585 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _587 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _589 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _591 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _593 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].y, _571);
                float _595 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].x, _573);
                float _597 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].x, _575);
                float _599 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].y, _583);
                float _601 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].z, _585);
                float _603 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].z, _587);
                float _605 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].w, _589);
                float _607 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].w, _591);
                float _609 = -_577;
                float _611 = _609 + 1.0;
                float _613 = _577 * _593;
                float _615 = _577 * _595;
                float _617 = _577 * _601;
                float _619 = _577 * _607;
                float _621 = fma(_611, _599, _613);
                float _623 = fma(_611, _597, _615);
                float _625 = fma(_611, _603, _617);
                float _627 = fma(_611, _605, _619);
                _152 = _537;
                _156 = _545;
                _124 = _617;
                _126 = _607;
                _136 = _623;
                _140 = _621;
                _144 = _625;
                _148 = _627;
                _158 = true;
            }
            else
            {
                int _629 = _527 + 240;
                uint _631 = uint(int(uint(_629) >> uint(2)));
                uint _633 = uint(int(uint(int(_631)) >> uint(2)));
                int _635 = int(_631) & 3;
                float _637 = (*spvDescriptorSet0.vp_c3)._m0[int(_633)][_635];
                int _639 = int(_631) + 1;
                uint _641 = uint(int(uint(_639) >> uint(2)));
                int _643 = _639 & 3;
                float _645 = (*spvDescriptorSet0.vp_c3)._m0[int(_641)][_643];
                int _647 = _527 + 248;
                uint _649 = uint(int(uint(_647) >> uint(2)));
                uint _651 = uint(int(uint(int(_649)) >> uint(2)));
                int _653 = int(_649) & 3;
                float _655 = (*spvDescriptorSet0.vp_c3)._m0[int(_651)][_653];
                int _657 = int(_649) + 1;
                uint _659 = uint(int(uint(_657) >> uint(2)));
                int _661 = _657 & 3;
                float _663 = (*spvDescriptorSet0.vp_c3)._m0[int(_659)][_661];
                uint _665 = uint(int(uint(_527) >> uint(2)));
                uint _667 = uint(int(uint(int(_665)) >> uint(2)));
                int _669 = int(_665) & 3;
                float _671 = (*spvDescriptorSet0.vp_c3)._m0[int(_667)][_669];
                int _673 = int(_665) + 1;
                uint _675 = uint(int(uint(_673) >> uint(2)));
                int _677 = _673 & 3;
                float _679 = (*spvDescriptorSet0.vp_c3)._m0[int(_675)][_677];
                _152 = _671;
                _156 = _679;
                _136 = _637;
                _140 = _645;
                _144 = _655;
                _148 = _663;
            }
        }
    }
    _158 = false;
    float _681 = _152;
    float _683 = _156;
    bool _685 = _132;
    float _687 = _124;
    float _689 = _126;
    float _691 = _136;
    float _693 = _140;
    float _695 = _144;
    float _697 = _148;
    bool _699 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _701 = !_699;
    float _703 = _687;
    float _705 = _689;
    float _707 = _681;
    float _709 = _683;
    float _723;
    float _725;
    if (!_701)
    {
        float _711 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _713 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _715 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _711);
        float _717 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _713);
        float _719 = _715 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _721 = _717 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _723 = _721;
        _725 = _719;
        _727 = true;
    }
    else
    {
        int _729 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _731 = _729 != 0;
        if (!_731)
        {
            _703 = _681;
        }
        float _733 = _703;
        float _735 = _733;
        _725 = _733;
        if (!_731)
        {
            _705 = _683;
        }
        float _737 = _705;
        bool _739 = !_731;
        float _741 = _737;
        _723 = _737;
        if (!_739)
        {
            if (!_685)
            {
                _735 = _681;
            }
            float _743 = _735;
            float _745 = _743;
            int _747 = as_type<int>(_743);
            if (!_685)
            {
                _741 = _683;
            }
            float _749 = _741;
            bool _751 = !_685;
            float _753 = _749;
            float _755 = _749;
            if (!_751)
            {
                int _757 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _759 = _757 != 0;
                int _761 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _763 = _761 != 0;
                int _765 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _767 = _765 != 0;
                int _769 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _771 = _769 != 0;
                int _773 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _775 = _773 != 0;
                if (_759)
                {
                    _745 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _777 = _745;
                float _779 = _777;
                if (_759)
                {
                    _753 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _781 = _753;
                float _783 = _781;
                if (!_759)
                {
                    _779 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _785 = _779;
                if (!_759)
                {
                    _783 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _787 = _783;
                float _789 = _785 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _791 = _787 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_771)
                {
                    float _793 = _789 * _681;
                    _707 = _793;
                }
                float _795 = _707;
                float _797 = -_789;
                float _799 = _797 + 1.0;
                int _801 = as_type<int>(_795);
                if (_775)
                {
                    float _803 = _791 * _683;
                    _709 = _803;
                }
                float _805 = _709;
                float _807 = -_791;
                float _809 = _807 + 1.0;
                float _811 = _805;
                if (_763)
                {
                    float _813 = _795 + _799;
                    _801 = as_type<int>(_813);
                }
                int _815 = _801;
                if (_767)
                {
                    float _817 = _805 + _809;
                    _811 = _817;
                }
                float _819 = _811;
                _747 = _815;
                _755 = _819;
            }
            int _821 = _747;
            float _823 = _755;
            int _825 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _827 = _825 != 0;
            int _829 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _831 = _829 != 0;
            int _833 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _835 = _833 != 0;
            int _837 = _821;
            int _839 = as_type<int>(_823);
            if (_831)
            {
                float _841 = -as_type<float>(_821);
                float _843 = _841 + 1.0;
                _837 = as_type<int>(_843);
            }
            int _845 = _837;
            if (_835)
            {
                float _847 = -_823;
                float _849 = _847 + 1.0;
                _839 = as_type<int>(_849);
            }
            int _851 = _839;
            bool _853 = !_827;
            float _855 = _853 ? as_type<float>(_845) : as_type<float>(_851);
            bool _857 = !_827;
            float _859 = _857 ? as_type<float>(_851) : as_type<float>(_845);
            _723 = _859;
            _725 = _855;
        }
    }
    _727 = false;
    float _861 = _723;
    float _863 = _725;
    float _865 = _861 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _867 = _861 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _869 = _691 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _871 = _693 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _873 = fma(_863, (*spvDescriptorSet0.vp_c3)._m0[8].x, _865);
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c3)._m0[7].x, _867);
    float _877 = _695 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _879 = _697 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _881 = _873 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _883 = _875 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _885 = -_881;
    float _887 = _885 + 1.0;
    out.m_27.x = _869;
    out.m_27.y = _871;
    out.m_27.z = _877;
    out.m_27.w = _879;
    out.m_29.x = _883;
    out.m_29.y = _887;
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _727 = false;
    bool _158 = false;
    bool _285 = false;
    bool _283 = false;
    bool _279 = false;
    bool _275 = false;
    bool _271 = false;
    bool _267 = false;
    bool _263 = false;
    bool _259 = false;
    bool _255 = false;
    bool _251 = false;
    bool _247 = false;
    bool _243 = false;
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
    bool _110 = !_108;
    float _112 = _95;
    float _114 = _97;
    float _116 = _99;
    float _118 = _101;
    float _120 = _65;
    float _122 = _89;
    float _124 = _45;
    float _126 = _43;
    bool _132;
    float _136;
    float _140;
    float _144;
    float _148;
    float _152;
    float _156;
    if (!_110)
    {
        int _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _130 = _128 != 0;
        _132 = _130;
        if (_130)
        {
            _112 = 255.0;
        }
        float _134 = _112;
        _136 = _134;
        if (_130)
        {
            _114 = 255.0;
        }
        float _138 = _114;
        _140 = _138;
        if (_130)
        {
            _116 = 255.0;
        }
        float _142 = _116;
        _144 = _142;
        if (_130)
        {
            _118 = 255.0;
        }
        float _146 = _118;
        _148 = _146;
        if (_130)
        {
            _120 = _43;
        }
        float _150 = _120;
        _152 = _150;
        if (_130)
        {
            _122 = _45;
        }
        float _154 = _122;
        _156 = _154;
        _158 = _130;
        if (!_158)
        {
            float _160 = trunc(_43);
            int _162 = int(_160);
            float _164 = trunc(_45);
            int _166 = int(_164);
            int _168 = _166 << 1;
            int _170 = _168 + _162;
            int _172 = _170 << 4;
            int _174 = _172 + 224;
            uint _177 = uint(int(uint(_174) >> uint(2)));
            uint _179 = uint(int(uint(int(_177)) >> uint(2)));
            int _181 = int(_177) & 3;
            float _183 = (*spvDescriptorSet0.vp_c3)._m0[int(_179)][_181];
            int _185 = int(_177) + 1;
            uint _187 = uint(int(uint(_185) >> uint(2)));
            int _189 = _185 & 3;
            float _191 = (*spvDescriptorSet0.vp_c3)._m0[int(_187)][_189];
            _152 = _183;
            _156 = _191;
            _124 = as_type<float>(_166);
            _126 = as_type<float>(_162);
            _136 = 255.0;
            _140 = 255.0;
            _144 = 255.0;
            _148 = 255.0;
            _158 = true;
        }
    }
    else
    {
        int _193 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _195 = _193 != 0;
        uint _197 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _199 = int(_197) & 15;
        bool _201 = !_195;
        float _203 = as_type<float>(_199);
        _132 = _195;
        if (!_201)
        {
            uint _205 = min(uint(_199), 13u);
            float _207 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _209 = int(_205) << 2;
            uint _211 = uint(int(uint(_209) >> uint(2)));
            uint _213 = uint(int(uint(int(_211)) >> uint(2)));
            int _215 = int(_211) & 3;
            float _217 = (*spvDescriptorSet0.vp_c1)._m0[int(_213)][_215];
            float _219 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _221 = _207 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _223 = _207 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _225 = _219 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _227 = _219 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _229 = as_type<int>(_217) >> 31;
            bool _231 = as_type<int>(_217) == 1072;
            float _233 = as_type<float>(_229);
            float _235 = _223;
            float _237 = _217;
            float _239 = _227;
            if (!_231)
            {
                bool _241 = as_type<int>(_217) == 1120;
                _243 = _241;
                if (!_243)
                {
                    bool _245 = as_type<int>(_217) == 1184;
                    _247 = _245;
                    if (!_247)
                    {
                        bool _249 = as_type<int>(_217) == 1248;
                        _251 = _249;
                        if (!_251)
                        {
                            bool _253 = as_type<int>(_217) == 1328;
                            _255 = _253;
                            if (!_255)
                            {
                                bool _257 = as_type<int>(_217) == 1408;
                                _259 = _257;
                                if (!_259)
                                {
                                    bool _261 = as_type<int>(_217) == 1504;
                                    _263 = _261;
                                    if (!_263)
                                    {
                                        bool _265 = as_type<int>(_217) == 1584;
                                        _267 = _265;
                                        if (!_267)
                                        {
                                            bool _269 = as_type<int>(_217) == 1680;
                                            _271 = _269;
                                            if (!_271)
                                            {
                                                bool _273 = as_type<int>(_217) == 1744;
                                                _275 = _273;
                                                if (!_275)
                                                {
                                                    bool _277 = as_type<int>(_217) == 1824;
                                                    _279 = _277;
                                                    if (!_279)
                                                    {
                                                        bool _281 = as_type<int>(_217) == 1888;
                                                        _283 = _281;
                                                        if (!_283)
                                                        {
                                                            _285 = true;
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
            float _291;
            float _293;
            if (!_243)
            {
                if (!_247)
                {
                    if (!_251)
                    {
                        if (!_255)
                        {
                            if (!_259)
                            {
                                if (!_263)
                                {
                                    if (!_267)
                                    {
                                        if (!_271)
                                        {
                                            if (!_275)
                                            {
                                                if (!_279)
                                                {
                                                    if (!_283)
                                                    {
                                                        if (!_285)
                                                        {
                                                            float _287 = _221 * _43;
                                                            float _289 = _225 * _45;
                                                            _291 = _289;
                                                            _293 = _287;
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
            if ((((((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255) || _251) || _247) || _243)
            {
                if ((!_247) || _243)
                {
                    if ((!_251) || _243)
                    {
                        if ((!_255) || _243)
                        {
                            if ((!_259) || _243)
                            {
                                if ((!_263) || _243)
                                {
                                    if ((!_267) || _243)
                                    {
                                        if ((!_271) || _243)
                                        {
                                            if ((!_275) || _243)
                                            {
                                                if ((!_279) || _243)
                                                {
                                                    if ((!_283) || _243)
                                                    {
                                                        if ((!_285) || _243)
                                                        {
                                                            _243 = false;
                                                            float _295 = -_223;
                                                            float _297 = _295 + 1.0;
                                                            float _299 = _225 * _45;
                                                            float _301 = fma(_223, _43, _297);
                                                            _291 = _299;
                                                            _293 = _301;
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
                if (((((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255) || _251) || _247)
                {
                    if ((!_251) || _247)
                    {
                        if ((!_255) || _247)
                        {
                            if ((!_259) || _247)
                            {
                                if ((!_263) || _247)
                                {
                                    if ((!_267) || _247)
                                    {
                                        if ((!_271) || _247)
                                        {
                                            if ((!_275) || _247)
                                            {
                                                if ((!_279) || _247)
                                                {
                                                    if ((!_283) || _247)
                                                    {
                                                        if ((!_285) || _247)
                                                        {
                                                            _247 = false;
                                                            float _303 = -_227;
                                                            float _305 = _303 + 1.0;
                                                            float _307 = _221 * _43;
                                                            float _309 = fma(_227, _45, _305);
                                                            _291 = _309;
                                                            _293 = _307;
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
                    if ((((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255) || _251)
                    {
                        if ((!_255) || _251)
                        {
                            if ((!_259) || _251)
                            {
                                if ((!_263) || _251)
                                {
                                    if ((!_267) || _251)
                                    {
                                        if ((!_271) || _251)
                                        {
                                            if ((!_275) || _251)
                                            {
                                                if ((!_279) || _251)
                                                {
                                                    if ((!_283) || _251)
                                                    {
                                                        if ((!_285) || _251)
                                                        {
                                                            _251 = false;
                                                            float _311 = -_223;
                                                            float _313 = _311 + 1.0;
                                                            float _315 = -_227;
                                                            float _317 = _315 + 1.0;
                                                            float _319 = fma(_223, _43, _313);
                                                            float _321 = fma(_227, _45, _317);
                                                            _291 = _321;
                                                            _293 = _319;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259) || _255)
                        {
                            if ((!_259) || _255)
                            {
                                if ((!_263) || _255)
                                {
                                    if ((!_267) || _255)
                                    {
                                        if ((!_271) || _255)
                                        {
                                            if ((!_275) || _255)
                                            {
                                                if ((!_279) || _255)
                                                {
                                                    if ((!_283) || _255)
                                                    {
                                                        if ((!_285) || _255)
                                                        {
                                                            _255 = false;
                                                            float _323 = -_225;
                                                            float _325 = _323 + 1.0;
                                                            float _327 = _221 * _43;
                                                            float _329 = -_227;
                                                            float _331 = _329 + _325;
                                                            float _333 = fma(_331, _45, _225);
                                                            _291 = _333;
                                                            _293 = _327;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263) || _259)
                            {
                                if ((!_263) || _259)
                                {
                                    if ((!_267) || _259)
                                    {
                                        if ((!_271) || _259)
                                        {
                                            if ((!_275) || _259)
                                            {
                                                if ((!_279) || _259)
                                                {
                                                    if ((!_283) || _259)
                                                    {
                                                        if ((!_285) || _259)
                                                        {
                                                            _259 = false;
                                                            float _335 = -_225;
                                                            float _337 = _335 + 1.0;
                                                            float _339 = -_223;
                                                            float _341 = _339 + 1.0;
                                                            float _343 = -_227;
                                                            float _345 = _343 + _337;
                                                            float _347 = fma(_223, _43, _341);
                                                            float _349 = fma(_345, _45, _225);
                                                            _291 = _349;
                                                            _293 = _347;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _285) || _283) || _279) || _275) || _271) || _267) || _263)
                                {
                                    if ((!_267) || _263)
                                    {
                                        if ((!_271) || _263)
                                        {
                                            if ((!_275) || _263)
                                            {
                                                if ((!_279) || _263)
                                                {
                                                    if ((!_283) || _263)
                                                    {
                                                        if ((!_285) || _263)
                                                        {
                                                            _263 = false;
                                                            float _351 = -_221;
                                                            float _353 = _351 + 1.0;
                                                            float _355 = _225 * _45;
                                                            float _357 = -_223;
                                                            float _359 = _357 + _353;
                                                            float _361 = fma(_359, _43, _221);
                                                            _291 = _355;
                                                            _293 = _361;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _285) || _283) || _279) || _275) || _271) || _267)
                                    {
                                        if ((!_271) || _267)
                                        {
                                            if ((!_275) || _267)
                                            {
                                                if ((!_279) || _267)
                                                {
                                                    if ((!_283) || _267)
                                                    {
                                                        if ((!_285) || _267)
                                                        {
                                                            _267 = false;
                                                            float _363 = -_221;
                                                            float _365 = _363 + 1.0;
                                                            float _367 = -_227;
                                                            float _369 = _367 + 1.0;
                                                            float _371 = -_223;
                                                            float _373 = _371 + _365;
                                                            float _375 = fma(_227, _45, _369);
                                                            float _377 = fma(_373, _43, _221);
                                                            _291 = _375;
                                                            _293 = _377;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _285) || _283) || _279) || _275) || _271)
                                        {
                                            if ((!_275) || _271)
                                            {
                                                if ((!_279) || _271)
                                                {
                                                    if ((!_283) || _271)
                                                    {
                                                        if ((!_285) || _271)
                                                        {
                                                            _271 = false;
                                                            float _379 = -_223;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _225 * _45;
                                                            float _385 = _381 * _43;
                                                            _291 = _383;
                                                            _293 = _385;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _285) || _283) || _279) || _275)
                                            {
                                                if ((!_279) || _275)
                                                {
                                                    if ((!_283) || _275)
                                                    {
                                                        if ((!_285) || _275)
                                                        {
                                                            _275 = false;
                                                            float _387 = -_223;
                                                            float _389 = _387 + 1.0;
                                                            float _391 = -_227;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = fma(_223, _43, _389);
                                                            float _397 = _393 * _45;
                                                            _291 = _397;
                                                            _293 = _395;
                                                        }
                                                    }
                                                }
                                                if (((false || _285) || _283) || _279)
                                                {
                                                    if ((!_283) || _279)
                                                    {
                                                        if ((!_285) || _279)
                                                        {
                                                            _279 = false;
                                                            float _399 = -_225;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = _221 * _43;
                                                            float _405 = fma(_401, _45, _225);
                                                            _291 = _405;
                                                            _293 = _403;
                                                        }
                                                    }
                                                    if ((false || _285) || _283)
                                                    {
                                                        if ((!_285) || _283)
                                                        {
                                                            _283 = false;
                                                            float _407 = -_221;
                                                            float _409 = _407 + 1.0;
                                                            float _411 = -_227;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = fma(_409, _43, _221);
                                                            float _417 = fma(_227, _45, _413);
                                                            _291 = _417;
                                                            _293 = _415;
                                                        }
                                                        if (false || _285)
                                                        {
                                                            _285 = false;
                                                            bool _419 = _199 != 12;
                                                            if (!_419)
                                                            {
                                                                float _421 = -_225;
                                                                float _423 = _421 + 1.0;
                                                                _233 = _423;
                                                            }
                                                            float _425 = _233;
                                                            if (!_419)
                                                            {
                                                                float _427 = -_223;
                                                                float _429 = _427 + 1.0;
                                                                _235 = _429;
                                                            }
                                                            float _431 = _235;
                                                            if (_419)
                                                            {
                                                                _237 = 0.0;
                                                            }
                                                            float _433 = _237;
                                                            float _435 = _433;
                                                            if (!_419)
                                                            {
                                                                float _437 = -_227;
                                                                float _439 = _437 + _425;
                                                                _239 = _439;
                                                            }
                                                            float _441 = _239;
                                                            if (_419)
                                                            {
                                                                _203 = 0.0;
                                                            }
                                                            float _443 = _203;
                                                            _291 = _443;
                                                            if (!_419)
                                                            {
                                                                float _445 = _43 * _431;
                                                                _435 = _445;
                                                            }
                                                            float _447 = _435;
                                                            _293 = _447;
                                                            if (!_419)
                                                            {
                                                                float _449 = _45 * _441;
                                                                _291 = _449;
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
            float _451 = _291;
            float _453 = _293;
            float _455 = -_451;
            float _457 = _455 + 1.0;
            float _459 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _461 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _463 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _465 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _467 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _469 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _471 = _451 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _473 = _451 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _475 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].y, _459);
            float _477 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].x, _461);
            float _479 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].x, _463);
            float _481 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].y, _465);
            float _483 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].z, _467);
            float _485 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].z, _469);
            float _487 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[29].w, _471);
            float _489 = fma(_457, (*spvDescriptorSet0.vp_c3)._m0[30].w, _473);
            float _491 = -_453;
            float _493 = _491 + 1.0;
            float _495 = _475 * _453;
            float _497 = _477 * _453;
            float _499 = _483 * _453;
            float _501 = _489 * _453;
            float _503 = fma(_493, _481, _495);
            float _505 = fma(_493, _479, _497);
            float _507 = fma(_493, _485, _499);
            float _509 = fma(_493, _487, _501);
            _152 = _43;
            _156 = _45;
            _136 = _505;
            _140 = _503;
            _144 = _507;
            _148 = _509;
            _158 = true;
        }
        else
        {
            float _511 = trunc(_43);
            int _513 = int(_511);
            bool _515 = _199 != 13;
            float _517 = trunc(_45);
            int _519 = int(_517);
            int _521 = _519 << 1;
            int _523 = _521 + _513;
            int _525 = _523 << 4;
            int _527 = _525 + 224;
            if (!_515)
            {
                float _529 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                uint _531 = uint(int(uint(_527) >> uint(2)));
                uint _533 = uint(int(uint(int(_531)) >> uint(2)));
                int _535 = int(_531) & 3;
                float _537 = (*spvDescriptorSet0.vp_c3)._m0[int(_533)][_535];
                int _539 = int(_531) + 1;
                uint _541 = uint(int(uint(_539) >> uint(2)));
                int _543 = _539 & 3;
                float _545 = (*spvDescriptorSet0.vp_c3)._m0[int(_541)][_543];
                float _547 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _549 = _529 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _551 = -_549;
                float _553 = _551 + 1.0;
                float _555 = _547 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _557 = -_529;
                float _559 = fma(_557, (*spvDescriptorSet0.vp_c3)._m0[26].w, _553);
                float _561 = -_555;
                float _563 = _561 + 1.0;
                float _565 = fma(_559, _45, _549);
                float _567 = -_547;
                float _569 = fma(_567, (*spvDescriptorSet0.vp_c3)._m0[26].y, _563);
                float _571 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _573 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _575 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _577 = fma(_569, _43, _555);
                float _579 = -_565;
                float _581 = _579 + 1.0;
                float _583 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _585 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _587 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _589 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _591 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _593 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].y, _571);
                float _595 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].x, _573);
                float _597 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].x, _575);
                float _599 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].y, _583);
                float _601 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].z, _585);
                float _603 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].z, _587);
                float _605 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[29].w, _589);
                float _607 = fma(_581, (*spvDescriptorSet0.vp_c3)._m0[30].w, _591);
                float _609 = -_577;
                float _611 = _609 + 1.0;
                float _613 = _577 * _593;
                float _615 = _577 * _595;
                float _617 = _577 * _601;
                float _619 = _577 * _607;
                float _621 = fma(_611, _599, _613);
                float _623 = fma(_611, _597, _615);
                float _625 = fma(_611, _603, _617);
                float _627 = fma(_611, _605, _619);
                _152 = _537;
                _156 = _545;
                _124 = _617;
                _126 = _607;
                _136 = _623;
                _140 = _621;
                _144 = _625;
                _148 = _627;
                _158 = true;
            }
            else
            {
                int _629 = _527 + 240;
                uint _631 = uint(int(uint(_629) >> uint(2)));
                uint _633 = uint(int(uint(int(_631)) >> uint(2)));
                int _635 = int(_631) & 3;
                float _637 = (*spvDescriptorSet0.vp_c3)._m0[int(_633)][_635];
                int _639 = int(_631) + 1;
                uint _641 = uint(int(uint(_639) >> uint(2)));
                int _643 = _639 & 3;
                float _645 = (*spvDescriptorSet0.vp_c3)._m0[int(_641)][_643];
                int _647 = _527 + 248;
                uint _649 = uint(int(uint(_647) >> uint(2)));
                uint _651 = uint(int(uint(int(_649)) >> uint(2)));
                int _653 = int(_649) & 3;
                float _655 = (*spvDescriptorSet0.vp_c3)._m0[int(_651)][_653];
                int _657 = int(_649) + 1;
                uint _659 = uint(int(uint(_657) >> uint(2)));
                int _661 = _657 & 3;
                float _663 = (*spvDescriptorSet0.vp_c3)._m0[int(_659)][_661];
                uint _665 = uint(int(uint(_527) >> uint(2)));
                uint _667 = uint(int(uint(int(_665)) >> uint(2)));
                int _669 = int(_665) & 3;
                float _671 = (*spvDescriptorSet0.vp_c3)._m0[int(_667)][_669];
                int _673 = int(_665) + 1;
                uint _675 = uint(int(uint(_673) >> uint(2)));
                int _677 = _673 & 3;
                float _679 = (*spvDescriptorSet0.vp_c3)._m0[int(_675)][_677];
                _152 = _671;
                _156 = _679;
                _136 = _637;
                _140 = _645;
                _144 = _655;
                _148 = _663;
            }
        }
    }
    _158 = false;
    float _681 = _152;
    float _683 = _156;
    bool _685 = _132;
    float _687 = _124;
    float _689 = _126;
    float _691 = _136;
    float _693 = _140;
    float _695 = _144;
    float _697 = _148;
    bool _699 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _701 = !_699;
    float _703 = _687;
    float _705 = _689;
    float _707 = _681;
    float _709 = _683;
    float _723;
    float _725;
    if (!_701)
    {
        float _711 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _713 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _715 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _711);
        float _717 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _713);
        float _719 = _715 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _721 = _717 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _723 = _721;
        _725 = _719;
        _727 = true;
    }
    else
    {
        int _729 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _731 = _729 != 0;
        if (!_731)
        {
            _703 = _681;
        }
        float _733 = _703;
        float _735 = _733;
        _725 = _733;
        if (!_731)
        {
            _705 = _683;
        }
        float _737 = _705;
        bool _739 = !_731;
        float _741 = _737;
        _723 = _737;
        if (!_739)
        {
            if (!_685)
            {
                _735 = _681;
            }
            float _743 = _735;
            float _745 = _743;
            int _747 = as_type<int>(_743);
            if (!_685)
            {
                _741 = _683;
            }
            float _749 = _741;
            bool _751 = !_685;
            float _753 = _749;
            float _755 = _749;
            if (!_751)
            {
                int _757 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _759 = _757 != 0;
                int _761 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _763 = _761 != 0;
                int _765 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _767 = _765 != 0;
                int _769 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _771 = _769 != 0;
                int _773 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _775 = _773 != 0;
                if (_759)
                {
                    _745 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _777 = _745;
                float _779 = _777;
                if (_759)
                {
                    _753 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _781 = _753;
                float _783 = _781;
                if (!_759)
                {
                    _779 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _785 = _779;
                if (!_759)
                {
                    _783 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _787 = _783;
                float _789 = _785 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _791 = _787 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_771)
                {
                    float _793 = _789 * _681;
                    _707 = _793;
                }
                float _795 = _707;
                float _797 = -_789;
                float _799 = _797 + 1.0;
                int _801 = as_type<int>(_795);
                if (_775)
                {
                    float _803 = _791 * _683;
                    _709 = _803;
                }
                float _805 = _709;
                float _807 = -_791;
                float _809 = _807 + 1.0;
                float _811 = _805;
                if (_763)
                {
                    float _813 = _795 + _799;
                    _801 = as_type<int>(_813);
                }
                int _815 = _801;
                if (_767)
                {
                    float _817 = _805 + _809;
                    _811 = _817;
                }
                float _819 = _811;
                _747 = _815;
                _755 = _819;
            }
            int _821 = _747;
            float _823 = _755;
            int _825 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _827 = _825 != 0;
            int _829 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _831 = _829 != 0;
            int _833 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _835 = _833 != 0;
            int _837 = _821;
            int _839 = as_type<int>(_823);
            if (_831)
            {
                float _841 = -as_type<float>(_821);
                float _843 = _841 + 1.0;
                _837 = as_type<int>(_843);
            }
            int _845 = _837;
            if (_835)
            {
                float _847 = -_823;
                float _849 = _847 + 1.0;
                _839 = as_type<int>(_849);
            }
            int _851 = _839;
            bool _853 = !_827;
            float _855 = _853 ? as_type<float>(_845) : as_type<float>(_851);
            bool _857 = !_827;
            float _859 = _857 ? as_type<float>(_851) : as_type<float>(_845);
            _723 = _859;
            _725 = _855;
        }
    }
    _727 = false;
    float _861 = _723;
    float _863 = _725;
    float _865 = _861 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _867 = _861 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _869 = _691 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _871 = _693 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _873 = fma(_863, (*spvDescriptorSet0.vp_c3)._m0[8].x, _865);
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c3)._m0[7].x, _867);
    float _877 = _695 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _879 = _697 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _881 = _873 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _883 = _875 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _885 = -_881;
    float _887 = _885 + 1.0;
    out.m_27.x = _869;
    out.m_27.y = _871;
    out.m_27.z = _877;
    out.m_27.w = _879;
    out.m_29.x = _883;
    out.m_29.y = _887;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

