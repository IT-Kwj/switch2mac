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
    float4 m_31 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1157 = false;
    bool _987 = false;
    bool _809 = false;
    bool _182 = false;
    bool _385 = false;
    bool _383 = false;
    bool _379 = false;
    bool _375 = false;
    bool _371 = false;
    bool _367 = false;
    bool _363 = false;
    bool _359 = false;
    bool _355 = false;
    bool _351 = false;
    bool _347 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_24.x;
    float _49 = in.m_24.y;
    float _51 = -_49;
    float _53 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _55 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _57 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _59 = _53 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _63 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].x, _57);
    float _65 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].x, _59);
    float _67 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].x, _61);
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _73 = _67 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _75 = _69 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _77 = _69 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _79 = _69 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _81 = _69 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].x, _75);
    float _85 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].x, _81);
    float _91 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[0].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[1].z, _85);
    float _95 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[2].z, _87);
    float _97 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[3].z, _89);
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _99;
    out.gl_Position.y = _101;
    out.gl_Position.z = _103;
    out.gl_Position.w = _105;
    int _108 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _112 = _108 != 0;
    bool _114 = !_112;
    float _116 = _71;
    float _118 = _103;
    float _120 = _101;
    float _122 = _99;
    float _124 = _69;
    float _126 = _93;
    float _128 = _103;
    float _130 = _101;
    float _132 = _99;
    float _134 = _105;
    float _136 = _49;
    float _138 = _53;
    float _140 = _55;
    bool _146;
    float _150;
    float _156;
    float _162;
    float _168;
    float _174;
    float _180;
    if (!_114)
    {
        int _142 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _144 = _142 != 0;
        _146 = _144;
        if (_144)
        {
            _116 = 255.0;
        }
        float _148 = _116;
        _150 = _148;
        if (_144)
        {
            _118 = _47;
        }
        float _152 = _118;
        float _154 = _152;
        _156 = _152;
        if (_144)
        {
            _120 = _49;
        }
        float _158 = _120;
        float _160 = _158;
        _162 = _158;
        if (_144)
        {
            _122 = _47;
        }
        float _164 = _122;
        float _166 = _164;
        _168 = _164;
        if (_144)
        {
            _124 = _49;
        }
        float _170 = _124;
        float _172 = _170;
        _174 = _170;
        if (_144)
        {
            _126 = _47;
        }
        float _176 = _126;
        float _178 = _176;
        _180 = _176;
        _182 = _144;
        if (!_182)
        {
            float _184 = trunc(_47);
            int _186 = int(_184);
            float _188 = trunc(_49);
            int _190 = int(_188);
            int _192 = _190 << 1;
            int _194 = _192 + _186;
            int _196 = _194 << 4;
            bool _198 = _196 == 0;
            bool _200 = _196 == 16;
            bool _202 = _196 == 32;
            bool _204 = _196 == 48;
            float _206 = as_type<float>(_190);
            _150 = 255.0;
            if (_198)
            {
                _154 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _208 = _154;
            float _210 = _208;
            if (_198)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _212 = _160;
            float _214 = _212;
            if (_198)
            {
                _166 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _216 = _166;
            float _218 = _216;
            if (_198)
            {
                _172 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _220 = _172;
            float _222 = _220;
            if (_198)
            {
                _178 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _224 = _178;
            float _226 = _224;
            if (_198)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _228 = _206;
            float _230 = _228;
            if (_200)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _232 = _210;
            float _234 = _232;
            if (_200)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _236 = _214;
            float _238 = _236;
            if (_200)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _240 = _218;
            float _242 = _240;
            if (_200)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _244 = _222;
            float _246 = _244;
            if (_200)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _248 = _226;
            float _250 = _248;
            if (_200)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _252 = _230;
            float _254 = _252;
            if (_202)
            {
                _234 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _256 = _234;
            float _258 = _256;
            if (_202)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _260 = _238;
            float _262 = _260;
            if (_202)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _264 = _242;
            float _266 = _264;
            if (_202)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _268 = _246;
            float _270 = _268;
            if (_202)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _272 = _250;
            float _274 = _272;
            if (_202)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _276 = _254;
            float _278 = _276;
            if (_204)
            {
                _258 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _280 = _258;
            _156 = _280;
            if (_204)
            {
                _262 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _282 = _262;
            _162 = _282;
            if (_204)
            {
                _266 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _284 = _266;
            _168 = _284;
            if (_204)
            {
                _270 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _286 = _270;
            _174 = _286;
            if (_204)
            {
                _274 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _288 = _274;
            _180 = _288;
            if (_204)
            {
                _278 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _290 = _278;
            _136 = _290;
            _182 = true;
        }
    }
    else
    {
        int _292 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _294 = _292 != 0;
        uint _297 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _299 = int(_297) & 15;
        bool _301 = !_294;
        float _303 = as_type<float>(_299);
        _146 = _294;
        if (!_301)
        {
            uint _305 = min(uint(_299), 13u);
            float _307 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _309 = int(_305) << 2;
            uint _311 = uint(int(uint(_309) >> uint(2)));
            uint _313 = uint(int(uint(int(_311)) >> uint(2)));
            int _315 = int(_311) & 3;
            float _317 = (*spvDescriptorSet0.vp_c1)._m0[int(_313)][_315];
            float _319 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _321 = _307 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _323 = _307 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _325 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _327 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _329 = as_type<int>(_317) >> 31;
            bool _331 = as_type<int>(_317) == 1456;
            float _333 = as_type<float>(_329);
            float _335 = _323;
            float _337 = _317;
            float _339 = _327;
            if (!_331)
            {
                bool _341 = as_type<int>(_317) == 1504;
                _343 = _341;
                if (!_343)
                {
                    bool _345 = as_type<int>(_317) == 1568;
                    _347 = _345;
                    if (!_347)
                    {
                        bool _349 = as_type<int>(_317) == 1632;
                        _351 = _349;
                        if (!_351)
                        {
                            bool _353 = as_type<int>(_317) == 1712;
                            _355 = _353;
                            if (!_355)
                            {
                                bool _357 = as_type<int>(_317) == 1792;
                                _359 = _357;
                                if (!_359)
                                {
                                    bool _361 = as_type<int>(_317) == 1888;
                                    _363 = _361;
                                    if (!_363)
                                    {
                                        bool _365 = as_type<int>(_317) == 1968;
                                        _367 = _365;
                                        if (!_367)
                                        {
                                            bool _369 = as_type<int>(_317) == 2064;
                                            _371 = _369;
                                            if (!_371)
                                            {
                                                bool _373 = as_type<int>(_317) == 2128;
                                                _375 = _373;
                                                if (!_375)
                                                {
                                                    bool _377 = as_type<int>(_317) == 2208;
                                                    _379 = _377;
                                                    if (!_379)
                                                    {
                                                        bool _381 = as_type<int>(_317) == 2272;
                                                        _383 = _381;
                                                        if (!_383)
                                                        {
                                                            _385 = true;
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
            float _391;
            float _393;
            if (!_343)
            {
                if (!_347)
                {
                    if (!_351)
                    {
                        if (!_355)
                        {
                            if (!_359)
                            {
                                if (!_363)
                                {
                                    if (!_367)
                                    {
                                        if (!_371)
                                        {
                                            if (!_375)
                                            {
                                                if (!_379)
                                                {
                                                    if (!_383)
                                                    {
                                                        if (!_385)
                                                        {
                                                            float _387 = _321 * _47;
                                                            float _389 = _325 * _49;
                                                            _391 = _389;
                                                            _393 = _387;
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
            if ((((((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355) || _351) || _347) || _343)
            {
                if ((!_347) || _343)
                {
                    if ((!_351) || _343)
                    {
                        if ((!_355) || _343)
                        {
                            if ((!_359) || _343)
                            {
                                if ((!_363) || _343)
                                {
                                    if ((!_367) || _343)
                                    {
                                        if ((!_371) || _343)
                                        {
                                            if ((!_375) || _343)
                                            {
                                                if ((!_379) || _343)
                                                {
                                                    if ((!_383) || _343)
                                                    {
                                                        if ((!_385) || _343)
                                                        {
                                                            _343 = false;
                                                            float _395 = -_323;
                                                            float _397 = _395 + 1.0;
                                                            float _399 = _325 * _49;
                                                            float _401 = fma(_323, _47, _397);
                                                            _391 = _399;
                                                            _393 = _401;
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
                if (((((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355) || _351) || _347)
                {
                    if ((!_351) || _347)
                    {
                        if ((!_355) || _347)
                        {
                            if ((!_359) || _347)
                            {
                                if ((!_363) || _347)
                                {
                                    if ((!_367) || _347)
                                    {
                                        if ((!_371) || _347)
                                        {
                                            if ((!_375) || _347)
                                            {
                                                if ((!_379) || _347)
                                                {
                                                    if ((!_383) || _347)
                                                    {
                                                        if ((!_385) || _347)
                                                        {
                                                            _347 = false;
                                                            float _403 = -_327;
                                                            float _405 = _403 + 1.0;
                                                            float _407 = _321 * _47;
                                                            float _409 = fma(_327, _49, _405);
                                                            _391 = _409;
                                                            _393 = _407;
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
                    if ((((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355) || _351)
                    {
                        if ((!_355) || _351)
                        {
                            if ((!_359) || _351)
                            {
                                if ((!_363) || _351)
                                {
                                    if ((!_367) || _351)
                                    {
                                        if ((!_371) || _351)
                                        {
                                            if ((!_375) || _351)
                                            {
                                                if ((!_379) || _351)
                                                {
                                                    if ((!_383) || _351)
                                                    {
                                                        if ((!_385) || _351)
                                                        {
                                                            _351 = false;
                                                            float _411 = -_323;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = -_327;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = fma(_323, _47, _413);
                                                            float _421 = fma(_327, _49, _417);
                                                            _391 = _421;
                                                            _393 = _419;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355)
                        {
                            if ((!_359) || _355)
                            {
                                if ((!_363) || _355)
                                {
                                    if ((!_367) || _355)
                                    {
                                        if ((!_371) || _355)
                                        {
                                            if ((!_375) || _355)
                                            {
                                                if ((!_379) || _355)
                                                {
                                                    if ((!_383) || _355)
                                                    {
                                                        if ((!_385) || _355)
                                                        {
                                                            _355 = false;
                                                            float _423 = -_325;
                                                            float _425 = _423 + 1.0;
                                                            float _427 = _321 * _47;
                                                            float _429 = -_327;
                                                            float _431 = _429 + _425;
                                                            float _433 = fma(_431, _49, _325);
                                                            _391 = _433;
                                                            _393 = _427;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359)
                            {
                                if ((!_363) || _359)
                                {
                                    if ((!_367) || _359)
                                    {
                                        if ((!_371) || _359)
                                        {
                                            if ((!_375) || _359)
                                            {
                                                if ((!_379) || _359)
                                                {
                                                    if ((!_383) || _359)
                                                    {
                                                        if ((!_385) || _359)
                                                        {
                                                            _359 = false;
                                                            float _435 = -_325;
                                                            float _437 = _435 + 1.0;
                                                            float _439 = -_323;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_327;
                                                            float _445 = _443 + _437;
                                                            float _447 = fma(_323, _47, _441);
                                                            float _449 = fma(_445, _49, _325);
                                                            _391 = _449;
                                                            _393 = _447;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363)
                                {
                                    if ((!_367) || _363)
                                    {
                                        if ((!_371) || _363)
                                        {
                                            if ((!_375) || _363)
                                            {
                                                if ((!_379) || _363)
                                                {
                                                    if ((!_383) || _363)
                                                    {
                                                        if ((!_385) || _363)
                                                        {
                                                            _363 = false;
                                                            float _451 = -_321;
                                                            float _453 = _451 + 1.0;
                                                            float _455 = _325 * _49;
                                                            float _457 = -_323;
                                                            float _459 = _457 + _453;
                                                            float _461 = fma(_459, _47, _321);
                                                            _391 = _455;
                                                            _393 = _461;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _385) || _383) || _379) || _375) || _371) || _367)
                                    {
                                        if ((!_371) || _367)
                                        {
                                            if ((!_375) || _367)
                                            {
                                                if ((!_379) || _367)
                                                {
                                                    if ((!_383) || _367)
                                                    {
                                                        if ((!_385) || _367)
                                                        {
                                                            _367 = false;
                                                            float _463 = -_321;
                                                            float _465 = _463 + 1.0;
                                                            float _467 = -_327;
                                                            float _469 = _467 + 1.0;
                                                            float _471 = -_323;
                                                            float _473 = _471 + _465;
                                                            float _475 = fma(_327, _49, _469);
                                                            float _477 = fma(_473, _47, _321);
                                                            _391 = _475;
                                                            _393 = _477;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _385) || _383) || _379) || _375) || _371)
                                        {
                                            if ((!_375) || _371)
                                            {
                                                if ((!_379) || _371)
                                                {
                                                    if ((!_383) || _371)
                                                    {
                                                        if ((!_385) || _371)
                                                        {
                                                            _371 = false;
                                                            float _479 = -_323;
                                                            float _481 = _479 + 1.0;
                                                            float _483 = _325 * _49;
                                                            float _485 = _481 * _47;
                                                            _391 = _483;
                                                            _393 = _485;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _385) || _383) || _379) || _375)
                                            {
                                                if ((!_379) || _375)
                                                {
                                                    if ((!_383) || _375)
                                                    {
                                                        if ((!_385) || _375)
                                                        {
                                                            _375 = false;
                                                            float _487 = -_323;
                                                            float _489 = _487 + 1.0;
                                                            float _491 = -_327;
                                                            float _493 = _491 + 1.0;
                                                            float _495 = fma(_323, _47, _489);
                                                            float _497 = _493 * _49;
                                                            _391 = _497;
                                                            _393 = _495;
                                                        }
                                                    }
                                                }
                                                if (((false || _385) || _383) || _379)
                                                {
                                                    if ((!_383) || _379)
                                                    {
                                                        if ((!_385) || _379)
                                                        {
                                                            _379 = false;
                                                            float _499 = -_325;
                                                            float _501 = _499 + 1.0;
                                                            float _503 = _321 * _47;
                                                            float _505 = fma(_501, _49, _325);
                                                            _391 = _505;
                                                            _393 = _503;
                                                        }
                                                    }
                                                    if ((false || _385) || _383)
                                                    {
                                                        if ((!_385) || _383)
                                                        {
                                                            _383 = false;
                                                            float _507 = -_321;
                                                            float _509 = _507 + 1.0;
                                                            float _511 = -_327;
                                                            float _513 = _511 + 1.0;
                                                            float _515 = fma(_509, _47, _321);
                                                            float _517 = fma(_327, _49, _513);
                                                            _391 = _517;
                                                            _393 = _515;
                                                        }
                                                        if (false || _385)
                                                        {
                                                            _385 = false;
                                                            bool _519 = _299 != 12;
                                                            if (!_519)
                                                            {
                                                                float _521 = -_325;
                                                                float _523 = _521 + 1.0;
                                                                _333 = _523;
                                                            }
                                                            float _525 = _333;
                                                            if (!_519)
                                                            {
                                                                float _527 = -_323;
                                                                float _529 = _527 + 1.0;
                                                                _335 = _529;
                                                            }
                                                            float _531 = _335;
                                                            if (_519)
                                                            {
                                                                _337 = 0.0;
                                                            }
                                                            float _533 = _337;
                                                            float _535 = _533;
                                                            if (!_519)
                                                            {
                                                                float _537 = -_327;
                                                                float _539 = _537 + _525;
                                                                _339 = _539;
                                                            }
                                                            float _541 = _339;
                                                            if (_519)
                                                            {
                                                                _303 = 0.0;
                                                            }
                                                            float _543 = _303;
                                                            _391 = _543;
                                                            if (!_519)
                                                            {
                                                                float _545 = _47 * _531;
                                                                _535 = _545;
                                                            }
                                                            float _547 = _535;
                                                            _393 = _547;
                                                            if (!_519)
                                                            {
                                                                float _549 = _49 * _541;
                                                                _391 = _549;
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
            float _551 = _391;
            float _553 = _393;
            float _555 = -_551;
            float _557 = _555 + 1.0;
            float _559 = _551 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _561 = _551 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _563 = -_553;
            float _565 = _563 + 1.0;
            float _567 = fma(_557, (*spvDescriptorSet0.vp_c3)._m0[30].w, _559);
            float _569 = fma(_557, (*spvDescriptorSet0.vp_c3)._m0[29].w, _561);
            float _571 = _567 * _553;
            float _573 = fma(_565, _569, _571);
            _180 = _47;
            _174 = _49;
            _168 = _47;
            _156 = _47;
            _162 = _49;
            _150 = _573;
            _182 = true;
        }
        else
        {
            float _575 = trunc(_47);
            int _577 = int(_575);
            bool _579 = _299 != 13;
            float _581 = trunc(_49);
            int _583 = int(_581);
            int _585 = _583 << 1;
            int _587 = _585 + _577;
            int _589 = _587 << 4;
            bool _591 = _589 == 0;
            bool _593 = _589 == 16;
            bool _595 = _589 == 32;
            bool _597 = _589 == 48;
            float _599 = as_type<float>(_583);
            float _601 = as_type<float>(_589);
            if (_591)
            {
                _128 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _603 = _128;
            float _605 = _603;
            if (_591)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _607 = _130;
            float _609 = _607;
            if (_591)
            {
                _132 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _611 = _132;
            float _613 = _611;
            if (_591)
            {
                _599 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _615 = _599;
            float _617 = _615;
            if (_591)
            {
                _601 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _619 = _601;
            float _621 = _619;
            if (_591)
            {
                _134 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _623 = _134;
            float _625 = _623;
            if (_593)
            {
                _605 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _627 = _605;
            float _629 = _627;
            if (_593)
            {
                _609 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _631 = _609;
            float _633 = _631;
            if (_593)
            {
                _613 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _635 = _613;
            float _637 = _635;
            if (_593)
            {
                _617 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _639 = _617;
            float _641 = _639;
            if (_593)
            {
                _621 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _643 = _621;
            float _645 = _643;
            if (_593)
            {
                _625 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _647 = _625;
            float _649 = _647;
            if (_595)
            {
                _629 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _651 = _629;
            float _653 = _651;
            if (_595)
            {
                _633 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _655 = _633;
            float _657 = _655;
            if (_595)
            {
                _637 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _659 = _637;
            float _661 = _659;
            if (_595)
            {
                _641 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _663 = _641;
            float _665 = _663;
            if (_595)
            {
                _645 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _667 = _645;
            float _669 = _667;
            if (_595)
            {
                _649 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _671 = _649;
            float _673 = _671;
            if (_597)
            {
                _653 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _675 = _653;
            _156 = _675;
            if (_597)
            {
                _657 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _677 = _657;
            _162 = _677;
            if (_597)
            {
                _661 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _679 = _661;
            _168 = _679;
            if (_597)
            {
                _665 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _681 = _665;
            _174 = _681;
            if (_597)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _683 = _669;
            _180 = _683;
            if (_597)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _685 = _673;
            if (!_579)
            {
                float _687 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _689 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _691 = _687 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _693 = -_691;
                float _695 = _693 + 1.0;
                float _697 = _689 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _699 = -_687;
                float _701 = fma(_699, (*spvDescriptorSet0.vp_c3)._m0[26].w, _695);
                float _703 = -_697;
                float _705 = _703 + 1.0;
                float _707 = fma(_701, _49, _691);
                float _709 = -_689;
                float _711 = fma(_709, (*spvDescriptorSet0.vp_c3)._m0[26].y, _705);
                float _713 = -_707;
                float _715 = _713 + 1.0;
                float _717 = _707 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _719 = _707 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _721 = fma(_711, _47, _697);
                float _723 = fma(_715, (*spvDescriptorSet0.vp_c3)._m0[30].w, _717);
                float _725 = fma(_715, (*spvDescriptorSet0.vp_c3)._m0[29].w, _719);
                float _727 = -_721;
                float _729 = _727 + 1.0;
                float _731 = _721 * _723;
                float _733 = fma(_729, _725, _731);
                _136 = _685;
                _150 = _733;
                _182 = true;
            }
            else
            {
                int _735 = _587 << 4;
                int _737 = _735 + 464;
                int _739 = _737 + 12;
                uint _741 = uint(int(uint(_739) >> uint(2)));
                uint _743 = uint(int(uint(int(_741)) >> uint(2)));
                int _745 = int(_741) & 3;
                float _747 = (*spvDescriptorSet0.vp_c3)._m0[int(_743)][_745];
                _136 = _685;
                _150 = _747;
            }
        }
    }
    _182 = false;
    float _749 = _136;
    float _751 = _180;
    float _753 = _174;
    float _755 = _168;
    float _757 = _156;
    float _759 = _162;
    bool _761 = _146;
    float _763 = _150;
    bool _765 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _767 = !_765;
    float _769 = _753;
    float _771 = _751;
    float _773 = _757;
    float _775 = _759;
    float _777 = _755;
    float _779 = _753;
    float _781 = _751;
    float _783 = _749;
    int _785 = as_type<int>(_751);
    float _787 = _749;
    float _789 = _749;
    float _791 = _751;
    float _805;
    float _807;
    if (!_767)
    {
        float _793 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _795 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _797 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _793);
        float _799 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _795);
        float _801 = _797 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _803 = _799 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _805 = _803;
        _807 = _801;
        _809 = true;
    }
    else
    {
        int _811 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _813 = _811 != 0;
        if (!_813)
        {
            _769 = _757;
        }
        float _815 = _769;
        float _817 = _815;
        _807 = _815;
        if (!_813)
        {
            _771 = _759;
        }
        float _819 = _771;
        bool _821 = !_813;
        float _823 = _819;
        _805 = _819;
        if (!_821)
        {
            if (!_761)
            {
                _817 = _757;
            }
            float _825 = _817;
            float _827 = _825;
            int _829 = as_type<int>(_825);
            if (!_761)
            {
                _823 = _759;
            }
            float _831 = _823;
            bool _833 = !_761;
            float _835 = _831;
            float _837 = _831;
            if (!_833)
            {
                int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _841 = _839 != 0;
                int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _845 = _843 != 0;
                int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _849 = _847 != 0;
                int _851 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _853 = _851 != 0;
                int _855 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _857 = _855 != 0;
                if (_841)
                {
                    _827 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _859 = _827;
                float _861 = _859;
                if (_841)
                {
                    _835 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _863 = _835;
                float _865 = _863;
                if (!_841)
                {
                    _861 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _867 = _861;
                if (!_841)
                {
                    _865 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _869 = _865;
                float _871 = _867 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _873 = _869 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_853)
                {
                    float _875 = _871 * _757;
                    _773 = _875;
                }
                float _877 = _773;
                float _879 = -_871;
                float _881 = _879 + 1.0;
                int _883 = as_type<int>(_877);
                if (_857)
                {
                    float _885 = _873 * _759;
                    _775 = _885;
                }
                float _887 = _775;
                float _889 = -_873;
                float _891 = _889 + 1.0;
                float _893 = _887;
                if (_845)
                {
                    float _895 = _877 + _881;
                    _883 = as_type<int>(_895);
                }
                int _897 = _883;
                if (_849)
                {
                    float _899 = _887 + _891;
                    _893 = _899;
                }
                float _901 = _893;
                _829 = _897;
                _837 = _901;
            }
            int _903 = _829;
            float _905 = _837;
            int _907 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _909 = _907 != 0;
            int _911 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _913 = _911 != 0;
            int _915 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _917 = _915 != 0;
            int _919 = _903;
            int _921 = as_type<int>(_905);
            if (_913)
            {
                float _923 = -as_type<float>(_903);
                float _925 = _923 + 1.0;
                _919 = as_type<int>(_925);
            }
            int _927 = _919;
            if (_917)
            {
                float _929 = -_905;
                float _931 = _929 + 1.0;
                _921 = as_type<int>(_931);
            }
            int _933 = _921;
            bool _935 = !_909;
            float _937 = _935 ? as_type<float>(_927) : as_type<float>(_933);
            bool _939 = !_909;
            float _941 = _939 ? as_type<float>(_933) : as_type<float>(_927);
            _805 = _941;
            _807 = _937;
        }
    }
    _809 = false;
    float _943 = _805;
    float _945 = _807;
    float _947 = _943 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _949 = _943 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _951 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _953 = fma(_945, (*spvDescriptorSet0.vp_c3)._m0[8].x, _947);
    float _955 = fma(_945, (*spvDescriptorSet0.vp_c3)._m0[7].x, _949);
    float _957 = _953 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _959 = _955 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _961 = -_957;
    float _963 = _961 + 1.0;
    out.m_27.x = _959;
    out.m_27.y = _963;
    bool _965 = !_951;
    float _967 = _963;
    float _969 = _959;
    float _983;
    float _985;
    if (!_965)
    {
        float _971 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _973 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _975 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _971);
        float _977 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _973);
        float _979 = _975 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _981 = _977 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _983 = _981;
        _985 = _979;
        _987 = true;
    }
    else
    {
        int _989 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _991 = _989 != 0;
        if (!_991)
        {
            _967 = _755;
        }
        float _993 = _967;
        float _995 = _993;
        _985 = _993;
        if (!_991)
        {
            _969 = _753;
        }
        float _997 = _969;
        bool _999 = !_991;
        float _1001 = _997;
        _983 = _997;
        if (!_999)
        {
            if (!_761)
            {
                _995 = _755;
            }
            float _1003 = _995;
            float _1005 = _1003;
            int _1007 = as_type<int>(_1003);
            if (!_761)
            {
                _1001 = _753;
            }
            float _1009 = _1001;
            bool _1011 = !_761;
            float _1013 = _1009;
            float _1015 = _1009;
            if (!_1011)
            {
                int _1017 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1019 = _1017 != 0;
                int _1021 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1023 = _1021 != 0;
                int _1025 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1027 = _1025 != 0;
                int _1029 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1031 = _1029 != 0;
                int _1033 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1035 = _1033 != 0;
                if (_1019)
                {
                    _1005 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1037 = _1005;
                float _1039 = _1037;
                if (_1019)
                {
                    _1013 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1041 = _1013;
                float _1043 = _1041;
                if (!_1019)
                {
                    _1039 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1045 = _1039;
                if (!_1019)
                {
                    _1043 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1047 = _1043;
                float _1049 = _1045 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1051 = _1047 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1031)
                {
                    float _1053 = _1049 * _755;
                    _777 = _1053;
                }
                float _1055 = _777;
                float _1057 = -_1049;
                float _1059 = _1057 + 1.0;
                int _1061 = as_type<int>(_1055);
                if (_1035)
                {
                    float _1063 = _1051 * _753;
                    _779 = _1063;
                }
                float _1065 = _779;
                float _1067 = -_1051;
                float _1069 = _1067 + 1.0;
                float _1071 = _1065;
                if (_1023)
                {
                    float _1073 = _1055 + _1059;
                    _1061 = as_type<int>(_1073);
                }
                int _1075 = _1061;
                if (_1027)
                {
                    float _1077 = _1065 + _1069;
                    _1071 = _1077;
                }
                float _1079 = _1071;
                _1007 = _1075;
                _1015 = _1079;
            }
            int _1081 = _1007;
            float _1083 = _1015;
            int _1085 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1087 = _1085 != 0;
            int _1089 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1091 = _1089 != 0;
            int _1093 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1095 = _1093 != 0;
            int _1097 = _1081;
            int _1099 = as_type<int>(_1083);
            if (_1091)
            {
                float _1101 = -as_type<float>(_1081);
                float _1103 = _1101 + 1.0;
                _1097 = as_type<int>(_1103);
            }
            int _1105 = _1097;
            if (_1095)
            {
                float _1107 = -_1083;
                float _1109 = _1107 + 1.0;
                _1099 = as_type<int>(_1109);
            }
            int _1111 = _1099;
            bool _1113 = !_1087;
            float _1115 = _1113 ? as_type<float>(_1105) : as_type<float>(_1111);
            bool _1117 = !_1087;
            float _1119 = _1117 ? as_type<float>(_1111) : as_type<float>(_1105);
            _983 = _1119;
            _985 = _1115;
        }
    }
    _987 = false;
    float _1121 = _983;
    float _1123 = _985;
    float _1125 = _1121 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1127 = _1121 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _1129 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _1131 = fma(_1123, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1125);
    float _1133 = fma(_1123, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1127);
    float _1135 = _1131 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1137 = _1133 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1139 = -_1135;
    float _1141 = _1139 + 1.0;
    out.m_29.x = _1137;
    out.m_29.y = _1141;
    bool _1143 = !_1129;
    if (!_1143)
    {
        float _1145 = _53 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _1147 = _53 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _1149 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[22].x, _1145);
        float _1151 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[23].x, _1147);
        float _1153 = _1149 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _1155 = _1151 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _789 = _1155;
        _791 = _1153;
        _1157 = true;
    }
    else
    {
        int _1159 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1161 = _1159 != 0;
        bool _1163 = !_1161;
        if (!_1163)
        {
            bool _1165 = !_761;
            if (!_1165)
            {
                int _1167 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1169 = _1167 != 0;
                int _1171 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1173 = _1171 != 0;
                int _1175 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1177 = _1175 != 0;
                int _1179 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1181 = _1179 != 0;
                int _1183 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1185 = _1183 != 0;
                if (_1169)
                {
                    _138 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1187 = _138;
                float _1189 = _1187;
                if (_1169)
                {
                    _140 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1191 = _140;
                float _1193 = _1191;
                if (!_1169)
                {
                    _1189 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1195 = _1189;
                if (!_1169)
                {
                    _1193 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1197 = _1193;
                float _1199 = _1195 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1201 = _1197 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1181)
                {
                    float _1203 = _1199 * _751;
                    _781 = _1203;
                }
                float _1205 = _781;
                float _1207 = -_1199;
                float _1209 = _1207 + 1.0;
                int _1211 = as_type<int>(_1205);
                if (_1185)
                {
                    float _1213 = _1201 * _749;
                    _783 = _1213;
                }
                float _1215 = _783;
                float _1217 = -_1201;
                float _1219 = _1217 + 1.0;
                _787 = _1215;
                if (_1173)
                {
                    float _1221 = _1205 + _1209;
                    _1211 = as_type<int>(_1221);
                }
                int _1223 = _1211;
                _785 = _1223;
                if (_1177)
                {
                    float _1225 = _1215 + _1219;
                    _787 = _1225;
                }
            }
            int _1227 = _785;
            float _1229 = _787;
            int _1231 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1233 = _1231 != 0;
            int _1235 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1237 = _1235 != 0;
            int _1239 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1241 = _1239 != 0;
            int _1243 = _1227;
            int _1245 = as_type<int>(_1229);
            if (_1237)
            {
                float _1247 = -as_type<float>(_1227);
                float _1249 = _1247 + 1.0;
                _1243 = as_type<int>(_1249);
            }
            int _1251 = _1243;
            if (_1241)
            {
                float _1253 = -_1229;
                float _1255 = _1253 + 1.0;
                _1245 = as_type<int>(_1255);
            }
            int _1257 = _1245;
            bool _1259 = !_1233;
            float _1261 = _1259 ? as_type<float>(_1251) : as_type<float>(_1257);
            bool _1263 = !_1233;
            float _1265 = _1263 ? as_type<float>(_1257) : as_type<float>(_1251);
            _789 = _1265;
            _791 = _1261;
        }
    }
    _1157 = false;
    float _1267 = _789;
    float _1269 = _791;
    float _1271 = _1267 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1273 = _1267 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _1275 = _763 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1277 = fma(_1269, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1271);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1273);
    out.m_31.w = _1275;
    float _1281 = _1277 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1283 = _1279 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _1285 = -_1281;
    float _1287 = _1285 + 1.0;
    out.m_33.x = _1283;
    out.m_33.y = _1287;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1157 = false;
    bool _987 = false;
    bool _809 = false;
    bool _182 = false;
    bool _385 = false;
    bool _383 = false;
    bool _379 = false;
    bool _375 = false;
    bool _371 = false;
    bool _367 = false;
    bool _363 = false;
    bool _359 = false;
    bool _355 = false;
    bool _351 = false;
    bool _347 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_24.x;
    float _49 = in.m_24.y;
    float _51 = -_49;
    float _53 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _55 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _57 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _59 = _53 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _63 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].x, _57);
    float _65 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].x, _59);
    float _67 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].x, _61);
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _73 = _67 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _75 = _69 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _77 = _69 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _79 = _69 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _81 = _69 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].x, _75);
    float _85 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].x, _81);
    float _91 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[0].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[1].z, _85);
    float _95 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[2].z, _87);
    float _97 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[3].z, _89);
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _99;
    out.gl_Position.y = _101;
    out.gl_Position.z = _103;
    out.gl_Position.w = _105;
    int _108 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _112 = _108 != 0;
    bool _114 = !_112;
    float _116 = _71;
    float _118 = _103;
    float _120 = _101;
    float _122 = _99;
    float _124 = _69;
    float _126 = _93;
    float _128 = _103;
    float _130 = _101;
    float _132 = _99;
    float _134 = _105;
    float _136 = _49;
    float _138 = _53;
    float _140 = _55;
    bool _146;
    float _150;
    float _156;
    float _162;
    float _168;
    float _174;
    float _180;
    if (!_114)
    {
        int _142 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _144 = _142 != 0;
        _146 = _144;
        if (_144)
        {
            _116 = 255.0;
        }
        float _148 = _116;
        _150 = _148;
        if (_144)
        {
            _118 = _47;
        }
        float _152 = _118;
        float _154 = _152;
        _156 = _152;
        if (_144)
        {
            _120 = _49;
        }
        float _158 = _120;
        float _160 = _158;
        _162 = _158;
        if (_144)
        {
            _122 = _47;
        }
        float _164 = _122;
        float _166 = _164;
        _168 = _164;
        if (_144)
        {
            _124 = _49;
        }
        float _170 = _124;
        float _172 = _170;
        _174 = _170;
        if (_144)
        {
            _126 = _47;
        }
        float _176 = _126;
        float _178 = _176;
        _180 = _176;
        _182 = _144;
        if (!_182)
        {
            float _184 = trunc(_47);
            int _186 = int(_184);
            float _188 = trunc(_49);
            int _190 = int(_188);
            int _192 = _190 << 1;
            int _194 = _192 + _186;
            int _196 = _194 << 4;
            bool _198 = _196 == 0;
            bool _200 = _196 == 16;
            bool _202 = _196 == 32;
            bool _204 = _196 == 48;
            float _206 = as_type<float>(_190);
            _150 = 255.0;
            if (_198)
            {
                _154 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _208 = _154;
            float _210 = _208;
            if (_198)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _212 = _160;
            float _214 = _212;
            if (_198)
            {
                _166 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _216 = _166;
            float _218 = _216;
            if (_198)
            {
                _172 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _220 = _172;
            float _222 = _220;
            if (_198)
            {
                _178 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _224 = _178;
            float _226 = _224;
            if (_198)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _228 = _206;
            float _230 = _228;
            if (_200)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _232 = _210;
            float _234 = _232;
            if (_200)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _236 = _214;
            float _238 = _236;
            if (_200)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _240 = _218;
            float _242 = _240;
            if (_200)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _244 = _222;
            float _246 = _244;
            if (_200)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _248 = _226;
            float _250 = _248;
            if (_200)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _252 = _230;
            float _254 = _252;
            if (_202)
            {
                _234 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _256 = _234;
            float _258 = _256;
            if (_202)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _260 = _238;
            float _262 = _260;
            if (_202)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _264 = _242;
            float _266 = _264;
            if (_202)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _268 = _246;
            float _270 = _268;
            if (_202)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _272 = _250;
            float _274 = _272;
            if (_202)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _276 = _254;
            float _278 = _276;
            if (_204)
            {
                _258 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _280 = _258;
            _156 = _280;
            if (_204)
            {
                _262 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _282 = _262;
            _162 = _282;
            if (_204)
            {
                _266 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _284 = _266;
            _168 = _284;
            if (_204)
            {
                _270 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _286 = _270;
            _174 = _286;
            if (_204)
            {
                _274 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _288 = _274;
            _180 = _288;
            if (_204)
            {
                _278 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _290 = _278;
            _136 = _290;
            _182 = true;
        }
    }
    else
    {
        int _292 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _294 = _292 != 0;
        uint _297 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _299 = int(_297) & 15;
        bool _301 = !_294;
        float _303 = as_type<float>(_299);
        _146 = _294;
        if (!_301)
        {
            uint _305 = min(uint(_299), 13u);
            float _307 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _309 = int(_305) << 2;
            uint _311 = uint(int(uint(_309) >> uint(2)));
            uint _313 = uint(int(uint(int(_311)) >> uint(2)));
            int _315 = int(_311) & 3;
            float _317 = (*spvDescriptorSet0.vp_c1)._m0[int(_313)][_315];
            float _319 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _321 = _307 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _323 = _307 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _325 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _327 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _329 = as_type<int>(_317) >> 31;
            bool _331 = as_type<int>(_317) == 1456;
            float _333 = as_type<float>(_329);
            float _335 = _323;
            float _337 = _317;
            float _339 = _327;
            if (!_331)
            {
                bool _341 = as_type<int>(_317) == 1504;
                _343 = _341;
                if (!_343)
                {
                    bool _345 = as_type<int>(_317) == 1568;
                    _347 = _345;
                    if (!_347)
                    {
                        bool _349 = as_type<int>(_317) == 1632;
                        _351 = _349;
                        if (!_351)
                        {
                            bool _353 = as_type<int>(_317) == 1712;
                            _355 = _353;
                            if (!_355)
                            {
                                bool _357 = as_type<int>(_317) == 1792;
                                _359 = _357;
                                if (!_359)
                                {
                                    bool _361 = as_type<int>(_317) == 1888;
                                    _363 = _361;
                                    if (!_363)
                                    {
                                        bool _365 = as_type<int>(_317) == 1968;
                                        _367 = _365;
                                        if (!_367)
                                        {
                                            bool _369 = as_type<int>(_317) == 2064;
                                            _371 = _369;
                                            if (!_371)
                                            {
                                                bool _373 = as_type<int>(_317) == 2128;
                                                _375 = _373;
                                                if (!_375)
                                                {
                                                    bool _377 = as_type<int>(_317) == 2208;
                                                    _379 = _377;
                                                    if (!_379)
                                                    {
                                                        bool _381 = as_type<int>(_317) == 2272;
                                                        _383 = _381;
                                                        if (!_383)
                                                        {
                                                            _385 = true;
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
            float _391;
            float _393;
            if (!_343)
            {
                if (!_347)
                {
                    if (!_351)
                    {
                        if (!_355)
                        {
                            if (!_359)
                            {
                                if (!_363)
                                {
                                    if (!_367)
                                    {
                                        if (!_371)
                                        {
                                            if (!_375)
                                            {
                                                if (!_379)
                                                {
                                                    if (!_383)
                                                    {
                                                        if (!_385)
                                                        {
                                                            float _387 = _321 * _47;
                                                            float _389 = _325 * _49;
                                                            _391 = _389;
                                                            _393 = _387;
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
            if ((((((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355) || _351) || _347) || _343)
            {
                if ((!_347) || _343)
                {
                    if ((!_351) || _343)
                    {
                        if ((!_355) || _343)
                        {
                            if ((!_359) || _343)
                            {
                                if ((!_363) || _343)
                                {
                                    if ((!_367) || _343)
                                    {
                                        if ((!_371) || _343)
                                        {
                                            if ((!_375) || _343)
                                            {
                                                if ((!_379) || _343)
                                                {
                                                    if ((!_383) || _343)
                                                    {
                                                        if ((!_385) || _343)
                                                        {
                                                            _343 = false;
                                                            float _395 = -_323;
                                                            float _397 = _395 + 1.0;
                                                            float _399 = _325 * _49;
                                                            float _401 = fma(_323, _47, _397);
                                                            _391 = _399;
                                                            _393 = _401;
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
                if (((((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355) || _351) || _347)
                {
                    if ((!_351) || _347)
                    {
                        if ((!_355) || _347)
                        {
                            if ((!_359) || _347)
                            {
                                if ((!_363) || _347)
                                {
                                    if ((!_367) || _347)
                                    {
                                        if ((!_371) || _347)
                                        {
                                            if ((!_375) || _347)
                                            {
                                                if ((!_379) || _347)
                                                {
                                                    if ((!_383) || _347)
                                                    {
                                                        if ((!_385) || _347)
                                                        {
                                                            _347 = false;
                                                            float _403 = -_327;
                                                            float _405 = _403 + 1.0;
                                                            float _407 = _321 * _47;
                                                            float _409 = fma(_327, _49, _405);
                                                            _391 = _409;
                                                            _393 = _407;
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
                    if ((((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355) || _351)
                    {
                        if ((!_355) || _351)
                        {
                            if ((!_359) || _351)
                            {
                                if ((!_363) || _351)
                                {
                                    if ((!_367) || _351)
                                    {
                                        if ((!_371) || _351)
                                        {
                                            if ((!_375) || _351)
                                            {
                                                if ((!_379) || _351)
                                                {
                                                    if ((!_383) || _351)
                                                    {
                                                        if ((!_385) || _351)
                                                        {
                                                            _351 = false;
                                                            float _411 = -_323;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = -_327;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = fma(_323, _47, _413);
                                                            float _421 = fma(_327, _49, _417);
                                                            _391 = _421;
                                                            _393 = _419;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355)
                        {
                            if ((!_359) || _355)
                            {
                                if ((!_363) || _355)
                                {
                                    if ((!_367) || _355)
                                    {
                                        if ((!_371) || _355)
                                        {
                                            if ((!_375) || _355)
                                            {
                                                if ((!_379) || _355)
                                                {
                                                    if ((!_383) || _355)
                                                    {
                                                        if ((!_385) || _355)
                                                        {
                                                            _355 = false;
                                                            float _423 = -_325;
                                                            float _425 = _423 + 1.0;
                                                            float _427 = _321 * _47;
                                                            float _429 = -_327;
                                                            float _431 = _429 + _425;
                                                            float _433 = fma(_431, _49, _325);
                                                            _391 = _433;
                                                            _393 = _427;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359)
                            {
                                if ((!_363) || _359)
                                {
                                    if ((!_367) || _359)
                                    {
                                        if ((!_371) || _359)
                                        {
                                            if ((!_375) || _359)
                                            {
                                                if ((!_379) || _359)
                                                {
                                                    if ((!_383) || _359)
                                                    {
                                                        if ((!_385) || _359)
                                                        {
                                                            _359 = false;
                                                            float _435 = -_325;
                                                            float _437 = _435 + 1.0;
                                                            float _439 = -_323;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_327;
                                                            float _445 = _443 + _437;
                                                            float _447 = fma(_323, _47, _441);
                                                            float _449 = fma(_445, _49, _325);
                                                            _391 = _449;
                                                            _393 = _447;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363)
                                {
                                    if ((!_367) || _363)
                                    {
                                        if ((!_371) || _363)
                                        {
                                            if ((!_375) || _363)
                                            {
                                                if ((!_379) || _363)
                                                {
                                                    if ((!_383) || _363)
                                                    {
                                                        if ((!_385) || _363)
                                                        {
                                                            _363 = false;
                                                            float _451 = -_321;
                                                            float _453 = _451 + 1.0;
                                                            float _455 = _325 * _49;
                                                            float _457 = -_323;
                                                            float _459 = _457 + _453;
                                                            float _461 = fma(_459, _47, _321);
                                                            _391 = _455;
                                                            _393 = _461;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _385) || _383) || _379) || _375) || _371) || _367)
                                    {
                                        if ((!_371) || _367)
                                        {
                                            if ((!_375) || _367)
                                            {
                                                if ((!_379) || _367)
                                                {
                                                    if ((!_383) || _367)
                                                    {
                                                        if ((!_385) || _367)
                                                        {
                                                            _367 = false;
                                                            float _463 = -_321;
                                                            float _465 = _463 + 1.0;
                                                            float _467 = -_327;
                                                            float _469 = _467 + 1.0;
                                                            float _471 = -_323;
                                                            float _473 = _471 + _465;
                                                            float _475 = fma(_327, _49, _469);
                                                            float _477 = fma(_473, _47, _321);
                                                            _391 = _475;
                                                            _393 = _477;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _385) || _383) || _379) || _375) || _371)
                                        {
                                            if ((!_375) || _371)
                                            {
                                                if ((!_379) || _371)
                                                {
                                                    if ((!_383) || _371)
                                                    {
                                                        if ((!_385) || _371)
                                                        {
                                                            _371 = false;
                                                            float _479 = -_323;
                                                            float _481 = _479 + 1.0;
                                                            float _483 = _325 * _49;
                                                            float _485 = _481 * _47;
                                                            _391 = _483;
                                                            _393 = _485;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _385) || _383) || _379) || _375)
                                            {
                                                if ((!_379) || _375)
                                                {
                                                    if ((!_383) || _375)
                                                    {
                                                        if ((!_385) || _375)
                                                        {
                                                            _375 = false;
                                                            float _487 = -_323;
                                                            float _489 = _487 + 1.0;
                                                            float _491 = -_327;
                                                            float _493 = _491 + 1.0;
                                                            float _495 = fma(_323, _47, _489);
                                                            float _497 = _493 * _49;
                                                            _391 = _497;
                                                            _393 = _495;
                                                        }
                                                    }
                                                }
                                                if (((false || _385) || _383) || _379)
                                                {
                                                    if ((!_383) || _379)
                                                    {
                                                        if ((!_385) || _379)
                                                        {
                                                            _379 = false;
                                                            float _499 = -_325;
                                                            float _501 = _499 + 1.0;
                                                            float _503 = _321 * _47;
                                                            float _505 = fma(_501, _49, _325);
                                                            _391 = _505;
                                                            _393 = _503;
                                                        }
                                                    }
                                                    if ((false || _385) || _383)
                                                    {
                                                        if ((!_385) || _383)
                                                        {
                                                            _383 = false;
                                                            float _507 = -_321;
                                                            float _509 = _507 + 1.0;
                                                            float _511 = -_327;
                                                            float _513 = _511 + 1.0;
                                                            float _515 = fma(_509, _47, _321);
                                                            float _517 = fma(_327, _49, _513);
                                                            _391 = _517;
                                                            _393 = _515;
                                                        }
                                                        if (false || _385)
                                                        {
                                                            _385 = false;
                                                            bool _519 = _299 != 12;
                                                            if (!_519)
                                                            {
                                                                float _521 = -_325;
                                                                float _523 = _521 + 1.0;
                                                                _333 = _523;
                                                            }
                                                            float _525 = _333;
                                                            if (!_519)
                                                            {
                                                                float _527 = -_323;
                                                                float _529 = _527 + 1.0;
                                                                _335 = _529;
                                                            }
                                                            float _531 = _335;
                                                            if (_519)
                                                            {
                                                                _337 = 0.0;
                                                            }
                                                            float _533 = _337;
                                                            float _535 = _533;
                                                            if (!_519)
                                                            {
                                                                float _537 = -_327;
                                                                float _539 = _537 + _525;
                                                                _339 = _539;
                                                            }
                                                            float _541 = _339;
                                                            if (_519)
                                                            {
                                                                _303 = 0.0;
                                                            }
                                                            float _543 = _303;
                                                            _391 = _543;
                                                            if (!_519)
                                                            {
                                                                float _545 = _47 * _531;
                                                                _535 = _545;
                                                            }
                                                            float _547 = _535;
                                                            _393 = _547;
                                                            if (!_519)
                                                            {
                                                                float _549 = _49 * _541;
                                                                _391 = _549;
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
            float _551 = _391;
            float _553 = _393;
            float _555 = -_551;
            float _557 = _555 + 1.0;
            float _559 = _551 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _561 = _551 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _563 = -_553;
            float _565 = _563 + 1.0;
            float _567 = fma(_557, (*spvDescriptorSet0.vp_c3)._m0[30].w, _559);
            float _569 = fma(_557, (*spvDescriptorSet0.vp_c3)._m0[29].w, _561);
            float _571 = _567 * _553;
            float _573 = fma(_565, _569, _571);
            _180 = _47;
            _174 = _49;
            _168 = _47;
            _156 = _47;
            _162 = _49;
            _150 = _573;
            _182 = true;
        }
        else
        {
            float _575 = trunc(_47);
            int _577 = int(_575);
            bool _579 = _299 != 13;
            float _581 = trunc(_49);
            int _583 = int(_581);
            int _585 = _583 << 1;
            int _587 = _585 + _577;
            int _589 = _587 << 4;
            bool _591 = _589 == 0;
            bool _593 = _589 == 16;
            bool _595 = _589 == 32;
            bool _597 = _589 == 48;
            float _599 = as_type<float>(_583);
            float _601 = as_type<float>(_589);
            if (_591)
            {
                _128 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _603 = _128;
            float _605 = _603;
            if (_591)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _607 = _130;
            float _609 = _607;
            if (_591)
            {
                _132 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _611 = _132;
            float _613 = _611;
            if (_591)
            {
                _599 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _615 = _599;
            float _617 = _615;
            if (_591)
            {
                _601 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _619 = _601;
            float _621 = _619;
            if (_591)
            {
                _134 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _623 = _134;
            float _625 = _623;
            if (_593)
            {
                _605 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _627 = _605;
            float _629 = _627;
            if (_593)
            {
                _609 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _631 = _609;
            float _633 = _631;
            if (_593)
            {
                _613 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _635 = _613;
            float _637 = _635;
            if (_593)
            {
                _617 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _639 = _617;
            float _641 = _639;
            if (_593)
            {
                _621 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _643 = _621;
            float _645 = _643;
            if (_593)
            {
                _625 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _647 = _625;
            float _649 = _647;
            if (_595)
            {
                _629 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _651 = _629;
            float _653 = _651;
            if (_595)
            {
                _633 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _655 = _633;
            float _657 = _655;
            if (_595)
            {
                _637 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _659 = _637;
            float _661 = _659;
            if (_595)
            {
                _641 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _663 = _641;
            float _665 = _663;
            if (_595)
            {
                _645 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _667 = _645;
            float _669 = _667;
            if (_595)
            {
                _649 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _671 = _649;
            float _673 = _671;
            if (_597)
            {
                _653 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _675 = _653;
            _156 = _675;
            if (_597)
            {
                _657 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _677 = _657;
            _162 = _677;
            if (_597)
            {
                _661 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _679 = _661;
            _168 = _679;
            if (_597)
            {
                _665 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _681 = _665;
            _174 = _681;
            if (_597)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _683 = _669;
            _180 = _683;
            if (_597)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _685 = _673;
            if (!_579)
            {
                float _687 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _689 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _691 = _687 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _693 = -_691;
                float _695 = _693 + 1.0;
                float _697 = _689 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _699 = -_687;
                float _701 = fma(_699, (*spvDescriptorSet0.vp_c3)._m0[26].w, _695);
                float _703 = -_697;
                float _705 = _703 + 1.0;
                float _707 = fma(_701, _49, _691);
                float _709 = -_689;
                float _711 = fma(_709, (*spvDescriptorSet0.vp_c3)._m0[26].y, _705);
                float _713 = -_707;
                float _715 = _713 + 1.0;
                float _717 = _707 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _719 = _707 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _721 = fma(_711, _47, _697);
                float _723 = fma(_715, (*spvDescriptorSet0.vp_c3)._m0[30].w, _717);
                float _725 = fma(_715, (*spvDescriptorSet0.vp_c3)._m0[29].w, _719);
                float _727 = -_721;
                float _729 = _727 + 1.0;
                float _731 = _721 * _723;
                float _733 = fma(_729, _725, _731);
                _136 = _685;
                _150 = _733;
                _182 = true;
            }
            else
            {
                int _735 = _587 << 4;
                int _737 = _735 + 464;
                int _739 = _737 + 12;
                uint _741 = uint(int(uint(_739) >> uint(2)));
                uint _743 = uint(int(uint(int(_741)) >> uint(2)));
                int _745 = int(_741) & 3;
                float _747 = (*spvDescriptorSet0.vp_c3)._m0[int(_743)][_745];
                _136 = _685;
                _150 = _747;
            }
        }
    }
    _182 = false;
    float _749 = _136;
    float _751 = _180;
    float _753 = _174;
    float _755 = _168;
    float _757 = _156;
    float _759 = _162;
    bool _761 = _146;
    float _763 = _150;
    bool _765 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _767 = !_765;
    float _769 = _753;
    float _771 = _751;
    float _773 = _757;
    float _775 = _759;
    float _777 = _755;
    float _779 = _753;
    float _781 = _751;
    float _783 = _749;
    int _785 = as_type<int>(_751);
    float _787 = _749;
    float _789 = _749;
    float _791 = _751;
    float _805;
    float _807;
    if (!_767)
    {
        float _793 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _795 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _797 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _793);
        float _799 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _795);
        float _801 = _797 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _803 = _799 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _805 = _803;
        _807 = _801;
        _809 = true;
    }
    else
    {
        int _811 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _813 = _811 != 0;
        if (!_813)
        {
            _769 = _757;
        }
        float _815 = _769;
        float _817 = _815;
        _807 = _815;
        if (!_813)
        {
            _771 = _759;
        }
        float _819 = _771;
        bool _821 = !_813;
        float _823 = _819;
        _805 = _819;
        if (!_821)
        {
            if (!_761)
            {
                _817 = _757;
            }
            float _825 = _817;
            float _827 = _825;
            int _829 = as_type<int>(_825);
            if (!_761)
            {
                _823 = _759;
            }
            float _831 = _823;
            bool _833 = !_761;
            float _835 = _831;
            float _837 = _831;
            if (!_833)
            {
                int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _841 = _839 != 0;
                int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _845 = _843 != 0;
                int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _849 = _847 != 0;
                int _851 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _853 = _851 != 0;
                int _855 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _857 = _855 != 0;
                if (_841)
                {
                    _827 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _859 = _827;
                float _861 = _859;
                if (_841)
                {
                    _835 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _863 = _835;
                float _865 = _863;
                if (!_841)
                {
                    _861 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _867 = _861;
                if (!_841)
                {
                    _865 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _869 = _865;
                float _871 = _867 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _873 = _869 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_853)
                {
                    float _875 = _871 * _757;
                    _773 = _875;
                }
                float _877 = _773;
                float _879 = -_871;
                float _881 = _879 + 1.0;
                int _883 = as_type<int>(_877);
                if (_857)
                {
                    float _885 = _873 * _759;
                    _775 = _885;
                }
                float _887 = _775;
                float _889 = -_873;
                float _891 = _889 + 1.0;
                float _893 = _887;
                if (_845)
                {
                    float _895 = _877 + _881;
                    _883 = as_type<int>(_895);
                }
                int _897 = _883;
                if (_849)
                {
                    float _899 = _887 + _891;
                    _893 = _899;
                }
                float _901 = _893;
                _829 = _897;
                _837 = _901;
            }
            int _903 = _829;
            float _905 = _837;
            int _907 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _909 = _907 != 0;
            int _911 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _913 = _911 != 0;
            int _915 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _917 = _915 != 0;
            int _919 = _903;
            int _921 = as_type<int>(_905);
            if (_913)
            {
                float _923 = -as_type<float>(_903);
                float _925 = _923 + 1.0;
                _919 = as_type<int>(_925);
            }
            int _927 = _919;
            if (_917)
            {
                float _929 = -_905;
                float _931 = _929 + 1.0;
                _921 = as_type<int>(_931);
            }
            int _933 = _921;
            bool _935 = !_909;
            float _937 = _935 ? as_type<float>(_927) : as_type<float>(_933);
            bool _939 = !_909;
            float _941 = _939 ? as_type<float>(_933) : as_type<float>(_927);
            _805 = _941;
            _807 = _937;
        }
    }
    _809 = false;
    float _943 = _805;
    float _945 = _807;
    float _947 = _943 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _949 = _943 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _951 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _953 = fma(_945, (*spvDescriptorSet0.vp_c3)._m0[8].x, _947);
    float _955 = fma(_945, (*spvDescriptorSet0.vp_c3)._m0[7].x, _949);
    float _957 = _953 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _959 = _955 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _961 = -_957;
    float _963 = _961 + 1.0;
    out.m_27.x = _959;
    out.m_27.y = _963;
    bool _965 = !_951;
    float _967 = _963;
    float _969 = _959;
    float _983;
    float _985;
    if (!_965)
    {
        float _971 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _973 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _975 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _971);
        float _977 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _973);
        float _979 = _975 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _981 = _977 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _983 = _981;
        _985 = _979;
        _987 = true;
    }
    else
    {
        int _989 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _991 = _989 != 0;
        if (!_991)
        {
            _967 = _755;
        }
        float _993 = _967;
        float _995 = _993;
        _985 = _993;
        if (!_991)
        {
            _969 = _753;
        }
        float _997 = _969;
        bool _999 = !_991;
        float _1001 = _997;
        _983 = _997;
        if (!_999)
        {
            if (!_761)
            {
                _995 = _755;
            }
            float _1003 = _995;
            float _1005 = _1003;
            int _1007 = as_type<int>(_1003);
            if (!_761)
            {
                _1001 = _753;
            }
            float _1009 = _1001;
            bool _1011 = !_761;
            float _1013 = _1009;
            float _1015 = _1009;
            if (!_1011)
            {
                int _1017 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1019 = _1017 != 0;
                int _1021 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1023 = _1021 != 0;
                int _1025 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1027 = _1025 != 0;
                int _1029 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1031 = _1029 != 0;
                int _1033 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1035 = _1033 != 0;
                if (_1019)
                {
                    _1005 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1037 = _1005;
                float _1039 = _1037;
                if (_1019)
                {
                    _1013 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1041 = _1013;
                float _1043 = _1041;
                if (!_1019)
                {
                    _1039 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1045 = _1039;
                if (!_1019)
                {
                    _1043 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1047 = _1043;
                float _1049 = _1045 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1051 = _1047 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1031)
                {
                    float _1053 = _1049 * _755;
                    _777 = _1053;
                }
                float _1055 = _777;
                float _1057 = -_1049;
                float _1059 = _1057 + 1.0;
                int _1061 = as_type<int>(_1055);
                if (_1035)
                {
                    float _1063 = _1051 * _753;
                    _779 = _1063;
                }
                float _1065 = _779;
                float _1067 = -_1051;
                float _1069 = _1067 + 1.0;
                float _1071 = _1065;
                if (_1023)
                {
                    float _1073 = _1055 + _1059;
                    _1061 = as_type<int>(_1073);
                }
                int _1075 = _1061;
                if (_1027)
                {
                    float _1077 = _1065 + _1069;
                    _1071 = _1077;
                }
                float _1079 = _1071;
                _1007 = _1075;
                _1015 = _1079;
            }
            int _1081 = _1007;
            float _1083 = _1015;
            int _1085 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1087 = _1085 != 0;
            int _1089 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1091 = _1089 != 0;
            int _1093 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1095 = _1093 != 0;
            int _1097 = _1081;
            int _1099 = as_type<int>(_1083);
            if (_1091)
            {
                float _1101 = -as_type<float>(_1081);
                float _1103 = _1101 + 1.0;
                _1097 = as_type<int>(_1103);
            }
            int _1105 = _1097;
            if (_1095)
            {
                float _1107 = -_1083;
                float _1109 = _1107 + 1.0;
                _1099 = as_type<int>(_1109);
            }
            int _1111 = _1099;
            bool _1113 = !_1087;
            float _1115 = _1113 ? as_type<float>(_1105) : as_type<float>(_1111);
            bool _1117 = !_1087;
            float _1119 = _1117 ? as_type<float>(_1111) : as_type<float>(_1105);
            _983 = _1119;
            _985 = _1115;
        }
    }
    _987 = false;
    float _1121 = _983;
    float _1123 = _985;
    float _1125 = _1121 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1127 = _1121 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _1129 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _1131 = fma(_1123, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1125);
    float _1133 = fma(_1123, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1127);
    float _1135 = _1131 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1137 = _1133 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1139 = -_1135;
    float _1141 = _1139 + 1.0;
    out.m_29.x = _1137;
    out.m_29.y = _1141;
    bool _1143 = !_1129;
    if (!_1143)
    {
        float _1145 = _53 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _1147 = _53 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _1149 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[22].x, _1145);
        float _1151 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[23].x, _1147);
        float _1153 = _1149 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _1155 = _1151 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _789 = _1155;
        _791 = _1153;
        _1157 = true;
    }
    else
    {
        int _1159 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1161 = _1159 != 0;
        bool _1163 = !_1161;
        if (!_1163)
        {
            bool _1165 = !_761;
            if (!_1165)
            {
                int _1167 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1169 = _1167 != 0;
                int _1171 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1173 = _1171 != 0;
                int _1175 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1177 = _1175 != 0;
                int _1179 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1181 = _1179 != 0;
                int _1183 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1185 = _1183 != 0;
                if (_1169)
                {
                    _138 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1187 = _138;
                float _1189 = _1187;
                if (_1169)
                {
                    _140 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1191 = _140;
                float _1193 = _1191;
                if (!_1169)
                {
                    _1189 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1195 = _1189;
                if (!_1169)
                {
                    _1193 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1197 = _1193;
                float _1199 = _1195 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1201 = _1197 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1181)
                {
                    float _1203 = _1199 * _751;
                    _781 = _1203;
                }
                float _1205 = _781;
                float _1207 = -_1199;
                float _1209 = _1207 + 1.0;
                int _1211 = as_type<int>(_1205);
                if (_1185)
                {
                    float _1213 = _1201 * _749;
                    _783 = _1213;
                }
                float _1215 = _783;
                float _1217 = -_1201;
                float _1219 = _1217 + 1.0;
                _787 = _1215;
                if (_1173)
                {
                    float _1221 = _1205 + _1209;
                    _1211 = as_type<int>(_1221);
                }
                int _1223 = _1211;
                _785 = _1223;
                if (_1177)
                {
                    float _1225 = _1215 + _1219;
                    _787 = _1225;
                }
            }
            int _1227 = _785;
            float _1229 = _787;
            int _1231 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1233 = _1231 != 0;
            int _1235 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1237 = _1235 != 0;
            int _1239 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1241 = _1239 != 0;
            int _1243 = _1227;
            int _1245 = as_type<int>(_1229);
            if (_1237)
            {
                float _1247 = -as_type<float>(_1227);
                float _1249 = _1247 + 1.0;
                _1243 = as_type<int>(_1249);
            }
            int _1251 = _1243;
            if (_1241)
            {
                float _1253 = -_1229;
                float _1255 = _1253 + 1.0;
                _1245 = as_type<int>(_1255);
            }
            int _1257 = _1245;
            bool _1259 = !_1233;
            float _1261 = _1259 ? as_type<float>(_1251) : as_type<float>(_1257);
            bool _1263 = !_1233;
            float _1265 = _1263 ? as_type<float>(_1257) : as_type<float>(_1251);
            _789 = _1265;
            _791 = _1261;
        }
    }
    _1157 = false;
    float _1267 = _789;
    float _1269 = _791;
    float _1271 = _1267 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1273 = _1267 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _1275 = _763 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1277 = fma(_1269, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1271);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1273);
    out.m_31.w = _1275;
    float _1281 = _1277 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1283 = _1279 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _1285 = -_1281;
    float _1287 = _1285 + 1.0;
    out.m_33.x = _1283;
    out.m_33.y = _1287;
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1157 = false;
    bool _987 = false;
    bool _809 = false;
    bool _182 = false;
    bool _385 = false;
    bool _383 = false;
    bool _379 = false;
    bool _375 = false;
    bool _371 = false;
    bool _367 = false;
    bool _363 = false;
    bool _359 = false;
    bool _355 = false;
    bool _351 = false;
    bool _347 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_24.x;
    float _49 = in.m_24.y;
    float _51 = -_49;
    float _53 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _55 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _57 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _59 = _53 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _63 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].x, _57);
    float _65 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].x, _59);
    float _67 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].x, _61);
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _73 = _67 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _75 = _69 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _77 = _69 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _79 = _69 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _81 = _69 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].x, _75);
    float _85 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].x, _81);
    float _91 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[0].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[1].z, _85);
    float _95 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[2].z, _87);
    float _97 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[3].z, _89);
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _99;
    out.gl_Position.y = _101;
    out.gl_Position.z = _103;
    out.gl_Position.w = _105;
    int _108 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _112 = _108 != 0;
    bool _114 = !_112;
    float _116 = _71;
    float _118 = _103;
    float _120 = _101;
    float _122 = _99;
    float _124 = _69;
    float _126 = _93;
    float _128 = _103;
    float _130 = _101;
    float _132 = _99;
    float _134 = _105;
    float _136 = _49;
    float _138 = _53;
    float _140 = _55;
    bool _146;
    float _150;
    float _156;
    float _162;
    float _168;
    float _174;
    float _180;
    if (!_114)
    {
        int _142 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _144 = _142 != 0;
        _146 = _144;
        if (_144)
        {
            _116 = 255.0;
        }
        float _148 = _116;
        _150 = _148;
        if (_144)
        {
            _118 = _47;
        }
        float _152 = _118;
        float _154 = _152;
        _156 = _152;
        if (_144)
        {
            _120 = _49;
        }
        float _158 = _120;
        float _160 = _158;
        _162 = _158;
        if (_144)
        {
            _122 = _47;
        }
        float _164 = _122;
        float _166 = _164;
        _168 = _164;
        if (_144)
        {
            _124 = _49;
        }
        float _170 = _124;
        float _172 = _170;
        _174 = _170;
        if (_144)
        {
            _126 = _47;
        }
        float _176 = _126;
        float _178 = _176;
        _180 = _176;
        _182 = _144;
        if (!_182)
        {
            float _184 = trunc(_47);
            int _186 = int(_184);
            float _188 = trunc(_49);
            int _190 = int(_188);
            int _192 = _190 << 1;
            int _194 = _192 + _186;
            int _196 = _194 << 4;
            bool _198 = _196 == 0;
            bool _200 = _196 == 16;
            bool _202 = _196 == 32;
            bool _204 = _196 == 48;
            float _206 = as_type<float>(_190);
            _150 = 255.0;
            if (_198)
            {
                _154 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _208 = _154;
            float _210 = _208;
            if (_198)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _212 = _160;
            float _214 = _212;
            if (_198)
            {
                _166 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _216 = _166;
            float _218 = _216;
            if (_198)
            {
                _172 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _220 = _172;
            float _222 = _220;
            if (_198)
            {
                _178 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _224 = _178;
            float _226 = _224;
            if (_198)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _228 = _206;
            float _230 = _228;
            if (_200)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _232 = _210;
            float _234 = _232;
            if (_200)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _236 = _214;
            float _238 = _236;
            if (_200)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _240 = _218;
            float _242 = _240;
            if (_200)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _244 = _222;
            float _246 = _244;
            if (_200)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _248 = _226;
            float _250 = _248;
            if (_200)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _252 = _230;
            float _254 = _252;
            if (_202)
            {
                _234 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _256 = _234;
            float _258 = _256;
            if (_202)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _260 = _238;
            float _262 = _260;
            if (_202)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _264 = _242;
            float _266 = _264;
            if (_202)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _268 = _246;
            float _270 = _268;
            if (_202)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _272 = _250;
            float _274 = _272;
            if (_202)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _276 = _254;
            float _278 = _276;
            if (_204)
            {
                _258 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _280 = _258;
            _156 = _280;
            if (_204)
            {
                _262 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _282 = _262;
            _162 = _282;
            if (_204)
            {
                _266 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _284 = _266;
            _168 = _284;
            if (_204)
            {
                _270 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _286 = _270;
            _174 = _286;
            if (_204)
            {
                _274 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _288 = _274;
            _180 = _288;
            if (_204)
            {
                _278 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _290 = _278;
            _136 = _290;
            _182 = true;
        }
    }
    else
    {
        int _292 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _294 = _292 != 0;
        uint _297 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _299 = int(_297) & 15;
        bool _301 = !_294;
        float _303 = as_type<float>(_299);
        _146 = _294;
        if (!_301)
        {
            uint _305 = min(uint(_299), 13u);
            float _307 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _309 = int(_305) << 2;
            uint _311 = uint(int(uint(_309) >> uint(2)));
            uint _313 = uint(int(uint(int(_311)) >> uint(2)));
            int _315 = int(_311) & 3;
            float _317 = (*spvDescriptorSet0.vp_c1)._m0[int(_313)][_315];
            float _319 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _321 = _307 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _323 = _307 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _325 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _327 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _329 = as_type<int>(_317) >> 31;
            bool _331 = as_type<int>(_317) == 1456;
            float _333 = as_type<float>(_329);
            float _335 = _323;
            float _337 = _317;
            float _339 = _327;
            if (!_331)
            {
                bool _341 = as_type<int>(_317) == 1504;
                _343 = _341;
                if (!_343)
                {
                    bool _345 = as_type<int>(_317) == 1568;
                    _347 = _345;
                    if (!_347)
                    {
                        bool _349 = as_type<int>(_317) == 1632;
                        _351 = _349;
                        if (!_351)
                        {
                            bool _353 = as_type<int>(_317) == 1712;
                            _355 = _353;
                            if (!_355)
                            {
                                bool _357 = as_type<int>(_317) == 1792;
                                _359 = _357;
                                if (!_359)
                                {
                                    bool _361 = as_type<int>(_317) == 1888;
                                    _363 = _361;
                                    if (!_363)
                                    {
                                        bool _365 = as_type<int>(_317) == 1968;
                                        _367 = _365;
                                        if (!_367)
                                        {
                                            bool _369 = as_type<int>(_317) == 2064;
                                            _371 = _369;
                                            if (!_371)
                                            {
                                                bool _373 = as_type<int>(_317) == 2128;
                                                _375 = _373;
                                                if (!_375)
                                                {
                                                    bool _377 = as_type<int>(_317) == 2208;
                                                    _379 = _377;
                                                    if (!_379)
                                                    {
                                                        bool _381 = as_type<int>(_317) == 2272;
                                                        _383 = _381;
                                                        if (!_383)
                                                        {
                                                            _385 = true;
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
            float _391;
            float _393;
            if (!_343)
            {
                if (!_347)
                {
                    if (!_351)
                    {
                        if (!_355)
                        {
                            if (!_359)
                            {
                                if (!_363)
                                {
                                    if (!_367)
                                    {
                                        if (!_371)
                                        {
                                            if (!_375)
                                            {
                                                if (!_379)
                                                {
                                                    if (!_383)
                                                    {
                                                        if (!_385)
                                                        {
                                                            float _387 = _321 * _47;
                                                            float _389 = _325 * _49;
                                                            _391 = _389;
                                                            _393 = _387;
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
            if ((((((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355) || _351) || _347) || _343)
            {
                if ((!_347) || _343)
                {
                    if ((!_351) || _343)
                    {
                        if ((!_355) || _343)
                        {
                            if ((!_359) || _343)
                            {
                                if ((!_363) || _343)
                                {
                                    if ((!_367) || _343)
                                    {
                                        if ((!_371) || _343)
                                        {
                                            if ((!_375) || _343)
                                            {
                                                if ((!_379) || _343)
                                                {
                                                    if ((!_383) || _343)
                                                    {
                                                        if ((!_385) || _343)
                                                        {
                                                            _343 = false;
                                                            float _395 = -_323;
                                                            float _397 = _395 + 1.0;
                                                            float _399 = _325 * _49;
                                                            float _401 = fma(_323, _47, _397);
                                                            _391 = _399;
                                                            _393 = _401;
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
                if (((((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355) || _351) || _347)
                {
                    if ((!_351) || _347)
                    {
                        if ((!_355) || _347)
                        {
                            if ((!_359) || _347)
                            {
                                if ((!_363) || _347)
                                {
                                    if ((!_367) || _347)
                                    {
                                        if ((!_371) || _347)
                                        {
                                            if ((!_375) || _347)
                                            {
                                                if ((!_379) || _347)
                                                {
                                                    if ((!_383) || _347)
                                                    {
                                                        if ((!_385) || _347)
                                                        {
                                                            _347 = false;
                                                            float _403 = -_327;
                                                            float _405 = _403 + 1.0;
                                                            float _407 = _321 * _47;
                                                            float _409 = fma(_327, _49, _405);
                                                            _391 = _409;
                                                            _393 = _407;
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
                    if ((((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355) || _351)
                    {
                        if ((!_355) || _351)
                        {
                            if ((!_359) || _351)
                            {
                                if ((!_363) || _351)
                                {
                                    if ((!_367) || _351)
                                    {
                                        if ((!_371) || _351)
                                        {
                                            if ((!_375) || _351)
                                            {
                                                if ((!_379) || _351)
                                                {
                                                    if ((!_383) || _351)
                                                    {
                                                        if ((!_385) || _351)
                                                        {
                                                            _351 = false;
                                                            float _411 = -_323;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = -_327;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = fma(_323, _47, _413);
                                                            float _421 = fma(_327, _49, _417);
                                                            _391 = _421;
                                                            _393 = _419;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359) || _355)
                        {
                            if ((!_359) || _355)
                            {
                                if ((!_363) || _355)
                                {
                                    if ((!_367) || _355)
                                    {
                                        if ((!_371) || _355)
                                        {
                                            if ((!_375) || _355)
                                            {
                                                if ((!_379) || _355)
                                                {
                                                    if ((!_383) || _355)
                                                    {
                                                        if ((!_385) || _355)
                                                        {
                                                            _355 = false;
                                                            float _423 = -_325;
                                                            float _425 = _423 + 1.0;
                                                            float _427 = _321 * _47;
                                                            float _429 = -_327;
                                                            float _431 = _429 + _425;
                                                            float _433 = fma(_431, _49, _325);
                                                            _391 = _433;
                                                            _393 = _427;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363) || _359)
                            {
                                if ((!_363) || _359)
                                {
                                    if ((!_367) || _359)
                                    {
                                        if ((!_371) || _359)
                                        {
                                            if ((!_375) || _359)
                                            {
                                                if ((!_379) || _359)
                                                {
                                                    if ((!_383) || _359)
                                                    {
                                                        if ((!_385) || _359)
                                                        {
                                                            _359 = false;
                                                            float _435 = -_325;
                                                            float _437 = _435 + 1.0;
                                                            float _439 = -_323;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_327;
                                                            float _445 = _443 + _437;
                                                            float _447 = fma(_323, _47, _441);
                                                            float _449 = fma(_445, _49, _325);
                                                            _391 = _449;
                                                            _393 = _447;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _385) || _383) || _379) || _375) || _371) || _367) || _363)
                                {
                                    if ((!_367) || _363)
                                    {
                                        if ((!_371) || _363)
                                        {
                                            if ((!_375) || _363)
                                            {
                                                if ((!_379) || _363)
                                                {
                                                    if ((!_383) || _363)
                                                    {
                                                        if ((!_385) || _363)
                                                        {
                                                            _363 = false;
                                                            float _451 = -_321;
                                                            float _453 = _451 + 1.0;
                                                            float _455 = _325 * _49;
                                                            float _457 = -_323;
                                                            float _459 = _457 + _453;
                                                            float _461 = fma(_459, _47, _321);
                                                            _391 = _455;
                                                            _393 = _461;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _385) || _383) || _379) || _375) || _371) || _367)
                                    {
                                        if ((!_371) || _367)
                                        {
                                            if ((!_375) || _367)
                                            {
                                                if ((!_379) || _367)
                                                {
                                                    if ((!_383) || _367)
                                                    {
                                                        if ((!_385) || _367)
                                                        {
                                                            _367 = false;
                                                            float _463 = -_321;
                                                            float _465 = _463 + 1.0;
                                                            float _467 = -_327;
                                                            float _469 = _467 + 1.0;
                                                            float _471 = -_323;
                                                            float _473 = _471 + _465;
                                                            float _475 = fma(_327, _49, _469);
                                                            float _477 = fma(_473, _47, _321);
                                                            _391 = _475;
                                                            _393 = _477;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _385) || _383) || _379) || _375) || _371)
                                        {
                                            if ((!_375) || _371)
                                            {
                                                if ((!_379) || _371)
                                                {
                                                    if ((!_383) || _371)
                                                    {
                                                        if ((!_385) || _371)
                                                        {
                                                            _371 = false;
                                                            float _479 = -_323;
                                                            float _481 = _479 + 1.0;
                                                            float _483 = _325 * _49;
                                                            float _485 = _481 * _47;
                                                            _391 = _483;
                                                            _393 = _485;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _385) || _383) || _379) || _375)
                                            {
                                                if ((!_379) || _375)
                                                {
                                                    if ((!_383) || _375)
                                                    {
                                                        if ((!_385) || _375)
                                                        {
                                                            _375 = false;
                                                            float _487 = -_323;
                                                            float _489 = _487 + 1.0;
                                                            float _491 = -_327;
                                                            float _493 = _491 + 1.0;
                                                            float _495 = fma(_323, _47, _489);
                                                            float _497 = _493 * _49;
                                                            _391 = _497;
                                                            _393 = _495;
                                                        }
                                                    }
                                                }
                                                if (((false || _385) || _383) || _379)
                                                {
                                                    if ((!_383) || _379)
                                                    {
                                                        if ((!_385) || _379)
                                                        {
                                                            _379 = false;
                                                            float _499 = -_325;
                                                            float _501 = _499 + 1.0;
                                                            float _503 = _321 * _47;
                                                            float _505 = fma(_501, _49, _325);
                                                            _391 = _505;
                                                            _393 = _503;
                                                        }
                                                    }
                                                    if ((false || _385) || _383)
                                                    {
                                                        if ((!_385) || _383)
                                                        {
                                                            _383 = false;
                                                            float _507 = -_321;
                                                            float _509 = _507 + 1.0;
                                                            float _511 = -_327;
                                                            float _513 = _511 + 1.0;
                                                            float _515 = fma(_509, _47, _321);
                                                            float _517 = fma(_327, _49, _513);
                                                            _391 = _517;
                                                            _393 = _515;
                                                        }
                                                        if (false || _385)
                                                        {
                                                            _385 = false;
                                                            bool _519 = _299 != 12;
                                                            if (!_519)
                                                            {
                                                                float _521 = -_325;
                                                                float _523 = _521 + 1.0;
                                                                _333 = _523;
                                                            }
                                                            float _525 = _333;
                                                            if (!_519)
                                                            {
                                                                float _527 = -_323;
                                                                float _529 = _527 + 1.0;
                                                                _335 = _529;
                                                            }
                                                            float _531 = _335;
                                                            if (_519)
                                                            {
                                                                _337 = 0.0;
                                                            }
                                                            float _533 = _337;
                                                            float _535 = _533;
                                                            if (!_519)
                                                            {
                                                                float _537 = -_327;
                                                                float _539 = _537 + _525;
                                                                _339 = _539;
                                                            }
                                                            float _541 = _339;
                                                            if (_519)
                                                            {
                                                                _303 = 0.0;
                                                            }
                                                            float _543 = _303;
                                                            _391 = _543;
                                                            if (!_519)
                                                            {
                                                                float _545 = _47 * _531;
                                                                _535 = _545;
                                                            }
                                                            float _547 = _535;
                                                            _393 = _547;
                                                            if (!_519)
                                                            {
                                                                float _549 = _49 * _541;
                                                                _391 = _549;
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
            float _551 = _391;
            float _553 = _393;
            float _555 = -_551;
            float _557 = _555 + 1.0;
            float _559 = _551 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _561 = _551 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _563 = -_553;
            float _565 = _563 + 1.0;
            float _567 = fma(_557, (*spvDescriptorSet0.vp_c3)._m0[30].w, _559);
            float _569 = fma(_557, (*spvDescriptorSet0.vp_c3)._m0[29].w, _561);
            float _571 = _567 * _553;
            float _573 = fma(_565, _569, _571);
            _180 = _47;
            _174 = _49;
            _168 = _47;
            _156 = _47;
            _162 = _49;
            _150 = _573;
            _182 = true;
        }
        else
        {
            float _575 = trunc(_47);
            int _577 = int(_575);
            bool _579 = _299 != 13;
            float _581 = trunc(_49);
            int _583 = int(_581);
            int _585 = _583 << 1;
            int _587 = _585 + _577;
            int _589 = _587 << 4;
            bool _591 = _589 == 0;
            bool _593 = _589 == 16;
            bool _595 = _589 == 32;
            bool _597 = _589 == 48;
            float _599 = as_type<float>(_583);
            float _601 = as_type<float>(_589);
            if (_591)
            {
                _128 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _603 = _128;
            float _605 = _603;
            if (_591)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _607 = _130;
            float _609 = _607;
            if (_591)
            {
                _132 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _611 = _132;
            float _613 = _611;
            if (_591)
            {
                _599 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _615 = _599;
            float _617 = _615;
            if (_591)
            {
                _601 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _619 = _601;
            float _621 = _619;
            if (_591)
            {
                _134 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _623 = _134;
            float _625 = _623;
            if (_593)
            {
                _605 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _627 = _605;
            float _629 = _627;
            if (_593)
            {
                _609 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _631 = _609;
            float _633 = _631;
            if (_593)
            {
                _613 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _635 = _613;
            float _637 = _635;
            if (_593)
            {
                _617 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _639 = _617;
            float _641 = _639;
            if (_593)
            {
                _621 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _643 = _621;
            float _645 = _643;
            if (_593)
            {
                _625 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _647 = _625;
            float _649 = _647;
            if (_595)
            {
                _629 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _651 = _629;
            float _653 = _651;
            if (_595)
            {
                _633 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _655 = _633;
            float _657 = _655;
            if (_595)
            {
                _637 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _659 = _637;
            float _661 = _659;
            if (_595)
            {
                _641 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _663 = _641;
            float _665 = _663;
            if (_595)
            {
                _645 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _667 = _645;
            float _669 = _667;
            if (_595)
            {
                _649 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _671 = _649;
            float _673 = _671;
            if (_597)
            {
                _653 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _675 = _653;
            _156 = _675;
            if (_597)
            {
                _657 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _677 = _657;
            _162 = _677;
            if (_597)
            {
                _661 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _679 = _661;
            _168 = _679;
            if (_597)
            {
                _665 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _681 = _665;
            _174 = _681;
            if (_597)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _683 = _669;
            _180 = _683;
            if (_597)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _685 = _673;
            if (!_579)
            {
                float _687 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _689 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _691 = _687 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _693 = -_691;
                float _695 = _693 + 1.0;
                float _697 = _689 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _699 = -_687;
                float _701 = fma(_699, (*spvDescriptorSet0.vp_c3)._m0[26].w, _695);
                float _703 = -_697;
                float _705 = _703 + 1.0;
                float _707 = fma(_701, _49, _691);
                float _709 = -_689;
                float _711 = fma(_709, (*spvDescriptorSet0.vp_c3)._m0[26].y, _705);
                float _713 = -_707;
                float _715 = _713 + 1.0;
                float _717 = _707 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _719 = _707 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _721 = fma(_711, _47, _697);
                float _723 = fma(_715, (*spvDescriptorSet0.vp_c3)._m0[30].w, _717);
                float _725 = fma(_715, (*spvDescriptorSet0.vp_c3)._m0[29].w, _719);
                float _727 = -_721;
                float _729 = _727 + 1.0;
                float _731 = _721 * _723;
                float _733 = fma(_729, _725, _731);
                _136 = _685;
                _150 = _733;
                _182 = true;
            }
            else
            {
                int _735 = _587 << 4;
                int _737 = _735 + 464;
                int _739 = _737 + 12;
                uint _741 = uint(int(uint(_739) >> uint(2)));
                uint _743 = uint(int(uint(int(_741)) >> uint(2)));
                int _745 = int(_741) & 3;
                float _747 = (*spvDescriptorSet0.vp_c3)._m0[int(_743)][_745];
                _136 = _685;
                _150 = _747;
            }
        }
    }
    _182 = false;
    float _749 = _136;
    float _751 = _180;
    float _753 = _174;
    float _755 = _168;
    float _757 = _156;
    float _759 = _162;
    bool _761 = _146;
    float _763 = _150;
    bool _765 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _767 = !_765;
    float _769 = _753;
    float _771 = _751;
    float _773 = _757;
    float _775 = _759;
    float _777 = _755;
    float _779 = _753;
    float _781 = _751;
    float _783 = _749;
    int _785 = as_type<int>(_751);
    float _787 = _749;
    float _789 = _749;
    float _791 = _751;
    float _805;
    float _807;
    if (!_767)
    {
        float _793 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _795 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _797 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _793);
        float _799 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _795);
        float _801 = _797 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _803 = _799 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _805 = _803;
        _807 = _801;
        _809 = true;
    }
    else
    {
        int _811 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _813 = _811 != 0;
        if (!_813)
        {
            _769 = _757;
        }
        float _815 = _769;
        float _817 = _815;
        _807 = _815;
        if (!_813)
        {
            _771 = _759;
        }
        float _819 = _771;
        bool _821 = !_813;
        float _823 = _819;
        _805 = _819;
        if (!_821)
        {
            if (!_761)
            {
                _817 = _757;
            }
            float _825 = _817;
            float _827 = _825;
            int _829 = as_type<int>(_825);
            if (!_761)
            {
                _823 = _759;
            }
            float _831 = _823;
            bool _833 = !_761;
            float _835 = _831;
            float _837 = _831;
            if (!_833)
            {
                int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _841 = _839 != 0;
                int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _845 = _843 != 0;
                int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _849 = _847 != 0;
                int _851 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _853 = _851 != 0;
                int _855 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _857 = _855 != 0;
                if (_841)
                {
                    _827 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _859 = _827;
                float _861 = _859;
                if (_841)
                {
                    _835 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _863 = _835;
                float _865 = _863;
                if (!_841)
                {
                    _861 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _867 = _861;
                if (!_841)
                {
                    _865 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _869 = _865;
                float _871 = _867 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _873 = _869 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_853)
                {
                    float _875 = _871 * _757;
                    _773 = _875;
                }
                float _877 = _773;
                float _879 = -_871;
                float _881 = _879 + 1.0;
                int _883 = as_type<int>(_877);
                if (_857)
                {
                    float _885 = _873 * _759;
                    _775 = _885;
                }
                float _887 = _775;
                float _889 = -_873;
                float _891 = _889 + 1.0;
                float _893 = _887;
                if (_845)
                {
                    float _895 = _877 + _881;
                    _883 = as_type<int>(_895);
                }
                int _897 = _883;
                if (_849)
                {
                    float _899 = _887 + _891;
                    _893 = _899;
                }
                float _901 = _893;
                _829 = _897;
                _837 = _901;
            }
            int _903 = _829;
            float _905 = _837;
            int _907 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _909 = _907 != 0;
            int _911 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _913 = _911 != 0;
            int _915 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _917 = _915 != 0;
            int _919 = _903;
            int _921 = as_type<int>(_905);
            if (_913)
            {
                float _923 = -as_type<float>(_903);
                float _925 = _923 + 1.0;
                _919 = as_type<int>(_925);
            }
            int _927 = _919;
            if (_917)
            {
                float _929 = -_905;
                float _931 = _929 + 1.0;
                _921 = as_type<int>(_931);
            }
            int _933 = _921;
            bool _935 = !_909;
            float _937 = _935 ? as_type<float>(_927) : as_type<float>(_933);
            bool _939 = !_909;
            float _941 = _939 ? as_type<float>(_933) : as_type<float>(_927);
            _805 = _941;
            _807 = _937;
        }
    }
    _809 = false;
    float _943 = _805;
    float _945 = _807;
    float _947 = _943 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _949 = _943 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _951 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _953 = fma(_945, (*spvDescriptorSet0.vp_c3)._m0[8].x, _947);
    float _955 = fma(_945, (*spvDescriptorSet0.vp_c3)._m0[7].x, _949);
    float _957 = _953 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _959 = _955 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _961 = -_957;
    float _963 = _961 + 1.0;
    out.m_27.x = _959;
    out.m_27.y = _963;
    bool _965 = !_951;
    float _967 = _963;
    float _969 = _959;
    float _983;
    float _985;
    if (!_965)
    {
        float _971 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _973 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _975 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _971);
        float _977 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _973);
        float _979 = _975 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _981 = _977 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _983 = _981;
        _985 = _979;
        _987 = true;
    }
    else
    {
        int _989 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _991 = _989 != 0;
        if (!_991)
        {
            _967 = _755;
        }
        float _993 = _967;
        float _995 = _993;
        _985 = _993;
        if (!_991)
        {
            _969 = _753;
        }
        float _997 = _969;
        bool _999 = !_991;
        float _1001 = _997;
        _983 = _997;
        if (!_999)
        {
            if (!_761)
            {
                _995 = _755;
            }
            float _1003 = _995;
            float _1005 = _1003;
            int _1007 = as_type<int>(_1003);
            if (!_761)
            {
                _1001 = _753;
            }
            float _1009 = _1001;
            bool _1011 = !_761;
            float _1013 = _1009;
            float _1015 = _1009;
            if (!_1011)
            {
                int _1017 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1019 = _1017 != 0;
                int _1021 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1023 = _1021 != 0;
                int _1025 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1027 = _1025 != 0;
                int _1029 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1031 = _1029 != 0;
                int _1033 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1035 = _1033 != 0;
                if (_1019)
                {
                    _1005 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1037 = _1005;
                float _1039 = _1037;
                if (_1019)
                {
                    _1013 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1041 = _1013;
                float _1043 = _1041;
                if (!_1019)
                {
                    _1039 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1045 = _1039;
                if (!_1019)
                {
                    _1043 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1047 = _1043;
                float _1049 = _1045 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1051 = _1047 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1031)
                {
                    float _1053 = _1049 * _755;
                    _777 = _1053;
                }
                float _1055 = _777;
                float _1057 = -_1049;
                float _1059 = _1057 + 1.0;
                int _1061 = as_type<int>(_1055);
                if (_1035)
                {
                    float _1063 = _1051 * _753;
                    _779 = _1063;
                }
                float _1065 = _779;
                float _1067 = -_1051;
                float _1069 = _1067 + 1.0;
                float _1071 = _1065;
                if (_1023)
                {
                    float _1073 = _1055 + _1059;
                    _1061 = as_type<int>(_1073);
                }
                int _1075 = _1061;
                if (_1027)
                {
                    float _1077 = _1065 + _1069;
                    _1071 = _1077;
                }
                float _1079 = _1071;
                _1007 = _1075;
                _1015 = _1079;
            }
            int _1081 = _1007;
            float _1083 = _1015;
            int _1085 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1087 = _1085 != 0;
            int _1089 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1091 = _1089 != 0;
            int _1093 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1095 = _1093 != 0;
            int _1097 = _1081;
            int _1099 = as_type<int>(_1083);
            if (_1091)
            {
                float _1101 = -as_type<float>(_1081);
                float _1103 = _1101 + 1.0;
                _1097 = as_type<int>(_1103);
            }
            int _1105 = _1097;
            if (_1095)
            {
                float _1107 = -_1083;
                float _1109 = _1107 + 1.0;
                _1099 = as_type<int>(_1109);
            }
            int _1111 = _1099;
            bool _1113 = !_1087;
            float _1115 = _1113 ? as_type<float>(_1105) : as_type<float>(_1111);
            bool _1117 = !_1087;
            float _1119 = _1117 ? as_type<float>(_1111) : as_type<float>(_1105);
            _983 = _1119;
            _985 = _1115;
        }
    }
    _987 = false;
    float _1121 = _983;
    float _1123 = _985;
    float _1125 = _1121 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1127 = _1121 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _1129 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _1131 = fma(_1123, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1125);
    float _1133 = fma(_1123, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1127);
    float _1135 = _1131 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1137 = _1133 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1139 = -_1135;
    float _1141 = _1139 + 1.0;
    out.m_29.x = _1137;
    out.m_29.y = _1141;
    bool _1143 = !_1129;
    if (!_1143)
    {
        float _1145 = _53 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _1147 = _53 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _1149 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[22].x, _1145);
        float _1151 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[23].x, _1147);
        float _1153 = _1149 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _1155 = _1151 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _789 = _1155;
        _791 = _1153;
        _1157 = true;
    }
    else
    {
        int _1159 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1161 = _1159 != 0;
        bool _1163 = !_1161;
        if (!_1163)
        {
            bool _1165 = !_761;
            if (!_1165)
            {
                int _1167 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1169 = _1167 != 0;
                int _1171 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1173 = _1171 != 0;
                int _1175 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1177 = _1175 != 0;
                int _1179 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1181 = _1179 != 0;
                int _1183 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1185 = _1183 != 0;
                if (_1169)
                {
                    _138 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1187 = _138;
                float _1189 = _1187;
                if (_1169)
                {
                    _140 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1191 = _140;
                float _1193 = _1191;
                if (!_1169)
                {
                    _1189 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1195 = _1189;
                if (!_1169)
                {
                    _1193 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1197 = _1193;
                float _1199 = _1195 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1201 = _1197 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1181)
                {
                    float _1203 = _1199 * _751;
                    _781 = _1203;
                }
                float _1205 = _781;
                float _1207 = -_1199;
                float _1209 = _1207 + 1.0;
                int _1211 = as_type<int>(_1205);
                if (_1185)
                {
                    float _1213 = _1201 * _749;
                    _783 = _1213;
                }
                float _1215 = _783;
                float _1217 = -_1201;
                float _1219 = _1217 + 1.0;
                _787 = _1215;
                if (_1173)
                {
                    float _1221 = _1205 + _1209;
                    _1211 = as_type<int>(_1221);
                }
                int _1223 = _1211;
                _785 = _1223;
                if (_1177)
                {
                    float _1225 = _1215 + _1219;
                    _787 = _1225;
                }
            }
            int _1227 = _785;
            float _1229 = _787;
            int _1231 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1233 = _1231 != 0;
            int _1235 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1237 = _1235 != 0;
            int _1239 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1241 = _1239 != 0;
            int _1243 = _1227;
            int _1245 = as_type<int>(_1229);
            if (_1237)
            {
                float _1247 = -as_type<float>(_1227);
                float _1249 = _1247 + 1.0;
                _1243 = as_type<int>(_1249);
            }
            int _1251 = _1243;
            if (_1241)
            {
                float _1253 = -_1229;
                float _1255 = _1253 + 1.0;
                _1245 = as_type<int>(_1255);
            }
            int _1257 = _1245;
            bool _1259 = !_1233;
            float _1261 = _1259 ? as_type<float>(_1251) : as_type<float>(_1257);
            bool _1263 = !_1233;
            float _1265 = _1263 ? as_type<float>(_1257) : as_type<float>(_1251);
            _789 = _1265;
            _791 = _1261;
        }
    }
    _1157 = false;
    float _1267 = _789;
    float _1269 = _791;
    float _1271 = _1267 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1273 = _1267 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _1275 = _763 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1277 = fma(_1269, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1271);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1273);
    out.m_31.w = _1275;
    float _1281 = _1277 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1283 = _1279 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _1285 = -_1281;
    float _1287 = _1285 + 1.0;
    out.m_33.x = _1283;
    out.m_33.y = _1287;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

