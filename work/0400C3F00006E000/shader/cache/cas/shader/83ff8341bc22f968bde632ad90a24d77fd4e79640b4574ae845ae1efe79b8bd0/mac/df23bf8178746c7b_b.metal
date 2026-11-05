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
    bool _1277 = false;
    bool _1107 = false;
    bool _929 = false;
    bool _196 = false;
    bool _399 = false;
    bool _397 = false;
    bool _393 = false;
    bool _389 = false;
    bool _385 = false;
    bool _381 = false;
    bool _377 = false;
    bool _373 = false;
    bool _369 = false;
    bool _365 = false;
    bool _361 = false;
    bool _357 = false;
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
    float _75 = _69 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _77 = _69 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _79 = _69 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _81 = _69 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _85 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].x, _81);
    float _91 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[1].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[0].z, _85);
    float _95 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[2].z, _87);
    float _97 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[3].z, _89);
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _101;
    out.gl_Position.y = _99;
    out.gl_Position.z = _103;
    out.gl_Position.w = _105;
    int _108 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _112 = _108 != 0;
    bool _114 = !_112;
    float _116 = _89;
    float _118 = _73;
    float _120 = _101;
    float _122 = _99;
    float _124 = _103;
    float _126 = _105;
    float _128 = _89;
    float _130 = _73;
    float _132 = _49;
    float _134 = _53;
    float _136 = _55;
    bool _144;
    float _152;
    float _160;
    float _166;
    float _172;
    float _178;
    float _182;
    float _186;
    float _190;
    float _194;
    if (!_114)
    {
        int _138 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _140 = _138 != 0;
        float _142 = 0.0;
        _144 = _140;
        if (_140)
        {
            _142 = _47;
        }
        float _146 = _142;
        float _148 = 0.0;
        float _150 = _146;
        _152 = _146;
        if (_140)
        {
            _148 = _49;
        }
        float _154 = _148;
        float _156 = 0.0;
        float _158 = _154;
        _160 = _154;
        if (_140)
        {
            _156 = _47;
        }
        float _162 = _156;
        float _164 = _162;
        _166 = _162;
        if (_140)
        {
            _116 = _49;
        }
        float _168 = _116;
        float _170 = _168;
        _172 = _168;
        if (_140)
        {
            _118 = _47;
        }
        float _174 = _118;
        float _176 = _174;
        _178 = _174;
        if (_140)
        {
            _120 = 255.0;
        }
        float _180 = _120;
        _182 = _180;
        if (_140)
        {
            _122 = 255.0;
        }
        float _184 = _122;
        _186 = _184;
        if (_140)
        {
            _124 = 255.0;
        }
        float _188 = _124;
        _190 = _188;
        if (_140)
        {
            _126 = 255.0;
        }
        float _192 = _126;
        _194 = _192;
        _196 = _140;
        if (!_196)
        {
            float _198 = trunc(_47);
            int _200 = int(_198);
            float _202 = trunc(_49);
            int _204 = int(_202);
            int _206 = _204 << 1;
            int _208 = _206 + _200;
            int _210 = _208 << 4;
            bool _212 = _210 == 0;
            bool _214 = _210 == 16;
            bool _216 = _210 == 32;
            bool _218 = _210 == 48;
            float _220 = as_type<float>(_204);
            _182 = 255.0;
            _186 = 255.0;
            _190 = 255.0;
            _194 = 255.0;
            if (_212)
            {
                _150 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _222 = _150;
            float _224 = _222;
            if (_212)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _226 = _158;
            float _228 = _226;
            if (_212)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _230 = _164;
            float _232 = _230;
            if (_212)
            {
                _170 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _234 = _170;
            float _236 = _234;
            if (_212)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _238 = _176;
            float _240 = _238;
            if (_212)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _242 = _220;
            float _244 = _242;
            if (_214)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _246 = _224;
            float _248 = _246;
            if (_214)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _250 = _228;
            float _252 = _250;
            if (_214)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _254 = _232;
            float _256 = _254;
            if (_214)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _258 = _236;
            float _260 = _258;
            if (_214)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _262 = _240;
            float _264 = _262;
            if (_214)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _266 = _244;
            float _268 = _266;
            if (_216)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _270 = _248;
            float _272 = _270;
            if (_216)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _274 = _252;
            float _276 = _274;
            if (_216)
            {
                _256 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _278 = _256;
            float _280 = _278;
            if (_216)
            {
                _260 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _282 = _260;
            float _284 = _282;
            if (_216)
            {
                _264 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _286 = _264;
            float _288 = _286;
            if (_216)
            {
                _268 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _290 = _268;
            float _292 = _290;
            if (_218)
            {
                _272 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _294 = _272;
            _152 = _294;
            if (_218)
            {
                _276 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _296 = _276;
            _160 = _296;
            if (_218)
            {
                _280 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _298 = _280;
            _166 = _298;
            if (_218)
            {
                _284 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _300 = _284;
            _172 = _300;
            if (_218)
            {
                _288 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _302 = _288;
            _178 = _302;
            if (_218)
            {
                _292 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _304 = _292;
            _132 = _304;
            _196 = true;
        }
    }
    else
    {
        int _306 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _308 = _306 != 0;
        uint _311 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _313 = int(_311) & 15;
        bool _315 = !_308;
        _144 = _308;
        if (!_315)
        {
            uint _317 = min(uint(_313), 13u);
            float _319 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _321 = int(_317) << 2;
            uint _323 = uint(int(uint(_321) >> uint(2)));
            uint _325 = uint(int(uint(int(_323)) >> uint(2)));
            int _327 = int(_323) & 3;
            float _329 = (*spvDescriptorSet0.vp_c1)._m0[int(_325)][_327];
            float _331 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _333 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _335 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _337 = _331 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _339 = _331 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _341 = as_type<int>(_329) >> 31;
            bool _343 = as_type<int>(_329) == 1552;
            float _345 = _333;
            float _347 = _335;
            float _349 = _329;
            float _351 = as_type<float>(_341);
            float _353 = _339;
            if (!_343)
            {
                bool _355 = as_type<int>(_329) == 1600;
                _357 = _355;
                if (!_357)
                {
                    bool _359 = as_type<int>(_329) == 1664;
                    _361 = _359;
                    if (!_361)
                    {
                        bool _363 = as_type<int>(_329) == 1728;
                        _365 = _363;
                        if (!_365)
                        {
                            bool _367 = as_type<int>(_329) == 1808;
                            _369 = _367;
                            if (!_369)
                            {
                                bool _371 = as_type<int>(_329) == 1888;
                                _373 = _371;
                                if (!_373)
                                {
                                    bool _375 = as_type<int>(_329) == 1984;
                                    _377 = _375;
                                    if (!_377)
                                    {
                                        bool _379 = as_type<int>(_329) == 2064;
                                        _381 = _379;
                                        if (!_381)
                                        {
                                            bool _383 = as_type<int>(_329) == 2160;
                                            _385 = _383;
                                            if (!_385)
                                            {
                                                bool _387 = as_type<int>(_329) == 2224;
                                                _389 = _387;
                                                if (!_389)
                                                {
                                                    bool _391 = as_type<int>(_329) == 2304;
                                                    _393 = _391;
                                                    if (!_393)
                                                    {
                                                        bool _395 = as_type<int>(_329) == 2368;
                                                        _397 = _395;
                                                        if (!_397)
                                                        {
                                                            _399 = true;
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
            float _405;
            float _407;
            if (!_357)
            {
                if (!_361)
                {
                    if (!_365)
                    {
                        if (!_369)
                        {
                            if (!_373)
                            {
                                if (!_377)
                                {
                                    if (!_381)
                                    {
                                        if (!_385)
                                        {
                                            if (!_389)
                                            {
                                                if (!_393)
                                                {
                                                    if (!_397)
                                                    {
                                                        if (!_399)
                                                        {
                                                            float _401 = _333 * _47;
                                                            float _403 = _337 * _49;
                                                            _405 = _403;
                                                            _407 = _401;
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
            if ((((((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369) || _365) || _361) || _357)
            {
                if ((!_361) || _357)
                {
                    if ((!_365) || _357)
                    {
                        if ((!_369) || _357)
                        {
                            if ((!_373) || _357)
                            {
                                if ((!_377) || _357)
                                {
                                    if ((!_381) || _357)
                                    {
                                        if ((!_385) || _357)
                                        {
                                            if ((!_389) || _357)
                                            {
                                                if ((!_393) || _357)
                                                {
                                                    if ((!_397) || _357)
                                                    {
                                                        if ((!_399) || _357)
                                                        {
                                                            _357 = false;
                                                            float _409 = -_335;
                                                            float _411 = _409 + 1.0;
                                                            float _413 = _337 * _49;
                                                            float _415 = fma(_335, _47, _411);
                                                            _405 = _413;
                                                            _407 = _415;
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
                if (((((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369) || _365) || _361)
                {
                    if ((!_365) || _361)
                    {
                        if ((!_369) || _361)
                        {
                            if ((!_373) || _361)
                            {
                                if ((!_377) || _361)
                                {
                                    if ((!_381) || _361)
                                    {
                                        if ((!_385) || _361)
                                        {
                                            if ((!_389) || _361)
                                            {
                                                if ((!_393) || _361)
                                                {
                                                    if ((!_397) || _361)
                                                    {
                                                        if ((!_399) || _361)
                                                        {
                                                            _361 = false;
                                                            float _417 = -_339;
                                                            float _419 = _417 + 1.0;
                                                            float _421 = _333 * _47;
                                                            float _423 = fma(_339, _49, _419);
                                                            _405 = _423;
                                                            _407 = _421;
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
                    if ((((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369) || _365)
                    {
                        if ((!_369) || _365)
                        {
                            if ((!_373) || _365)
                            {
                                if ((!_377) || _365)
                                {
                                    if ((!_381) || _365)
                                    {
                                        if ((!_385) || _365)
                                        {
                                            if ((!_389) || _365)
                                            {
                                                if ((!_393) || _365)
                                                {
                                                    if ((!_397) || _365)
                                                    {
                                                        if ((!_399) || _365)
                                                        {
                                                            _365 = false;
                                                            float _425 = -_335;
                                                            float _427 = _425 + 1.0;
                                                            float _429 = -_339;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = fma(_335, _47, _427);
                                                            float _435 = fma(_339, _49, _431);
                                                            _405 = _435;
                                                            _407 = _433;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369)
                        {
                            if ((!_373) || _369)
                            {
                                if ((!_377) || _369)
                                {
                                    if ((!_381) || _369)
                                    {
                                        if ((!_385) || _369)
                                        {
                                            if ((!_389) || _369)
                                            {
                                                if ((!_393) || _369)
                                                {
                                                    if ((!_397) || _369)
                                                    {
                                                        if ((!_399) || _369)
                                                        {
                                                            _369 = false;
                                                            float _437 = -_337;
                                                            float _439 = _437 + 1.0;
                                                            float _441 = -_339;
                                                            float _443 = _441 + _439;
                                                            float _445 = _333 * _47;
                                                            float _447 = fma(_443, _49, _337);
                                                            _405 = _447;
                                                            _407 = _445;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373)
                            {
                                if ((!_377) || _373)
                                {
                                    if ((!_381) || _373)
                                    {
                                        if ((!_385) || _373)
                                        {
                                            if ((!_389) || _373)
                                            {
                                                if ((!_393) || _373)
                                                {
                                                    if ((!_397) || _373)
                                                    {
                                                        if ((!_399) || _373)
                                                        {
                                                            _373 = false;
                                                            float _449 = -_337;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = -_335;
                                                            float _455 = _453 + 1.0;
                                                            float _457 = -_339;
                                                            float _459 = _457 + _451;
                                                            float _461 = fma(_335, _47, _455);
                                                            float _463 = fma(_459, _49, _337);
                                                            _405 = _463;
                                                            _407 = _461;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377)
                                {
                                    if ((!_381) || _377)
                                    {
                                        if ((!_385) || _377)
                                        {
                                            if ((!_389) || _377)
                                            {
                                                if ((!_393) || _377)
                                                {
                                                    if ((!_397) || _377)
                                                    {
                                                        if ((!_399) || _377)
                                                        {
                                                            _377 = false;
                                                            float _465 = -_333;
                                                            float _467 = _465 + 1.0;
                                                            float _469 = -_335;
                                                            float _471 = _469 + _467;
                                                            float _473 = _337 * _49;
                                                            float _475 = fma(_471, _47, _333);
                                                            _405 = _473;
                                                            _407 = _475;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _399) || _397) || _393) || _389) || _385) || _381)
                                    {
                                        if ((!_385) || _381)
                                        {
                                            if ((!_389) || _381)
                                            {
                                                if ((!_393) || _381)
                                                {
                                                    if ((!_397) || _381)
                                                    {
                                                        if ((!_399) || _381)
                                                        {
                                                            _381 = false;
                                                            float _477 = -_333;
                                                            float _479 = _477 + 1.0;
                                                            float _481 = -_339;
                                                            float _483 = _481 + 1.0;
                                                            float _485 = -_335;
                                                            float _487 = _485 + _479;
                                                            float _489 = fma(_339, _49, _483);
                                                            float _491 = fma(_487, _47, _333);
                                                            _405 = _489;
                                                            _407 = _491;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _399) || _397) || _393) || _389) || _385)
                                        {
                                            if ((!_389) || _385)
                                            {
                                                if ((!_393) || _385)
                                                {
                                                    if ((!_397) || _385)
                                                    {
                                                        if ((!_399) || _385)
                                                        {
                                                            _385 = false;
                                                            float _493 = -_335;
                                                            float _495 = _493 + 1.0;
                                                            float _497 = _337 * _49;
                                                            float _499 = _495 * _47;
                                                            _405 = _497;
                                                            _407 = _499;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _399) || _397) || _393) || _389)
                                            {
                                                if ((!_393) || _389)
                                                {
                                                    if ((!_397) || _389)
                                                    {
                                                        if ((!_399) || _389)
                                                        {
                                                            _389 = false;
                                                            float _501 = -_335;
                                                            float _503 = _501 + 1.0;
                                                            float _505 = -_339;
                                                            float _507 = _505 + 1.0;
                                                            float _509 = fma(_335, _47, _503);
                                                            float _511 = _507 * _49;
                                                            _405 = _511;
                                                            _407 = _509;
                                                        }
                                                    }
                                                }
                                                if (((false || _399) || _397) || _393)
                                                {
                                                    if ((!_397) || _393)
                                                    {
                                                        if ((!_399) || _393)
                                                        {
                                                            _393 = false;
                                                            float _513 = -_337;
                                                            float _515 = _513 + 1.0;
                                                            float _517 = _333 * _47;
                                                            float _519 = fma(_515, _49, _337);
                                                            _405 = _519;
                                                            _407 = _517;
                                                        }
                                                    }
                                                    if ((false || _399) || _397)
                                                    {
                                                        if ((!_399) || _397)
                                                        {
                                                            _397 = false;
                                                            float _521 = -_333;
                                                            float _523 = _521 + 1.0;
                                                            float _525 = -_339;
                                                            float _527 = _525 + 1.0;
                                                            float _529 = fma(_523, _47, _333);
                                                            float _531 = fma(_339, _49, _527);
                                                            _405 = _531;
                                                            _407 = _529;
                                                        }
                                                        if (false || _399)
                                                        {
                                                            _399 = false;
                                                            bool _533 = _313 != 12;
                                                            if (!_533)
                                                            {
                                                                float _535 = -_337;
                                                                float _537 = _535 + 1.0;
                                                                _345 = _537;
                                                            }
                                                            float _539 = _345;
                                                            if (!_533)
                                                            {
                                                                float _541 = -_335;
                                                                float _543 = _541 + 1.0;
                                                                _347 = _543;
                                                            }
                                                            float _545 = _347;
                                                            if (_533)
                                                            {
                                                                _349 = 0.0;
                                                                _351 = 0.0;
                                                            }
                                                            float _547 = _349;
                                                            float _549 = _351;
                                                            float _551 = _549;
                                                            _405 = _547;
                                                            if (!_533)
                                                            {
                                                                float _553 = -_339;
                                                                float _555 = _553 + _539;
                                                                _353 = _555;
                                                            }
                                                            float _557 = _353;
                                                            if (!_533)
                                                            {
                                                                float _559 = _47 * _545;
                                                                _551 = _559;
                                                            }
                                                            float _561 = _551;
                                                            _407 = _561;
                                                            if (!_533)
                                                            {
                                                                float _563 = _49 * _557;
                                                                _405 = _563;
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
            float _565 = _405;
            float _567 = _407;
            float _569 = -_565;
            float _571 = _569 + 1.0;
            float _573 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _575 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _577 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _579 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _581 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _583 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _585 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _587 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _589 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].x, _573);
            float _591 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].x, _575);
            float _593 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].y, _577);
            float _595 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].y, _579);
            float _597 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].z, _581);
            float _599 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].z, _583);
            float _601 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].w, _585);
            float _603 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].w, _587);
            float _605 = _589 * _567;
            float _607 = _593 * _567;
            float _609 = _597 * _567;
            float _611 = -_567;
            float _613 = _611 + 1.0;
            float _615 = _603 * _567;
            float _617 = fma(_613, _591, _605);
            float _619 = fma(_613, _595, _607);
            float _621 = fma(_613, _599, _609);
            float _623 = fma(_613, _601, _615);
            _178 = _47;
            _172 = _49;
            _166 = _47;
            _152 = _47;
            _160 = _49;
            _182 = _617;
            _186 = _619;
            _190 = _621;
            _194 = _623;
            _196 = true;
        }
        else
        {
            float _625 = trunc(_47);
            int _627 = int(_625);
            bool _629 = _313 != 13;
            float _631 = trunc(_49);
            int _633 = int(_631);
            int _635 = _633 << 1;
            int _637 = _635 + _627;
            int _639 = _637 << 4;
            bool _641 = _639 == 0;
            bool _643 = _639 == 16;
            bool _645 = _639 == 32;
            bool _647 = _639 == 48;
            float _649 = 0.0;
            if (_641)
            {
                _649 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _651 = _649;
            float _653 = 0.0;
            float _655 = _651;
            if (_641)
            {
                _653 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _657 = _653;
            float _659 = 0.0;
            float _661 = _657;
            if (_641)
            {
                _659 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _663 = _659;
            float _665 = _663;
            if (_641)
            {
                _128 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _667 = _128;
            float _669 = _667;
            if (_641)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _671 = _130;
            float _673 = 0.0;
            float _675 = _671;
            if (_641)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _677 = _673;
            float _679 = _677;
            if (_643)
            {
                _655 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _681 = _655;
            float _683 = _681;
            if (_643)
            {
                _661 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _685 = _661;
            float _687 = _685;
            if (_643)
            {
                _665 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _689 = _665;
            float _691 = _689;
            if (_643)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _693 = _669;
            float _695 = _693;
            if (_643)
            {
                _675 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _697 = _675;
            float _699 = _697;
            if (_643)
            {
                _679 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _701 = _679;
            float _703 = _701;
            if (_645)
            {
                _683 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _705 = _683;
            float _707 = _705;
            if (_645)
            {
                _687 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _709 = _687;
            float _711 = _709;
            if (_645)
            {
                _691 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _713 = _691;
            float _715 = _713;
            if (_645)
            {
                _695 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _717 = _695;
            float _719 = _717;
            if (_645)
            {
                _699 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _721 = _699;
            float _723 = _721;
            if (_645)
            {
                _703 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _725 = _703;
            float _727 = _725;
            if (_647)
            {
                _707 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _729 = _707;
            _152 = _729;
            if (_647)
            {
                _711 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _731 = _711;
            _160 = _731;
            if (_647)
            {
                _715 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _733 = _715;
            _166 = _733;
            if (_647)
            {
                _719 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _735 = _719;
            _172 = _735;
            if (_647)
            {
                _723 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _737 = _723;
            _178 = _737;
            if (_647)
            {
                _727 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _739 = _727;
            if (!_629)
            {
                float _741 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _743 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _745 = _741 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _747 = -_745;
                float _749 = _747 + 1.0;
                float _751 = _743 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _753 = -_741;
                float _755 = fma(_753, (*spvDescriptorSet0.vp_c3)._m0[26].w, _749);
                float _757 = -_751;
                float _759 = _757 + 1.0;
                float _761 = fma(_755, _49, _745);
                float _763 = -_743;
                float _765 = fma(_763, (*spvDescriptorSet0.vp_c3)._m0[26].y, _759);
                float _767 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _769 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _771 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _773 = fma(_765, _47, _751);
                float _775 = -_761;
                float _777 = _775 + 1.0;
                float _779 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _781 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _783 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _785 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _787 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _789 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].x, _767);
                float _791 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].x, _769);
                float _793 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].y, _771);
                float _795 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].y, _779);
                float _797 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].z, _781);
                float _799 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].z, _783);
                float _801 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].w, _785);
                float _803 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].w, _787);
                float _805 = -_773;
                float _807 = _805 + 1.0;
                float _809 = _773 * _789;
                float _811 = _773 * _793;
                float _813 = _773 * _797;
                float _815 = _773 * _803;
                float _817 = fma(_807, _791, _809);
                float _819 = fma(_807, _795, _811);
                float _821 = fma(_807, _799, _813);
                float _823 = fma(_807, _801, _815);
                _132 = _739;
                _182 = _817;
                _186 = _819;
                _190 = _821;
                _194 = _823;
                _196 = true;
            }
            else
            {
                int _825 = _637 << 4;
                int _827 = _825 + 464;
                uint _829 = uint(int(uint(_827) >> uint(2)));
                uint _831 = uint(int(uint(int(_829)) >> uint(2)));
                int _833 = int(_829) & 3;
                float _835 = (*spvDescriptorSet0.vp_c3)._m0[int(_831)][_833];
                int _837 = int(_829) + 1;
                uint _839 = uint(int(uint(_837) >> uint(2)));
                int _841 = _837 & 3;
                float _843 = (*spvDescriptorSet0.vp_c3)._m0[int(_839)][_841];
                int _845 = _827 + 8;
                uint _847 = uint(int(uint(_845) >> uint(2)));
                uint _849 = uint(int(uint(int(_847)) >> uint(2)));
                int _851 = int(_847) & 3;
                float _853 = (*spvDescriptorSet0.vp_c3)._m0[int(_849)][_851];
                int _855 = int(_847) + 1;
                uint _857 = uint(int(uint(_855) >> uint(2)));
                int _859 = _855 & 3;
                float _861 = (*spvDescriptorSet0.vp_c3)._m0[int(_857)][_859];
                _132 = _739;
                _182 = _835;
                _186 = _843;
                _190 = _853;
                _194 = _861;
            }
        }
    }
    _196 = false;
    float _863 = _132;
    float _865 = _178;
    float _867 = _172;
    float _869 = _166;
    float _871 = _152;
    float _873 = _160;
    bool _875 = _144;
    float _877 = _182;
    float _879 = _186;
    float _881 = _190;
    float _883 = _194;
    bool _885 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _887 = !_885;
    float _889 = _867;
    float _891 = _865;
    float _893 = _871;
    float _895 = _873;
    float _897 = _869;
    float _899 = _867;
    float _901 = _865;
    float _903 = _863;
    int _905 = as_type<int>(_865);
    float _907 = _863;
    float _909 = _863;
    float _911 = _865;
    float _925;
    float _927;
    if (!_887)
    {
        float _913 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _915 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _917 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _913);
        float _919 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _915);
        float _921 = _917 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _923 = _919 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _925 = _923;
        _927 = _921;
        _929 = true;
    }
    else
    {
        int _931 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _933 = _931 != 0;
        if (!_933)
        {
            _889 = _871;
        }
        float _935 = _889;
        float _937 = _935;
        _927 = _935;
        if (!_933)
        {
            _891 = _873;
        }
        float _939 = _891;
        bool _941 = !_933;
        float _943 = _939;
        _925 = _939;
        if (!_941)
        {
            if (!_875)
            {
                _937 = _871;
            }
            float _945 = _937;
            float _947 = _945;
            int _949 = as_type<int>(_945);
            if (!_875)
            {
                _943 = _873;
            }
            float _951 = _943;
            bool _953 = !_875;
            float _955 = _951;
            float _957 = _951;
            if (!_953)
            {
                int _959 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _961 = _959 != 0;
                int _963 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _965 = _963 != 0;
                int _967 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _969 = _967 != 0;
                int _971 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _973 = _971 != 0;
                int _975 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _977 = _975 != 0;
                if (_961)
                {
                    _947 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _979 = _947;
                float _981 = _979;
                if (_961)
                {
                    _955 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _983 = _955;
                float _985 = _983;
                if (!_961)
                {
                    _981 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _987 = _981;
                if (!_961)
                {
                    _985 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _989 = _985;
                float _991 = _987 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _993 = _989 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_973)
                {
                    float _995 = _991 * _871;
                    _893 = _995;
                }
                float _997 = _893;
                float _999 = -_991;
                float _1001 = _999 + 1.0;
                int _1003 = as_type<int>(_997);
                if (_977)
                {
                    float _1005 = _993 * _873;
                    _895 = _1005;
                }
                float _1007 = _895;
                float _1009 = -_993;
                float _1011 = _1009 + 1.0;
                float _1013 = _1007;
                if (_965)
                {
                    float _1015 = _997 + _1001;
                    _1003 = as_type<int>(_1015);
                }
                int _1017 = _1003;
                if (_969)
                {
                    float _1019 = _1007 + _1011;
                    _1013 = _1019;
                }
                float _1021 = _1013;
                _949 = _1017;
                _957 = _1021;
            }
            int _1023 = _949;
            float _1025 = _957;
            int _1027 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1029 = _1027 != 0;
            int _1031 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1033 = _1031 != 0;
            int _1035 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1037 = _1035 != 0;
            int _1039 = _1023;
            int _1041 = as_type<int>(_1025);
            if (_1033)
            {
                float _1043 = -as_type<float>(_1023);
                float _1045 = _1043 + 1.0;
                _1039 = as_type<int>(_1045);
            }
            int _1047 = _1039;
            if (_1037)
            {
                float _1049 = -_1025;
                float _1051 = _1049 + 1.0;
                _1041 = as_type<int>(_1051);
            }
            int _1053 = _1041;
            bool _1055 = !_1029;
            float _1057 = _1055 ? as_type<float>(_1047) : as_type<float>(_1053);
            bool _1059 = !_1029;
            float _1061 = _1059 ? as_type<float>(_1053) : as_type<float>(_1047);
            _925 = _1061;
            _927 = _1057;
        }
    }
    _929 = false;
    float _1063 = _925;
    float _1065 = _927;
    float _1067 = _1063 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _1069 = _1063 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _1071 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _1073 = fma(_1065, (*spvDescriptorSet0.vp_c3)._m0[8].x, _1067);
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c3)._m0[7].x, _1069);
    float _1077 = _1073 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _1079 = _1075 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _1081 = -_1077;
    float _1083 = _1081 + 1.0;
    out.m_27.x = _1079;
    out.m_27.y = _1083;
    bool _1085 = !_1071;
    float _1087 = _1079;
    float _1089 = _1075;
    float _1103;
    float _1105;
    if (!_1085)
    {
        float _1091 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1093 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1095 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _1091);
        float _1097 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1093);
        float _1099 = _1095 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1101 = _1097 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _1103 = _1101;
        _1105 = _1099;
        _1107 = true;
    }
    else
    {
        int _1109 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1111 = _1109 != 0;
        if (!_1111)
        {
            _1087 = _869;
        }
        float _1113 = _1087;
        float _1115 = _1113;
        _1105 = _1113;
        if (!_1111)
        {
            _1089 = _867;
        }
        float _1117 = _1089;
        bool _1119 = !_1111;
        float _1121 = _1117;
        _1103 = _1117;
        if (!_1119)
        {
            if (!_875)
            {
                _1115 = _869;
            }
            float _1123 = _1115;
            float _1125 = _1123;
            int _1127 = as_type<int>(_1123);
            if (!_875)
            {
                _1121 = _867;
            }
            float _1129 = _1121;
            bool _1131 = !_875;
            float _1133 = _1129;
            float _1135 = _1129;
            if (!_1131)
            {
                int _1137 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1139 = _1137 != 0;
                int _1141 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1143 = _1141 != 0;
                int _1145 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1147 = _1145 != 0;
                int _1149 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1151 = _1149 != 0;
                int _1153 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1155 = _1153 != 0;
                if (_1139)
                {
                    _1125 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1157 = _1125;
                float _1159 = _1157;
                if (_1139)
                {
                    _1133 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1161 = _1133;
                float _1163 = _1161;
                if (!_1139)
                {
                    _1159 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1165 = _1159;
                if (!_1139)
                {
                    _1163 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1167 = _1163;
                float _1169 = _1165 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1171 = _1167 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1151)
                {
                    float _1173 = _1169 * _869;
                    _897 = _1173;
                }
                float _1175 = _897;
                float _1177 = -_1169;
                float _1179 = _1177 + 1.0;
                int _1181 = as_type<int>(_1175);
                if (_1155)
                {
                    float _1183 = _1171 * _867;
                    _899 = _1183;
                }
                float _1185 = _899;
                float _1187 = -_1171;
                float _1189 = _1187 + 1.0;
                float _1191 = _1185;
                if (_1143)
                {
                    float _1193 = _1175 + _1179;
                    _1181 = as_type<int>(_1193);
                }
                int _1195 = _1181;
                if (_1147)
                {
                    float _1197 = _1185 + _1189;
                    _1191 = _1197;
                }
                float _1199 = _1191;
                _1127 = _1195;
                _1135 = _1199;
            }
            int _1201 = _1127;
            float _1203 = _1135;
            int _1205 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1207 = _1205 != 0;
            int _1209 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1211 = _1209 != 0;
            int _1213 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1215 = _1213 != 0;
            int _1217 = _1201;
            int _1219 = as_type<int>(_1203);
            if (_1211)
            {
                float _1221 = -as_type<float>(_1201);
                float _1223 = _1221 + 1.0;
                _1217 = as_type<int>(_1223);
            }
            int _1225 = _1217;
            if (_1215)
            {
                float _1227 = -_1203;
                float _1229 = _1227 + 1.0;
                _1219 = as_type<int>(_1229);
            }
            int _1231 = _1219;
            bool _1233 = !_1207;
            float _1235 = _1233 ? as_type<float>(_1225) : as_type<float>(_1231);
            bool _1237 = !_1207;
            float _1239 = _1237 ? as_type<float>(_1231) : as_type<float>(_1225);
            _1103 = _1239;
            _1105 = _1235;
        }
    }
    _1107 = false;
    float _1241 = _1103;
    float _1243 = _1105;
    float _1245 = _1241 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1247 = _1241 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _1249 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _1251 = fma(_1243, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1245);
    float _1253 = fma(_1243, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1247);
    float _1255 = _1251 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1257 = _1253 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1259 = -_1255;
    float _1261 = _1259 + 1.0;
    out.m_29.x = _1257;
    out.m_29.y = _1261;
    bool _1263 = !_1249;
    if (!_1263)
    {
        float _1265 = _53 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _1267 = _53 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _1269 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[22].x, _1265);
        float _1271 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[23].x, _1267);
        float _1273 = _1269 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _1275 = _1271 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _909 = _1275;
        _911 = _1273;
        _1277 = true;
    }
    else
    {
        int _1279 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1281 = _1279 != 0;
        bool _1283 = !_1281;
        if (!_1283)
        {
            bool _1285 = !_875;
            if (!_1285)
            {
                int _1287 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1289 = _1287 != 0;
                int _1291 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1293 = _1291 != 0;
                int _1295 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1297 = _1295 != 0;
                int _1299 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1301 = _1299 != 0;
                int _1303 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1305 = _1303 != 0;
                if (_1289)
                {
                    _134 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1307 = _134;
                float _1309 = _1307;
                if (_1289)
                {
                    _136 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1311 = _136;
                float _1313 = _1311;
                if (!_1289)
                {
                    _1309 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1315 = _1309;
                if (!_1289)
                {
                    _1313 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1317 = _1313;
                float _1319 = _1315 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1321 = _1317 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1301)
                {
                    float _1323 = _1319 * _865;
                    _901 = _1323;
                }
                float _1325 = _901;
                float _1327 = -_1319;
                float _1329 = _1327 + 1.0;
                int _1331 = as_type<int>(_1325);
                if (_1305)
                {
                    float _1333 = _1321 * _863;
                    _903 = _1333;
                }
                float _1335 = _903;
                float _1337 = -_1321;
                float _1339 = _1337 + 1.0;
                _907 = _1335;
                if (_1293)
                {
                    float _1341 = _1325 + _1329;
                    _1331 = as_type<int>(_1341);
                }
                int _1343 = _1331;
                _905 = _1343;
                if (_1297)
                {
                    float _1345 = _1335 + _1339;
                    _907 = _1345;
                }
            }
            int _1347 = _905;
            float _1349 = _907;
            int _1351 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1353 = _1351 != 0;
            int _1355 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1357 = _1355 != 0;
            int _1359 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1361 = _1359 != 0;
            int _1363 = _1347;
            int _1365 = as_type<int>(_1349);
            if (_1357)
            {
                float _1367 = -as_type<float>(_1347);
                float _1369 = _1367 + 1.0;
                _1363 = as_type<int>(_1369);
            }
            int _1371 = _1363;
            if (_1361)
            {
                float _1373 = -_1349;
                float _1375 = _1373 + 1.0;
                _1365 = as_type<int>(_1375);
            }
            int _1377 = _1365;
            bool _1379 = !_1353;
            float _1381 = _1379 ? as_type<float>(_1371) : as_type<float>(_1377);
            bool _1383 = !_1353;
            float _1385 = _1383 ? as_type<float>(_1377) : as_type<float>(_1371);
            _909 = _1385;
            _911 = _1381;
        }
    }
    _1277 = false;
    float _1387 = _909;
    float _1389 = _911;
    float _1391 = _1387 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1393 = _1387 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _1395 = _877 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1397 = _879 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1399 = fma(_1389, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1391);
    float _1401 = fma(_1389, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1393);
    float _1403 = _881 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1405 = _883 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1407 = _1399 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1409 = _1401 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _1411 = -_1407;
    float _1413 = _1411 + 1.0;
    out.m_31.x = _1395;
    out.m_31.y = _1397;
    out.m_31.z = _1403;
    out.m_31.w = _1405;
    out.m_33.x = _1409;
    out.m_33.y = _1413;
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
    bool _1277 = false;
    bool _1107 = false;
    bool _929 = false;
    bool _196 = false;
    bool _399 = false;
    bool _397 = false;
    bool _393 = false;
    bool _389 = false;
    bool _385 = false;
    bool _381 = false;
    bool _377 = false;
    bool _373 = false;
    bool _369 = false;
    bool _365 = false;
    bool _361 = false;
    bool _357 = false;
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
    float _75 = _69 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _77 = _69 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _79 = _69 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _81 = _69 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _85 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].x, _81);
    float _91 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[1].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[0].z, _85);
    float _95 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[2].z, _87);
    float _97 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[3].z, _89);
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _101;
    out.gl_Position.y = _99;
    out.gl_Position.z = _103;
    out.gl_Position.w = _105;
    int _108 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _112 = _108 != 0;
    bool _114 = !_112;
    float _116 = _89;
    float _118 = _73;
    float _120 = _101;
    float _122 = _99;
    float _124 = _103;
    float _126 = _105;
    float _128 = _89;
    float _130 = _73;
    float _132 = _49;
    float _134 = _53;
    float _136 = _55;
    bool _144;
    float _152;
    float _160;
    float _166;
    float _172;
    float _178;
    float _182;
    float _186;
    float _190;
    float _194;
    if (!_114)
    {
        int _138 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _140 = _138 != 0;
        float _142 = 0.0;
        _144 = _140;
        if (_140)
        {
            _142 = _47;
        }
        float _146 = _142;
        float _148 = 0.0;
        float _150 = _146;
        _152 = _146;
        if (_140)
        {
            _148 = _49;
        }
        float _154 = _148;
        float _156 = 0.0;
        float _158 = _154;
        _160 = _154;
        if (_140)
        {
            _156 = _47;
        }
        float _162 = _156;
        float _164 = _162;
        _166 = _162;
        if (_140)
        {
            _116 = _49;
        }
        float _168 = _116;
        float _170 = _168;
        _172 = _168;
        if (_140)
        {
            _118 = _47;
        }
        float _174 = _118;
        float _176 = _174;
        _178 = _174;
        if (_140)
        {
            _120 = 255.0;
        }
        float _180 = _120;
        _182 = _180;
        if (_140)
        {
            _122 = 255.0;
        }
        float _184 = _122;
        _186 = _184;
        if (_140)
        {
            _124 = 255.0;
        }
        float _188 = _124;
        _190 = _188;
        if (_140)
        {
            _126 = 255.0;
        }
        float _192 = _126;
        _194 = _192;
        _196 = _140;
        if (!_196)
        {
            float _198 = trunc(_47);
            int _200 = int(_198);
            float _202 = trunc(_49);
            int _204 = int(_202);
            int _206 = _204 << 1;
            int _208 = _206 + _200;
            int _210 = _208 << 4;
            bool _212 = _210 == 0;
            bool _214 = _210 == 16;
            bool _216 = _210 == 32;
            bool _218 = _210 == 48;
            float _220 = as_type<float>(_204);
            _182 = 255.0;
            _186 = 255.0;
            _190 = 255.0;
            _194 = 255.0;
            if (_212)
            {
                _150 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _222 = _150;
            float _224 = _222;
            if (_212)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _226 = _158;
            float _228 = _226;
            if (_212)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _230 = _164;
            float _232 = _230;
            if (_212)
            {
                _170 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _234 = _170;
            float _236 = _234;
            if (_212)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _238 = _176;
            float _240 = _238;
            if (_212)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _242 = _220;
            float _244 = _242;
            if (_214)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _246 = _224;
            float _248 = _246;
            if (_214)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _250 = _228;
            float _252 = _250;
            if (_214)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _254 = _232;
            float _256 = _254;
            if (_214)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _258 = _236;
            float _260 = _258;
            if (_214)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _262 = _240;
            float _264 = _262;
            if (_214)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _266 = _244;
            float _268 = _266;
            if (_216)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _270 = _248;
            float _272 = _270;
            if (_216)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _274 = _252;
            float _276 = _274;
            if (_216)
            {
                _256 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _278 = _256;
            float _280 = _278;
            if (_216)
            {
                _260 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _282 = _260;
            float _284 = _282;
            if (_216)
            {
                _264 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _286 = _264;
            float _288 = _286;
            if (_216)
            {
                _268 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _290 = _268;
            float _292 = _290;
            if (_218)
            {
                _272 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _294 = _272;
            _152 = _294;
            if (_218)
            {
                _276 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _296 = _276;
            _160 = _296;
            if (_218)
            {
                _280 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _298 = _280;
            _166 = _298;
            if (_218)
            {
                _284 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _300 = _284;
            _172 = _300;
            if (_218)
            {
                _288 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _302 = _288;
            _178 = _302;
            if (_218)
            {
                _292 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _304 = _292;
            _132 = _304;
            _196 = true;
        }
    }
    else
    {
        int _306 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _308 = _306 != 0;
        uint _311 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _313 = int(_311) & 15;
        bool _315 = !_308;
        _144 = _308;
        if (!_315)
        {
            uint _317 = min(uint(_313), 13u);
            float _319 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _321 = int(_317) << 2;
            uint _323 = uint(int(uint(_321) >> uint(2)));
            uint _325 = uint(int(uint(int(_323)) >> uint(2)));
            int _327 = int(_323) & 3;
            float _329 = (*spvDescriptorSet0.vp_c1)._m0[int(_325)][_327];
            float _331 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _333 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _335 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _337 = _331 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _339 = _331 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _341 = as_type<int>(_329) >> 31;
            bool _343 = as_type<int>(_329) == 1552;
            float _345 = _333;
            float _347 = _335;
            float _349 = _329;
            float _351 = as_type<float>(_341);
            float _353 = _339;
            if (!_343)
            {
                bool _355 = as_type<int>(_329) == 1600;
                _357 = _355;
                if (!_357)
                {
                    bool _359 = as_type<int>(_329) == 1664;
                    _361 = _359;
                    if (!_361)
                    {
                        bool _363 = as_type<int>(_329) == 1728;
                        _365 = _363;
                        if (!_365)
                        {
                            bool _367 = as_type<int>(_329) == 1808;
                            _369 = _367;
                            if (!_369)
                            {
                                bool _371 = as_type<int>(_329) == 1888;
                                _373 = _371;
                                if (!_373)
                                {
                                    bool _375 = as_type<int>(_329) == 1984;
                                    _377 = _375;
                                    if (!_377)
                                    {
                                        bool _379 = as_type<int>(_329) == 2064;
                                        _381 = _379;
                                        if (!_381)
                                        {
                                            bool _383 = as_type<int>(_329) == 2160;
                                            _385 = _383;
                                            if (!_385)
                                            {
                                                bool _387 = as_type<int>(_329) == 2224;
                                                _389 = _387;
                                                if (!_389)
                                                {
                                                    bool _391 = as_type<int>(_329) == 2304;
                                                    _393 = _391;
                                                    if (!_393)
                                                    {
                                                        bool _395 = as_type<int>(_329) == 2368;
                                                        _397 = _395;
                                                        if (!_397)
                                                        {
                                                            _399 = true;
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
            float _405;
            float _407;
            if (!_357)
            {
                if (!_361)
                {
                    if (!_365)
                    {
                        if (!_369)
                        {
                            if (!_373)
                            {
                                if (!_377)
                                {
                                    if (!_381)
                                    {
                                        if (!_385)
                                        {
                                            if (!_389)
                                            {
                                                if (!_393)
                                                {
                                                    if (!_397)
                                                    {
                                                        if (!_399)
                                                        {
                                                            float _401 = _333 * _47;
                                                            float _403 = _337 * _49;
                                                            _405 = _403;
                                                            _407 = _401;
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
            if ((((((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369) || _365) || _361) || _357)
            {
                if ((!_361) || _357)
                {
                    if ((!_365) || _357)
                    {
                        if ((!_369) || _357)
                        {
                            if ((!_373) || _357)
                            {
                                if ((!_377) || _357)
                                {
                                    if ((!_381) || _357)
                                    {
                                        if ((!_385) || _357)
                                        {
                                            if ((!_389) || _357)
                                            {
                                                if ((!_393) || _357)
                                                {
                                                    if ((!_397) || _357)
                                                    {
                                                        if ((!_399) || _357)
                                                        {
                                                            _357 = false;
                                                            float _409 = -_335;
                                                            float _411 = _409 + 1.0;
                                                            float _413 = _337 * _49;
                                                            float _415 = fma(_335, _47, _411);
                                                            _405 = _413;
                                                            _407 = _415;
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
                if (((((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369) || _365) || _361)
                {
                    if ((!_365) || _361)
                    {
                        if ((!_369) || _361)
                        {
                            if ((!_373) || _361)
                            {
                                if ((!_377) || _361)
                                {
                                    if ((!_381) || _361)
                                    {
                                        if ((!_385) || _361)
                                        {
                                            if ((!_389) || _361)
                                            {
                                                if ((!_393) || _361)
                                                {
                                                    if ((!_397) || _361)
                                                    {
                                                        if ((!_399) || _361)
                                                        {
                                                            _361 = false;
                                                            float _417 = -_339;
                                                            float _419 = _417 + 1.0;
                                                            float _421 = _333 * _47;
                                                            float _423 = fma(_339, _49, _419);
                                                            _405 = _423;
                                                            _407 = _421;
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
                    if ((((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369) || _365)
                    {
                        if ((!_369) || _365)
                        {
                            if ((!_373) || _365)
                            {
                                if ((!_377) || _365)
                                {
                                    if ((!_381) || _365)
                                    {
                                        if ((!_385) || _365)
                                        {
                                            if ((!_389) || _365)
                                            {
                                                if ((!_393) || _365)
                                                {
                                                    if ((!_397) || _365)
                                                    {
                                                        if ((!_399) || _365)
                                                        {
                                                            _365 = false;
                                                            float _425 = -_335;
                                                            float _427 = _425 + 1.0;
                                                            float _429 = -_339;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = fma(_335, _47, _427);
                                                            float _435 = fma(_339, _49, _431);
                                                            _405 = _435;
                                                            _407 = _433;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369)
                        {
                            if ((!_373) || _369)
                            {
                                if ((!_377) || _369)
                                {
                                    if ((!_381) || _369)
                                    {
                                        if ((!_385) || _369)
                                        {
                                            if ((!_389) || _369)
                                            {
                                                if ((!_393) || _369)
                                                {
                                                    if ((!_397) || _369)
                                                    {
                                                        if ((!_399) || _369)
                                                        {
                                                            _369 = false;
                                                            float _437 = -_337;
                                                            float _439 = _437 + 1.0;
                                                            float _441 = -_339;
                                                            float _443 = _441 + _439;
                                                            float _445 = _333 * _47;
                                                            float _447 = fma(_443, _49, _337);
                                                            _405 = _447;
                                                            _407 = _445;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373)
                            {
                                if ((!_377) || _373)
                                {
                                    if ((!_381) || _373)
                                    {
                                        if ((!_385) || _373)
                                        {
                                            if ((!_389) || _373)
                                            {
                                                if ((!_393) || _373)
                                                {
                                                    if ((!_397) || _373)
                                                    {
                                                        if ((!_399) || _373)
                                                        {
                                                            _373 = false;
                                                            float _449 = -_337;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = -_335;
                                                            float _455 = _453 + 1.0;
                                                            float _457 = -_339;
                                                            float _459 = _457 + _451;
                                                            float _461 = fma(_335, _47, _455);
                                                            float _463 = fma(_459, _49, _337);
                                                            _405 = _463;
                                                            _407 = _461;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377)
                                {
                                    if ((!_381) || _377)
                                    {
                                        if ((!_385) || _377)
                                        {
                                            if ((!_389) || _377)
                                            {
                                                if ((!_393) || _377)
                                                {
                                                    if ((!_397) || _377)
                                                    {
                                                        if ((!_399) || _377)
                                                        {
                                                            _377 = false;
                                                            float _465 = -_333;
                                                            float _467 = _465 + 1.0;
                                                            float _469 = -_335;
                                                            float _471 = _469 + _467;
                                                            float _473 = _337 * _49;
                                                            float _475 = fma(_471, _47, _333);
                                                            _405 = _473;
                                                            _407 = _475;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _399) || _397) || _393) || _389) || _385) || _381)
                                    {
                                        if ((!_385) || _381)
                                        {
                                            if ((!_389) || _381)
                                            {
                                                if ((!_393) || _381)
                                                {
                                                    if ((!_397) || _381)
                                                    {
                                                        if ((!_399) || _381)
                                                        {
                                                            _381 = false;
                                                            float _477 = -_333;
                                                            float _479 = _477 + 1.0;
                                                            float _481 = -_339;
                                                            float _483 = _481 + 1.0;
                                                            float _485 = -_335;
                                                            float _487 = _485 + _479;
                                                            float _489 = fma(_339, _49, _483);
                                                            float _491 = fma(_487, _47, _333);
                                                            _405 = _489;
                                                            _407 = _491;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _399) || _397) || _393) || _389) || _385)
                                        {
                                            if ((!_389) || _385)
                                            {
                                                if ((!_393) || _385)
                                                {
                                                    if ((!_397) || _385)
                                                    {
                                                        if ((!_399) || _385)
                                                        {
                                                            _385 = false;
                                                            float _493 = -_335;
                                                            float _495 = _493 + 1.0;
                                                            float _497 = _337 * _49;
                                                            float _499 = _495 * _47;
                                                            _405 = _497;
                                                            _407 = _499;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _399) || _397) || _393) || _389)
                                            {
                                                if ((!_393) || _389)
                                                {
                                                    if ((!_397) || _389)
                                                    {
                                                        if ((!_399) || _389)
                                                        {
                                                            _389 = false;
                                                            float _501 = -_335;
                                                            float _503 = _501 + 1.0;
                                                            float _505 = -_339;
                                                            float _507 = _505 + 1.0;
                                                            float _509 = fma(_335, _47, _503);
                                                            float _511 = _507 * _49;
                                                            _405 = _511;
                                                            _407 = _509;
                                                        }
                                                    }
                                                }
                                                if (((false || _399) || _397) || _393)
                                                {
                                                    if ((!_397) || _393)
                                                    {
                                                        if ((!_399) || _393)
                                                        {
                                                            _393 = false;
                                                            float _513 = -_337;
                                                            float _515 = _513 + 1.0;
                                                            float _517 = _333 * _47;
                                                            float _519 = fma(_515, _49, _337);
                                                            _405 = _519;
                                                            _407 = _517;
                                                        }
                                                    }
                                                    if ((false || _399) || _397)
                                                    {
                                                        if ((!_399) || _397)
                                                        {
                                                            _397 = false;
                                                            float _521 = -_333;
                                                            float _523 = _521 + 1.0;
                                                            float _525 = -_339;
                                                            float _527 = _525 + 1.0;
                                                            float _529 = fma(_523, _47, _333);
                                                            float _531 = fma(_339, _49, _527);
                                                            _405 = _531;
                                                            _407 = _529;
                                                        }
                                                        if (false || _399)
                                                        {
                                                            _399 = false;
                                                            bool _533 = _313 != 12;
                                                            if (!_533)
                                                            {
                                                                float _535 = -_337;
                                                                float _537 = _535 + 1.0;
                                                                _345 = _537;
                                                            }
                                                            float _539 = _345;
                                                            if (!_533)
                                                            {
                                                                float _541 = -_335;
                                                                float _543 = _541 + 1.0;
                                                                _347 = _543;
                                                            }
                                                            float _545 = _347;
                                                            if (_533)
                                                            {
                                                                _349 = 0.0;
                                                                _351 = 0.0;
                                                            }
                                                            float _547 = _349;
                                                            float _549 = _351;
                                                            float _551 = _549;
                                                            _405 = _547;
                                                            if (!_533)
                                                            {
                                                                float _553 = -_339;
                                                                float _555 = _553 + _539;
                                                                _353 = _555;
                                                            }
                                                            float _557 = _353;
                                                            if (!_533)
                                                            {
                                                                float _559 = _47 * _545;
                                                                _551 = _559;
                                                            }
                                                            float _561 = _551;
                                                            _407 = _561;
                                                            if (!_533)
                                                            {
                                                                float _563 = _49 * _557;
                                                                _405 = _563;
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
            float _565 = _405;
            float _567 = _407;
            float _569 = -_565;
            float _571 = _569 + 1.0;
            float _573 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _575 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _577 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _579 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _581 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _583 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _585 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _587 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _589 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].x, _573);
            float _591 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].x, _575);
            float _593 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].y, _577);
            float _595 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].y, _579);
            float _597 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].z, _581);
            float _599 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].z, _583);
            float _601 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].w, _585);
            float _603 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].w, _587);
            float _605 = _589 * _567;
            float _607 = _593 * _567;
            float _609 = _597 * _567;
            float _611 = -_567;
            float _613 = _611 + 1.0;
            float _615 = _603 * _567;
            float _617 = fma(_613, _591, _605);
            float _619 = fma(_613, _595, _607);
            float _621 = fma(_613, _599, _609);
            float _623 = fma(_613, _601, _615);
            _178 = _47;
            _172 = _49;
            _166 = _47;
            _152 = _47;
            _160 = _49;
            _182 = _617;
            _186 = _619;
            _190 = _621;
            _194 = _623;
            _196 = true;
        }
        else
        {
            float _625 = trunc(_47);
            int _627 = int(_625);
            bool _629 = _313 != 13;
            float _631 = trunc(_49);
            int _633 = int(_631);
            int _635 = _633 << 1;
            int _637 = _635 + _627;
            int _639 = _637 << 4;
            bool _641 = _639 == 0;
            bool _643 = _639 == 16;
            bool _645 = _639 == 32;
            bool _647 = _639 == 48;
            float _649 = 0.0;
            if (_641)
            {
                _649 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _651 = _649;
            float _653 = 0.0;
            float _655 = _651;
            if (_641)
            {
                _653 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _657 = _653;
            float _659 = 0.0;
            float _661 = _657;
            if (_641)
            {
                _659 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _663 = _659;
            float _665 = _663;
            if (_641)
            {
                _128 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _667 = _128;
            float _669 = _667;
            if (_641)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _671 = _130;
            float _673 = 0.0;
            float _675 = _671;
            if (_641)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _677 = _673;
            float _679 = _677;
            if (_643)
            {
                _655 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _681 = _655;
            float _683 = _681;
            if (_643)
            {
                _661 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _685 = _661;
            float _687 = _685;
            if (_643)
            {
                _665 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _689 = _665;
            float _691 = _689;
            if (_643)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _693 = _669;
            float _695 = _693;
            if (_643)
            {
                _675 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _697 = _675;
            float _699 = _697;
            if (_643)
            {
                _679 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _701 = _679;
            float _703 = _701;
            if (_645)
            {
                _683 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _705 = _683;
            float _707 = _705;
            if (_645)
            {
                _687 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _709 = _687;
            float _711 = _709;
            if (_645)
            {
                _691 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _713 = _691;
            float _715 = _713;
            if (_645)
            {
                _695 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _717 = _695;
            float _719 = _717;
            if (_645)
            {
                _699 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _721 = _699;
            float _723 = _721;
            if (_645)
            {
                _703 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _725 = _703;
            float _727 = _725;
            if (_647)
            {
                _707 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _729 = _707;
            _152 = _729;
            if (_647)
            {
                _711 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _731 = _711;
            _160 = _731;
            if (_647)
            {
                _715 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _733 = _715;
            _166 = _733;
            if (_647)
            {
                _719 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _735 = _719;
            _172 = _735;
            if (_647)
            {
                _723 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _737 = _723;
            _178 = _737;
            if (_647)
            {
                _727 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _739 = _727;
            if (!_629)
            {
                float _741 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _743 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _745 = _741 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _747 = -_745;
                float _749 = _747 + 1.0;
                float _751 = _743 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _753 = -_741;
                float _755 = fma(_753, (*spvDescriptorSet0.vp_c3)._m0[26].w, _749);
                float _757 = -_751;
                float _759 = _757 + 1.0;
                float _761 = fma(_755, _49, _745);
                float _763 = -_743;
                float _765 = fma(_763, (*spvDescriptorSet0.vp_c3)._m0[26].y, _759);
                float _767 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _769 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _771 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _773 = fma(_765, _47, _751);
                float _775 = -_761;
                float _777 = _775 + 1.0;
                float _779 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _781 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _783 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _785 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _787 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _789 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].x, _767);
                float _791 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].x, _769);
                float _793 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].y, _771);
                float _795 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].y, _779);
                float _797 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].z, _781);
                float _799 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].z, _783);
                float _801 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].w, _785);
                float _803 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].w, _787);
                float _805 = -_773;
                float _807 = _805 + 1.0;
                float _809 = _773 * _789;
                float _811 = _773 * _793;
                float _813 = _773 * _797;
                float _815 = _773 * _803;
                float _817 = fma(_807, _791, _809);
                float _819 = fma(_807, _795, _811);
                float _821 = fma(_807, _799, _813);
                float _823 = fma(_807, _801, _815);
                _132 = _739;
                _182 = _817;
                _186 = _819;
                _190 = _821;
                _194 = _823;
                _196 = true;
            }
            else
            {
                int _825 = _637 << 4;
                int _827 = _825 + 464;
                uint _829 = uint(int(uint(_827) >> uint(2)));
                uint _831 = uint(int(uint(int(_829)) >> uint(2)));
                int _833 = int(_829) & 3;
                float _835 = (*spvDescriptorSet0.vp_c3)._m0[int(_831)][_833];
                int _837 = int(_829) + 1;
                uint _839 = uint(int(uint(_837) >> uint(2)));
                int _841 = _837 & 3;
                float _843 = (*spvDescriptorSet0.vp_c3)._m0[int(_839)][_841];
                int _845 = _827 + 8;
                uint _847 = uint(int(uint(_845) >> uint(2)));
                uint _849 = uint(int(uint(int(_847)) >> uint(2)));
                int _851 = int(_847) & 3;
                float _853 = (*spvDescriptorSet0.vp_c3)._m0[int(_849)][_851];
                int _855 = int(_847) + 1;
                uint _857 = uint(int(uint(_855) >> uint(2)));
                int _859 = _855 & 3;
                float _861 = (*spvDescriptorSet0.vp_c3)._m0[int(_857)][_859];
                _132 = _739;
                _182 = _835;
                _186 = _843;
                _190 = _853;
                _194 = _861;
            }
        }
    }
    _196 = false;
    float _863 = _132;
    float _865 = _178;
    float _867 = _172;
    float _869 = _166;
    float _871 = _152;
    float _873 = _160;
    bool _875 = _144;
    float _877 = _182;
    float _879 = _186;
    float _881 = _190;
    float _883 = _194;
    bool _885 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _887 = !_885;
    float _889 = _867;
    float _891 = _865;
    float _893 = _871;
    float _895 = _873;
    float _897 = _869;
    float _899 = _867;
    float _901 = _865;
    float _903 = _863;
    int _905 = as_type<int>(_865);
    float _907 = _863;
    float _909 = _863;
    float _911 = _865;
    float _925;
    float _927;
    if (!_887)
    {
        float _913 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _915 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _917 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _913);
        float _919 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _915);
        float _921 = _917 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _923 = _919 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _925 = _923;
        _927 = _921;
        _929 = true;
    }
    else
    {
        int _931 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _933 = _931 != 0;
        if (!_933)
        {
            _889 = _871;
        }
        float _935 = _889;
        float _937 = _935;
        _927 = _935;
        if (!_933)
        {
            _891 = _873;
        }
        float _939 = _891;
        bool _941 = !_933;
        float _943 = _939;
        _925 = _939;
        if (!_941)
        {
            if (!_875)
            {
                _937 = _871;
            }
            float _945 = _937;
            float _947 = _945;
            int _949 = as_type<int>(_945);
            if (!_875)
            {
                _943 = _873;
            }
            float _951 = _943;
            bool _953 = !_875;
            float _955 = _951;
            float _957 = _951;
            if (!_953)
            {
                int _959 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _961 = _959 != 0;
                int _963 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _965 = _963 != 0;
                int _967 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _969 = _967 != 0;
                int _971 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _973 = _971 != 0;
                int _975 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _977 = _975 != 0;
                if (_961)
                {
                    _947 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _979 = _947;
                float _981 = _979;
                if (_961)
                {
                    _955 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _983 = _955;
                float _985 = _983;
                if (!_961)
                {
                    _981 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _987 = _981;
                if (!_961)
                {
                    _985 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _989 = _985;
                float _991 = _987 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _993 = _989 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_973)
                {
                    float _995 = _991 * _871;
                    _893 = _995;
                }
                float _997 = _893;
                float _999 = -_991;
                float _1001 = _999 + 1.0;
                int _1003 = as_type<int>(_997);
                if (_977)
                {
                    float _1005 = _993 * _873;
                    _895 = _1005;
                }
                float _1007 = _895;
                float _1009 = -_993;
                float _1011 = _1009 + 1.0;
                float _1013 = _1007;
                if (_965)
                {
                    float _1015 = _997 + _1001;
                    _1003 = as_type<int>(_1015);
                }
                int _1017 = _1003;
                if (_969)
                {
                    float _1019 = _1007 + _1011;
                    _1013 = _1019;
                }
                float _1021 = _1013;
                _949 = _1017;
                _957 = _1021;
            }
            int _1023 = _949;
            float _1025 = _957;
            int _1027 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1029 = _1027 != 0;
            int _1031 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1033 = _1031 != 0;
            int _1035 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1037 = _1035 != 0;
            int _1039 = _1023;
            int _1041 = as_type<int>(_1025);
            if (_1033)
            {
                float _1043 = -as_type<float>(_1023);
                float _1045 = _1043 + 1.0;
                _1039 = as_type<int>(_1045);
            }
            int _1047 = _1039;
            if (_1037)
            {
                float _1049 = -_1025;
                float _1051 = _1049 + 1.0;
                _1041 = as_type<int>(_1051);
            }
            int _1053 = _1041;
            bool _1055 = !_1029;
            float _1057 = _1055 ? as_type<float>(_1047) : as_type<float>(_1053);
            bool _1059 = !_1029;
            float _1061 = _1059 ? as_type<float>(_1053) : as_type<float>(_1047);
            _925 = _1061;
            _927 = _1057;
        }
    }
    _929 = false;
    float _1063 = _925;
    float _1065 = _927;
    float _1067 = _1063 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _1069 = _1063 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _1071 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _1073 = fma(_1065, (*spvDescriptorSet0.vp_c3)._m0[8].x, _1067);
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c3)._m0[7].x, _1069);
    float _1077 = _1073 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _1079 = _1075 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _1081 = -_1077;
    float _1083 = _1081 + 1.0;
    out.m_27.x = _1079;
    out.m_27.y = _1083;
    bool _1085 = !_1071;
    float _1087 = _1079;
    float _1089 = _1075;
    float _1103;
    float _1105;
    if (!_1085)
    {
        float _1091 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1093 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1095 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _1091);
        float _1097 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1093);
        float _1099 = _1095 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1101 = _1097 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _1103 = _1101;
        _1105 = _1099;
        _1107 = true;
    }
    else
    {
        int _1109 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1111 = _1109 != 0;
        if (!_1111)
        {
            _1087 = _869;
        }
        float _1113 = _1087;
        float _1115 = _1113;
        _1105 = _1113;
        if (!_1111)
        {
            _1089 = _867;
        }
        float _1117 = _1089;
        bool _1119 = !_1111;
        float _1121 = _1117;
        _1103 = _1117;
        if (!_1119)
        {
            if (!_875)
            {
                _1115 = _869;
            }
            float _1123 = _1115;
            float _1125 = _1123;
            int _1127 = as_type<int>(_1123);
            if (!_875)
            {
                _1121 = _867;
            }
            float _1129 = _1121;
            bool _1131 = !_875;
            float _1133 = _1129;
            float _1135 = _1129;
            if (!_1131)
            {
                int _1137 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1139 = _1137 != 0;
                int _1141 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1143 = _1141 != 0;
                int _1145 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1147 = _1145 != 0;
                int _1149 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1151 = _1149 != 0;
                int _1153 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1155 = _1153 != 0;
                if (_1139)
                {
                    _1125 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1157 = _1125;
                float _1159 = _1157;
                if (_1139)
                {
                    _1133 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1161 = _1133;
                float _1163 = _1161;
                if (!_1139)
                {
                    _1159 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1165 = _1159;
                if (!_1139)
                {
                    _1163 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1167 = _1163;
                float _1169 = _1165 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1171 = _1167 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1151)
                {
                    float _1173 = _1169 * _869;
                    _897 = _1173;
                }
                float _1175 = _897;
                float _1177 = -_1169;
                float _1179 = _1177 + 1.0;
                int _1181 = as_type<int>(_1175);
                if (_1155)
                {
                    float _1183 = _1171 * _867;
                    _899 = _1183;
                }
                float _1185 = _899;
                float _1187 = -_1171;
                float _1189 = _1187 + 1.0;
                float _1191 = _1185;
                if (_1143)
                {
                    float _1193 = _1175 + _1179;
                    _1181 = as_type<int>(_1193);
                }
                int _1195 = _1181;
                if (_1147)
                {
                    float _1197 = _1185 + _1189;
                    _1191 = _1197;
                }
                float _1199 = _1191;
                _1127 = _1195;
                _1135 = _1199;
            }
            int _1201 = _1127;
            float _1203 = _1135;
            int _1205 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1207 = _1205 != 0;
            int _1209 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1211 = _1209 != 0;
            int _1213 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1215 = _1213 != 0;
            int _1217 = _1201;
            int _1219 = as_type<int>(_1203);
            if (_1211)
            {
                float _1221 = -as_type<float>(_1201);
                float _1223 = _1221 + 1.0;
                _1217 = as_type<int>(_1223);
            }
            int _1225 = _1217;
            if (_1215)
            {
                float _1227 = -_1203;
                float _1229 = _1227 + 1.0;
                _1219 = as_type<int>(_1229);
            }
            int _1231 = _1219;
            bool _1233 = !_1207;
            float _1235 = _1233 ? as_type<float>(_1225) : as_type<float>(_1231);
            bool _1237 = !_1207;
            float _1239 = _1237 ? as_type<float>(_1231) : as_type<float>(_1225);
            _1103 = _1239;
            _1105 = _1235;
        }
    }
    _1107 = false;
    float _1241 = _1103;
    float _1243 = _1105;
    float _1245 = _1241 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1247 = _1241 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _1249 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _1251 = fma(_1243, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1245);
    float _1253 = fma(_1243, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1247);
    float _1255 = _1251 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1257 = _1253 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1259 = -_1255;
    float _1261 = _1259 + 1.0;
    out.m_29.x = _1257;
    out.m_29.y = _1261;
    bool _1263 = !_1249;
    if (!_1263)
    {
        float _1265 = _53 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _1267 = _53 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _1269 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[22].x, _1265);
        float _1271 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[23].x, _1267);
        float _1273 = _1269 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _1275 = _1271 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _909 = _1275;
        _911 = _1273;
        _1277 = true;
    }
    else
    {
        int _1279 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1281 = _1279 != 0;
        bool _1283 = !_1281;
        if (!_1283)
        {
            bool _1285 = !_875;
            if (!_1285)
            {
                int _1287 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1289 = _1287 != 0;
                int _1291 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1293 = _1291 != 0;
                int _1295 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1297 = _1295 != 0;
                int _1299 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1301 = _1299 != 0;
                int _1303 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1305 = _1303 != 0;
                if (_1289)
                {
                    _134 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1307 = _134;
                float _1309 = _1307;
                if (_1289)
                {
                    _136 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1311 = _136;
                float _1313 = _1311;
                if (!_1289)
                {
                    _1309 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1315 = _1309;
                if (!_1289)
                {
                    _1313 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1317 = _1313;
                float _1319 = _1315 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1321 = _1317 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1301)
                {
                    float _1323 = _1319 * _865;
                    _901 = _1323;
                }
                float _1325 = _901;
                float _1327 = -_1319;
                float _1329 = _1327 + 1.0;
                int _1331 = as_type<int>(_1325);
                if (_1305)
                {
                    float _1333 = _1321 * _863;
                    _903 = _1333;
                }
                float _1335 = _903;
                float _1337 = -_1321;
                float _1339 = _1337 + 1.0;
                _907 = _1335;
                if (_1293)
                {
                    float _1341 = _1325 + _1329;
                    _1331 = as_type<int>(_1341);
                }
                int _1343 = _1331;
                _905 = _1343;
                if (_1297)
                {
                    float _1345 = _1335 + _1339;
                    _907 = _1345;
                }
            }
            int _1347 = _905;
            float _1349 = _907;
            int _1351 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1353 = _1351 != 0;
            int _1355 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1357 = _1355 != 0;
            int _1359 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1361 = _1359 != 0;
            int _1363 = _1347;
            int _1365 = as_type<int>(_1349);
            if (_1357)
            {
                float _1367 = -as_type<float>(_1347);
                float _1369 = _1367 + 1.0;
                _1363 = as_type<int>(_1369);
            }
            int _1371 = _1363;
            if (_1361)
            {
                float _1373 = -_1349;
                float _1375 = _1373 + 1.0;
                _1365 = as_type<int>(_1375);
            }
            int _1377 = _1365;
            bool _1379 = !_1353;
            float _1381 = _1379 ? as_type<float>(_1371) : as_type<float>(_1377);
            bool _1383 = !_1353;
            float _1385 = _1383 ? as_type<float>(_1377) : as_type<float>(_1371);
            _909 = _1385;
            _911 = _1381;
        }
    }
    _1277 = false;
    float _1387 = _909;
    float _1389 = _911;
    float _1391 = _1387 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1393 = _1387 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _1395 = _877 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1397 = _879 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1399 = fma(_1389, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1391);
    float _1401 = fma(_1389, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1393);
    float _1403 = _881 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1405 = _883 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1407 = _1399 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1409 = _1401 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _1411 = -_1407;
    float _1413 = _1411 + 1.0;
    out.m_31.x = _1395;
    out.m_31.y = _1397;
    out.m_31.z = _1403;
    out.m_31.w = _1405;
    out.m_33.x = _1409;
    out.m_33.y = _1413;
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
    bool _1277 = false;
    bool _1107 = false;
    bool _929 = false;
    bool _196 = false;
    bool _399 = false;
    bool _397 = false;
    bool _393 = false;
    bool _389 = false;
    bool _385 = false;
    bool _381 = false;
    bool _377 = false;
    bool _373 = false;
    bool _369 = false;
    bool _365 = false;
    bool _361 = false;
    bool _357 = false;
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
    float _75 = _69 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _77 = _69 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _79 = _69 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _81 = _69 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _85 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].x, _81);
    float _91 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[1].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[0].z, _85);
    float _95 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[2].z, _87);
    float _97 = fma(_73, (*spvDescriptorSet0.vp_c3)._m0[3].z, _89);
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _101;
    out.gl_Position.y = _99;
    out.gl_Position.z = _103;
    out.gl_Position.w = _105;
    int _108 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _112 = _108 != 0;
    bool _114 = !_112;
    float _116 = _89;
    float _118 = _73;
    float _120 = _101;
    float _122 = _99;
    float _124 = _103;
    float _126 = _105;
    float _128 = _89;
    float _130 = _73;
    float _132 = _49;
    float _134 = _53;
    float _136 = _55;
    bool _144;
    float _152;
    float _160;
    float _166;
    float _172;
    float _178;
    float _182;
    float _186;
    float _190;
    float _194;
    if (!_114)
    {
        int _138 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _140 = _138 != 0;
        float _142 = 0.0;
        _144 = _140;
        if (_140)
        {
            _142 = _47;
        }
        float _146 = _142;
        float _148 = 0.0;
        float _150 = _146;
        _152 = _146;
        if (_140)
        {
            _148 = _49;
        }
        float _154 = _148;
        float _156 = 0.0;
        float _158 = _154;
        _160 = _154;
        if (_140)
        {
            _156 = _47;
        }
        float _162 = _156;
        float _164 = _162;
        _166 = _162;
        if (_140)
        {
            _116 = _49;
        }
        float _168 = _116;
        float _170 = _168;
        _172 = _168;
        if (_140)
        {
            _118 = _47;
        }
        float _174 = _118;
        float _176 = _174;
        _178 = _174;
        if (_140)
        {
            _120 = 255.0;
        }
        float _180 = _120;
        _182 = _180;
        if (_140)
        {
            _122 = 255.0;
        }
        float _184 = _122;
        _186 = _184;
        if (_140)
        {
            _124 = 255.0;
        }
        float _188 = _124;
        _190 = _188;
        if (_140)
        {
            _126 = 255.0;
        }
        float _192 = _126;
        _194 = _192;
        _196 = _140;
        if (!_196)
        {
            float _198 = trunc(_47);
            int _200 = int(_198);
            float _202 = trunc(_49);
            int _204 = int(_202);
            int _206 = _204 << 1;
            int _208 = _206 + _200;
            int _210 = _208 << 4;
            bool _212 = _210 == 0;
            bool _214 = _210 == 16;
            bool _216 = _210 == 32;
            bool _218 = _210 == 48;
            float _220 = as_type<float>(_204);
            _182 = 255.0;
            _186 = 255.0;
            _190 = 255.0;
            _194 = 255.0;
            if (_212)
            {
                _150 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _222 = _150;
            float _224 = _222;
            if (_212)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _226 = _158;
            float _228 = _226;
            if (_212)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _230 = _164;
            float _232 = _230;
            if (_212)
            {
                _170 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _234 = _170;
            float _236 = _234;
            if (_212)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _238 = _176;
            float _240 = _238;
            if (_212)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _242 = _220;
            float _244 = _242;
            if (_214)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _246 = _224;
            float _248 = _246;
            if (_214)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _250 = _228;
            float _252 = _250;
            if (_214)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _254 = _232;
            float _256 = _254;
            if (_214)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _258 = _236;
            float _260 = _258;
            if (_214)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _262 = _240;
            float _264 = _262;
            if (_214)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _266 = _244;
            float _268 = _266;
            if (_216)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _270 = _248;
            float _272 = _270;
            if (_216)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _274 = _252;
            float _276 = _274;
            if (_216)
            {
                _256 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _278 = _256;
            float _280 = _278;
            if (_216)
            {
                _260 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _282 = _260;
            float _284 = _282;
            if (_216)
            {
                _264 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _286 = _264;
            float _288 = _286;
            if (_216)
            {
                _268 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _290 = _268;
            float _292 = _290;
            if (_218)
            {
                _272 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _294 = _272;
            _152 = _294;
            if (_218)
            {
                _276 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _296 = _276;
            _160 = _296;
            if (_218)
            {
                _280 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _298 = _280;
            _166 = _298;
            if (_218)
            {
                _284 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _300 = _284;
            _172 = _300;
            if (_218)
            {
                _288 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _302 = _288;
            _178 = _302;
            if (_218)
            {
                _292 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _304 = _292;
            _132 = _304;
            _196 = true;
        }
    }
    else
    {
        int _306 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _308 = _306 != 0;
        uint _311 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _313 = int(_311) & 15;
        bool _315 = !_308;
        _144 = _308;
        if (!_315)
        {
            uint _317 = min(uint(_313), 13u);
            float _319 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _321 = int(_317) << 2;
            uint _323 = uint(int(uint(_321) >> uint(2)));
            uint _325 = uint(int(uint(int(_323)) >> uint(2)));
            int _327 = int(_323) & 3;
            float _329 = (*spvDescriptorSet0.vp_c1)._m0[int(_325)][_327];
            float _331 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _333 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _335 = _319 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _337 = _331 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _339 = _331 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _341 = as_type<int>(_329) >> 31;
            bool _343 = as_type<int>(_329) == 1552;
            float _345 = _333;
            float _347 = _335;
            float _349 = _329;
            float _351 = as_type<float>(_341);
            float _353 = _339;
            if (!_343)
            {
                bool _355 = as_type<int>(_329) == 1600;
                _357 = _355;
                if (!_357)
                {
                    bool _359 = as_type<int>(_329) == 1664;
                    _361 = _359;
                    if (!_361)
                    {
                        bool _363 = as_type<int>(_329) == 1728;
                        _365 = _363;
                        if (!_365)
                        {
                            bool _367 = as_type<int>(_329) == 1808;
                            _369 = _367;
                            if (!_369)
                            {
                                bool _371 = as_type<int>(_329) == 1888;
                                _373 = _371;
                                if (!_373)
                                {
                                    bool _375 = as_type<int>(_329) == 1984;
                                    _377 = _375;
                                    if (!_377)
                                    {
                                        bool _379 = as_type<int>(_329) == 2064;
                                        _381 = _379;
                                        if (!_381)
                                        {
                                            bool _383 = as_type<int>(_329) == 2160;
                                            _385 = _383;
                                            if (!_385)
                                            {
                                                bool _387 = as_type<int>(_329) == 2224;
                                                _389 = _387;
                                                if (!_389)
                                                {
                                                    bool _391 = as_type<int>(_329) == 2304;
                                                    _393 = _391;
                                                    if (!_393)
                                                    {
                                                        bool _395 = as_type<int>(_329) == 2368;
                                                        _397 = _395;
                                                        if (!_397)
                                                        {
                                                            _399 = true;
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
            float _405;
            float _407;
            if (!_357)
            {
                if (!_361)
                {
                    if (!_365)
                    {
                        if (!_369)
                        {
                            if (!_373)
                            {
                                if (!_377)
                                {
                                    if (!_381)
                                    {
                                        if (!_385)
                                        {
                                            if (!_389)
                                            {
                                                if (!_393)
                                                {
                                                    if (!_397)
                                                    {
                                                        if (!_399)
                                                        {
                                                            float _401 = _333 * _47;
                                                            float _403 = _337 * _49;
                                                            _405 = _403;
                                                            _407 = _401;
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
            if ((((((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369) || _365) || _361) || _357)
            {
                if ((!_361) || _357)
                {
                    if ((!_365) || _357)
                    {
                        if ((!_369) || _357)
                        {
                            if ((!_373) || _357)
                            {
                                if ((!_377) || _357)
                                {
                                    if ((!_381) || _357)
                                    {
                                        if ((!_385) || _357)
                                        {
                                            if ((!_389) || _357)
                                            {
                                                if ((!_393) || _357)
                                                {
                                                    if ((!_397) || _357)
                                                    {
                                                        if ((!_399) || _357)
                                                        {
                                                            _357 = false;
                                                            float _409 = -_335;
                                                            float _411 = _409 + 1.0;
                                                            float _413 = _337 * _49;
                                                            float _415 = fma(_335, _47, _411);
                                                            _405 = _413;
                                                            _407 = _415;
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
                if (((((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369) || _365) || _361)
                {
                    if ((!_365) || _361)
                    {
                        if ((!_369) || _361)
                        {
                            if ((!_373) || _361)
                            {
                                if ((!_377) || _361)
                                {
                                    if ((!_381) || _361)
                                    {
                                        if ((!_385) || _361)
                                        {
                                            if ((!_389) || _361)
                                            {
                                                if ((!_393) || _361)
                                                {
                                                    if ((!_397) || _361)
                                                    {
                                                        if ((!_399) || _361)
                                                        {
                                                            _361 = false;
                                                            float _417 = -_339;
                                                            float _419 = _417 + 1.0;
                                                            float _421 = _333 * _47;
                                                            float _423 = fma(_339, _49, _419);
                                                            _405 = _423;
                                                            _407 = _421;
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
                    if ((((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369) || _365)
                    {
                        if ((!_369) || _365)
                        {
                            if ((!_373) || _365)
                            {
                                if ((!_377) || _365)
                                {
                                    if ((!_381) || _365)
                                    {
                                        if ((!_385) || _365)
                                        {
                                            if ((!_389) || _365)
                                            {
                                                if ((!_393) || _365)
                                                {
                                                    if ((!_397) || _365)
                                                    {
                                                        if ((!_399) || _365)
                                                        {
                                                            _365 = false;
                                                            float _425 = -_335;
                                                            float _427 = _425 + 1.0;
                                                            float _429 = -_339;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = fma(_335, _47, _427);
                                                            float _435 = fma(_339, _49, _431);
                                                            _405 = _435;
                                                            _407 = _433;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373) || _369)
                        {
                            if ((!_373) || _369)
                            {
                                if ((!_377) || _369)
                                {
                                    if ((!_381) || _369)
                                    {
                                        if ((!_385) || _369)
                                        {
                                            if ((!_389) || _369)
                                            {
                                                if ((!_393) || _369)
                                                {
                                                    if ((!_397) || _369)
                                                    {
                                                        if ((!_399) || _369)
                                                        {
                                                            _369 = false;
                                                            float _437 = -_337;
                                                            float _439 = _437 + 1.0;
                                                            float _441 = -_339;
                                                            float _443 = _441 + _439;
                                                            float _445 = _333 * _47;
                                                            float _447 = fma(_443, _49, _337);
                                                            _405 = _447;
                                                            _407 = _445;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377) || _373)
                            {
                                if ((!_377) || _373)
                                {
                                    if ((!_381) || _373)
                                    {
                                        if ((!_385) || _373)
                                        {
                                            if ((!_389) || _373)
                                            {
                                                if ((!_393) || _373)
                                                {
                                                    if ((!_397) || _373)
                                                    {
                                                        if ((!_399) || _373)
                                                        {
                                                            _373 = false;
                                                            float _449 = -_337;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = -_335;
                                                            float _455 = _453 + 1.0;
                                                            float _457 = -_339;
                                                            float _459 = _457 + _451;
                                                            float _461 = fma(_335, _47, _455);
                                                            float _463 = fma(_459, _49, _337);
                                                            _405 = _463;
                                                            _407 = _461;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _399) || _397) || _393) || _389) || _385) || _381) || _377)
                                {
                                    if ((!_381) || _377)
                                    {
                                        if ((!_385) || _377)
                                        {
                                            if ((!_389) || _377)
                                            {
                                                if ((!_393) || _377)
                                                {
                                                    if ((!_397) || _377)
                                                    {
                                                        if ((!_399) || _377)
                                                        {
                                                            _377 = false;
                                                            float _465 = -_333;
                                                            float _467 = _465 + 1.0;
                                                            float _469 = -_335;
                                                            float _471 = _469 + _467;
                                                            float _473 = _337 * _49;
                                                            float _475 = fma(_471, _47, _333);
                                                            _405 = _473;
                                                            _407 = _475;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _399) || _397) || _393) || _389) || _385) || _381)
                                    {
                                        if ((!_385) || _381)
                                        {
                                            if ((!_389) || _381)
                                            {
                                                if ((!_393) || _381)
                                                {
                                                    if ((!_397) || _381)
                                                    {
                                                        if ((!_399) || _381)
                                                        {
                                                            _381 = false;
                                                            float _477 = -_333;
                                                            float _479 = _477 + 1.0;
                                                            float _481 = -_339;
                                                            float _483 = _481 + 1.0;
                                                            float _485 = -_335;
                                                            float _487 = _485 + _479;
                                                            float _489 = fma(_339, _49, _483);
                                                            float _491 = fma(_487, _47, _333);
                                                            _405 = _489;
                                                            _407 = _491;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _399) || _397) || _393) || _389) || _385)
                                        {
                                            if ((!_389) || _385)
                                            {
                                                if ((!_393) || _385)
                                                {
                                                    if ((!_397) || _385)
                                                    {
                                                        if ((!_399) || _385)
                                                        {
                                                            _385 = false;
                                                            float _493 = -_335;
                                                            float _495 = _493 + 1.0;
                                                            float _497 = _337 * _49;
                                                            float _499 = _495 * _47;
                                                            _405 = _497;
                                                            _407 = _499;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _399) || _397) || _393) || _389)
                                            {
                                                if ((!_393) || _389)
                                                {
                                                    if ((!_397) || _389)
                                                    {
                                                        if ((!_399) || _389)
                                                        {
                                                            _389 = false;
                                                            float _501 = -_335;
                                                            float _503 = _501 + 1.0;
                                                            float _505 = -_339;
                                                            float _507 = _505 + 1.0;
                                                            float _509 = fma(_335, _47, _503);
                                                            float _511 = _507 * _49;
                                                            _405 = _511;
                                                            _407 = _509;
                                                        }
                                                    }
                                                }
                                                if (((false || _399) || _397) || _393)
                                                {
                                                    if ((!_397) || _393)
                                                    {
                                                        if ((!_399) || _393)
                                                        {
                                                            _393 = false;
                                                            float _513 = -_337;
                                                            float _515 = _513 + 1.0;
                                                            float _517 = _333 * _47;
                                                            float _519 = fma(_515, _49, _337);
                                                            _405 = _519;
                                                            _407 = _517;
                                                        }
                                                    }
                                                    if ((false || _399) || _397)
                                                    {
                                                        if ((!_399) || _397)
                                                        {
                                                            _397 = false;
                                                            float _521 = -_333;
                                                            float _523 = _521 + 1.0;
                                                            float _525 = -_339;
                                                            float _527 = _525 + 1.0;
                                                            float _529 = fma(_523, _47, _333);
                                                            float _531 = fma(_339, _49, _527);
                                                            _405 = _531;
                                                            _407 = _529;
                                                        }
                                                        if (false || _399)
                                                        {
                                                            _399 = false;
                                                            bool _533 = _313 != 12;
                                                            if (!_533)
                                                            {
                                                                float _535 = -_337;
                                                                float _537 = _535 + 1.0;
                                                                _345 = _537;
                                                            }
                                                            float _539 = _345;
                                                            if (!_533)
                                                            {
                                                                float _541 = -_335;
                                                                float _543 = _541 + 1.0;
                                                                _347 = _543;
                                                            }
                                                            float _545 = _347;
                                                            if (_533)
                                                            {
                                                                _349 = 0.0;
                                                                _351 = 0.0;
                                                            }
                                                            float _547 = _349;
                                                            float _549 = _351;
                                                            float _551 = _549;
                                                            _405 = _547;
                                                            if (!_533)
                                                            {
                                                                float _553 = -_339;
                                                                float _555 = _553 + _539;
                                                                _353 = _555;
                                                            }
                                                            float _557 = _353;
                                                            if (!_533)
                                                            {
                                                                float _559 = _47 * _545;
                                                                _551 = _559;
                                                            }
                                                            float _561 = _551;
                                                            _407 = _561;
                                                            if (!_533)
                                                            {
                                                                float _563 = _49 * _557;
                                                                _405 = _563;
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
            float _565 = _405;
            float _567 = _407;
            float _569 = -_565;
            float _571 = _569 + 1.0;
            float _573 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _575 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _577 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _579 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _581 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _583 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _585 = _565 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _587 = _565 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _589 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].x, _573);
            float _591 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].x, _575);
            float _593 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].y, _577);
            float _595 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].y, _579);
            float _597 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].z, _581);
            float _599 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].z, _583);
            float _601 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[29].w, _585);
            float _603 = fma(_571, (*spvDescriptorSet0.vp_c3)._m0[30].w, _587);
            float _605 = _589 * _567;
            float _607 = _593 * _567;
            float _609 = _597 * _567;
            float _611 = -_567;
            float _613 = _611 + 1.0;
            float _615 = _603 * _567;
            float _617 = fma(_613, _591, _605);
            float _619 = fma(_613, _595, _607);
            float _621 = fma(_613, _599, _609);
            float _623 = fma(_613, _601, _615);
            _178 = _47;
            _172 = _49;
            _166 = _47;
            _152 = _47;
            _160 = _49;
            _182 = _617;
            _186 = _619;
            _190 = _621;
            _194 = _623;
            _196 = true;
        }
        else
        {
            float _625 = trunc(_47);
            int _627 = int(_625);
            bool _629 = _313 != 13;
            float _631 = trunc(_49);
            int _633 = int(_631);
            int _635 = _633 << 1;
            int _637 = _635 + _627;
            int _639 = _637 << 4;
            bool _641 = _639 == 0;
            bool _643 = _639 == 16;
            bool _645 = _639 == 32;
            bool _647 = _639 == 48;
            float _649 = 0.0;
            if (_641)
            {
                _649 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _651 = _649;
            float _653 = 0.0;
            float _655 = _651;
            if (_641)
            {
                _653 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _657 = _653;
            float _659 = 0.0;
            float _661 = _657;
            if (_641)
            {
                _659 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _663 = _659;
            float _665 = _663;
            if (_641)
            {
                _128 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _667 = _128;
            float _669 = _667;
            if (_641)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _671 = _130;
            float _673 = 0.0;
            float _675 = _671;
            if (_641)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _677 = _673;
            float _679 = _677;
            if (_643)
            {
                _655 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _681 = _655;
            float _683 = _681;
            if (_643)
            {
                _661 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _685 = _661;
            float _687 = _685;
            if (_643)
            {
                _665 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _689 = _665;
            float _691 = _689;
            if (_643)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _693 = _669;
            float _695 = _693;
            if (_643)
            {
                _675 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _697 = _675;
            float _699 = _697;
            if (_643)
            {
                _679 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _701 = _679;
            float _703 = _701;
            if (_645)
            {
                _683 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _705 = _683;
            float _707 = _705;
            if (_645)
            {
                _687 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _709 = _687;
            float _711 = _709;
            if (_645)
            {
                _691 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _713 = _691;
            float _715 = _713;
            if (_645)
            {
                _695 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _717 = _695;
            float _719 = _717;
            if (_645)
            {
                _699 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _721 = _699;
            float _723 = _721;
            if (_645)
            {
                _703 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _725 = _703;
            float _727 = _725;
            if (_647)
            {
                _707 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _729 = _707;
            _152 = _729;
            if (_647)
            {
                _711 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _731 = _711;
            _160 = _731;
            if (_647)
            {
                _715 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _733 = _715;
            _166 = _733;
            if (_647)
            {
                _719 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _735 = _719;
            _172 = _735;
            if (_647)
            {
                _723 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _737 = _723;
            _178 = _737;
            if (_647)
            {
                _727 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _739 = _727;
            if (!_629)
            {
                float _741 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _743 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _745 = _741 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _747 = -_745;
                float _749 = _747 + 1.0;
                float _751 = _743 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _753 = -_741;
                float _755 = fma(_753, (*spvDescriptorSet0.vp_c3)._m0[26].w, _749);
                float _757 = -_751;
                float _759 = _757 + 1.0;
                float _761 = fma(_755, _49, _745);
                float _763 = -_743;
                float _765 = fma(_763, (*spvDescriptorSet0.vp_c3)._m0[26].y, _759);
                float _767 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _769 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _771 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _773 = fma(_765, _47, _751);
                float _775 = -_761;
                float _777 = _775 + 1.0;
                float _779 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _781 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _783 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _785 = _761 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _787 = _761 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _789 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].x, _767);
                float _791 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].x, _769);
                float _793 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].y, _771);
                float _795 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].y, _779);
                float _797 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].z, _781);
                float _799 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].z, _783);
                float _801 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[29].w, _785);
                float _803 = fma(_777, (*spvDescriptorSet0.vp_c3)._m0[30].w, _787);
                float _805 = -_773;
                float _807 = _805 + 1.0;
                float _809 = _773 * _789;
                float _811 = _773 * _793;
                float _813 = _773 * _797;
                float _815 = _773 * _803;
                float _817 = fma(_807, _791, _809);
                float _819 = fma(_807, _795, _811);
                float _821 = fma(_807, _799, _813);
                float _823 = fma(_807, _801, _815);
                _132 = _739;
                _182 = _817;
                _186 = _819;
                _190 = _821;
                _194 = _823;
                _196 = true;
            }
            else
            {
                int _825 = _637 << 4;
                int _827 = _825 + 464;
                uint _829 = uint(int(uint(_827) >> uint(2)));
                uint _831 = uint(int(uint(int(_829)) >> uint(2)));
                int _833 = int(_829) & 3;
                float _835 = (*spvDescriptorSet0.vp_c3)._m0[int(_831)][_833];
                int _837 = int(_829) + 1;
                uint _839 = uint(int(uint(_837) >> uint(2)));
                int _841 = _837 & 3;
                float _843 = (*spvDescriptorSet0.vp_c3)._m0[int(_839)][_841];
                int _845 = _827 + 8;
                uint _847 = uint(int(uint(_845) >> uint(2)));
                uint _849 = uint(int(uint(int(_847)) >> uint(2)));
                int _851 = int(_847) & 3;
                float _853 = (*spvDescriptorSet0.vp_c3)._m0[int(_849)][_851];
                int _855 = int(_847) + 1;
                uint _857 = uint(int(uint(_855) >> uint(2)));
                int _859 = _855 & 3;
                float _861 = (*spvDescriptorSet0.vp_c3)._m0[int(_857)][_859];
                _132 = _739;
                _182 = _835;
                _186 = _843;
                _190 = _853;
                _194 = _861;
            }
        }
    }
    _196 = false;
    float _863 = _132;
    float _865 = _178;
    float _867 = _172;
    float _869 = _166;
    float _871 = _152;
    float _873 = _160;
    bool _875 = _144;
    float _877 = _182;
    float _879 = _186;
    float _881 = _190;
    float _883 = _194;
    bool _885 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _887 = !_885;
    float _889 = _867;
    float _891 = _865;
    float _893 = _871;
    float _895 = _873;
    float _897 = _869;
    float _899 = _867;
    float _901 = _865;
    float _903 = _863;
    int _905 = as_type<int>(_865);
    float _907 = _863;
    float _909 = _863;
    float _911 = _865;
    float _925;
    float _927;
    if (!_887)
    {
        float _913 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _915 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _917 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _913);
        float _919 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _915);
        float _921 = _917 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _923 = _919 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _925 = _923;
        _927 = _921;
        _929 = true;
    }
    else
    {
        int _931 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _933 = _931 != 0;
        if (!_933)
        {
            _889 = _871;
        }
        float _935 = _889;
        float _937 = _935;
        _927 = _935;
        if (!_933)
        {
            _891 = _873;
        }
        float _939 = _891;
        bool _941 = !_933;
        float _943 = _939;
        _925 = _939;
        if (!_941)
        {
            if (!_875)
            {
                _937 = _871;
            }
            float _945 = _937;
            float _947 = _945;
            int _949 = as_type<int>(_945);
            if (!_875)
            {
                _943 = _873;
            }
            float _951 = _943;
            bool _953 = !_875;
            float _955 = _951;
            float _957 = _951;
            if (!_953)
            {
                int _959 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _961 = _959 != 0;
                int _963 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _965 = _963 != 0;
                int _967 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _969 = _967 != 0;
                int _971 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _973 = _971 != 0;
                int _975 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _977 = _975 != 0;
                if (_961)
                {
                    _947 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _979 = _947;
                float _981 = _979;
                if (_961)
                {
                    _955 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _983 = _955;
                float _985 = _983;
                if (!_961)
                {
                    _981 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _987 = _981;
                if (!_961)
                {
                    _985 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _989 = _985;
                float _991 = _987 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _993 = _989 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_973)
                {
                    float _995 = _991 * _871;
                    _893 = _995;
                }
                float _997 = _893;
                float _999 = -_991;
                float _1001 = _999 + 1.0;
                int _1003 = as_type<int>(_997);
                if (_977)
                {
                    float _1005 = _993 * _873;
                    _895 = _1005;
                }
                float _1007 = _895;
                float _1009 = -_993;
                float _1011 = _1009 + 1.0;
                float _1013 = _1007;
                if (_965)
                {
                    float _1015 = _997 + _1001;
                    _1003 = as_type<int>(_1015);
                }
                int _1017 = _1003;
                if (_969)
                {
                    float _1019 = _1007 + _1011;
                    _1013 = _1019;
                }
                float _1021 = _1013;
                _949 = _1017;
                _957 = _1021;
            }
            int _1023 = _949;
            float _1025 = _957;
            int _1027 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1029 = _1027 != 0;
            int _1031 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1033 = _1031 != 0;
            int _1035 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1037 = _1035 != 0;
            int _1039 = _1023;
            int _1041 = as_type<int>(_1025);
            if (_1033)
            {
                float _1043 = -as_type<float>(_1023);
                float _1045 = _1043 + 1.0;
                _1039 = as_type<int>(_1045);
            }
            int _1047 = _1039;
            if (_1037)
            {
                float _1049 = -_1025;
                float _1051 = _1049 + 1.0;
                _1041 = as_type<int>(_1051);
            }
            int _1053 = _1041;
            bool _1055 = !_1029;
            float _1057 = _1055 ? as_type<float>(_1047) : as_type<float>(_1053);
            bool _1059 = !_1029;
            float _1061 = _1059 ? as_type<float>(_1053) : as_type<float>(_1047);
            _925 = _1061;
            _927 = _1057;
        }
    }
    _929 = false;
    float _1063 = _925;
    float _1065 = _927;
    float _1067 = _1063 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _1069 = _1063 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _1071 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _1073 = fma(_1065, (*spvDescriptorSet0.vp_c3)._m0[8].x, _1067);
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c3)._m0[7].x, _1069);
    float _1077 = _1073 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _1079 = _1075 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _1081 = -_1077;
    float _1083 = _1081 + 1.0;
    out.m_27.x = _1079;
    out.m_27.y = _1083;
    bool _1085 = !_1071;
    float _1087 = _1079;
    float _1089 = _1075;
    float _1103;
    float _1105;
    if (!_1085)
    {
        float _1091 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1093 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1095 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _1091);
        float _1097 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1093);
        float _1099 = _1095 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1101 = _1097 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _1103 = _1101;
        _1105 = _1099;
        _1107 = true;
    }
    else
    {
        int _1109 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1111 = _1109 != 0;
        if (!_1111)
        {
            _1087 = _869;
        }
        float _1113 = _1087;
        float _1115 = _1113;
        _1105 = _1113;
        if (!_1111)
        {
            _1089 = _867;
        }
        float _1117 = _1089;
        bool _1119 = !_1111;
        float _1121 = _1117;
        _1103 = _1117;
        if (!_1119)
        {
            if (!_875)
            {
                _1115 = _869;
            }
            float _1123 = _1115;
            float _1125 = _1123;
            int _1127 = as_type<int>(_1123);
            if (!_875)
            {
                _1121 = _867;
            }
            float _1129 = _1121;
            bool _1131 = !_875;
            float _1133 = _1129;
            float _1135 = _1129;
            if (!_1131)
            {
                int _1137 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1139 = _1137 != 0;
                int _1141 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1143 = _1141 != 0;
                int _1145 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1147 = _1145 != 0;
                int _1149 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1151 = _1149 != 0;
                int _1153 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1155 = _1153 != 0;
                if (_1139)
                {
                    _1125 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1157 = _1125;
                float _1159 = _1157;
                if (_1139)
                {
                    _1133 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1161 = _1133;
                float _1163 = _1161;
                if (!_1139)
                {
                    _1159 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1165 = _1159;
                if (!_1139)
                {
                    _1163 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1167 = _1163;
                float _1169 = _1165 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1171 = _1167 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1151)
                {
                    float _1173 = _1169 * _869;
                    _897 = _1173;
                }
                float _1175 = _897;
                float _1177 = -_1169;
                float _1179 = _1177 + 1.0;
                int _1181 = as_type<int>(_1175);
                if (_1155)
                {
                    float _1183 = _1171 * _867;
                    _899 = _1183;
                }
                float _1185 = _899;
                float _1187 = -_1171;
                float _1189 = _1187 + 1.0;
                float _1191 = _1185;
                if (_1143)
                {
                    float _1193 = _1175 + _1179;
                    _1181 = as_type<int>(_1193);
                }
                int _1195 = _1181;
                if (_1147)
                {
                    float _1197 = _1185 + _1189;
                    _1191 = _1197;
                }
                float _1199 = _1191;
                _1127 = _1195;
                _1135 = _1199;
            }
            int _1201 = _1127;
            float _1203 = _1135;
            int _1205 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1207 = _1205 != 0;
            int _1209 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1211 = _1209 != 0;
            int _1213 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1215 = _1213 != 0;
            int _1217 = _1201;
            int _1219 = as_type<int>(_1203);
            if (_1211)
            {
                float _1221 = -as_type<float>(_1201);
                float _1223 = _1221 + 1.0;
                _1217 = as_type<int>(_1223);
            }
            int _1225 = _1217;
            if (_1215)
            {
                float _1227 = -_1203;
                float _1229 = _1227 + 1.0;
                _1219 = as_type<int>(_1229);
            }
            int _1231 = _1219;
            bool _1233 = !_1207;
            float _1235 = _1233 ? as_type<float>(_1225) : as_type<float>(_1231);
            bool _1237 = !_1207;
            float _1239 = _1237 ? as_type<float>(_1231) : as_type<float>(_1225);
            _1103 = _1239;
            _1105 = _1235;
        }
    }
    _1107 = false;
    float _1241 = _1103;
    float _1243 = _1105;
    float _1245 = _1241 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1247 = _1241 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _1249 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _1251 = fma(_1243, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1245);
    float _1253 = fma(_1243, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1247);
    float _1255 = _1251 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1257 = _1253 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1259 = -_1255;
    float _1261 = _1259 + 1.0;
    out.m_29.x = _1257;
    out.m_29.y = _1261;
    bool _1263 = !_1249;
    if (!_1263)
    {
        float _1265 = _53 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _1267 = _53 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _1269 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[22].x, _1265);
        float _1271 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[23].x, _1267);
        float _1273 = _1269 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _1275 = _1271 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _909 = _1275;
        _911 = _1273;
        _1277 = true;
    }
    else
    {
        int _1279 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1281 = _1279 != 0;
        bool _1283 = !_1281;
        if (!_1283)
        {
            bool _1285 = !_875;
            if (!_1285)
            {
                int _1287 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1289 = _1287 != 0;
                int _1291 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1293 = _1291 != 0;
                int _1295 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1297 = _1295 != 0;
                int _1299 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1301 = _1299 != 0;
                int _1303 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1305 = _1303 != 0;
                if (_1289)
                {
                    _134 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1307 = _134;
                float _1309 = _1307;
                if (_1289)
                {
                    _136 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1311 = _136;
                float _1313 = _1311;
                if (!_1289)
                {
                    _1309 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1315 = _1309;
                if (!_1289)
                {
                    _1313 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1317 = _1313;
                float _1319 = _1315 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1321 = _1317 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1301)
                {
                    float _1323 = _1319 * _865;
                    _901 = _1323;
                }
                float _1325 = _901;
                float _1327 = -_1319;
                float _1329 = _1327 + 1.0;
                int _1331 = as_type<int>(_1325);
                if (_1305)
                {
                    float _1333 = _1321 * _863;
                    _903 = _1333;
                }
                float _1335 = _903;
                float _1337 = -_1321;
                float _1339 = _1337 + 1.0;
                _907 = _1335;
                if (_1293)
                {
                    float _1341 = _1325 + _1329;
                    _1331 = as_type<int>(_1341);
                }
                int _1343 = _1331;
                _905 = _1343;
                if (_1297)
                {
                    float _1345 = _1335 + _1339;
                    _907 = _1345;
                }
            }
            int _1347 = _905;
            float _1349 = _907;
            int _1351 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1353 = _1351 != 0;
            int _1355 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1357 = _1355 != 0;
            int _1359 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1361 = _1359 != 0;
            int _1363 = _1347;
            int _1365 = as_type<int>(_1349);
            if (_1357)
            {
                float _1367 = -as_type<float>(_1347);
                float _1369 = _1367 + 1.0;
                _1363 = as_type<int>(_1369);
            }
            int _1371 = _1363;
            if (_1361)
            {
                float _1373 = -_1349;
                float _1375 = _1373 + 1.0;
                _1365 = as_type<int>(_1375);
            }
            int _1377 = _1365;
            bool _1379 = !_1353;
            float _1381 = _1379 ? as_type<float>(_1371) : as_type<float>(_1377);
            bool _1383 = !_1353;
            float _1385 = _1383 ? as_type<float>(_1377) : as_type<float>(_1371);
            _909 = _1385;
            _911 = _1381;
        }
    }
    _1277 = false;
    float _1387 = _909;
    float _1389 = _911;
    float _1391 = _1387 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1393 = _1387 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _1395 = _877 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1397 = _879 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1399 = fma(_1389, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1391);
    float _1401 = fma(_1389, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1393);
    float _1403 = _881 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1405 = _883 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1407 = _1399 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1409 = _1401 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _1411 = -_1407;
    float _1413 = _1411 + 1.0;
    out.m_31.x = _1395;
    out.m_31.y = _1397;
    out.m_31.z = _1403;
    out.m_31.w = _1405;
    out.m_33.x = _1409;
    out.m_33.y = _1413;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

