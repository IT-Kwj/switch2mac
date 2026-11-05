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
    float4 m_33 [[user(locn2)]];
    float4 m_29 [[user(locn4)]];
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1015 = false;
    bool _841 = false;
    bool _184 = false;
    bool _361 = false;
    bool _359 = false;
    bool _355 = false;
    bool _351 = false;
    bool _347 = false;
    bool _343 = false;
    bool _339 = false;
    bool _335 = false;
    bool _331 = false;
    bool _327 = false;
    bool _323 = false;
    bool _319 = false;
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
    float _116 = _105;
    float _118 = _103;
    float _120 = _91;
    float _122 = _69;
    float _124 = _93;
    float _126 = _99;
    float _128 = _101;
    float _130 = _105;
    float _132 = _103;
    float _134 = _55;
    float _136 = _53;
    bool _144;
    float _150;
    float _156;
    float _162;
    float _166;
    float _170;
    float _174;
    float _178;
    float _182;
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
        float _148 = _146;
        _150 = _146;
        if (_140)
        {
            _116 = _49;
        }
        float _152 = _116;
        float _154 = _152;
        _156 = _152;
        if (_140)
        {
            _118 = _47;
        }
        float _158 = _118;
        float _160 = _158;
        _162 = _158;
        if (_140)
        {
            _120 = _49;
        }
        float _164 = _120;
        _166 = _164;
        if (_140)
        {
            _122 = 255.0;
        }
        float _168 = _122;
        _170 = _168;
        if (_140)
        {
            _124 = 255.0;
        }
        float _172 = _124;
        _174 = _172;
        if (_140)
        {
            _126 = 255.0;
        }
        float _176 = _126;
        _178 = _176;
        if (_140)
        {
            _128 = 255.0;
        }
        float _180 = _128;
        _182 = _180;
        _184 = _140;
        if (!_184)
        {
            float _186 = trunc(_47);
            int _188 = int(_186);
            float _190 = trunc(_49);
            int _192 = int(_190);
            int _194 = _192 << 1;
            int _196 = _194 + _188;
            int _198 = _196 << 4;
            bool _200 = _198 == 0;
            bool _202 = _198 == 16;
            bool _204 = _198 == 32;
            bool _206 = _198 == 48;
            float _208 = as_type<float>(_198);
            _170 = 255.0;
            _174 = 255.0;
            _178 = 255.0;
            _182 = 255.0;
            if (_200)
            {
                _148 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _210 = _148;
            float _212 = _210;
            if (_200)
            {
                _154 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _214 = _154;
            float _216 = _214;
            if (_200)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _218 = _160;
            float _220 = _218;
            if (_200)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _222 = _208;
            float _224 = _222;
            if (_202)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _226 = _212;
            float _228 = _226;
            if (_202)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _230 = _216;
            float _232 = _230;
            if (_202)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _234 = _220;
            float _236 = _234;
            if (_202)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _238 = _224;
            float _240 = _238;
            if (_204)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _242 = _228;
            float _244 = _242;
            if (_204)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _246 = _232;
            float _248 = _246;
            if (_204)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _250 = _236;
            float _252 = _250;
            if (_204)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _254 = _240;
            float _256 = _254;
            if (_206)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _258 = _244;
            _150 = _258;
            if (_206)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _260 = _248;
            _156 = _260;
            if (_206)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _262 = _252;
            _162 = _262;
            if (_206)
            {
                _256 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _264 = _256;
            _166 = _264;
            _184 = true;
        }
    }
    else
    {
        int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _268 = _266 != 0;
        uint _271 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _273 = int(_271) & 15;
        bool _275 = !_268;
        float _277 = as_type<float>(_273);
        float _279 = as_type<float>(_273);
        _144 = _268;
        if (!_275)
        {
            uint _281 = min(uint(_273), 13u);
            float _283 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _285 = int(_281) << 2;
            uint _287 = uint(int(uint(_285) >> uint(2)));
            uint _289 = uint(int(uint(int(_287)) >> uint(2)));
            int _291 = int(_287) & 3;
            float _293 = (*spvDescriptorSet0.vp_c1)._m0[int(_289)][_291];
            float _295 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _297 = _283 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _299 = _283 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _301 = _295 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _303 = _295 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _305 = as_type<int>(_293) >> 31;
            bool _307 = as_type<int>(_293) == 1408;
            float _309 = as_type<float>(_305);
            float _311 = _299;
            float _313 = _293;
            float _315 = _303;
            if (!_307)
            {
                bool _317 = as_type<int>(_293) == 1456;
                _319 = _317;
                if (!_319)
                {
                    bool _321 = as_type<int>(_293) == 1520;
                    _323 = _321;
                    if (!_323)
                    {
                        bool _325 = as_type<int>(_293) == 1584;
                        _327 = _325;
                        if (!_327)
                        {
                            bool _329 = as_type<int>(_293) == 1664;
                            _331 = _329;
                            if (!_331)
                            {
                                bool _333 = as_type<int>(_293) == 1744;
                                _335 = _333;
                                if (!_335)
                                {
                                    bool _337 = as_type<int>(_293) == 1840;
                                    _339 = _337;
                                    if (!_339)
                                    {
                                        bool _341 = as_type<int>(_293) == 1920;
                                        _343 = _341;
                                        if (!_343)
                                        {
                                            bool _345 = as_type<int>(_293) == 2016;
                                            _347 = _345;
                                            if (!_347)
                                            {
                                                bool _349 = as_type<int>(_293) == 2080;
                                                _351 = _349;
                                                if (!_351)
                                                {
                                                    bool _353 = as_type<int>(_293) == 2160;
                                                    _355 = _353;
                                                    if (!_355)
                                                    {
                                                        bool _357 = as_type<int>(_293) == 2224;
                                                        _359 = _357;
                                                        if (!_359)
                                                        {
                                                            _361 = true;
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
            float _367;
            float _369;
            if (!_319)
            {
                if (!_323)
                {
                    if (!_327)
                    {
                        if (!_331)
                        {
                            if (!_335)
                            {
                                if (!_339)
                                {
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
                                                        if (!_361)
                                                        {
                                                            float _363 = _297 * _47;
                                                            float _365 = _301 * _49;
                                                            _367 = _365;
                                                            _369 = _363;
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
            if ((((((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331) || _327) || _323) || _319)
            {
                if ((!_323) || _319)
                {
                    if ((!_327) || _319)
                    {
                        if ((!_331) || _319)
                        {
                            if ((!_335) || _319)
                            {
                                if ((!_339) || _319)
                                {
                                    if ((!_343) || _319)
                                    {
                                        if ((!_347) || _319)
                                        {
                                            if ((!_351) || _319)
                                            {
                                                if ((!_355) || _319)
                                                {
                                                    if ((!_359) || _319)
                                                    {
                                                        if ((!_361) || _319)
                                                        {
                                                            _319 = false;
                                                            float _371 = -_299;
                                                            float _373 = _371 + 1.0;
                                                            float _375 = _301 * _49;
                                                            float _377 = fma(_299, _47, _373);
                                                            _367 = _375;
                                                            _369 = _377;
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
                if (((((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331) || _327) || _323)
                {
                    if ((!_327) || _323)
                    {
                        if ((!_331) || _323)
                        {
                            if ((!_335) || _323)
                            {
                                if ((!_339) || _323)
                                {
                                    if ((!_343) || _323)
                                    {
                                        if ((!_347) || _323)
                                        {
                                            if ((!_351) || _323)
                                            {
                                                if ((!_355) || _323)
                                                {
                                                    if ((!_359) || _323)
                                                    {
                                                        if ((!_361) || _323)
                                                        {
                                                            _323 = false;
                                                            float _379 = -_303;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _297 * _47;
                                                            float _385 = fma(_303, _49, _381);
                                                            _367 = _385;
                                                            _369 = _383;
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
                    if ((((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331) || _327)
                    {
                        if ((!_331) || _327)
                        {
                            if ((!_335) || _327)
                            {
                                if ((!_339) || _327)
                                {
                                    if ((!_343) || _327)
                                    {
                                        if ((!_347) || _327)
                                        {
                                            if ((!_351) || _327)
                                            {
                                                if ((!_355) || _327)
                                                {
                                                    if ((!_359) || _327)
                                                    {
                                                        if ((!_361) || _327)
                                                        {
                                                            _327 = false;
                                                            float _387 = -_299;
                                                            float _389 = _387 + 1.0;
                                                            float _391 = -_303;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = fma(_299, _47, _389);
                                                            float _397 = fma(_303, _49, _393);
                                                            _367 = _397;
                                                            _369 = _395;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331)
                        {
                            if ((!_335) || _331)
                            {
                                if ((!_339) || _331)
                                {
                                    if ((!_343) || _331)
                                    {
                                        if ((!_347) || _331)
                                        {
                                            if ((!_351) || _331)
                                            {
                                                if ((!_355) || _331)
                                                {
                                                    if ((!_359) || _331)
                                                    {
                                                        if ((!_361) || _331)
                                                        {
                                                            _331 = false;
                                                            float _399 = -_301;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = _297 * _47;
                                                            float _405 = -_303;
                                                            float _407 = _405 + _401;
                                                            float _409 = fma(_407, _49, _301);
                                                            _367 = _409;
                                                            _369 = _403;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335)
                            {
                                if ((!_339) || _335)
                                {
                                    if ((!_343) || _335)
                                    {
                                        if ((!_347) || _335)
                                        {
                                            if ((!_351) || _335)
                                            {
                                                if ((!_355) || _335)
                                                {
                                                    if ((!_359) || _335)
                                                    {
                                                        if ((!_361) || _335)
                                                        {
                                                            _335 = false;
                                                            float _411 = -_301;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = -_299;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = -_303;
                                                            float _421 = _419 + _413;
                                                            float _423 = fma(_299, _47, _417);
                                                            float _425 = fma(_421, _49, _301);
                                                            _367 = _425;
                                                            _369 = _423;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339)
                                {
                                    if ((!_343) || _339)
                                    {
                                        if ((!_347) || _339)
                                        {
                                            if ((!_351) || _339)
                                            {
                                                if ((!_355) || _339)
                                                {
                                                    if ((!_359) || _339)
                                                    {
                                                        if ((!_361) || _339)
                                                        {
                                                            _339 = false;
                                                            float _427 = -_297;
                                                            float _429 = _427 + 1.0;
                                                            float _431 = _301 * _49;
                                                            float _433 = -_299;
                                                            float _435 = _433 + _429;
                                                            float _437 = fma(_435, _47, _297);
                                                            _367 = _431;
                                                            _369 = _437;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _361) || _359) || _355) || _351) || _347) || _343)
                                    {
                                        if ((!_347) || _343)
                                        {
                                            if ((!_351) || _343)
                                            {
                                                if ((!_355) || _343)
                                                {
                                                    if ((!_359) || _343)
                                                    {
                                                        if ((!_361) || _343)
                                                        {
                                                            _343 = false;
                                                            float _439 = -_297;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_303;
                                                            float _445 = _443 + 1.0;
                                                            float _447 = -_299;
                                                            float _449 = _447 + _441;
                                                            float _451 = fma(_303, _49, _445);
                                                            float _453 = fma(_449, _47, _297);
                                                            _367 = _451;
                                                            _369 = _453;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _361) || _359) || _355) || _351) || _347)
                                        {
                                            if ((!_351) || _347)
                                            {
                                                if ((!_355) || _347)
                                                {
                                                    if ((!_359) || _347)
                                                    {
                                                        if ((!_361) || _347)
                                                        {
                                                            _347 = false;
                                                            float _455 = -_299;
                                                            float _457 = _455 + 1.0;
                                                            float _459 = _301 * _49;
                                                            float _461 = _457 * _47;
                                                            _367 = _459;
                                                            _369 = _461;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _361) || _359) || _355) || _351)
                                            {
                                                if ((!_355) || _351)
                                                {
                                                    if ((!_359) || _351)
                                                    {
                                                        if ((!_361) || _351)
                                                        {
                                                            _351 = false;
                                                            float _463 = -_299;
                                                            float _465 = _463 + 1.0;
                                                            float _467 = -_303;
                                                            float _469 = _467 + 1.0;
                                                            float _471 = fma(_299, _47, _465);
                                                            float _473 = _469 * _49;
                                                            _367 = _473;
                                                            _369 = _471;
                                                        }
                                                    }
                                                }
                                                if (((false || _361) || _359) || _355)
                                                {
                                                    if ((!_359) || _355)
                                                    {
                                                        if ((!_361) || _355)
                                                        {
                                                            _355 = false;
                                                            float _475 = -_301;
                                                            float _477 = _475 + 1.0;
                                                            float _479 = _297 * _47;
                                                            float _481 = fma(_477, _49, _301);
                                                            _367 = _481;
                                                            _369 = _479;
                                                        }
                                                    }
                                                    if ((false || _361) || _359)
                                                    {
                                                        if ((!_361) || _359)
                                                        {
                                                            _359 = false;
                                                            float _483 = -_297;
                                                            float _485 = _483 + 1.0;
                                                            float _487 = -_303;
                                                            float _489 = _487 + 1.0;
                                                            float _491 = fma(_485, _47, _297);
                                                            float _493 = fma(_303, _49, _489);
                                                            _367 = _493;
                                                            _369 = _491;
                                                        }
                                                        if (false || _361)
                                                        {
                                                            _361 = false;
                                                            bool _495 = _273 != 12;
                                                            if (!_495)
                                                            {
                                                                float _497 = -_301;
                                                                float _499 = _497 + 1.0;
                                                                _309 = _499;
                                                            }
                                                            float _501 = _309;
                                                            if (!_495)
                                                            {
                                                                float _503 = -_299;
                                                                float _505 = _503 + 1.0;
                                                                _311 = _505;
                                                            }
                                                            float _507 = _311;
                                                            if (_495)
                                                            {
                                                                _313 = 0.0;
                                                            }
                                                            float _509 = _313;
                                                            float _511 = _509;
                                                            if (!_495)
                                                            {
                                                                float _513 = -_303;
                                                                float _515 = _513 + _501;
                                                                _315 = _515;
                                                            }
                                                            float _517 = _315;
                                                            if (_495)
                                                            {
                                                                _277 = 0.0;
                                                            }
                                                            float _519 = _277;
                                                            _367 = _519;
                                                            if (!_495)
                                                            {
                                                                float _521 = _47 * _507;
                                                                _511 = _521;
                                                            }
                                                            float _523 = _511;
                                                            _369 = _523;
                                                            if (!_495)
                                                            {
                                                                float _525 = _49 * _517;
                                                                _367 = _525;
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
            float _527 = _367;
            float _529 = _369;
            float _531 = -_527;
            float _533 = _531 + 1.0;
            float _535 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _537 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _539 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _541 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _543 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _545 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _547 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _549 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _551 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].x, _535);
            float _553 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].x, _537);
            float _555 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].y, _539);
            float _557 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].y, _541);
            float _559 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].z, _543);
            float _561 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].z, _545);
            float _563 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].w, _547);
            float _565 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].w, _549);
            float _567 = -_529;
            float _569 = _567 + 1.0;
            float _571 = _551 * _529;
            float _573 = _555 * _529;
            float _575 = _559 * _529;
            float _577 = _565 * _529;
            float _579 = fma(_569, _553, _571);
            float _581 = fma(_569, _557, _573);
            float _583 = fma(_569, _561, _575);
            float _585 = fma(_569, _563, _577);
            _166 = _49;
            _162 = _47;
            _150 = _47;
            _156 = _49;
            _170 = _579;
            _174 = _581;
            _178 = _583;
            _182 = _585;
            _184 = true;
        }
        else
        {
            float _587 = trunc(_47);
            int _589 = int(_587);
            bool _591 = _273 != 13;
            float _593 = trunc(_49);
            int _595 = int(_593);
            int _597 = _595 << 1;
            int _599 = _597 + _589;
            int _601 = _599 << 4;
            bool _603 = _601 == 0;
            bool _605 = _601 == 16;
            bool _607 = _601 == 32;
            bool _609 = _601 == 48;
            float _611 = 0.0;
            if (_603)
            {
                _611 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _613 = _611;
            float _615 = _613;
            if (_603)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _617 = _130;
            float _619 = _617;
            if (_603)
            {
                _132 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _621 = _132;
            float _623 = _621;
            if (_603)
            {
                _279 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _625 = _279;
            float _627 = _625;
            if (_605)
            {
                _615 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _629 = _615;
            float _631 = _629;
            if (_605)
            {
                _619 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _633 = _619;
            float _635 = _633;
            if (_605)
            {
                _623 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _637 = _623;
            float _639 = _637;
            if (_605)
            {
                _627 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _641 = _627;
            float _643 = _641;
            if (_607)
            {
                _631 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _645 = _631;
            float _647 = _645;
            if (_607)
            {
                _635 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _649 = _635;
            float _651 = _649;
            if (_607)
            {
                _639 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _653 = _639;
            float _655 = _653;
            if (_607)
            {
                _643 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _657 = _643;
            float _659 = _657;
            if (_609)
            {
                _647 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _661 = _647;
            _150 = _661;
            if (_609)
            {
                _651 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _663 = _651;
            _156 = _663;
            if (_609)
            {
                _655 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _665 = _655;
            _162 = _665;
            if (_609)
            {
                _659 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _667 = _659;
            _166 = _667;
            if (!_591)
            {
                float _669 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _671 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _673 = _669 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _675 = -_673;
                float _677 = _675 + 1.0;
                float _679 = _671 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _681 = -_669;
                float _683 = fma(_681, (*spvDescriptorSet0.vp_c3)._m0[26].w, _677);
                float _685 = -_679;
                float _687 = _685 + 1.0;
                float _689 = fma(_683, _49, _673);
                float _691 = -_671;
                float _693 = fma(_691, (*spvDescriptorSet0.vp_c3)._m0[26].y, _687);
                float _695 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _697 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _699 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _701 = fma(_693, _47, _679);
                float _703 = -_689;
                float _705 = _703 + 1.0;
                float _707 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _709 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _711 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _713 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _715 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _717 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].x, _695);
                float _719 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].x, _697);
                float _721 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].y, _699);
                float _723 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].y, _707);
                float _725 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].z, _709);
                float _727 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].z, _711);
                float _729 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].w, _713);
                float _731 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].w, _715);
                float _733 = -_701;
                float _735 = _733 + 1.0;
                float _737 = _701 * _717;
                float _739 = _701 * _721;
                float _741 = _701 * _725;
                float _743 = _701 * _731;
                float _745 = fma(_735, _719, _737);
                float _747 = fma(_735, _723, _739);
                float _749 = fma(_735, _727, _741);
                float _751 = fma(_735, _729, _743);
                _170 = _745;
                _174 = _747;
                _178 = _749;
                _182 = _751;
                _184 = true;
            }
            else
            {
                int _753 = _599 << 4;
                int _755 = _753 + 464;
                uint _757 = uint(int(uint(_755) >> uint(2)));
                uint _759 = uint(int(uint(int(_757)) >> uint(2)));
                int _761 = int(_757) & 3;
                float _763 = (*spvDescriptorSet0.vp_c3)._m0[int(_759)][_761];
                int _765 = int(_757) + 1;
                uint _767 = uint(int(uint(_765) >> uint(2)));
                int _769 = _765 & 3;
                float _771 = (*spvDescriptorSet0.vp_c3)._m0[int(_767)][_769];
                int _773 = _755 + 8;
                uint _775 = uint(int(uint(_773) >> uint(2)));
                uint _777 = uint(int(uint(int(_775)) >> uint(2)));
                int _779 = int(_775) & 3;
                float _781 = (*spvDescriptorSet0.vp_c3)._m0[int(_777)][_779];
                int _783 = int(_775) + 1;
                uint _785 = uint(int(uint(_783) >> uint(2)));
                int _787 = _783 & 3;
                float _789 = (*spvDescriptorSet0.vp_c3)._m0[int(_785)][_787];
                _170 = _763;
                _174 = _771;
                _178 = _781;
                _182 = _789;
            }
        }
    }
    _184 = false;
    float _791 = _166;
    float _793 = _162;
    float _795 = _150;
    float _797 = _156;
    bool _799 = _144;
    float _801 = _170;
    float _803 = _174;
    float _805 = _178;
    float _807 = _182;
    bool _809 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _811 = !_809;
    float _813 = _793;
    float _815 = _791;
    float _817 = _795;
    float _819 = _797;
    float _821 = _793;
    float _823 = _791;
    float _837;
    float _839;
    if (!_811)
    {
        float _825 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _827 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _829 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _825);
        float _831 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _827);
        float _833 = _829 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _835 = _831 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _837 = _835;
        _839 = _833;
        _841 = true;
    }
    else
    {
        int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _845 = _843 != 0;
        if (!_845)
        {
            _813 = _795;
        }
        float _847 = _813;
        float _849 = _847;
        _839 = _847;
        if (!_845)
        {
            _815 = _797;
        }
        float _851 = _815;
        bool _853 = !_845;
        float _855 = _851;
        _837 = _851;
        if (!_853)
        {
            if (!_799)
            {
                _849 = _795;
            }
            float _857 = _849;
            float _859 = _857;
            int _861 = as_type<int>(_857);
            if (!_799)
            {
                _855 = _797;
            }
            float _863 = _855;
            bool _865 = !_799;
            float _867 = _863;
            float _869 = _863;
            if (!_865)
            {
                int _871 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _873 = _871 != 0;
                int _875 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _877 = _875 != 0;
                int _879 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _881 = _879 != 0;
                int _883 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _885 = _883 != 0;
                int _887 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _889 = _887 != 0;
                if (_873)
                {
                    _859 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _891 = _859;
                float _893 = _891;
                if (_873)
                {
                    _867 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _895 = _867;
                float _897 = _895;
                if (!_873)
                {
                    _893 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _899 = _893;
                if (!_873)
                {
                    _897 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _901 = _897;
                float _903 = _899 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _905 = _901 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_885)
                {
                    float _907 = _903 * _795;
                    _817 = _907;
                }
                float _909 = _817;
                float _911 = -_903;
                float _913 = _911 + 1.0;
                int _915 = as_type<int>(_909);
                if (_889)
                {
                    float _917 = _905 * _797;
                    _819 = _917;
                }
                float _919 = _819;
                float _921 = -_905;
                float _923 = _921 + 1.0;
                float _925 = _919;
                if (_877)
                {
                    float _927 = _909 + _913;
                    _915 = as_type<int>(_927);
                }
                int _929 = _915;
                if (_881)
                {
                    float _931 = _919 + _923;
                    _925 = _931;
                }
                float _933 = _925;
                _861 = _929;
                _869 = _933;
            }
            int _935 = _861;
            float _937 = _869;
            int _939 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _941 = _939 != 0;
            int _943 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _945 = _943 != 0;
            int _947 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _949 = _947 != 0;
            int _951 = _935;
            int _953 = as_type<int>(_937);
            if (_945)
            {
                float _955 = -as_type<float>(_935);
                float _957 = _955 + 1.0;
                _951 = as_type<int>(_957);
            }
            int _959 = _951;
            if (_949)
            {
                float _961 = -_937;
                float _963 = _961 + 1.0;
                _953 = as_type<int>(_963);
            }
            int _965 = _953;
            bool _967 = !_941;
            float _969 = _967 ? as_type<float>(_959) : as_type<float>(_965);
            bool _971 = !_941;
            float _973 = _971 ? as_type<float>(_965) : as_type<float>(_959);
            _837 = _973;
            _839 = _969;
        }
    }
    _841 = false;
    float _975 = _837;
    float _977 = _839;
    float _979 = _975 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _981 = _975 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _983 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _985 = fma(_977, (*spvDescriptorSet0.vp_c3)._m0[8].x, _979);
    float _987 = fma(_977, (*spvDescriptorSet0.vp_c3)._m0[7].x, _981);
    float _989 = _985 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _991 = _987 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _993 = -_989;
    float _995 = _993 + 1.0;
    out.m_27.x = _991;
    out.m_27.y = _995;
    bool _997 = !_983;
    float _1011;
    float _1013;
    if (!_997)
    {
        float _999 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1001 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1003 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _999);
        float _1005 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1001);
        float _1007 = _1003 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1009 = _1005 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _1011 = _1009;
        _1013 = _1007;
        _1015 = true;
    }
    else
    {
        int _1017 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1019 = _1017 != 0;
        if (!_1019)
        {
            _134 = _793;
        }
        float _1021 = _134;
        float _1023 = _1021;
        _1013 = _1021;
        if (!_1019)
        {
            _136 = _791;
        }
        float _1025 = _136;
        bool _1027 = !_1019;
        float _1029 = _1025;
        _1011 = _1025;
        if (!_1027)
        {
            if (!_799)
            {
                _1023 = _793;
            }
            float _1031 = _1023;
            float _1033 = _1031;
            int _1035 = as_type<int>(_1031);
            if (!_799)
            {
                _1029 = _791;
            }
            float _1037 = _1029;
            bool _1039 = !_799;
            float _1041 = _1037;
            float _1043 = _1037;
            if (!_1039)
            {
                int _1045 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1047 = _1045 != 0;
                int _1049 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1051 = _1049 != 0;
                int _1053 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1055 = _1053 != 0;
                int _1057 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1059 = _1057 != 0;
                int _1061 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1063 = _1061 != 0;
                if (_1047)
                {
                    _1033 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1065 = _1033;
                float _1067 = _1065;
                if (_1047)
                {
                    _1041 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1069 = _1041;
                float _1071 = _1069;
                if (!_1047)
                {
                    _1067 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1073 = _1067;
                if (!_1047)
                {
                    _1071 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1075 = _1071;
                float _1077 = _1073 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1079 = _1075 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1059)
                {
                    float _1081 = _1077 * _793;
                    _821 = _1081;
                }
                float _1083 = _821;
                float _1085 = -_1077;
                float _1087 = _1085 + 1.0;
                int _1089 = as_type<int>(_1083);
                if (_1063)
                {
                    float _1091 = _1079 * _791;
                    _823 = _1091;
                }
                float _1093 = _823;
                float _1095 = -_1079;
                float _1097 = _1095 + 1.0;
                float _1099 = _1093;
                if (_1051)
                {
                    float _1101 = _1083 + _1087;
                    _1089 = as_type<int>(_1101);
                }
                int _1103 = _1089;
                if (_1055)
                {
                    float _1105 = _1093 + _1097;
                    _1099 = _1105;
                }
                float _1107 = _1099;
                _1035 = _1103;
                _1043 = _1107;
            }
            int _1109 = _1035;
            float _1111 = _1043;
            int _1113 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1115 = _1113 != 0;
            int _1117 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1119 = _1117 != 0;
            int _1121 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1123 = _1121 != 0;
            int _1125 = _1109;
            int _1127 = as_type<int>(_1111);
            if (_1119)
            {
                float _1129 = -as_type<float>(_1109);
                float _1131 = _1129 + 1.0;
                _1125 = as_type<int>(_1131);
            }
            int _1133 = _1125;
            if (_1123)
            {
                float _1135 = -_1111;
                float _1137 = _1135 + 1.0;
                _1127 = as_type<int>(_1137);
            }
            int _1139 = _1127;
            bool _1141 = !_1115;
            float _1143 = _1141 ? as_type<float>(_1133) : as_type<float>(_1139);
            bool _1145 = !_1115;
            float _1147 = _1145 ? as_type<float>(_1139) : as_type<float>(_1133);
            _1011 = _1147;
            _1013 = _1143;
        }
    }
    _1015 = false;
    float _1149 = _1011;
    float _1151 = _1013;
    float _1153 = _1149 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1155 = _1149 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1157 = _801 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1159 = _803 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1153);
    float _1163 = fma(_1151, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1155);
    float _1165 = _805 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1167 = _807 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1171 = _1163 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    out.m_29.x = _47;
    out.m_29.y = _49;
    float _1173 = -_1169;
    float _1175 = _1173 + 1.0;
    out.m_31.x = _1157;
    out.m_31.y = _1159;
    out.m_31.z = _1165;
    out.m_31.w = _1167;
    out.m_33.x = _1171;
    out.m_33.y = _1175;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1015 = false;
    bool _841 = false;
    bool _184 = false;
    bool _361 = false;
    bool _359 = false;
    bool _355 = false;
    bool _351 = false;
    bool _347 = false;
    bool _343 = false;
    bool _339 = false;
    bool _335 = false;
    bool _331 = false;
    bool _327 = false;
    bool _323 = false;
    bool _319 = false;
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
    float _116 = _105;
    float _118 = _103;
    float _120 = _91;
    float _122 = _69;
    float _124 = _93;
    float _126 = _99;
    float _128 = _101;
    float _130 = _105;
    float _132 = _103;
    float _134 = _55;
    float _136 = _53;
    bool _144;
    float _150;
    float _156;
    float _162;
    float _166;
    float _170;
    float _174;
    float _178;
    float _182;
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
        float _148 = _146;
        _150 = _146;
        if (_140)
        {
            _116 = _49;
        }
        float _152 = _116;
        float _154 = _152;
        _156 = _152;
        if (_140)
        {
            _118 = _47;
        }
        float _158 = _118;
        float _160 = _158;
        _162 = _158;
        if (_140)
        {
            _120 = _49;
        }
        float _164 = _120;
        _166 = _164;
        if (_140)
        {
            _122 = 255.0;
        }
        float _168 = _122;
        _170 = _168;
        if (_140)
        {
            _124 = 255.0;
        }
        float _172 = _124;
        _174 = _172;
        if (_140)
        {
            _126 = 255.0;
        }
        float _176 = _126;
        _178 = _176;
        if (_140)
        {
            _128 = 255.0;
        }
        float _180 = _128;
        _182 = _180;
        _184 = _140;
        if (!_184)
        {
            float _186 = trunc(_47);
            int _188 = int(_186);
            float _190 = trunc(_49);
            int _192 = int(_190);
            int _194 = _192 << 1;
            int _196 = _194 + _188;
            int _198 = _196 << 4;
            bool _200 = _198 == 0;
            bool _202 = _198 == 16;
            bool _204 = _198 == 32;
            bool _206 = _198 == 48;
            float _208 = as_type<float>(_198);
            _170 = 255.0;
            _174 = 255.0;
            _178 = 255.0;
            _182 = 255.0;
            if (_200)
            {
                _148 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _210 = _148;
            float _212 = _210;
            if (_200)
            {
                _154 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _214 = _154;
            float _216 = _214;
            if (_200)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _218 = _160;
            float _220 = _218;
            if (_200)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _222 = _208;
            float _224 = _222;
            if (_202)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _226 = _212;
            float _228 = _226;
            if (_202)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _230 = _216;
            float _232 = _230;
            if (_202)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _234 = _220;
            float _236 = _234;
            if (_202)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _238 = _224;
            float _240 = _238;
            if (_204)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _242 = _228;
            float _244 = _242;
            if (_204)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _246 = _232;
            float _248 = _246;
            if (_204)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _250 = _236;
            float _252 = _250;
            if (_204)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _254 = _240;
            float _256 = _254;
            if (_206)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _258 = _244;
            _150 = _258;
            if (_206)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _260 = _248;
            _156 = _260;
            if (_206)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _262 = _252;
            _162 = _262;
            if (_206)
            {
                _256 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _264 = _256;
            _166 = _264;
            _184 = true;
        }
    }
    else
    {
        int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _268 = _266 != 0;
        uint _271 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _273 = int(_271) & 15;
        bool _275 = !_268;
        float _277 = as_type<float>(_273);
        float _279 = as_type<float>(_273);
        _144 = _268;
        if (!_275)
        {
            uint _281 = min(uint(_273), 13u);
            float _283 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _285 = int(_281) << 2;
            uint _287 = uint(int(uint(_285) >> uint(2)));
            uint _289 = uint(int(uint(int(_287)) >> uint(2)));
            int _291 = int(_287) & 3;
            float _293 = (*spvDescriptorSet0.vp_c1)._m0[int(_289)][_291];
            float _295 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _297 = _283 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _299 = _283 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _301 = _295 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _303 = _295 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _305 = as_type<int>(_293) >> 31;
            bool _307 = as_type<int>(_293) == 1408;
            float _309 = as_type<float>(_305);
            float _311 = _299;
            float _313 = _293;
            float _315 = _303;
            if (!_307)
            {
                bool _317 = as_type<int>(_293) == 1456;
                _319 = _317;
                if (!_319)
                {
                    bool _321 = as_type<int>(_293) == 1520;
                    _323 = _321;
                    if (!_323)
                    {
                        bool _325 = as_type<int>(_293) == 1584;
                        _327 = _325;
                        if (!_327)
                        {
                            bool _329 = as_type<int>(_293) == 1664;
                            _331 = _329;
                            if (!_331)
                            {
                                bool _333 = as_type<int>(_293) == 1744;
                                _335 = _333;
                                if (!_335)
                                {
                                    bool _337 = as_type<int>(_293) == 1840;
                                    _339 = _337;
                                    if (!_339)
                                    {
                                        bool _341 = as_type<int>(_293) == 1920;
                                        _343 = _341;
                                        if (!_343)
                                        {
                                            bool _345 = as_type<int>(_293) == 2016;
                                            _347 = _345;
                                            if (!_347)
                                            {
                                                bool _349 = as_type<int>(_293) == 2080;
                                                _351 = _349;
                                                if (!_351)
                                                {
                                                    bool _353 = as_type<int>(_293) == 2160;
                                                    _355 = _353;
                                                    if (!_355)
                                                    {
                                                        bool _357 = as_type<int>(_293) == 2224;
                                                        _359 = _357;
                                                        if (!_359)
                                                        {
                                                            _361 = true;
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
            float _367;
            float _369;
            if (!_319)
            {
                if (!_323)
                {
                    if (!_327)
                    {
                        if (!_331)
                        {
                            if (!_335)
                            {
                                if (!_339)
                                {
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
                                                        if (!_361)
                                                        {
                                                            float _363 = _297 * _47;
                                                            float _365 = _301 * _49;
                                                            _367 = _365;
                                                            _369 = _363;
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
            if ((((((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331) || _327) || _323) || _319)
            {
                if ((!_323) || _319)
                {
                    if ((!_327) || _319)
                    {
                        if ((!_331) || _319)
                        {
                            if ((!_335) || _319)
                            {
                                if ((!_339) || _319)
                                {
                                    if ((!_343) || _319)
                                    {
                                        if ((!_347) || _319)
                                        {
                                            if ((!_351) || _319)
                                            {
                                                if ((!_355) || _319)
                                                {
                                                    if ((!_359) || _319)
                                                    {
                                                        if ((!_361) || _319)
                                                        {
                                                            _319 = false;
                                                            float _371 = -_299;
                                                            float _373 = _371 + 1.0;
                                                            float _375 = _301 * _49;
                                                            float _377 = fma(_299, _47, _373);
                                                            _367 = _375;
                                                            _369 = _377;
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
                if (((((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331) || _327) || _323)
                {
                    if ((!_327) || _323)
                    {
                        if ((!_331) || _323)
                        {
                            if ((!_335) || _323)
                            {
                                if ((!_339) || _323)
                                {
                                    if ((!_343) || _323)
                                    {
                                        if ((!_347) || _323)
                                        {
                                            if ((!_351) || _323)
                                            {
                                                if ((!_355) || _323)
                                                {
                                                    if ((!_359) || _323)
                                                    {
                                                        if ((!_361) || _323)
                                                        {
                                                            _323 = false;
                                                            float _379 = -_303;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _297 * _47;
                                                            float _385 = fma(_303, _49, _381);
                                                            _367 = _385;
                                                            _369 = _383;
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
                    if ((((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331) || _327)
                    {
                        if ((!_331) || _327)
                        {
                            if ((!_335) || _327)
                            {
                                if ((!_339) || _327)
                                {
                                    if ((!_343) || _327)
                                    {
                                        if ((!_347) || _327)
                                        {
                                            if ((!_351) || _327)
                                            {
                                                if ((!_355) || _327)
                                                {
                                                    if ((!_359) || _327)
                                                    {
                                                        if ((!_361) || _327)
                                                        {
                                                            _327 = false;
                                                            float _387 = -_299;
                                                            float _389 = _387 + 1.0;
                                                            float _391 = -_303;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = fma(_299, _47, _389);
                                                            float _397 = fma(_303, _49, _393);
                                                            _367 = _397;
                                                            _369 = _395;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331)
                        {
                            if ((!_335) || _331)
                            {
                                if ((!_339) || _331)
                                {
                                    if ((!_343) || _331)
                                    {
                                        if ((!_347) || _331)
                                        {
                                            if ((!_351) || _331)
                                            {
                                                if ((!_355) || _331)
                                                {
                                                    if ((!_359) || _331)
                                                    {
                                                        if ((!_361) || _331)
                                                        {
                                                            _331 = false;
                                                            float _399 = -_301;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = _297 * _47;
                                                            float _405 = -_303;
                                                            float _407 = _405 + _401;
                                                            float _409 = fma(_407, _49, _301);
                                                            _367 = _409;
                                                            _369 = _403;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335)
                            {
                                if ((!_339) || _335)
                                {
                                    if ((!_343) || _335)
                                    {
                                        if ((!_347) || _335)
                                        {
                                            if ((!_351) || _335)
                                            {
                                                if ((!_355) || _335)
                                                {
                                                    if ((!_359) || _335)
                                                    {
                                                        if ((!_361) || _335)
                                                        {
                                                            _335 = false;
                                                            float _411 = -_301;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = -_299;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = -_303;
                                                            float _421 = _419 + _413;
                                                            float _423 = fma(_299, _47, _417);
                                                            float _425 = fma(_421, _49, _301);
                                                            _367 = _425;
                                                            _369 = _423;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339)
                                {
                                    if ((!_343) || _339)
                                    {
                                        if ((!_347) || _339)
                                        {
                                            if ((!_351) || _339)
                                            {
                                                if ((!_355) || _339)
                                                {
                                                    if ((!_359) || _339)
                                                    {
                                                        if ((!_361) || _339)
                                                        {
                                                            _339 = false;
                                                            float _427 = -_297;
                                                            float _429 = _427 + 1.0;
                                                            float _431 = _301 * _49;
                                                            float _433 = -_299;
                                                            float _435 = _433 + _429;
                                                            float _437 = fma(_435, _47, _297);
                                                            _367 = _431;
                                                            _369 = _437;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _361) || _359) || _355) || _351) || _347) || _343)
                                    {
                                        if ((!_347) || _343)
                                        {
                                            if ((!_351) || _343)
                                            {
                                                if ((!_355) || _343)
                                                {
                                                    if ((!_359) || _343)
                                                    {
                                                        if ((!_361) || _343)
                                                        {
                                                            _343 = false;
                                                            float _439 = -_297;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_303;
                                                            float _445 = _443 + 1.0;
                                                            float _447 = -_299;
                                                            float _449 = _447 + _441;
                                                            float _451 = fma(_303, _49, _445);
                                                            float _453 = fma(_449, _47, _297);
                                                            _367 = _451;
                                                            _369 = _453;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _361) || _359) || _355) || _351) || _347)
                                        {
                                            if ((!_351) || _347)
                                            {
                                                if ((!_355) || _347)
                                                {
                                                    if ((!_359) || _347)
                                                    {
                                                        if ((!_361) || _347)
                                                        {
                                                            _347 = false;
                                                            float _455 = -_299;
                                                            float _457 = _455 + 1.0;
                                                            float _459 = _301 * _49;
                                                            float _461 = _457 * _47;
                                                            _367 = _459;
                                                            _369 = _461;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _361) || _359) || _355) || _351)
                                            {
                                                if ((!_355) || _351)
                                                {
                                                    if ((!_359) || _351)
                                                    {
                                                        if ((!_361) || _351)
                                                        {
                                                            _351 = false;
                                                            float _463 = -_299;
                                                            float _465 = _463 + 1.0;
                                                            float _467 = -_303;
                                                            float _469 = _467 + 1.0;
                                                            float _471 = fma(_299, _47, _465);
                                                            float _473 = _469 * _49;
                                                            _367 = _473;
                                                            _369 = _471;
                                                        }
                                                    }
                                                }
                                                if (((false || _361) || _359) || _355)
                                                {
                                                    if ((!_359) || _355)
                                                    {
                                                        if ((!_361) || _355)
                                                        {
                                                            _355 = false;
                                                            float _475 = -_301;
                                                            float _477 = _475 + 1.0;
                                                            float _479 = _297 * _47;
                                                            float _481 = fma(_477, _49, _301);
                                                            _367 = _481;
                                                            _369 = _479;
                                                        }
                                                    }
                                                    if ((false || _361) || _359)
                                                    {
                                                        if ((!_361) || _359)
                                                        {
                                                            _359 = false;
                                                            float _483 = -_297;
                                                            float _485 = _483 + 1.0;
                                                            float _487 = -_303;
                                                            float _489 = _487 + 1.0;
                                                            float _491 = fma(_485, _47, _297);
                                                            float _493 = fma(_303, _49, _489);
                                                            _367 = _493;
                                                            _369 = _491;
                                                        }
                                                        if (false || _361)
                                                        {
                                                            _361 = false;
                                                            bool _495 = _273 != 12;
                                                            if (!_495)
                                                            {
                                                                float _497 = -_301;
                                                                float _499 = _497 + 1.0;
                                                                _309 = _499;
                                                            }
                                                            float _501 = _309;
                                                            if (!_495)
                                                            {
                                                                float _503 = -_299;
                                                                float _505 = _503 + 1.0;
                                                                _311 = _505;
                                                            }
                                                            float _507 = _311;
                                                            if (_495)
                                                            {
                                                                _313 = 0.0;
                                                            }
                                                            float _509 = _313;
                                                            float _511 = _509;
                                                            if (!_495)
                                                            {
                                                                float _513 = -_303;
                                                                float _515 = _513 + _501;
                                                                _315 = _515;
                                                            }
                                                            float _517 = _315;
                                                            if (_495)
                                                            {
                                                                _277 = 0.0;
                                                            }
                                                            float _519 = _277;
                                                            _367 = _519;
                                                            if (!_495)
                                                            {
                                                                float _521 = _47 * _507;
                                                                _511 = _521;
                                                            }
                                                            float _523 = _511;
                                                            _369 = _523;
                                                            if (!_495)
                                                            {
                                                                float _525 = _49 * _517;
                                                                _367 = _525;
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
            float _527 = _367;
            float _529 = _369;
            float _531 = -_527;
            float _533 = _531 + 1.0;
            float _535 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _537 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _539 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _541 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _543 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _545 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _547 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _549 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _551 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].x, _535);
            float _553 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].x, _537);
            float _555 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].y, _539);
            float _557 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].y, _541);
            float _559 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].z, _543);
            float _561 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].z, _545);
            float _563 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].w, _547);
            float _565 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].w, _549);
            float _567 = -_529;
            float _569 = _567 + 1.0;
            float _571 = _551 * _529;
            float _573 = _555 * _529;
            float _575 = _559 * _529;
            float _577 = _565 * _529;
            float _579 = fma(_569, _553, _571);
            float _581 = fma(_569, _557, _573);
            float _583 = fma(_569, _561, _575);
            float _585 = fma(_569, _563, _577);
            _166 = _49;
            _162 = _47;
            _150 = _47;
            _156 = _49;
            _170 = _579;
            _174 = _581;
            _178 = _583;
            _182 = _585;
            _184 = true;
        }
        else
        {
            float _587 = trunc(_47);
            int _589 = int(_587);
            bool _591 = _273 != 13;
            float _593 = trunc(_49);
            int _595 = int(_593);
            int _597 = _595 << 1;
            int _599 = _597 + _589;
            int _601 = _599 << 4;
            bool _603 = _601 == 0;
            bool _605 = _601 == 16;
            bool _607 = _601 == 32;
            bool _609 = _601 == 48;
            float _611 = 0.0;
            if (_603)
            {
                _611 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _613 = _611;
            float _615 = _613;
            if (_603)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _617 = _130;
            float _619 = _617;
            if (_603)
            {
                _132 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _621 = _132;
            float _623 = _621;
            if (_603)
            {
                _279 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _625 = _279;
            float _627 = _625;
            if (_605)
            {
                _615 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _629 = _615;
            float _631 = _629;
            if (_605)
            {
                _619 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _633 = _619;
            float _635 = _633;
            if (_605)
            {
                _623 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _637 = _623;
            float _639 = _637;
            if (_605)
            {
                _627 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _641 = _627;
            float _643 = _641;
            if (_607)
            {
                _631 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _645 = _631;
            float _647 = _645;
            if (_607)
            {
                _635 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _649 = _635;
            float _651 = _649;
            if (_607)
            {
                _639 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _653 = _639;
            float _655 = _653;
            if (_607)
            {
                _643 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _657 = _643;
            float _659 = _657;
            if (_609)
            {
                _647 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _661 = _647;
            _150 = _661;
            if (_609)
            {
                _651 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _663 = _651;
            _156 = _663;
            if (_609)
            {
                _655 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _665 = _655;
            _162 = _665;
            if (_609)
            {
                _659 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _667 = _659;
            _166 = _667;
            if (!_591)
            {
                float _669 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _671 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _673 = _669 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _675 = -_673;
                float _677 = _675 + 1.0;
                float _679 = _671 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _681 = -_669;
                float _683 = fma(_681, (*spvDescriptorSet0.vp_c3)._m0[26].w, _677);
                float _685 = -_679;
                float _687 = _685 + 1.0;
                float _689 = fma(_683, _49, _673);
                float _691 = -_671;
                float _693 = fma(_691, (*spvDescriptorSet0.vp_c3)._m0[26].y, _687);
                float _695 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _697 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _699 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _701 = fma(_693, _47, _679);
                float _703 = -_689;
                float _705 = _703 + 1.0;
                float _707 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _709 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _711 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _713 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _715 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _717 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].x, _695);
                float _719 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].x, _697);
                float _721 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].y, _699);
                float _723 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].y, _707);
                float _725 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].z, _709);
                float _727 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].z, _711);
                float _729 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].w, _713);
                float _731 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].w, _715);
                float _733 = -_701;
                float _735 = _733 + 1.0;
                float _737 = _701 * _717;
                float _739 = _701 * _721;
                float _741 = _701 * _725;
                float _743 = _701 * _731;
                float _745 = fma(_735, _719, _737);
                float _747 = fma(_735, _723, _739);
                float _749 = fma(_735, _727, _741);
                float _751 = fma(_735, _729, _743);
                _170 = _745;
                _174 = _747;
                _178 = _749;
                _182 = _751;
                _184 = true;
            }
            else
            {
                int _753 = _599 << 4;
                int _755 = _753 + 464;
                uint _757 = uint(int(uint(_755) >> uint(2)));
                uint _759 = uint(int(uint(int(_757)) >> uint(2)));
                int _761 = int(_757) & 3;
                float _763 = (*spvDescriptorSet0.vp_c3)._m0[int(_759)][_761];
                int _765 = int(_757) + 1;
                uint _767 = uint(int(uint(_765) >> uint(2)));
                int _769 = _765 & 3;
                float _771 = (*spvDescriptorSet0.vp_c3)._m0[int(_767)][_769];
                int _773 = _755 + 8;
                uint _775 = uint(int(uint(_773) >> uint(2)));
                uint _777 = uint(int(uint(int(_775)) >> uint(2)));
                int _779 = int(_775) & 3;
                float _781 = (*spvDescriptorSet0.vp_c3)._m0[int(_777)][_779];
                int _783 = int(_775) + 1;
                uint _785 = uint(int(uint(_783) >> uint(2)));
                int _787 = _783 & 3;
                float _789 = (*spvDescriptorSet0.vp_c3)._m0[int(_785)][_787];
                _170 = _763;
                _174 = _771;
                _178 = _781;
                _182 = _789;
            }
        }
    }
    _184 = false;
    float _791 = _166;
    float _793 = _162;
    float _795 = _150;
    float _797 = _156;
    bool _799 = _144;
    float _801 = _170;
    float _803 = _174;
    float _805 = _178;
    float _807 = _182;
    bool _809 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _811 = !_809;
    float _813 = _793;
    float _815 = _791;
    float _817 = _795;
    float _819 = _797;
    float _821 = _793;
    float _823 = _791;
    float _837;
    float _839;
    if (!_811)
    {
        float _825 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _827 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _829 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _825);
        float _831 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _827);
        float _833 = _829 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _835 = _831 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _837 = _835;
        _839 = _833;
        _841 = true;
    }
    else
    {
        int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _845 = _843 != 0;
        if (!_845)
        {
            _813 = _795;
        }
        float _847 = _813;
        float _849 = _847;
        _839 = _847;
        if (!_845)
        {
            _815 = _797;
        }
        float _851 = _815;
        bool _853 = !_845;
        float _855 = _851;
        _837 = _851;
        if (!_853)
        {
            if (!_799)
            {
                _849 = _795;
            }
            float _857 = _849;
            float _859 = _857;
            int _861 = as_type<int>(_857);
            if (!_799)
            {
                _855 = _797;
            }
            float _863 = _855;
            bool _865 = !_799;
            float _867 = _863;
            float _869 = _863;
            if (!_865)
            {
                int _871 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _873 = _871 != 0;
                int _875 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _877 = _875 != 0;
                int _879 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _881 = _879 != 0;
                int _883 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _885 = _883 != 0;
                int _887 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _889 = _887 != 0;
                if (_873)
                {
                    _859 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _891 = _859;
                float _893 = _891;
                if (_873)
                {
                    _867 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _895 = _867;
                float _897 = _895;
                if (!_873)
                {
                    _893 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _899 = _893;
                if (!_873)
                {
                    _897 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _901 = _897;
                float _903 = _899 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _905 = _901 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_885)
                {
                    float _907 = _903 * _795;
                    _817 = _907;
                }
                float _909 = _817;
                float _911 = -_903;
                float _913 = _911 + 1.0;
                int _915 = as_type<int>(_909);
                if (_889)
                {
                    float _917 = _905 * _797;
                    _819 = _917;
                }
                float _919 = _819;
                float _921 = -_905;
                float _923 = _921 + 1.0;
                float _925 = _919;
                if (_877)
                {
                    float _927 = _909 + _913;
                    _915 = as_type<int>(_927);
                }
                int _929 = _915;
                if (_881)
                {
                    float _931 = _919 + _923;
                    _925 = _931;
                }
                float _933 = _925;
                _861 = _929;
                _869 = _933;
            }
            int _935 = _861;
            float _937 = _869;
            int _939 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _941 = _939 != 0;
            int _943 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _945 = _943 != 0;
            int _947 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _949 = _947 != 0;
            int _951 = _935;
            int _953 = as_type<int>(_937);
            if (_945)
            {
                float _955 = -as_type<float>(_935);
                float _957 = _955 + 1.0;
                _951 = as_type<int>(_957);
            }
            int _959 = _951;
            if (_949)
            {
                float _961 = -_937;
                float _963 = _961 + 1.0;
                _953 = as_type<int>(_963);
            }
            int _965 = _953;
            bool _967 = !_941;
            float _969 = _967 ? as_type<float>(_959) : as_type<float>(_965);
            bool _971 = !_941;
            float _973 = _971 ? as_type<float>(_965) : as_type<float>(_959);
            _837 = _973;
            _839 = _969;
        }
    }
    _841 = false;
    float _975 = _837;
    float _977 = _839;
    float _979 = _975 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _981 = _975 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _983 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _985 = fma(_977, (*spvDescriptorSet0.vp_c3)._m0[8].x, _979);
    float _987 = fma(_977, (*spvDescriptorSet0.vp_c3)._m0[7].x, _981);
    float _989 = _985 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _991 = _987 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _993 = -_989;
    float _995 = _993 + 1.0;
    out.m_27.x = _991;
    out.m_27.y = _995;
    bool _997 = !_983;
    float _1011;
    float _1013;
    if (!_997)
    {
        float _999 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1001 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1003 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _999);
        float _1005 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1001);
        float _1007 = _1003 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1009 = _1005 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _1011 = _1009;
        _1013 = _1007;
        _1015 = true;
    }
    else
    {
        int _1017 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1019 = _1017 != 0;
        if (!_1019)
        {
            _134 = _793;
        }
        float _1021 = _134;
        float _1023 = _1021;
        _1013 = _1021;
        if (!_1019)
        {
            _136 = _791;
        }
        float _1025 = _136;
        bool _1027 = !_1019;
        float _1029 = _1025;
        _1011 = _1025;
        if (!_1027)
        {
            if (!_799)
            {
                _1023 = _793;
            }
            float _1031 = _1023;
            float _1033 = _1031;
            int _1035 = as_type<int>(_1031);
            if (!_799)
            {
                _1029 = _791;
            }
            float _1037 = _1029;
            bool _1039 = !_799;
            float _1041 = _1037;
            float _1043 = _1037;
            if (!_1039)
            {
                int _1045 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1047 = _1045 != 0;
                int _1049 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1051 = _1049 != 0;
                int _1053 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1055 = _1053 != 0;
                int _1057 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1059 = _1057 != 0;
                int _1061 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1063 = _1061 != 0;
                if (_1047)
                {
                    _1033 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1065 = _1033;
                float _1067 = _1065;
                if (_1047)
                {
                    _1041 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1069 = _1041;
                float _1071 = _1069;
                if (!_1047)
                {
                    _1067 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1073 = _1067;
                if (!_1047)
                {
                    _1071 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1075 = _1071;
                float _1077 = _1073 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1079 = _1075 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1059)
                {
                    float _1081 = _1077 * _793;
                    _821 = _1081;
                }
                float _1083 = _821;
                float _1085 = -_1077;
                float _1087 = _1085 + 1.0;
                int _1089 = as_type<int>(_1083);
                if (_1063)
                {
                    float _1091 = _1079 * _791;
                    _823 = _1091;
                }
                float _1093 = _823;
                float _1095 = -_1079;
                float _1097 = _1095 + 1.0;
                float _1099 = _1093;
                if (_1051)
                {
                    float _1101 = _1083 + _1087;
                    _1089 = as_type<int>(_1101);
                }
                int _1103 = _1089;
                if (_1055)
                {
                    float _1105 = _1093 + _1097;
                    _1099 = _1105;
                }
                float _1107 = _1099;
                _1035 = _1103;
                _1043 = _1107;
            }
            int _1109 = _1035;
            float _1111 = _1043;
            int _1113 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1115 = _1113 != 0;
            int _1117 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1119 = _1117 != 0;
            int _1121 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1123 = _1121 != 0;
            int _1125 = _1109;
            int _1127 = as_type<int>(_1111);
            if (_1119)
            {
                float _1129 = -as_type<float>(_1109);
                float _1131 = _1129 + 1.0;
                _1125 = as_type<int>(_1131);
            }
            int _1133 = _1125;
            if (_1123)
            {
                float _1135 = -_1111;
                float _1137 = _1135 + 1.0;
                _1127 = as_type<int>(_1137);
            }
            int _1139 = _1127;
            bool _1141 = !_1115;
            float _1143 = _1141 ? as_type<float>(_1133) : as_type<float>(_1139);
            bool _1145 = !_1115;
            float _1147 = _1145 ? as_type<float>(_1139) : as_type<float>(_1133);
            _1011 = _1147;
            _1013 = _1143;
        }
    }
    _1015 = false;
    float _1149 = _1011;
    float _1151 = _1013;
    float _1153 = _1149 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1155 = _1149 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1157 = _801 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1159 = _803 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1153);
    float _1163 = fma(_1151, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1155);
    float _1165 = _805 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1167 = _807 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1171 = _1163 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    out.m_29.x = _47;
    out.m_29.y = _49;
    float _1173 = -_1169;
    float _1175 = _1173 + 1.0;
    out.m_31.x = _1157;
    out.m_31.y = _1159;
    out.m_31.z = _1165;
    out.m_31.w = _1167;
    out.m_33.x = _1171;
    out.m_33.y = _1175;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1015 = false;
    bool _841 = false;
    bool _184 = false;
    bool _361 = false;
    bool _359 = false;
    bool _355 = false;
    bool _351 = false;
    bool _347 = false;
    bool _343 = false;
    bool _339 = false;
    bool _335 = false;
    bool _331 = false;
    bool _327 = false;
    bool _323 = false;
    bool _319 = false;
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
    float _116 = _105;
    float _118 = _103;
    float _120 = _91;
    float _122 = _69;
    float _124 = _93;
    float _126 = _99;
    float _128 = _101;
    float _130 = _105;
    float _132 = _103;
    float _134 = _55;
    float _136 = _53;
    bool _144;
    float _150;
    float _156;
    float _162;
    float _166;
    float _170;
    float _174;
    float _178;
    float _182;
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
        float _148 = _146;
        _150 = _146;
        if (_140)
        {
            _116 = _49;
        }
        float _152 = _116;
        float _154 = _152;
        _156 = _152;
        if (_140)
        {
            _118 = _47;
        }
        float _158 = _118;
        float _160 = _158;
        _162 = _158;
        if (_140)
        {
            _120 = _49;
        }
        float _164 = _120;
        _166 = _164;
        if (_140)
        {
            _122 = 255.0;
        }
        float _168 = _122;
        _170 = _168;
        if (_140)
        {
            _124 = 255.0;
        }
        float _172 = _124;
        _174 = _172;
        if (_140)
        {
            _126 = 255.0;
        }
        float _176 = _126;
        _178 = _176;
        if (_140)
        {
            _128 = 255.0;
        }
        float _180 = _128;
        _182 = _180;
        _184 = _140;
        if (!_184)
        {
            float _186 = trunc(_47);
            int _188 = int(_186);
            float _190 = trunc(_49);
            int _192 = int(_190);
            int _194 = _192 << 1;
            int _196 = _194 + _188;
            int _198 = _196 << 4;
            bool _200 = _198 == 0;
            bool _202 = _198 == 16;
            bool _204 = _198 == 32;
            bool _206 = _198 == 48;
            float _208 = as_type<float>(_198);
            _170 = 255.0;
            _174 = 255.0;
            _178 = 255.0;
            _182 = 255.0;
            if (_200)
            {
                _148 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _210 = _148;
            float _212 = _210;
            if (_200)
            {
                _154 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _214 = _154;
            float _216 = _214;
            if (_200)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _218 = _160;
            float _220 = _218;
            if (_200)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _222 = _208;
            float _224 = _222;
            if (_202)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _226 = _212;
            float _228 = _226;
            if (_202)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _230 = _216;
            float _232 = _230;
            if (_202)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _234 = _220;
            float _236 = _234;
            if (_202)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _238 = _224;
            float _240 = _238;
            if (_204)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _242 = _228;
            float _244 = _242;
            if (_204)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _246 = _232;
            float _248 = _246;
            if (_204)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _250 = _236;
            float _252 = _250;
            if (_204)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _254 = _240;
            float _256 = _254;
            if (_206)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _258 = _244;
            _150 = _258;
            if (_206)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _260 = _248;
            _156 = _260;
            if (_206)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _262 = _252;
            _162 = _262;
            if (_206)
            {
                _256 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _264 = _256;
            _166 = _264;
            _184 = true;
        }
    }
    else
    {
        int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _268 = _266 != 0;
        uint _271 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _273 = int(_271) & 15;
        bool _275 = !_268;
        float _277 = as_type<float>(_273);
        float _279 = as_type<float>(_273);
        _144 = _268;
        if (!_275)
        {
            uint _281 = min(uint(_273), 13u);
            float _283 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _285 = int(_281) << 2;
            uint _287 = uint(int(uint(_285) >> uint(2)));
            uint _289 = uint(int(uint(int(_287)) >> uint(2)));
            int _291 = int(_287) & 3;
            float _293 = (*spvDescriptorSet0.vp_c1)._m0[int(_289)][_291];
            float _295 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _297 = _283 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _299 = _283 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _301 = _295 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _303 = _295 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _305 = as_type<int>(_293) >> 31;
            bool _307 = as_type<int>(_293) == 1408;
            float _309 = as_type<float>(_305);
            float _311 = _299;
            float _313 = _293;
            float _315 = _303;
            if (!_307)
            {
                bool _317 = as_type<int>(_293) == 1456;
                _319 = _317;
                if (!_319)
                {
                    bool _321 = as_type<int>(_293) == 1520;
                    _323 = _321;
                    if (!_323)
                    {
                        bool _325 = as_type<int>(_293) == 1584;
                        _327 = _325;
                        if (!_327)
                        {
                            bool _329 = as_type<int>(_293) == 1664;
                            _331 = _329;
                            if (!_331)
                            {
                                bool _333 = as_type<int>(_293) == 1744;
                                _335 = _333;
                                if (!_335)
                                {
                                    bool _337 = as_type<int>(_293) == 1840;
                                    _339 = _337;
                                    if (!_339)
                                    {
                                        bool _341 = as_type<int>(_293) == 1920;
                                        _343 = _341;
                                        if (!_343)
                                        {
                                            bool _345 = as_type<int>(_293) == 2016;
                                            _347 = _345;
                                            if (!_347)
                                            {
                                                bool _349 = as_type<int>(_293) == 2080;
                                                _351 = _349;
                                                if (!_351)
                                                {
                                                    bool _353 = as_type<int>(_293) == 2160;
                                                    _355 = _353;
                                                    if (!_355)
                                                    {
                                                        bool _357 = as_type<int>(_293) == 2224;
                                                        _359 = _357;
                                                        if (!_359)
                                                        {
                                                            _361 = true;
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
            float _367;
            float _369;
            if (!_319)
            {
                if (!_323)
                {
                    if (!_327)
                    {
                        if (!_331)
                        {
                            if (!_335)
                            {
                                if (!_339)
                                {
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
                                                        if (!_361)
                                                        {
                                                            float _363 = _297 * _47;
                                                            float _365 = _301 * _49;
                                                            _367 = _365;
                                                            _369 = _363;
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
            if ((((((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331) || _327) || _323) || _319)
            {
                if ((!_323) || _319)
                {
                    if ((!_327) || _319)
                    {
                        if ((!_331) || _319)
                        {
                            if ((!_335) || _319)
                            {
                                if ((!_339) || _319)
                                {
                                    if ((!_343) || _319)
                                    {
                                        if ((!_347) || _319)
                                        {
                                            if ((!_351) || _319)
                                            {
                                                if ((!_355) || _319)
                                                {
                                                    if ((!_359) || _319)
                                                    {
                                                        if ((!_361) || _319)
                                                        {
                                                            _319 = false;
                                                            float _371 = -_299;
                                                            float _373 = _371 + 1.0;
                                                            float _375 = _301 * _49;
                                                            float _377 = fma(_299, _47, _373);
                                                            _367 = _375;
                                                            _369 = _377;
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
                if (((((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331) || _327) || _323)
                {
                    if ((!_327) || _323)
                    {
                        if ((!_331) || _323)
                        {
                            if ((!_335) || _323)
                            {
                                if ((!_339) || _323)
                                {
                                    if ((!_343) || _323)
                                    {
                                        if ((!_347) || _323)
                                        {
                                            if ((!_351) || _323)
                                            {
                                                if ((!_355) || _323)
                                                {
                                                    if ((!_359) || _323)
                                                    {
                                                        if ((!_361) || _323)
                                                        {
                                                            _323 = false;
                                                            float _379 = -_303;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _297 * _47;
                                                            float _385 = fma(_303, _49, _381);
                                                            _367 = _385;
                                                            _369 = _383;
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
                    if ((((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331) || _327)
                    {
                        if ((!_331) || _327)
                        {
                            if ((!_335) || _327)
                            {
                                if ((!_339) || _327)
                                {
                                    if ((!_343) || _327)
                                    {
                                        if ((!_347) || _327)
                                        {
                                            if ((!_351) || _327)
                                            {
                                                if ((!_355) || _327)
                                                {
                                                    if ((!_359) || _327)
                                                    {
                                                        if ((!_361) || _327)
                                                        {
                                                            _327 = false;
                                                            float _387 = -_299;
                                                            float _389 = _387 + 1.0;
                                                            float _391 = -_303;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = fma(_299, _47, _389);
                                                            float _397 = fma(_303, _49, _393);
                                                            _367 = _397;
                                                            _369 = _395;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335) || _331)
                        {
                            if ((!_335) || _331)
                            {
                                if ((!_339) || _331)
                                {
                                    if ((!_343) || _331)
                                    {
                                        if ((!_347) || _331)
                                        {
                                            if ((!_351) || _331)
                                            {
                                                if ((!_355) || _331)
                                                {
                                                    if ((!_359) || _331)
                                                    {
                                                        if ((!_361) || _331)
                                                        {
                                                            _331 = false;
                                                            float _399 = -_301;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = _297 * _47;
                                                            float _405 = -_303;
                                                            float _407 = _405 + _401;
                                                            float _409 = fma(_407, _49, _301);
                                                            _367 = _409;
                                                            _369 = _403;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339) || _335)
                            {
                                if ((!_339) || _335)
                                {
                                    if ((!_343) || _335)
                                    {
                                        if ((!_347) || _335)
                                        {
                                            if ((!_351) || _335)
                                            {
                                                if ((!_355) || _335)
                                                {
                                                    if ((!_359) || _335)
                                                    {
                                                        if ((!_361) || _335)
                                                        {
                                                            _335 = false;
                                                            float _411 = -_301;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = -_299;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = -_303;
                                                            float _421 = _419 + _413;
                                                            float _423 = fma(_299, _47, _417);
                                                            float _425 = fma(_421, _49, _301);
                                                            _367 = _425;
                                                            _369 = _423;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _361) || _359) || _355) || _351) || _347) || _343) || _339)
                                {
                                    if ((!_343) || _339)
                                    {
                                        if ((!_347) || _339)
                                        {
                                            if ((!_351) || _339)
                                            {
                                                if ((!_355) || _339)
                                                {
                                                    if ((!_359) || _339)
                                                    {
                                                        if ((!_361) || _339)
                                                        {
                                                            _339 = false;
                                                            float _427 = -_297;
                                                            float _429 = _427 + 1.0;
                                                            float _431 = _301 * _49;
                                                            float _433 = -_299;
                                                            float _435 = _433 + _429;
                                                            float _437 = fma(_435, _47, _297);
                                                            _367 = _431;
                                                            _369 = _437;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _361) || _359) || _355) || _351) || _347) || _343)
                                    {
                                        if ((!_347) || _343)
                                        {
                                            if ((!_351) || _343)
                                            {
                                                if ((!_355) || _343)
                                                {
                                                    if ((!_359) || _343)
                                                    {
                                                        if ((!_361) || _343)
                                                        {
                                                            _343 = false;
                                                            float _439 = -_297;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_303;
                                                            float _445 = _443 + 1.0;
                                                            float _447 = -_299;
                                                            float _449 = _447 + _441;
                                                            float _451 = fma(_303, _49, _445);
                                                            float _453 = fma(_449, _47, _297);
                                                            _367 = _451;
                                                            _369 = _453;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _361) || _359) || _355) || _351) || _347)
                                        {
                                            if ((!_351) || _347)
                                            {
                                                if ((!_355) || _347)
                                                {
                                                    if ((!_359) || _347)
                                                    {
                                                        if ((!_361) || _347)
                                                        {
                                                            _347 = false;
                                                            float _455 = -_299;
                                                            float _457 = _455 + 1.0;
                                                            float _459 = _301 * _49;
                                                            float _461 = _457 * _47;
                                                            _367 = _459;
                                                            _369 = _461;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _361) || _359) || _355) || _351)
                                            {
                                                if ((!_355) || _351)
                                                {
                                                    if ((!_359) || _351)
                                                    {
                                                        if ((!_361) || _351)
                                                        {
                                                            _351 = false;
                                                            float _463 = -_299;
                                                            float _465 = _463 + 1.0;
                                                            float _467 = -_303;
                                                            float _469 = _467 + 1.0;
                                                            float _471 = fma(_299, _47, _465);
                                                            float _473 = _469 * _49;
                                                            _367 = _473;
                                                            _369 = _471;
                                                        }
                                                    }
                                                }
                                                if (((false || _361) || _359) || _355)
                                                {
                                                    if ((!_359) || _355)
                                                    {
                                                        if ((!_361) || _355)
                                                        {
                                                            _355 = false;
                                                            float _475 = -_301;
                                                            float _477 = _475 + 1.0;
                                                            float _479 = _297 * _47;
                                                            float _481 = fma(_477, _49, _301);
                                                            _367 = _481;
                                                            _369 = _479;
                                                        }
                                                    }
                                                    if ((false || _361) || _359)
                                                    {
                                                        if ((!_361) || _359)
                                                        {
                                                            _359 = false;
                                                            float _483 = -_297;
                                                            float _485 = _483 + 1.0;
                                                            float _487 = -_303;
                                                            float _489 = _487 + 1.0;
                                                            float _491 = fma(_485, _47, _297);
                                                            float _493 = fma(_303, _49, _489);
                                                            _367 = _493;
                                                            _369 = _491;
                                                        }
                                                        if (false || _361)
                                                        {
                                                            _361 = false;
                                                            bool _495 = _273 != 12;
                                                            if (!_495)
                                                            {
                                                                float _497 = -_301;
                                                                float _499 = _497 + 1.0;
                                                                _309 = _499;
                                                            }
                                                            float _501 = _309;
                                                            if (!_495)
                                                            {
                                                                float _503 = -_299;
                                                                float _505 = _503 + 1.0;
                                                                _311 = _505;
                                                            }
                                                            float _507 = _311;
                                                            if (_495)
                                                            {
                                                                _313 = 0.0;
                                                            }
                                                            float _509 = _313;
                                                            float _511 = _509;
                                                            if (!_495)
                                                            {
                                                                float _513 = -_303;
                                                                float _515 = _513 + _501;
                                                                _315 = _515;
                                                            }
                                                            float _517 = _315;
                                                            if (_495)
                                                            {
                                                                _277 = 0.0;
                                                            }
                                                            float _519 = _277;
                                                            _367 = _519;
                                                            if (!_495)
                                                            {
                                                                float _521 = _47 * _507;
                                                                _511 = _521;
                                                            }
                                                            float _523 = _511;
                                                            _369 = _523;
                                                            if (!_495)
                                                            {
                                                                float _525 = _49 * _517;
                                                                _367 = _525;
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
            float _527 = _367;
            float _529 = _369;
            float _531 = -_527;
            float _533 = _531 + 1.0;
            float _535 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _537 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _539 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _541 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _543 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _545 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _547 = _527 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _549 = _527 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _551 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].x, _535);
            float _553 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].x, _537);
            float _555 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].y, _539);
            float _557 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].y, _541);
            float _559 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].z, _543);
            float _561 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].z, _545);
            float _563 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[29].w, _547);
            float _565 = fma(_533, (*spvDescriptorSet0.vp_c3)._m0[30].w, _549);
            float _567 = -_529;
            float _569 = _567 + 1.0;
            float _571 = _551 * _529;
            float _573 = _555 * _529;
            float _575 = _559 * _529;
            float _577 = _565 * _529;
            float _579 = fma(_569, _553, _571);
            float _581 = fma(_569, _557, _573);
            float _583 = fma(_569, _561, _575);
            float _585 = fma(_569, _563, _577);
            _166 = _49;
            _162 = _47;
            _150 = _47;
            _156 = _49;
            _170 = _579;
            _174 = _581;
            _178 = _583;
            _182 = _585;
            _184 = true;
        }
        else
        {
            float _587 = trunc(_47);
            int _589 = int(_587);
            bool _591 = _273 != 13;
            float _593 = trunc(_49);
            int _595 = int(_593);
            int _597 = _595 << 1;
            int _599 = _597 + _589;
            int _601 = _599 << 4;
            bool _603 = _601 == 0;
            bool _605 = _601 == 16;
            bool _607 = _601 == 32;
            bool _609 = _601 == 48;
            float _611 = 0.0;
            if (_603)
            {
                _611 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _613 = _611;
            float _615 = _613;
            if (_603)
            {
                _130 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _617 = _130;
            float _619 = _617;
            if (_603)
            {
                _132 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _621 = _132;
            float _623 = _621;
            if (_603)
            {
                _279 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _625 = _279;
            float _627 = _625;
            if (_605)
            {
                _615 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _629 = _615;
            float _631 = _629;
            if (_605)
            {
                _619 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _633 = _619;
            float _635 = _633;
            if (_605)
            {
                _623 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _637 = _623;
            float _639 = _637;
            if (_605)
            {
                _627 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _641 = _627;
            float _643 = _641;
            if (_607)
            {
                _631 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _645 = _631;
            float _647 = _645;
            if (_607)
            {
                _635 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _649 = _635;
            float _651 = _649;
            if (_607)
            {
                _639 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _653 = _639;
            float _655 = _653;
            if (_607)
            {
                _643 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _657 = _643;
            float _659 = _657;
            if (_609)
            {
                _647 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _661 = _647;
            _150 = _661;
            if (_609)
            {
                _651 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _663 = _651;
            _156 = _663;
            if (_609)
            {
                _655 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _665 = _655;
            _162 = _665;
            if (_609)
            {
                _659 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _667 = _659;
            _166 = _667;
            if (!_591)
            {
                float _669 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _671 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _673 = _669 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _675 = -_673;
                float _677 = _675 + 1.0;
                float _679 = _671 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _681 = -_669;
                float _683 = fma(_681, (*spvDescriptorSet0.vp_c3)._m0[26].w, _677);
                float _685 = -_679;
                float _687 = _685 + 1.0;
                float _689 = fma(_683, _49, _673);
                float _691 = -_671;
                float _693 = fma(_691, (*spvDescriptorSet0.vp_c3)._m0[26].y, _687);
                float _695 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _697 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _699 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _701 = fma(_693, _47, _679);
                float _703 = -_689;
                float _705 = _703 + 1.0;
                float _707 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _709 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _711 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _713 = _689 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _715 = _689 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _717 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].x, _695);
                float _719 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].x, _697);
                float _721 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].y, _699);
                float _723 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].y, _707);
                float _725 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].z, _709);
                float _727 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].z, _711);
                float _729 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[29].w, _713);
                float _731 = fma(_705, (*spvDescriptorSet0.vp_c3)._m0[30].w, _715);
                float _733 = -_701;
                float _735 = _733 + 1.0;
                float _737 = _701 * _717;
                float _739 = _701 * _721;
                float _741 = _701 * _725;
                float _743 = _701 * _731;
                float _745 = fma(_735, _719, _737);
                float _747 = fma(_735, _723, _739);
                float _749 = fma(_735, _727, _741);
                float _751 = fma(_735, _729, _743);
                _170 = _745;
                _174 = _747;
                _178 = _749;
                _182 = _751;
                _184 = true;
            }
            else
            {
                int _753 = _599 << 4;
                int _755 = _753 + 464;
                uint _757 = uint(int(uint(_755) >> uint(2)));
                uint _759 = uint(int(uint(int(_757)) >> uint(2)));
                int _761 = int(_757) & 3;
                float _763 = (*spvDescriptorSet0.vp_c3)._m0[int(_759)][_761];
                int _765 = int(_757) + 1;
                uint _767 = uint(int(uint(_765) >> uint(2)));
                int _769 = _765 & 3;
                float _771 = (*spvDescriptorSet0.vp_c3)._m0[int(_767)][_769];
                int _773 = _755 + 8;
                uint _775 = uint(int(uint(_773) >> uint(2)));
                uint _777 = uint(int(uint(int(_775)) >> uint(2)));
                int _779 = int(_775) & 3;
                float _781 = (*spvDescriptorSet0.vp_c3)._m0[int(_777)][_779];
                int _783 = int(_775) + 1;
                uint _785 = uint(int(uint(_783) >> uint(2)));
                int _787 = _783 & 3;
                float _789 = (*spvDescriptorSet0.vp_c3)._m0[int(_785)][_787];
                _170 = _763;
                _174 = _771;
                _178 = _781;
                _182 = _789;
            }
        }
    }
    _184 = false;
    float _791 = _166;
    float _793 = _162;
    float _795 = _150;
    float _797 = _156;
    bool _799 = _144;
    float _801 = _170;
    float _803 = _174;
    float _805 = _178;
    float _807 = _182;
    bool _809 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _811 = !_809;
    float _813 = _793;
    float _815 = _791;
    float _817 = _795;
    float _819 = _797;
    float _821 = _793;
    float _823 = _791;
    float _837;
    float _839;
    if (!_811)
    {
        float _825 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _827 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _829 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _825);
        float _831 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _827);
        float _833 = _829 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _835 = _831 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _837 = _835;
        _839 = _833;
        _841 = true;
    }
    else
    {
        int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _845 = _843 != 0;
        if (!_845)
        {
            _813 = _795;
        }
        float _847 = _813;
        float _849 = _847;
        _839 = _847;
        if (!_845)
        {
            _815 = _797;
        }
        float _851 = _815;
        bool _853 = !_845;
        float _855 = _851;
        _837 = _851;
        if (!_853)
        {
            if (!_799)
            {
                _849 = _795;
            }
            float _857 = _849;
            float _859 = _857;
            int _861 = as_type<int>(_857);
            if (!_799)
            {
                _855 = _797;
            }
            float _863 = _855;
            bool _865 = !_799;
            float _867 = _863;
            float _869 = _863;
            if (!_865)
            {
                int _871 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _873 = _871 != 0;
                int _875 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _877 = _875 != 0;
                int _879 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _881 = _879 != 0;
                int _883 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _885 = _883 != 0;
                int _887 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _889 = _887 != 0;
                if (_873)
                {
                    _859 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _891 = _859;
                float _893 = _891;
                if (_873)
                {
                    _867 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _895 = _867;
                float _897 = _895;
                if (!_873)
                {
                    _893 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _899 = _893;
                if (!_873)
                {
                    _897 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _901 = _897;
                float _903 = _899 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _905 = _901 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_885)
                {
                    float _907 = _903 * _795;
                    _817 = _907;
                }
                float _909 = _817;
                float _911 = -_903;
                float _913 = _911 + 1.0;
                int _915 = as_type<int>(_909);
                if (_889)
                {
                    float _917 = _905 * _797;
                    _819 = _917;
                }
                float _919 = _819;
                float _921 = -_905;
                float _923 = _921 + 1.0;
                float _925 = _919;
                if (_877)
                {
                    float _927 = _909 + _913;
                    _915 = as_type<int>(_927);
                }
                int _929 = _915;
                if (_881)
                {
                    float _931 = _919 + _923;
                    _925 = _931;
                }
                float _933 = _925;
                _861 = _929;
                _869 = _933;
            }
            int _935 = _861;
            float _937 = _869;
            int _939 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _941 = _939 != 0;
            int _943 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _945 = _943 != 0;
            int _947 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _949 = _947 != 0;
            int _951 = _935;
            int _953 = as_type<int>(_937);
            if (_945)
            {
                float _955 = -as_type<float>(_935);
                float _957 = _955 + 1.0;
                _951 = as_type<int>(_957);
            }
            int _959 = _951;
            if (_949)
            {
                float _961 = -_937;
                float _963 = _961 + 1.0;
                _953 = as_type<int>(_963);
            }
            int _965 = _953;
            bool _967 = !_941;
            float _969 = _967 ? as_type<float>(_959) : as_type<float>(_965);
            bool _971 = !_941;
            float _973 = _971 ? as_type<float>(_965) : as_type<float>(_959);
            _837 = _973;
            _839 = _969;
        }
    }
    _841 = false;
    float _975 = _837;
    float _977 = _839;
    float _979 = _975 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _981 = _975 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _983 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _985 = fma(_977, (*spvDescriptorSet0.vp_c3)._m0[8].x, _979);
    float _987 = fma(_977, (*spvDescriptorSet0.vp_c3)._m0[7].x, _981);
    float _989 = _985 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _991 = _987 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _993 = -_989;
    float _995 = _993 + 1.0;
    out.m_27.x = _991;
    out.m_27.y = _995;
    bool _997 = !_983;
    float _1011;
    float _1013;
    if (!_997)
    {
        float _999 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1001 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1003 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _999);
        float _1005 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1001);
        float _1007 = _1003 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1009 = _1005 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _1011 = _1009;
        _1013 = _1007;
        _1015 = true;
    }
    else
    {
        int _1017 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1019 = _1017 != 0;
        if (!_1019)
        {
            _134 = _793;
        }
        float _1021 = _134;
        float _1023 = _1021;
        _1013 = _1021;
        if (!_1019)
        {
            _136 = _791;
        }
        float _1025 = _136;
        bool _1027 = !_1019;
        float _1029 = _1025;
        _1011 = _1025;
        if (!_1027)
        {
            if (!_799)
            {
                _1023 = _793;
            }
            float _1031 = _1023;
            float _1033 = _1031;
            int _1035 = as_type<int>(_1031);
            if (!_799)
            {
                _1029 = _791;
            }
            float _1037 = _1029;
            bool _1039 = !_799;
            float _1041 = _1037;
            float _1043 = _1037;
            if (!_1039)
            {
                int _1045 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1047 = _1045 != 0;
                int _1049 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1051 = _1049 != 0;
                int _1053 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1055 = _1053 != 0;
                int _1057 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1059 = _1057 != 0;
                int _1061 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1063 = _1061 != 0;
                if (_1047)
                {
                    _1033 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1065 = _1033;
                float _1067 = _1065;
                if (_1047)
                {
                    _1041 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1069 = _1041;
                float _1071 = _1069;
                if (!_1047)
                {
                    _1067 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1073 = _1067;
                if (!_1047)
                {
                    _1071 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1075 = _1071;
                float _1077 = _1073 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1079 = _1075 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1059)
                {
                    float _1081 = _1077 * _793;
                    _821 = _1081;
                }
                float _1083 = _821;
                float _1085 = -_1077;
                float _1087 = _1085 + 1.0;
                int _1089 = as_type<int>(_1083);
                if (_1063)
                {
                    float _1091 = _1079 * _791;
                    _823 = _1091;
                }
                float _1093 = _823;
                float _1095 = -_1079;
                float _1097 = _1095 + 1.0;
                float _1099 = _1093;
                if (_1051)
                {
                    float _1101 = _1083 + _1087;
                    _1089 = as_type<int>(_1101);
                }
                int _1103 = _1089;
                if (_1055)
                {
                    float _1105 = _1093 + _1097;
                    _1099 = _1105;
                }
                float _1107 = _1099;
                _1035 = _1103;
                _1043 = _1107;
            }
            int _1109 = _1035;
            float _1111 = _1043;
            int _1113 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1115 = _1113 != 0;
            int _1117 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1119 = _1117 != 0;
            int _1121 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1123 = _1121 != 0;
            int _1125 = _1109;
            int _1127 = as_type<int>(_1111);
            if (_1119)
            {
                float _1129 = -as_type<float>(_1109);
                float _1131 = _1129 + 1.0;
                _1125 = as_type<int>(_1131);
            }
            int _1133 = _1125;
            if (_1123)
            {
                float _1135 = -_1111;
                float _1137 = _1135 + 1.0;
                _1127 = as_type<int>(_1137);
            }
            int _1139 = _1127;
            bool _1141 = !_1115;
            float _1143 = _1141 ? as_type<float>(_1133) : as_type<float>(_1139);
            bool _1145 = !_1115;
            float _1147 = _1145 ? as_type<float>(_1139) : as_type<float>(_1133);
            _1011 = _1147;
            _1013 = _1143;
        }
    }
    _1015 = false;
    float _1149 = _1011;
    float _1151 = _1013;
    float _1153 = _1149 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1155 = _1149 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1157 = _801 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1159 = _803 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1153);
    float _1163 = fma(_1151, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1155);
    float _1165 = _805 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1167 = _807 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1171 = _1163 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    out.m_29.x = _47;
    out.m_29.y = _49;
    float _1173 = -_1169;
    float _1175 = _1173 + 1.0;
    out.m_31.x = _1157;
    out.m_31.y = _1159;
    out.m_31.z = _1165;
    out.m_31.w = _1167;
    out.m_33.x = _1171;
    out.m_33.y = _1175;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

