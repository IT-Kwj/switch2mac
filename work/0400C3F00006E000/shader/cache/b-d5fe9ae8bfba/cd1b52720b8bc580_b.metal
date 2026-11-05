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
    bool _1079 = false;
    bool _889 = false;
    bool _152 = false;
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
    float _45 = in.m_24.x;
    float _47 = in.m_24.y;
    float _49 = -_47;
    float _51 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _53 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _73 = _67 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _79 = _67 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].z, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].z, _85);
    float _95 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].z, _87);
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _99;
    out.gl_Position.y = _97;
    out.gl_Position.z = _101;
    out.gl_Position.w = _103;
    int _106 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _110 = _106 != 0;
    bool _112 = !_110;
    float _114 = _71;
    float _116 = _87;
    float _118 = _71;
    float _120 = _87;
    float _122 = _47;
    float _124 = _45;
    float _126 = _53;
    bool _134;
    float _136;
    float _138;
    float _140;
    float _142;
    float _144;
    float _146;
    float _148;
    float _150;
    if (!_112)
    {
        int _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _130 = _128 != 0;
        bool _132 = !_130;
        _134 = _130;
        if (!_132)
        {
            _136 = _47;
            _138 = _45;
            _140 = 1.0;
            _142 = 1.0;
            _144 = 255.0;
            _146 = 255.0;
            _148 = 255.0;
            _150 = 255.0;
            _152 = true;
        }
        else
        {
            float _154 = trunc(_45);
            int _156 = int(_154);
            float _158 = trunc(_47);
            int _160 = int(_158);
            int _162 = _160 << 1;
            int _164 = _162 + _156;
            int _166 = _164 << 4;
            bool _168 = _166 == 0;
            bool _170 = _166 == 16;
            bool _172 = _166 == 32;
            bool _174 = _166 == 48;
            float _176 = 0.0;
            float _178 = as_type<float>(_156);
            float _180 = as_type<float>(_160);
            _144 = 255.0;
            _146 = 255.0;
            _148 = 255.0;
            _150 = 255.0;
            if (_168)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _182 = _176;
            float _184 = _182;
            if (_168)
            {
                _114 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _186 = _114;
            float _188 = 0.0;
            float _190 = _186;
            if (_168)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _192 = _188;
            float _194 = _192;
            if (_168)
            {
                _178 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _196 = _178;
            float _198 = _196;
            if (_168)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _200 = _180;
            float _202 = _200;
            if (_168)
            {
                _116 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _204 = _116;
            float _206 = _204;
            if (_170)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _208 = _184;
            float _210 = _208;
            if (_170)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _212 = _190;
            float _214 = _212;
            if (_170)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _216 = _194;
            float _218 = _216;
            if (_170)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _220 = _198;
            float _222 = _220;
            if (_170)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _224 = _202;
            float _226 = _224;
            if (_170)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _228 = _206;
            float _230 = _228;
            if (_172)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _232 = _210;
            float _234 = _232;
            if (_172)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _236 = _214;
            float _238 = _236;
            if (_172)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _240 = _218;
            float _242 = _240;
            if (_172)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _244 = _222;
            float _246 = _244;
            if (_172)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _248 = _226;
            float _250 = _248;
            if (_172)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _252 = _230;
            float _254 = _252;
            if (_174)
            {
                _234 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _256 = _234;
            _138 = _256;
            if (_174)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _258 = _238;
            _136 = _258;
            if (_174)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _260 = _242;
            _140 = _260;
            if (_174)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _262 = _246;
            _124 = _262;
            if (_174)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _264 = _250;
            _122 = _264;
            if (_174)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _266 = _254;
            _142 = _266;
            _152 = true;
        }
    }
    else
    {
        int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _270 = _268 != 0;
        uint _273 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _275 = int(_273) & 15;
        bool _277 = !_270;
        _134 = _270;
        if (!_277)
        {
            uint _279 = min(uint(_275), 13u);
            float _281 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _283 = int(_279) << 2;
            uint _285 = uint(int(uint(_283) >> uint(2)));
            uint _287 = uint(int(uint(int(_285)) >> uint(2)));
            int _289 = int(_285) & 3;
            float _291 = (*spvDescriptorSet0.vp_c1)._m0[int(_287)][_289];
            float _293 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _295 = _281 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _297 = _281 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _299 = _293 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _301 = _293 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _303 = as_type<int>(_291) >> 31;
            bool _305 = as_type<int>(_291) == 1552;
            float _307 = _295;
            float _309 = _297;
            float _311 = _291;
            float _313 = as_type<float>(_303);
            float _315 = _301;
            if (!_305)
            {
                bool _317 = as_type<int>(_291) == 1600;
                _319 = _317;
                if (!_319)
                {
                    bool _321 = as_type<int>(_291) == 1664;
                    _323 = _321;
                    if (!_323)
                    {
                        bool _325 = as_type<int>(_291) == 1728;
                        _327 = _325;
                        if (!_327)
                        {
                            bool _329 = as_type<int>(_291) == 1808;
                            _331 = _329;
                            if (!_331)
                            {
                                bool _333 = as_type<int>(_291) == 1888;
                                _335 = _333;
                                if (!_335)
                                {
                                    bool _337 = as_type<int>(_291) == 1984;
                                    _339 = _337;
                                    if (!_339)
                                    {
                                        bool _341 = as_type<int>(_291) == 2064;
                                        _343 = _341;
                                        if (!_343)
                                        {
                                            bool _345 = as_type<int>(_291) == 2160;
                                            _347 = _345;
                                            if (!_347)
                                            {
                                                bool _349 = as_type<int>(_291) == 2224;
                                                _351 = _349;
                                                if (!_351)
                                                {
                                                    bool _353 = as_type<int>(_291) == 2304;
                                                    _355 = _353;
                                                    if (!_355)
                                                    {
                                                        bool _357 = as_type<int>(_291) == 2368;
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
                                                            float _363 = _295 * _45;
                                                            float _365 = _299 * _47;
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
                                                            float _371 = -_297;
                                                            float _373 = _371 + 1.0;
                                                            float _375 = _299 * _47;
                                                            float _377 = fma(_297, _45, _373);
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
                                                            float _379 = -_301;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _295 * _45;
                                                            float _385 = fma(_301, _47, _381);
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
                                                            float _387 = -_297;
                                                            float _389 = _387 + 1.0;
                                                            float _391 = -_301;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = fma(_297, _45, _389);
                                                            float _397 = fma(_301, _47, _393);
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
                                                            float _399 = -_299;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = -_301;
                                                            float _405 = _403 + _401;
                                                            float _407 = _295 * _45;
                                                            float _409 = fma(_405, _47, _299);
                                                            _367 = _409;
                                                            _369 = _407;
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
                                                            float _411 = -_299;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = -_297;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = -_301;
                                                            float _421 = _419 + _413;
                                                            float _423 = fma(_297, _45, _417);
                                                            float _425 = fma(_421, _47, _299);
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
                                                            float _427 = -_295;
                                                            float _429 = _427 + 1.0;
                                                            float _431 = -_297;
                                                            float _433 = _431 + _429;
                                                            float _435 = _299 * _47;
                                                            float _437 = fma(_433, _45, _295);
                                                            _367 = _435;
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
                                                            float _439 = -_295;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_301;
                                                            float _445 = _443 + 1.0;
                                                            float _447 = -_297;
                                                            float _449 = _447 + _441;
                                                            float _451 = fma(_301, _47, _445);
                                                            float _453 = fma(_449, _45, _295);
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
                                                            float _455 = -_297;
                                                            float _457 = _455 + 1.0;
                                                            float _459 = _299 * _47;
                                                            float _461 = _457 * _45;
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
                                                            float _463 = -_297;
                                                            float _465 = _463 + 1.0;
                                                            float _467 = -_301;
                                                            float _469 = _467 + 1.0;
                                                            float _471 = fma(_297, _45, _465);
                                                            float _473 = _469 * _47;
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
                                                            float _475 = -_299;
                                                            float _477 = _475 + 1.0;
                                                            float _479 = _295 * _45;
                                                            float _481 = fma(_477, _47, _299);
                                                            _367 = _481;
                                                            _369 = _479;
                                                        }
                                                    }
                                                    if ((false || _361) || _359)
                                                    {
                                                        if ((!_361) || _359)
                                                        {
                                                            _359 = false;
                                                            float _483 = -_295;
                                                            float _485 = _483 + 1.0;
                                                            float _487 = -_301;
                                                            float _489 = _487 + 1.0;
                                                            float _491 = fma(_485, _45, _295);
                                                            float _493 = fma(_301, _47, _489);
                                                            _367 = _493;
                                                            _369 = _491;
                                                        }
                                                        if (false || _361)
                                                        {
                                                            _361 = false;
                                                            bool _495 = _275 != 12;
                                                            if (!_495)
                                                            {
                                                                float _497 = -_299;
                                                                float _499 = _497 + 1.0;
                                                                _307 = _499;
                                                            }
                                                            float _501 = _307;
                                                            if (!_495)
                                                            {
                                                                float _503 = -_297;
                                                                float _505 = _503 + 1.0;
                                                                _309 = _505;
                                                            }
                                                            float _507 = _309;
                                                            if (_495)
                                                            {
                                                                _311 = 0.0;
                                                                _313 = 0.0;
                                                            }
                                                            float _509 = _311;
                                                            float _511 = _313;
                                                            float _513 = _511;
                                                            _367 = _509;
                                                            if (!_495)
                                                            {
                                                                float _515 = -_301;
                                                                float _517 = _515 + _501;
                                                                _315 = _517;
                                                            }
                                                            float _519 = _315;
                                                            if (!_495)
                                                            {
                                                                float _521 = _45 * _507;
                                                                _513 = _521;
                                                            }
                                                            float _523 = _513;
                                                            _369 = _523;
                                                            if (!_495)
                                                            {
                                                                float _525 = _47 * _519;
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
            float _567 = _551 * _529;
            float _569 = _555 * _529;
            float _571 = _559 * _529;
            float _573 = _565 * _529;
            float _575 = -_529;
            float _577 = _575 + 1.0;
            float _579 = fma(_577, _553, _567);
            float _581 = fma(_577, _557, _569);
            float _583 = fma(_577, _561, _571);
            float _585 = fma(_577, _563, _573);
            _136 = _47;
            _138 = _45;
            _140 = 1.0;
            _142 = 1.0;
            _144 = _579;
            _146 = _581;
            _148 = _583;
            _150 = _585;
            _152 = true;
        }
        else
        {
            float _587 = trunc(_45);
            int _589 = int(_587);
            bool _591 = _275 != 13;
            float _593 = trunc(_47);
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
                _118 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _617 = _118;
            float _619 = 0.0;
            float _621 = _617;
            if (_603)
            {
                _619 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _623 = _619;
            float _625 = _623;
            if (_603)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _627 = _120;
            float _629 = 0.0;
            float _631 = _627;
            if (_603)
            {
                _629 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _633 = _629;
            float _635 = 0.0;
            float _637 = _633;
            if (_603)
            {
                _635 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _639 = _635;
            float _641 = _639;
            if (_605)
            {
                _615 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _643 = _615;
            float _645 = _643;
            if (_605)
            {
                _621 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _647 = _621;
            float _649 = _647;
            if (_605)
            {
                _625 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _651 = _625;
            float _653 = _651;
            if (_605)
            {
                _631 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _655 = _631;
            float _657 = _655;
            if (_605)
            {
                _637 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _659 = _637;
            float _661 = _659;
            if (_605)
            {
                _641 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _663 = _641;
            float _665 = _663;
            if (_607)
            {
                _645 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _667 = _645;
            float _669 = _667;
            if (_607)
            {
                _649 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _671 = _649;
            float _673 = _671;
            if (_607)
            {
                _653 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _675 = _653;
            float _677 = _675;
            if (_607)
            {
                _657 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _679 = _657;
            float _681 = _679;
            if (_607)
            {
                _661 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _683 = _661;
            float _685 = _683;
            if (_607)
            {
                _665 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _687 = _665;
            float _689 = _687;
            if (_609)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _691 = _669;
            _138 = _691;
            if (_609)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _693 = _673;
            _136 = _693;
            if (_609)
            {
                _677 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _695 = _677;
            _140 = _695;
            if (_609)
            {
                _681 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _697 = _681;
            if (_609)
            {
                _685 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _699 = _685;
            if (_609)
            {
                _689 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _701 = _689;
            if (!_591)
            {
                float _703 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _705 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _707 = _703 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _709 = -_707;
                float _711 = _709 + 1.0;
                float _713 = _705 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _715 = -_703;
                float _717 = fma(_715, (*spvDescriptorSet0.vp_c3)._m0[26].w, _711);
                float _719 = -_713;
                float _721 = _719 + 1.0;
                float _723 = fma(_717, _47, _707);
                float _725 = -_705;
                float _727 = fma(_725, (*spvDescriptorSet0.vp_c3)._m0[26].y, _721);
                float _729 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _731 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _733 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _735 = fma(_727, _45, _713);
                float _737 = -_723;
                float _739 = _737 + 1.0;
                float _741 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _743 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _745 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _747 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _749 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _751 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].x, _729);
                float _753 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].y, _731);
                float _755 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].z, _733);
                float _757 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].w, _741);
                float _759 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].x, _743);
                float _761 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].y, _745);
                float _763 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].z, _747);
                float _765 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].w, _749);
                float _767 = _735 * _751;
                float _769 = -_735;
                float _771 = _769 + 1.0;
                float _773 = _735 * _753;
                float _775 = _735 * _755;
                float _777 = _735 * _757;
                float _779 = fma(_771, _759, _767);
                float _781 = fma(_771, _761, _773);
                float _783 = fma(_771, _763, _775);
                float _785 = fma(_771, _765, _777);
                _122 = _699;
                _124 = _697;
                _142 = _701;
                _144 = _779;
                _146 = _781;
                _148 = _783;
                _150 = _785;
                _152 = true;
            }
            else
            {
                int _787 = _599 << 4;
                int _789 = _787 + 464;
                uint _791 = uint(int(uint(_789) >> uint(2)));
                uint _793 = uint(int(uint(int(_791)) >> uint(2)));
                int _795 = int(_791) & 3;
                float _797 = (*spvDescriptorSet0.vp_c3)._m0[int(_793)][_795];
                int _799 = int(_791) + 1;
                uint _801 = uint(int(uint(_799) >> uint(2)));
                int _803 = _799 & 3;
                float _805 = (*spvDescriptorSet0.vp_c3)._m0[int(_801)][_803];
                int _807 = _789 + 8;
                uint _809 = uint(int(uint(_807) >> uint(2)));
                uint _811 = uint(int(uint(int(_809)) >> uint(2)));
                int _813 = int(_809) & 3;
                float _815 = (*spvDescriptorSet0.vp_c3)._m0[int(_811)][_813];
                int _817 = int(_809) + 1;
                uint _819 = uint(int(uint(_817) >> uint(2)));
                int _821 = _817 & 3;
                float _823 = (*spvDescriptorSet0.vp_c3)._m0[int(_819)][_821];
                _122 = _699;
                _124 = _697;
                _142 = _701;
                _144 = _797;
                _146 = _805;
                _148 = _815;
                _150 = _823;
            }
        }
    }
    _152 = false;
    float _825 = _122;
    float _827 = _124;
    float _829 = _136;
    float _831 = _138;
    float _833 = _140;
    bool _835 = _134;
    float _837 = _142;
    float _839 = _144;
    float _841 = _146;
    float _843 = _148;
    float _845 = _150;
    bool _847 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _849 = !_847;
    float _851 = _829;
    float _853 = _825;
    float _855 = _827;
    float _857 = _831;
    float _859 = _829;
    float _861 = _827;
    float _863 = _825;
    float _883;
    int _885;
    float _887;
    if (!_849)
    {
        float _865 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _867 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _869 = _51 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _871 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _865);
        float _873 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _867);
        float _875 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[17].x, _869);
        float _877 = _871 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _879 = _873 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _881 = _875 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _883 = _879;
        _885 = as_type<int>(_881);
        _887 = _877;
        _889 = true;
    }
    else
    {
        int _891 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _893 = _891 != 0;
        if (!_893)
        {
            _851 = _831;
        }
        float _895 = _851;
        _887 = _895;
        if (!_893)
        {
            _853 = _829;
        }
        float _897 = _853;
        float _899 = _897;
        _883 = _897;
        if (!_893)
        {
            _855 = _833;
        }
        float _901 = _855;
        bool _903 = !_893;
        float _905 = _901;
        _885 = as_type<int>(_901);
        if (!_903)
        {
            if (!_835)
            {
                _899 = _831;
            }
            float _907 = _899;
            float _909 = _907;
            float _911 = _907;
            if (!_835)
            {
                _905 = _829;
            }
            float _913 = _905;
            bool _915 = !_835;
            float _917 = _913;
            int _919 = as_type<int>(_913);
            if (!_915)
            {
                int _921 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _923 = _921 != 0;
                int _925 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _927 = _925 != 0;
                int _929 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _931 = _929 != 0;
                int _933 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _935 = _933 != 0;
                int _937 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _939 = _937 != 0;
                if (_923)
                {
                    _909 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _941 = _909;
                float _943 = _941;
                if (_923)
                {
                    _917 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _945 = _917;
                float _947 = _945;
                if (!_923)
                {
                    _943 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _949 = _943;
                if (!_923)
                {
                    _947 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _951 = _947;
                float _953 = _949 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _955 = _951 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_935)
                {
                    float _957 = _953 * _831;
                    _857 = _957;
                }
                float _959 = _857;
                float _961 = -_953;
                float _963 = _961 + 1.0;
                float _965 = _959;
                if (_939)
                {
                    float _967 = _955 * _829;
                    _859 = _967;
                }
                float _969 = _859;
                float _971 = -_955;
                float _973 = _971 + 1.0;
                int _975 = as_type<int>(_969);
                if (_927)
                {
                    float _977 = _959 + _963;
                    _965 = _977;
                }
                float _979 = _965;
                if (_931)
                {
                    float _981 = _969 + _973;
                    _975 = as_type<int>(_981);
                }
                int _983 = _975;
                _919 = _983;
                _911 = _979;
            }
            int _985 = _919;
            float _987 = _911;
            int _989 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _991 = _989 != 0;
            int _993 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _995 = _993 != 0;
            int _997 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _999 = _997 != 0;
            int _1001 = as_type<int>(_987);
            int _1003 = _985;
            _885 = as_type<int>(_833);
            if (_995)
            {
                float _1005 = -_987;
                float _1007 = _1005 + 1.0;
                _1001 = as_type<int>(_1007);
            }
            int _1009 = _1001;
            if (_999)
            {
                float _1011 = -as_type<float>(_985);
                float _1013 = _1011 + 1.0;
                _1003 = as_type<int>(_1013);
            }
            int _1015 = _1003;
            bool _1017 = !_991;
            float _1019 = _1017 ? as_type<float>(_1009) : as_type<float>(_1015);
            bool _1021 = !_991;
            float _1023 = _1021 ? as_type<float>(_1015) : as_type<float>(_1009);
            _883 = _1023;
            _887 = _1019;
        }
    }
    _889 = false;
    float _1025 = _883;
    int _1027 = _885;
    float _1029 = _887;
    float _1031 = _1025 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _1033 = _1025 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_1027);
    bool _1035 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _1037 = fma(_1029, (*spvDescriptorSet0.vp_c3)._m0[8].x, _1031);
    float _1039 = fma(_1029, (*spvDescriptorSet0.vp_c3)._m0[7].x, _1033);
    float _1041 = _1037 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _1043 = _1039 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _1045 = -_1041;
    float _1047 = _1045 + 1.0;
    out.m_27.x = _1043;
    out.m_27.y = _1047;
    bool _1049 = !_1035;
    float _1051 = _1025;
    float _1053 = as_type<float>(_1027);
    float _1073;
    float _1075;
    int _1077;
    if (!_1049)
    {
        float _1055 = _51 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1057 = _51 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1059 = _51 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _1061 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[18].x, _1055);
        float _1063 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1057);
        float _1065 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[21].x, _1059);
        float _1067 = _1061 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1069 = _1063 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _1071 = _1065 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _1073 = _1069;
        _1075 = _1067;
        _1077 = as_type<int>(_1071);
        _1079 = true;
    }
    else
    {
        int _1081 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1083 = _1081 != 0;
        if (!_1083)
        {
            _126 = _827;
        }
        float _1085 = _126;
        _1075 = _1085;
        if (!_1083)
        {
            _1051 = _825;
        }
        float _1087 = _1051;
        float _1089 = _1087;
        _1073 = _1087;
        if (!_1083)
        {
            _1053 = _837;
        }
        float _1091 = _1053;
        bool _1093 = !_1083;
        float _1095 = _1091;
        _1077 = as_type<int>(_1091);
        if (!_1093)
        {
            if (!_835)
            {
                _1089 = _827;
            }
            float _1097 = _1089;
            float _1099 = _1097;
            float _1101 = _1097;
            if (!_835)
            {
                _1095 = _825;
            }
            float _1103 = _1095;
            bool _1105 = !_835;
            float _1107 = _1103;
            int _1109 = as_type<int>(_1103);
            if (!_1105)
            {
                int _1111 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1113 = _1111 != 0;
                int _1115 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1117 = _1115 != 0;
                int _1119 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1121 = _1119 != 0;
                int _1123 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1125 = _1123 != 0;
                int _1127 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1129 = _1127 != 0;
                if (_1113)
                {
                    _1099 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1131 = _1099;
                float _1133 = _1131;
                if (_1113)
                {
                    _1107 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1135 = _1107;
                float _1137 = _1135;
                if (!_1113)
                {
                    _1133 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1139 = _1133;
                if (!_1113)
                {
                    _1137 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1141 = _1137;
                float _1143 = _1139 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1145 = _1141 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1125)
                {
                    float _1147 = _1143 * _827;
                    _861 = _1147;
                }
                float _1149 = _861;
                float _1151 = -_1143;
                float _1153 = _1151 + 1.0;
                float _1155 = _1149;
                if (_1129)
                {
                    float _1157 = _1145 * _825;
                    _863 = _1157;
                }
                float _1159 = _863;
                float _1161 = -_1145;
                float _1163 = _1161 + 1.0;
                int _1165 = as_type<int>(_1159);
                if (_1117)
                {
                    float _1167 = _1149 + _1153;
                    _1155 = _1167;
                }
                float _1169 = _1155;
                if (_1121)
                {
                    float _1171 = _1159 + _1163;
                    _1165 = as_type<int>(_1171);
                }
                int _1173 = _1165;
                _1109 = _1173;
                _1101 = _1169;
            }
            int _1175 = _1109;
            float _1177 = _1101;
            int _1179 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1181 = _1179 != 0;
            int _1183 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1185 = _1183 != 0;
            int _1187 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1189 = _1187 != 0;
            int _1191 = as_type<int>(_1177);
            int _1193 = _1175;
            _1077 = as_type<int>(_837);
            if (_1185)
            {
                float _1195 = -_1177;
                float _1197 = _1195 + 1.0;
                _1191 = as_type<int>(_1197);
            }
            int _1199 = _1191;
            if (_1189)
            {
                float _1201 = -as_type<float>(_1175);
                float _1203 = _1201 + 1.0;
                _1193 = as_type<int>(_1203);
            }
            int _1205 = _1193;
            bool _1207 = !_1181;
            float _1209 = _1207 ? as_type<float>(_1199) : as_type<float>(_1205);
            bool _1211 = !_1181;
            float _1213 = _1211 ? as_type<float>(_1205) : as_type<float>(_1199);
            _1073 = _1213;
            _1075 = _1209;
        }
    }
    _1079 = false;
    float _1215 = _1073;
    float _1217 = _1075;
    int _1219 = _1077;
    float _1221 = _1215 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1223 = _1215 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1225 = _839 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1227 = _841 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1229 = fma(_1217, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1221);
    float _1231 = fma(_1217, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1223);
    float _1233 = _843 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1235 = _845 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1237 = _1229 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    out.m_29.w = as_type<float>(_1219);
    float _1241 = -_1237;
    float _1243 = _1241 + 1.0;
    out.m_31.x = _1225;
    out.m_31.y = _1227;
    out.m_31.z = _1233;
    out.m_31.w = _1235;
    out.m_29.x = _1239;
    out.m_29.y = _1243;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1079 = false;
    bool _889 = false;
    bool _152 = false;
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
    float _45 = in.m_24.x;
    float _47 = in.m_24.y;
    float _49 = -_47;
    float _51 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _53 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _73 = _67 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _79 = _67 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].z, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].z, _85);
    float _95 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].z, _87);
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _99;
    out.gl_Position.y = _97;
    out.gl_Position.z = _101;
    out.gl_Position.w = _103;
    int _106 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _110 = _106 != 0;
    bool _112 = !_110;
    float _114 = _71;
    float _116 = _87;
    float _118 = _71;
    float _120 = _87;
    float _122 = _47;
    float _124 = _45;
    float _126 = _53;
    bool _134;
    float _136;
    float _138;
    float _140;
    float _142;
    float _144;
    float _146;
    float _148;
    float _150;
    if (!_112)
    {
        int _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _130 = _128 != 0;
        bool _132 = !_130;
        _134 = _130;
        if (!_132)
        {
            _136 = _47;
            _138 = _45;
            _140 = 1.0;
            _142 = 1.0;
            _144 = 255.0;
            _146 = 255.0;
            _148 = 255.0;
            _150 = 255.0;
            _152 = true;
        }
        else
        {
            float _154 = trunc(_45);
            int _156 = int(_154);
            float _158 = trunc(_47);
            int _160 = int(_158);
            int _162 = _160 << 1;
            int _164 = _162 + _156;
            int _166 = _164 << 4;
            bool _168 = _166 == 0;
            bool _170 = _166 == 16;
            bool _172 = _166 == 32;
            bool _174 = _166 == 48;
            float _176 = 0.0;
            float _178 = as_type<float>(_156);
            float _180 = as_type<float>(_160);
            _144 = 255.0;
            _146 = 255.0;
            _148 = 255.0;
            _150 = 255.0;
            if (_168)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _182 = _176;
            float _184 = _182;
            if (_168)
            {
                _114 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _186 = _114;
            float _188 = 0.0;
            float _190 = _186;
            if (_168)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _192 = _188;
            float _194 = _192;
            if (_168)
            {
                _178 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _196 = _178;
            float _198 = _196;
            if (_168)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _200 = _180;
            float _202 = _200;
            if (_168)
            {
                _116 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _204 = _116;
            float _206 = _204;
            if (_170)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _208 = _184;
            float _210 = _208;
            if (_170)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _212 = _190;
            float _214 = _212;
            if (_170)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _216 = _194;
            float _218 = _216;
            if (_170)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _220 = _198;
            float _222 = _220;
            if (_170)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _224 = _202;
            float _226 = _224;
            if (_170)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _228 = _206;
            float _230 = _228;
            if (_172)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _232 = _210;
            float _234 = _232;
            if (_172)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _236 = _214;
            float _238 = _236;
            if (_172)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _240 = _218;
            float _242 = _240;
            if (_172)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _244 = _222;
            float _246 = _244;
            if (_172)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _248 = _226;
            float _250 = _248;
            if (_172)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _252 = _230;
            float _254 = _252;
            if (_174)
            {
                _234 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _256 = _234;
            _138 = _256;
            if (_174)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _258 = _238;
            _136 = _258;
            if (_174)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _260 = _242;
            _140 = _260;
            if (_174)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _262 = _246;
            _124 = _262;
            if (_174)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _264 = _250;
            _122 = _264;
            if (_174)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _266 = _254;
            _142 = _266;
            _152 = true;
        }
    }
    else
    {
        int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _270 = _268 != 0;
        uint _273 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _275 = int(_273) & 15;
        bool _277 = !_270;
        _134 = _270;
        if (!_277)
        {
            uint _279 = min(uint(_275), 13u);
            float _281 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _283 = int(_279) << 2;
            uint _285 = uint(int(uint(_283) >> uint(2)));
            uint _287 = uint(int(uint(int(_285)) >> uint(2)));
            int _289 = int(_285) & 3;
            float _291 = (*spvDescriptorSet0.vp_c1)._m0[int(_287)][_289];
            float _293 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _295 = _281 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _297 = _281 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _299 = _293 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _301 = _293 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _303 = as_type<int>(_291) >> 31;
            bool _305 = as_type<int>(_291) == 1552;
            float _307 = _295;
            float _309 = _297;
            float _311 = _291;
            float _313 = as_type<float>(_303);
            float _315 = _301;
            if (!_305)
            {
                bool _317 = as_type<int>(_291) == 1600;
                _319 = _317;
                if (!_319)
                {
                    bool _321 = as_type<int>(_291) == 1664;
                    _323 = _321;
                    if (!_323)
                    {
                        bool _325 = as_type<int>(_291) == 1728;
                        _327 = _325;
                        if (!_327)
                        {
                            bool _329 = as_type<int>(_291) == 1808;
                            _331 = _329;
                            if (!_331)
                            {
                                bool _333 = as_type<int>(_291) == 1888;
                                _335 = _333;
                                if (!_335)
                                {
                                    bool _337 = as_type<int>(_291) == 1984;
                                    _339 = _337;
                                    if (!_339)
                                    {
                                        bool _341 = as_type<int>(_291) == 2064;
                                        _343 = _341;
                                        if (!_343)
                                        {
                                            bool _345 = as_type<int>(_291) == 2160;
                                            _347 = _345;
                                            if (!_347)
                                            {
                                                bool _349 = as_type<int>(_291) == 2224;
                                                _351 = _349;
                                                if (!_351)
                                                {
                                                    bool _353 = as_type<int>(_291) == 2304;
                                                    _355 = _353;
                                                    if (!_355)
                                                    {
                                                        bool _357 = as_type<int>(_291) == 2368;
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
                                                            float _363 = _295 * _45;
                                                            float _365 = _299 * _47;
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
                                                            float _371 = -_297;
                                                            float _373 = _371 + 1.0;
                                                            float _375 = _299 * _47;
                                                            float _377 = fma(_297, _45, _373);
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
                                                            float _379 = -_301;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _295 * _45;
                                                            float _385 = fma(_301, _47, _381);
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
                                                            float _387 = -_297;
                                                            float _389 = _387 + 1.0;
                                                            float _391 = -_301;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = fma(_297, _45, _389);
                                                            float _397 = fma(_301, _47, _393);
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
                                                            float _399 = -_299;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = -_301;
                                                            float _405 = _403 + _401;
                                                            float _407 = _295 * _45;
                                                            float _409 = fma(_405, _47, _299);
                                                            _367 = _409;
                                                            _369 = _407;
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
                                                            float _411 = -_299;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = -_297;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = -_301;
                                                            float _421 = _419 + _413;
                                                            float _423 = fma(_297, _45, _417);
                                                            float _425 = fma(_421, _47, _299);
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
                                                            float _427 = -_295;
                                                            float _429 = _427 + 1.0;
                                                            float _431 = -_297;
                                                            float _433 = _431 + _429;
                                                            float _435 = _299 * _47;
                                                            float _437 = fma(_433, _45, _295);
                                                            _367 = _435;
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
                                                            float _439 = -_295;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_301;
                                                            float _445 = _443 + 1.0;
                                                            float _447 = -_297;
                                                            float _449 = _447 + _441;
                                                            float _451 = fma(_301, _47, _445);
                                                            float _453 = fma(_449, _45, _295);
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
                                                            float _455 = -_297;
                                                            float _457 = _455 + 1.0;
                                                            float _459 = _299 * _47;
                                                            float _461 = _457 * _45;
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
                                                            float _463 = -_297;
                                                            float _465 = _463 + 1.0;
                                                            float _467 = -_301;
                                                            float _469 = _467 + 1.0;
                                                            float _471 = fma(_297, _45, _465);
                                                            float _473 = _469 * _47;
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
                                                            float _475 = -_299;
                                                            float _477 = _475 + 1.0;
                                                            float _479 = _295 * _45;
                                                            float _481 = fma(_477, _47, _299);
                                                            _367 = _481;
                                                            _369 = _479;
                                                        }
                                                    }
                                                    if ((false || _361) || _359)
                                                    {
                                                        if ((!_361) || _359)
                                                        {
                                                            _359 = false;
                                                            float _483 = -_295;
                                                            float _485 = _483 + 1.0;
                                                            float _487 = -_301;
                                                            float _489 = _487 + 1.0;
                                                            float _491 = fma(_485, _45, _295);
                                                            float _493 = fma(_301, _47, _489);
                                                            _367 = _493;
                                                            _369 = _491;
                                                        }
                                                        if (false || _361)
                                                        {
                                                            _361 = false;
                                                            bool _495 = _275 != 12;
                                                            if (!_495)
                                                            {
                                                                float _497 = -_299;
                                                                float _499 = _497 + 1.0;
                                                                _307 = _499;
                                                            }
                                                            float _501 = _307;
                                                            if (!_495)
                                                            {
                                                                float _503 = -_297;
                                                                float _505 = _503 + 1.0;
                                                                _309 = _505;
                                                            }
                                                            float _507 = _309;
                                                            if (_495)
                                                            {
                                                                _311 = 0.0;
                                                                _313 = 0.0;
                                                            }
                                                            float _509 = _311;
                                                            float _511 = _313;
                                                            float _513 = _511;
                                                            _367 = _509;
                                                            if (!_495)
                                                            {
                                                                float _515 = -_301;
                                                                float _517 = _515 + _501;
                                                                _315 = _517;
                                                            }
                                                            float _519 = _315;
                                                            if (!_495)
                                                            {
                                                                float _521 = _45 * _507;
                                                                _513 = _521;
                                                            }
                                                            float _523 = _513;
                                                            _369 = _523;
                                                            if (!_495)
                                                            {
                                                                float _525 = _47 * _519;
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
            float _567 = _551 * _529;
            float _569 = _555 * _529;
            float _571 = _559 * _529;
            float _573 = _565 * _529;
            float _575 = -_529;
            float _577 = _575 + 1.0;
            float _579 = fma(_577, _553, _567);
            float _581 = fma(_577, _557, _569);
            float _583 = fma(_577, _561, _571);
            float _585 = fma(_577, _563, _573);
            _136 = _47;
            _138 = _45;
            _140 = 1.0;
            _142 = 1.0;
            _144 = _579;
            _146 = _581;
            _148 = _583;
            _150 = _585;
            _152 = true;
        }
        else
        {
            float _587 = trunc(_45);
            int _589 = int(_587);
            bool _591 = _275 != 13;
            float _593 = trunc(_47);
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
                _118 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _617 = _118;
            float _619 = 0.0;
            float _621 = _617;
            if (_603)
            {
                _619 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _623 = _619;
            float _625 = _623;
            if (_603)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _627 = _120;
            float _629 = 0.0;
            float _631 = _627;
            if (_603)
            {
                _629 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _633 = _629;
            float _635 = 0.0;
            float _637 = _633;
            if (_603)
            {
                _635 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _639 = _635;
            float _641 = _639;
            if (_605)
            {
                _615 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _643 = _615;
            float _645 = _643;
            if (_605)
            {
                _621 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _647 = _621;
            float _649 = _647;
            if (_605)
            {
                _625 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _651 = _625;
            float _653 = _651;
            if (_605)
            {
                _631 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _655 = _631;
            float _657 = _655;
            if (_605)
            {
                _637 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _659 = _637;
            float _661 = _659;
            if (_605)
            {
                _641 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _663 = _641;
            float _665 = _663;
            if (_607)
            {
                _645 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _667 = _645;
            float _669 = _667;
            if (_607)
            {
                _649 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _671 = _649;
            float _673 = _671;
            if (_607)
            {
                _653 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _675 = _653;
            float _677 = _675;
            if (_607)
            {
                _657 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _679 = _657;
            float _681 = _679;
            if (_607)
            {
                _661 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _683 = _661;
            float _685 = _683;
            if (_607)
            {
                _665 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _687 = _665;
            float _689 = _687;
            if (_609)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _691 = _669;
            _138 = _691;
            if (_609)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _693 = _673;
            _136 = _693;
            if (_609)
            {
                _677 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _695 = _677;
            _140 = _695;
            if (_609)
            {
                _681 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _697 = _681;
            if (_609)
            {
                _685 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _699 = _685;
            if (_609)
            {
                _689 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _701 = _689;
            if (!_591)
            {
                float _703 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _705 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _707 = _703 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _709 = -_707;
                float _711 = _709 + 1.0;
                float _713 = _705 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _715 = -_703;
                float _717 = fma(_715, (*spvDescriptorSet0.vp_c3)._m0[26].w, _711);
                float _719 = -_713;
                float _721 = _719 + 1.0;
                float _723 = fma(_717, _47, _707);
                float _725 = -_705;
                float _727 = fma(_725, (*spvDescriptorSet0.vp_c3)._m0[26].y, _721);
                float _729 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _731 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _733 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _735 = fma(_727, _45, _713);
                float _737 = -_723;
                float _739 = _737 + 1.0;
                float _741 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _743 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _745 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _747 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _749 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _751 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].x, _729);
                float _753 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].y, _731);
                float _755 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].z, _733);
                float _757 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].w, _741);
                float _759 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].x, _743);
                float _761 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].y, _745);
                float _763 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].z, _747);
                float _765 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].w, _749);
                float _767 = _735 * _751;
                float _769 = -_735;
                float _771 = _769 + 1.0;
                float _773 = _735 * _753;
                float _775 = _735 * _755;
                float _777 = _735 * _757;
                float _779 = fma(_771, _759, _767);
                float _781 = fma(_771, _761, _773);
                float _783 = fma(_771, _763, _775);
                float _785 = fma(_771, _765, _777);
                _122 = _699;
                _124 = _697;
                _142 = _701;
                _144 = _779;
                _146 = _781;
                _148 = _783;
                _150 = _785;
                _152 = true;
            }
            else
            {
                int _787 = _599 << 4;
                int _789 = _787 + 464;
                uint _791 = uint(int(uint(_789) >> uint(2)));
                uint _793 = uint(int(uint(int(_791)) >> uint(2)));
                int _795 = int(_791) & 3;
                float _797 = (*spvDescriptorSet0.vp_c3)._m0[int(_793)][_795];
                int _799 = int(_791) + 1;
                uint _801 = uint(int(uint(_799) >> uint(2)));
                int _803 = _799 & 3;
                float _805 = (*spvDescriptorSet0.vp_c3)._m0[int(_801)][_803];
                int _807 = _789 + 8;
                uint _809 = uint(int(uint(_807) >> uint(2)));
                uint _811 = uint(int(uint(int(_809)) >> uint(2)));
                int _813 = int(_809) & 3;
                float _815 = (*spvDescriptorSet0.vp_c3)._m0[int(_811)][_813];
                int _817 = int(_809) + 1;
                uint _819 = uint(int(uint(_817) >> uint(2)));
                int _821 = _817 & 3;
                float _823 = (*spvDescriptorSet0.vp_c3)._m0[int(_819)][_821];
                _122 = _699;
                _124 = _697;
                _142 = _701;
                _144 = _797;
                _146 = _805;
                _148 = _815;
                _150 = _823;
            }
        }
    }
    _152 = false;
    float _825 = _122;
    float _827 = _124;
    float _829 = _136;
    float _831 = _138;
    float _833 = _140;
    bool _835 = _134;
    float _837 = _142;
    float _839 = _144;
    float _841 = _146;
    float _843 = _148;
    float _845 = _150;
    bool _847 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _849 = !_847;
    float _851 = _829;
    float _853 = _825;
    float _855 = _827;
    float _857 = _831;
    float _859 = _829;
    float _861 = _827;
    float _863 = _825;
    float _883;
    int _885;
    float _887;
    if (!_849)
    {
        float _865 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _867 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _869 = _51 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _871 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _865);
        float _873 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _867);
        float _875 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[17].x, _869);
        float _877 = _871 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _879 = _873 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _881 = _875 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _883 = _879;
        _885 = as_type<int>(_881);
        _887 = _877;
        _889 = true;
    }
    else
    {
        int _891 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _893 = _891 != 0;
        if (!_893)
        {
            _851 = _831;
        }
        float _895 = _851;
        _887 = _895;
        if (!_893)
        {
            _853 = _829;
        }
        float _897 = _853;
        float _899 = _897;
        _883 = _897;
        if (!_893)
        {
            _855 = _833;
        }
        float _901 = _855;
        bool _903 = !_893;
        float _905 = _901;
        _885 = as_type<int>(_901);
        if (!_903)
        {
            if (!_835)
            {
                _899 = _831;
            }
            float _907 = _899;
            float _909 = _907;
            float _911 = _907;
            if (!_835)
            {
                _905 = _829;
            }
            float _913 = _905;
            bool _915 = !_835;
            float _917 = _913;
            int _919 = as_type<int>(_913);
            if (!_915)
            {
                int _921 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _923 = _921 != 0;
                int _925 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _927 = _925 != 0;
                int _929 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _931 = _929 != 0;
                int _933 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _935 = _933 != 0;
                int _937 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _939 = _937 != 0;
                if (_923)
                {
                    _909 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _941 = _909;
                float _943 = _941;
                if (_923)
                {
                    _917 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _945 = _917;
                float _947 = _945;
                if (!_923)
                {
                    _943 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _949 = _943;
                if (!_923)
                {
                    _947 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _951 = _947;
                float _953 = _949 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _955 = _951 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_935)
                {
                    float _957 = _953 * _831;
                    _857 = _957;
                }
                float _959 = _857;
                float _961 = -_953;
                float _963 = _961 + 1.0;
                float _965 = _959;
                if (_939)
                {
                    float _967 = _955 * _829;
                    _859 = _967;
                }
                float _969 = _859;
                float _971 = -_955;
                float _973 = _971 + 1.0;
                int _975 = as_type<int>(_969);
                if (_927)
                {
                    float _977 = _959 + _963;
                    _965 = _977;
                }
                float _979 = _965;
                if (_931)
                {
                    float _981 = _969 + _973;
                    _975 = as_type<int>(_981);
                }
                int _983 = _975;
                _919 = _983;
                _911 = _979;
            }
            int _985 = _919;
            float _987 = _911;
            int _989 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _991 = _989 != 0;
            int _993 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _995 = _993 != 0;
            int _997 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _999 = _997 != 0;
            int _1001 = as_type<int>(_987);
            int _1003 = _985;
            _885 = as_type<int>(_833);
            if (_995)
            {
                float _1005 = -_987;
                float _1007 = _1005 + 1.0;
                _1001 = as_type<int>(_1007);
            }
            int _1009 = _1001;
            if (_999)
            {
                float _1011 = -as_type<float>(_985);
                float _1013 = _1011 + 1.0;
                _1003 = as_type<int>(_1013);
            }
            int _1015 = _1003;
            bool _1017 = !_991;
            float _1019 = _1017 ? as_type<float>(_1009) : as_type<float>(_1015);
            bool _1021 = !_991;
            float _1023 = _1021 ? as_type<float>(_1015) : as_type<float>(_1009);
            _883 = _1023;
            _887 = _1019;
        }
    }
    _889 = false;
    float _1025 = _883;
    int _1027 = _885;
    float _1029 = _887;
    float _1031 = _1025 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _1033 = _1025 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_1027);
    bool _1035 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _1037 = fma(_1029, (*spvDescriptorSet0.vp_c3)._m0[8].x, _1031);
    float _1039 = fma(_1029, (*spvDescriptorSet0.vp_c3)._m0[7].x, _1033);
    float _1041 = _1037 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _1043 = _1039 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _1045 = -_1041;
    float _1047 = _1045 + 1.0;
    out.m_27.x = _1043;
    out.m_27.y = _1047;
    bool _1049 = !_1035;
    float _1051 = _1025;
    float _1053 = as_type<float>(_1027);
    float _1073;
    float _1075;
    int _1077;
    if (!_1049)
    {
        float _1055 = _51 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1057 = _51 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1059 = _51 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _1061 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[18].x, _1055);
        float _1063 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1057);
        float _1065 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[21].x, _1059);
        float _1067 = _1061 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1069 = _1063 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _1071 = _1065 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _1073 = _1069;
        _1075 = _1067;
        _1077 = as_type<int>(_1071);
        _1079 = true;
    }
    else
    {
        int _1081 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1083 = _1081 != 0;
        if (!_1083)
        {
            _126 = _827;
        }
        float _1085 = _126;
        _1075 = _1085;
        if (!_1083)
        {
            _1051 = _825;
        }
        float _1087 = _1051;
        float _1089 = _1087;
        _1073 = _1087;
        if (!_1083)
        {
            _1053 = _837;
        }
        float _1091 = _1053;
        bool _1093 = !_1083;
        float _1095 = _1091;
        _1077 = as_type<int>(_1091);
        if (!_1093)
        {
            if (!_835)
            {
                _1089 = _827;
            }
            float _1097 = _1089;
            float _1099 = _1097;
            float _1101 = _1097;
            if (!_835)
            {
                _1095 = _825;
            }
            float _1103 = _1095;
            bool _1105 = !_835;
            float _1107 = _1103;
            int _1109 = as_type<int>(_1103);
            if (!_1105)
            {
                int _1111 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1113 = _1111 != 0;
                int _1115 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1117 = _1115 != 0;
                int _1119 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1121 = _1119 != 0;
                int _1123 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1125 = _1123 != 0;
                int _1127 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1129 = _1127 != 0;
                if (_1113)
                {
                    _1099 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1131 = _1099;
                float _1133 = _1131;
                if (_1113)
                {
                    _1107 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1135 = _1107;
                float _1137 = _1135;
                if (!_1113)
                {
                    _1133 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1139 = _1133;
                if (!_1113)
                {
                    _1137 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1141 = _1137;
                float _1143 = _1139 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1145 = _1141 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1125)
                {
                    float _1147 = _1143 * _827;
                    _861 = _1147;
                }
                float _1149 = _861;
                float _1151 = -_1143;
                float _1153 = _1151 + 1.0;
                float _1155 = _1149;
                if (_1129)
                {
                    float _1157 = _1145 * _825;
                    _863 = _1157;
                }
                float _1159 = _863;
                float _1161 = -_1145;
                float _1163 = _1161 + 1.0;
                int _1165 = as_type<int>(_1159);
                if (_1117)
                {
                    float _1167 = _1149 + _1153;
                    _1155 = _1167;
                }
                float _1169 = _1155;
                if (_1121)
                {
                    float _1171 = _1159 + _1163;
                    _1165 = as_type<int>(_1171);
                }
                int _1173 = _1165;
                _1109 = _1173;
                _1101 = _1169;
            }
            int _1175 = _1109;
            float _1177 = _1101;
            int _1179 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1181 = _1179 != 0;
            int _1183 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1185 = _1183 != 0;
            int _1187 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1189 = _1187 != 0;
            int _1191 = as_type<int>(_1177);
            int _1193 = _1175;
            _1077 = as_type<int>(_837);
            if (_1185)
            {
                float _1195 = -_1177;
                float _1197 = _1195 + 1.0;
                _1191 = as_type<int>(_1197);
            }
            int _1199 = _1191;
            if (_1189)
            {
                float _1201 = -as_type<float>(_1175);
                float _1203 = _1201 + 1.0;
                _1193 = as_type<int>(_1203);
            }
            int _1205 = _1193;
            bool _1207 = !_1181;
            float _1209 = _1207 ? as_type<float>(_1199) : as_type<float>(_1205);
            bool _1211 = !_1181;
            float _1213 = _1211 ? as_type<float>(_1205) : as_type<float>(_1199);
            _1073 = _1213;
            _1075 = _1209;
        }
    }
    _1079 = false;
    float _1215 = _1073;
    float _1217 = _1075;
    int _1219 = _1077;
    float _1221 = _1215 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1223 = _1215 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1225 = _839 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1227 = _841 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1229 = fma(_1217, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1221);
    float _1231 = fma(_1217, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1223);
    float _1233 = _843 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1235 = _845 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1237 = _1229 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    out.m_29.w = as_type<float>(_1219);
    float _1241 = -_1237;
    float _1243 = _1241 + 1.0;
    out.m_31.x = _1225;
    out.m_31.y = _1227;
    out.m_31.z = _1233;
    out.m_31.w = _1235;
    out.m_29.x = _1239;
    out.m_29.y = _1243;
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
    bool _1079 = false;
    bool _889 = false;
    bool _152 = false;
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
    float _45 = in.m_24.x;
    float _47 = in.m_24.y;
    float _49 = -_47;
    float _51 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _53 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _73 = _67 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _79 = _67 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].z, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].z, _85);
    float _95 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].z, _87);
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _99;
    out.gl_Position.y = _97;
    out.gl_Position.z = _101;
    out.gl_Position.w = _103;
    int _106 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _110 = _106 != 0;
    bool _112 = !_110;
    float _114 = _71;
    float _116 = _87;
    float _118 = _71;
    float _120 = _87;
    float _122 = _47;
    float _124 = _45;
    float _126 = _53;
    bool _134;
    float _136;
    float _138;
    float _140;
    float _142;
    float _144;
    float _146;
    float _148;
    float _150;
    if (!_112)
    {
        int _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _130 = _128 != 0;
        bool _132 = !_130;
        _134 = _130;
        if (!_132)
        {
            _136 = _47;
            _138 = _45;
            _140 = 1.0;
            _142 = 1.0;
            _144 = 255.0;
            _146 = 255.0;
            _148 = 255.0;
            _150 = 255.0;
            _152 = true;
        }
        else
        {
            float _154 = trunc(_45);
            int _156 = int(_154);
            float _158 = trunc(_47);
            int _160 = int(_158);
            int _162 = _160 << 1;
            int _164 = _162 + _156;
            int _166 = _164 << 4;
            bool _168 = _166 == 0;
            bool _170 = _166 == 16;
            bool _172 = _166 == 32;
            bool _174 = _166 == 48;
            float _176 = 0.0;
            float _178 = as_type<float>(_156);
            float _180 = as_type<float>(_160);
            _144 = 255.0;
            _146 = 255.0;
            _148 = 255.0;
            _150 = 255.0;
            if (_168)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _182 = _176;
            float _184 = _182;
            if (_168)
            {
                _114 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _186 = _114;
            float _188 = 0.0;
            float _190 = _186;
            if (_168)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _192 = _188;
            float _194 = _192;
            if (_168)
            {
                _178 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _196 = _178;
            float _198 = _196;
            if (_168)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _200 = _180;
            float _202 = _200;
            if (_168)
            {
                _116 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _204 = _116;
            float _206 = _204;
            if (_170)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _208 = _184;
            float _210 = _208;
            if (_170)
            {
                _190 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _212 = _190;
            float _214 = _212;
            if (_170)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _216 = _194;
            float _218 = _216;
            if (_170)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _220 = _198;
            float _222 = _220;
            if (_170)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _224 = _202;
            float _226 = _224;
            if (_170)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _228 = _206;
            float _230 = _228;
            if (_172)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _232 = _210;
            float _234 = _232;
            if (_172)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _236 = _214;
            float _238 = _236;
            if (_172)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _240 = _218;
            float _242 = _240;
            if (_172)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _244 = _222;
            float _246 = _244;
            if (_172)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _248 = _226;
            float _250 = _248;
            if (_172)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _252 = _230;
            float _254 = _252;
            if (_174)
            {
                _234 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _256 = _234;
            _138 = _256;
            if (_174)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _258 = _238;
            _136 = _258;
            if (_174)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _260 = _242;
            _140 = _260;
            if (_174)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _262 = _246;
            _124 = _262;
            if (_174)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _264 = _250;
            _122 = _264;
            if (_174)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _266 = _254;
            _142 = _266;
            _152 = true;
        }
    }
    else
    {
        int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _270 = _268 != 0;
        uint _273 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _275 = int(_273) & 15;
        bool _277 = !_270;
        _134 = _270;
        if (!_277)
        {
            uint _279 = min(uint(_275), 13u);
            float _281 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _283 = int(_279) << 2;
            uint _285 = uint(int(uint(_283) >> uint(2)));
            uint _287 = uint(int(uint(int(_285)) >> uint(2)));
            int _289 = int(_285) & 3;
            float _291 = (*spvDescriptorSet0.vp_c1)._m0[int(_287)][_289];
            float _293 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _295 = _281 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _297 = _281 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _299 = _293 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _301 = _293 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _303 = as_type<int>(_291) >> 31;
            bool _305 = as_type<int>(_291) == 1552;
            float _307 = _295;
            float _309 = _297;
            float _311 = _291;
            float _313 = as_type<float>(_303);
            float _315 = _301;
            if (!_305)
            {
                bool _317 = as_type<int>(_291) == 1600;
                _319 = _317;
                if (!_319)
                {
                    bool _321 = as_type<int>(_291) == 1664;
                    _323 = _321;
                    if (!_323)
                    {
                        bool _325 = as_type<int>(_291) == 1728;
                        _327 = _325;
                        if (!_327)
                        {
                            bool _329 = as_type<int>(_291) == 1808;
                            _331 = _329;
                            if (!_331)
                            {
                                bool _333 = as_type<int>(_291) == 1888;
                                _335 = _333;
                                if (!_335)
                                {
                                    bool _337 = as_type<int>(_291) == 1984;
                                    _339 = _337;
                                    if (!_339)
                                    {
                                        bool _341 = as_type<int>(_291) == 2064;
                                        _343 = _341;
                                        if (!_343)
                                        {
                                            bool _345 = as_type<int>(_291) == 2160;
                                            _347 = _345;
                                            if (!_347)
                                            {
                                                bool _349 = as_type<int>(_291) == 2224;
                                                _351 = _349;
                                                if (!_351)
                                                {
                                                    bool _353 = as_type<int>(_291) == 2304;
                                                    _355 = _353;
                                                    if (!_355)
                                                    {
                                                        bool _357 = as_type<int>(_291) == 2368;
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
                                                            float _363 = _295 * _45;
                                                            float _365 = _299 * _47;
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
                                                            float _371 = -_297;
                                                            float _373 = _371 + 1.0;
                                                            float _375 = _299 * _47;
                                                            float _377 = fma(_297, _45, _373);
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
                                                            float _379 = -_301;
                                                            float _381 = _379 + 1.0;
                                                            float _383 = _295 * _45;
                                                            float _385 = fma(_301, _47, _381);
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
                                                            float _387 = -_297;
                                                            float _389 = _387 + 1.0;
                                                            float _391 = -_301;
                                                            float _393 = _391 + 1.0;
                                                            float _395 = fma(_297, _45, _389);
                                                            float _397 = fma(_301, _47, _393);
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
                                                            float _399 = -_299;
                                                            float _401 = _399 + 1.0;
                                                            float _403 = -_301;
                                                            float _405 = _403 + _401;
                                                            float _407 = _295 * _45;
                                                            float _409 = fma(_405, _47, _299);
                                                            _367 = _409;
                                                            _369 = _407;
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
                                                            float _411 = -_299;
                                                            float _413 = _411 + 1.0;
                                                            float _415 = -_297;
                                                            float _417 = _415 + 1.0;
                                                            float _419 = -_301;
                                                            float _421 = _419 + _413;
                                                            float _423 = fma(_297, _45, _417);
                                                            float _425 = fma(_421, _47, _299);
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
                                                            float _427 = -_295;
                                                            float _429 = _427 + 1.0;
                                                            float _431 = -_297;
                                                            float _433 = _431 + _429;
                                                            float _435 = _299 * _47;
                                                            float _437 = fma(_433, _45, _295);
                                                            _367 = _435;
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
                                                            float _439 = -_295;
                                                            float _441 = _439 + 1.0;
                                                            float _443 = -_301;
                                                            float _445 = _443 + 1.0;
                                                            float _447 = -_297;
                                                            float _449 = _447 + _441;
                                                            float _451 = fma(_301, _47, _445);
                                                            float _453 = fma(_449, _45, _295);
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
                                                            float _455 = -_297;
                                                            float _457 = _455 + 1.0;
                                                            float _459 = _299 * _47;
                                                            float _461 = _457 * _45;
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
                                                            float _463 = -_297;
                                                            float _465 = _463 + 1.0;
                                                            float _467 = -_301;
                                                            float _469 = _467 + 1.0;
                                                            float _471 = fma(_297, _45, _465);
                                                            float _473 = _469 * _47;
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
                                                            float _475 = -_299;
                                                            float _477 = _475 + 1.0;
                                                            float _479 = _295 * _45;
                                                            float _481 = fma(_477, _47, _299);
                                                            _367 = _481;
                                                            _369 = _479;
                                                        }
                                                    }
                                                    if ((false || _361) || _359)
                                                    {
                                                        if ((!_361) || _359)
                                                        {
                                                            _359 = false;
                                                            float _483 = -_295;
                                                            float _485 = _483 + 1.0;
                                                            float _487 = -_301;
                                                            float _489 = _487 + 1.0;
                                                            float _491 = fma(_485, _45, _295);
                                                            float _493 = fma(_301, _47, _489);
                                                            _367 = _493;
                                                            _369 = _491;
                                                        }
                                                        if (false || _361)
                                                        {
                                                            _361 = false;
                                                            bool _495 = _275 != 12;
                                                            if (!_495)
                                                            {
                                                                float _497 = -_299;
                                                                float _499 = _497 + 1.0;
                                                                _307 = _499;
                                                            }
                                                            float _501 = _307;
                                                            if (!_495)
                                                            {
                                                                float _503 = -_297;
                                                                float _505 = _503 + 1.0;
                                                                _309 = _505;
                                                            }
                                                            float _507 = _309;
                                                            if (_495)
                                                            {
                                                                _311 = 0.0;
                                                                _313 = 0.0;
                                                            }
                                                            float _509 = _311;
                                                            float _511 = _313;
                                                            float _513 = _511;
                                                            _367 = _509;
                                                            if (!_495)
                                                            {
                                                                float _515 = -_301;
                                                                float _517 = _515 + _501;
                                                                _315 = _517;
                                                            }
                                                            float _519 = _315;
                                                            if (!_495)
                                                            {
                                                                float _521 = _45 * _507;
                                                                _513 = _521;
                                                            }
                                                            float _523 = _513;
                                                            _369 = _523;
                                                            if (!_495)
                                                            {
                                                                float _525 = _47 * _519;
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
            float _567 = _551 * _529;
            float _569 = _555 * _529;
            float _571 = _559 * _529;
            float _573 = _565 * _529;
            float _575 = -_529;
            float _577 = _575 + 1.0;
            float _579 = fma(_577, _553, _567);
            float _581 = fma(_577, _557, _569);
            float _583 = fma(_577, _561, _571);
            float _585 = fma(_577, _563, _573);
            _136 = _47;
            _138 = _45;
            _140 = 1.0;
            _142 = 1.0;
            _144 = _579;
            _146 = _581;
            _148 = _583;
            _150 = _585;
            _152 = true;
        }
        else
        {
            float _587 = trunc(_45);
            int _589 = int(_587);
            bool _591 = _275 != 13;
            float _593 = trunc(_47);
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
                _118 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _617 = _118;
            float _619 = 0.0;
            float _621 = _617;
            if (_603)
            {
                _619 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _623 = _619;
            float _625 = _623;
            if (_603)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _627 = _120;
            float _629 = 0.0;
            float _631 = _627;
            if (_603)
            {
                _629 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _633 = _629;
            float _635 = 0.0;
            float _637 = _633;
            if (_603)
            {
                _635 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _639 = _635;
            float _641 = _639;
            if (_605)
            {
                _615 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _643 = _615;
            float _645 = _643;
            if (_605)
            {
                _621 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _647 = _621;
            float _649 = _647;
            if (_605)
            {
                _625 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _651 = _625;
            float _653 = _651;
            if (_605)
            {
                _631 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _655 = _631;
            float _657 = _655;
            if (_605)
            {
                _637 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _659 = _637;
            float _661 = _659;
            if (_605)
            {
                _641 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _663 = _641;
            float _665 = _663;
            if (_607)
            {
                _645 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _667 = _645;
            float _669 = _667;
            if (_607)
            {
                _649 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _671 = _649;
            float _673 = _671;
            if (_607)
            {
                _653 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _675 = _653;
            float _677 = _675;
            if (_607)
            {
                _657 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _679 = _657;
            float _681 = _679;
            if (_607)
            {
                _661 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _683 = _661;
            float _685 = _683;
            if (_607)
            {
                _665 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _687 = _665;
            float _689 = _687;
            if (_609)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _691 = _669;
            _138 = _691;
            if (_609)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _693 = _673;
            _136 = _693;
            if (_609)
            {
                _677 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _695 = _677;
            _140 = _695;
            if (_609)
            {
                _681 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _697 = _681;
            if (_609)
            {
                _685 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _699 = _685;
            if (_609)
            {
                _689 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _701 = _689;
            if (!_591)
            {
                float _703 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _705 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _707 = _703 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _709 = -_707;
                float _711 = _709 + 1.0;
                float _713 = _705 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _715 = -_703;
                float _717 = fma(_715, (*spvDescriptorSet0.vp_c3)._m0[26].w, _711);
                float _719 = -_713;
                float _721 = _719 + 1.0;
                float _723 = fma(_717, _47, _707);
                float _725 = -_705;
                float _727 = fma(_725, (*spvDescriptorSet0.vp_c3)._m0[26].y, _721);
                float _729 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _731 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _733 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _735 = fma(_727, _45, _713);
                float _737 = -_723;
                float _739 = _737 + 1.0;
                float _741 = _723 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _743 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _745 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _747 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _749 = _723 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _751 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].x, _729);
                float _753 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].y, _731);
                float _755 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].z, _733);
                float _757 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[30].w, _741);
                float _759 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].x, _743);
                float _761 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].y, _745);
                float _763 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].z, _747);
                float _765 = fma(_739, (*spvDescriptorSet0.vp_c3)._m0[29].w, _749);
                float _767 = _735 * _751;
                float _769 = -_735;
                float _771 = _769 + 1.0;
                float _773 = _735 * _753;
                float _775 = _735 * _755;
                float _777 = _735 * _757;
                float _779 = fma(_771, _759, _767);
                float _781 = fma(_771, _761, _773);
                float _783 = fma(_771, _763, _775);
                float _785 = fma(_771, _765, _777);
                _122 = _699;
                _124 = _697;
                _142 = _701;
                _144 = _779;
                _146 = _781;
                _148 = _783;
                _150 = _785;
                _152 = true;
            }
            else
            {
                int _787 = _599 << 4;
                int _789 = _787 + 464;
                uint _791 = uint(int(uint(_789) >> uint(2)));
                uint _793 = uint(int(uint(int(_791)) >> uint(2)));
                int _795 = int(_791) & 3;
                float _797 = (*spvDescriptorSet0.vp_c3)._m0[int(_793)][_795];
                int _799 = int(_791) + 1;
                uint _801 = uint(int(uint(_799) >> uint(2)));
                int _803 = _799 & 3;
                float _805 = (*spvDescriptorSet0.vp_c3)._m0[int(_801)][_803];
                int _807 = _789 + 8;
                uint _809 = uint(int(uint(_807) >> uint(2)));
                uint _811 = uint(int(uint(int(_809)) >> uint(2)));
                int _813 = int(_809) & 3;
                float _815 = (*spvDescriptorSet0.vp_c3)._m0[int(_811)][_813];
                int _817 = int(_809) + 1;
                uint _819 = uint(int(uint(_817) >> uint(2)));
                int _821 = _817 & 3;
                float _823 = (*spvDescriptorSet0.vp_c3)._m0[int(_819)][_821];
                _122 = _699;
                _124 = _697;
                _142 = _701;
                _144 = _797;
                _146 = _805;
                _148 = _815;
                _150 = _823;
            }
        }
    }
    _152 = false;
    float _825 = _122;
    float _827 = _124;
    float _829 = _136;
    float _831 = _138;
    float _833 = _140;
    bool _835 = _134;
    float _837 = _142;
    float _839 = _144;
    float _841 = _146;
    float _843 = _148;
    float _845 = _150;
    bool _847 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _849 = !_847;
    float _851 = _829;
    float _853 = _825;
    float _855 = _827;
    float _857 = _831;
    float _859 = _829;
    float _861 = _827;
    float _863 = _825;
    float _883;
    int _885;
    float _887;
    if (!_849)
    {
        float _865 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _867 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _869 = _51 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _871 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _865);
        float _873 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _867);
        float _875 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[17].x, _869);
        float _877 = _871 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _879 = _873 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _881 = _875 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _883 = _879;
        _885 = as_type<int>(_881);
        _887 = _877;
        _889 = true;
    }
    else
    {
        int _891 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _893 = _891 != 0;
        if (!_893)
        {
            _851 = _831;
        }
        float _895 = _851;
        _887 = _895;
        if (!_893)
        {
            _853 = _829;
        }
        float _897 = _853;
        float _899 = _897;
        _883 = _897;
        if (!_893)
        {
            _855 = _833;
        }
        float _901 = _855;
        bool _903 = !_893;
        float _905 = _901;
        _885 = as_type<int>(_901);
        if (!_903)
        {
            if (!_835)
            {
                _899 = _831;
            }
            float _907 = _899;
            float _909 = _907;
            float _911 = _907;
            if (!_835)
            {
                _905 = _829;
            }
            float _913 = _905;
            bool _915 = !_835;
            float _917 = _913;
            int _919 = as_type<int>(_913);
            if (!_915)
            {
                int _921 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _923 = _921 != 0;
                int _925 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _927 = _925 != 0;
                int _929 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _931 = _929 != 0;
                int _933 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _935 = _933 != 0;
                int _937 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _939 = _937 != 0;
                if (_923)
                {
                    _909 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _941 = _909;
                float _943 = _941;
                if (_923)
                {
                    _917 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _945 = _917;
                float _947 = _945;
                if (!_923)
                {
                    _943 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _949 = _943;
                if (!_923)
                {
                    _947 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _951 = _947;
                float _953 = _949 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _955 = _951 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_935)
                {
                    float _957 = _953 * _831;
                    _857 = _957;
                }
                float _959 = _857;
                float _961 = -_953;
                float _963 = _961 + 1.0;
                float _965 = _959;
                if (_939)
                {
                    float _967 = _955 * _829;
                    _859 = _967;
                }
                float _969 = _859;
                float _971 = -_955;
                float _973 = _971 + 1.0;
                int _975 = as_type<int>(_969);
                if (_927)
                {
                    float _977 = _959 + _963;
                    _965 = _977;
                }
                float _979 = _965;
                if (_931)
                {
                    float _981 = _969 + _973;
                    _975 = as_type<int>(_981);
                }
                int _983 = _975;
                _919 = _983;
                _911 = _979;
            }
            int _985 = _919;
            float _987 = _911;
            int _989 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _991 = _989 != 0;
            int _993 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _995 = _993 != 0;
            int _997 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _999 = _997 != 0;
            int _1001 = as_type<int>(_987);
            int _1003 = _985;
            _885 = as_type<int>(_833);
            if (_995)
            {
                float _1005 = -_987;
                float _1007 = _1005 + 1.0;
                _1001 = as_type<int>(_1007);
            }
            int _1009 = _1001;
            if (_999)
            {
                float _1011 = -as_type<float>(_985);
                float _1013 = _1011 + 1.0;
                _1003 = as_type<int>(_1013);
            }
            int _1015 = _1003;
            bool _1017 = !_991;
            float _1019 = _1017 ? as_type<float>(_1009) : as_type<float>(_1015);
            bool _1021 = !_991;
            float _1023 = _1021 ? as_type<float>(_1015) : as_type<float>(_1009);
            _883 = _1023;
            _887 = _1019;
        }
    }
    _889 = false;
    float _1025 = _883;
    int _1027 = _885;
    float _1029 = _887;
    float _1031 = _1025 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _1033 = _1025 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_1027);
    bool _1035 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _1037 = fma(_1029, (*spvDescriptorSet0.vp_c3)._m0[8].x, _1031);
    float _1039 = fma(_1029, (*spvDescriptorSet0.vp_c3)._m0[7].x, _1033);
    float _1041 = _1037 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _1043 = _1039 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _1045 = -_1041;
    float _1047 = _1045 + 1.0;
    out.m_27.x = _1043;
    out.m_27.y = _1047;
    bool _1049 = !_1035;
    float _1051 = _1025;
    float _1053 = as_type<float>(_1027);
    float _1073;
    float _1075;
    int _1077;
    if (!_1049)
    {
        float _1055 = _51 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1057 = _51 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1059 = _51 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _1061 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[18].x, _1055);
        float _1063 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1057);
        float _1065 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[21].x, _1059);
        float _1067 = _1061 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1069 = _1063 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _1071 = _1065 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _1073 = _1069;
        _1075 = _1067;
        _1077 = as_type<int>(_1071);
        _1079 = true;
    }
    else
    {
        int _1081 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1083 = _1081 != 0;
        if (!_1083)
        {
            _126 = _827;
        }
        float _1085 = _126;
        _1075 = _1085;
        if (!_1083)
        {
            _1051 = _825;
        }
        float _1087 = _1051;
        float _1089 = _1087;
        _1073 = _1087;
        if (!_1083)
        {
            _1053 = _837;
        }
        float _1091 = _1053;
        bool _1093 = !_1083;
        float _1095 = _1091;
        _1077 = as_type<int>(_1091);
        if (!_1093)
        {
            if (!_835)
            {
                _1089 = _827;
            }
            float _1097 = _1089;
            float _1099 = _1097;
            float _1101 = _1097;
            if (!_835)
            {
                _1095 = _825;
            }
            float _1103 = _1095;
            bool _1105 = !_835;
            float _1107 = _1103;
            int _1109 = as_type<int>(_1103);
            if (!_1105)
            {
                int _1111 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1113 = _1111 != 0;
                int _1115 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1117 = _1115 != 0;
                int _1119 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1121 = _1119 != 0;
                int _1123 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1125 = _1123 != 0;
                int _1127 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1129 = _1127 != 0;
                if (_1113)
                {
                    _1099 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1131 = _1099;
                float _1133 = _1131;
                if (_1113)
                {
                    _1107 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1135 = _1107;
                float _1137 = _1135;
                if (!_1113)
                {
                    _1133 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1139 = _1133;
                if (!_1113)
                {
                    _1137 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1141 = _1137;
                float _1143 = _1139 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1145 = _1141 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1125)
                {
                    float _1147 = _1143 * _827;
                    _861 = _1147;
                }
                float _1149 = _861;
                float _1151 = -_1143;
                float _1153 = _1151 + 1.0;
                float _1155 = _1149;
                if (_1129)
                {
                    float _1157 = _1145 * _825;
                    _863 = _1157;
                }
                float _1159 = _863;
                float _1161 = -_1145;
                float _1163 = _1161 + 1.0;
                int _1165 = as_type<int>(_1159);
                if (_1117)
                {
                    float _1167 = _1149 + _1153;
                    _1155 = _1167;
                }
                float _1169 = _1155;
                if (_1121)
                {
                    float _1171 = _1159 + _1163;
                    _1165 = as_type<int>(_1171);
                }
                int _1173 = _1165;
                _1109 = _1173;
                _1101 = _1169;
            }
            int _1175 = _1109;
            float _1177 = _1101;
            int _1179 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1181 = _1179 != 0;
            int _1183 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1185 = _1183 != 0;
            int _1187 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1189 = _1187 != 0;
            int _1191 = as_type<int>(_1177);
            int _1193 = _1175;
            _1077 = as_type<int>(_837);
            if (_1185)
            {
                float _1195 = -_1177;
                float _1197 = _1195 + 1.0;
                _1191 = as_type<int>(_1197);
            }
            int _1199 = _1191;
            if (_1189)
            {
                float _1201 = -as_type<float>(_1175);
                float _1203 = _1201 + 1.0;
                _1193 = as_type<int>(_1203);
            }
            int _1205 = _1193;
            bool _1207 = !_1181;
            float _1209 = _1207 ? as_type<float>(_1199) : as_type<float>(_1205);
            bool _1211 = !_1181;
            float _1213 = _1211 ? as_type<float>(_1205) : as_type<float>(_1199);
            _1073 = _1213;
            _1075 = _1209;
        }
    }
    _1079 = false;
    float _1215 = _1073;
    float _1217 = _1075;
    int _1219 = _1077;
    float _1221 = _1215 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1223 = _1215 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1225 = _839 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1227 = _841 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1229 = fma(_1217, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1221);
    float _1231 = fma(_1217, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1223);
    float _1233 = _843 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1235 = _845 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1237 = _1229 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    out.m_29.w = as_type<float>(_1219);
    float _1241 = -_1237;
    float _1243 = _1241 + 1.0;
    out.m_31.x = _1225;
    out.m_31.y = _1227;
    out.m_31.z = _1233;
    out.m_31.w = _1235;
    out.m_29.x = _1239;
    out.m_29.y = _1243;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

