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
    float4 m_33 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1383 = false;
    bool _1205 = false;
    bool _1017 = false;
    bool _162 = false;
    bool _419 = false;
    bool _417 = false;
    bool _413 = false;
    bool _409 = false;
    bool _405 = false;
    bool _401 = false;
    bool _397 = false;
    bool _393 = false;
    bool _389 = false;
    bool _385 = false;
    bool _381 = false;
    bool _377 = false;
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
    float _116 = _97;
    float _118 = _87;
    float _120 = _97;
    float _122 = _87;
    float _124 = _49;
    float _126 = _55;
    float _128 = _53;
    bool _136;
    float _138;
    float _140;
    float _142;
    float _144;
    float _146;
    int _148;
    float _150;
    float _152;
    float _154;
    float _156;
    float _158;
    int _160;
    if (!_114)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        bool _134 = !_132;
        _136 = _132;
        if (!_134)
        {
            _138 = _49;
            _140 = _47;
            _142 = _49;
            _144 = _47;
            _146 = 1.0;
            _148 = 1065353216;
            _150 = _47;
            _152 = 255.0;
            _154 = 255.0;
            _156 = 255.0;
            _158 = 255.0;
            _160 = 1065353216;
            _162 = true;
        }
        else
        {
            float _164 = trunc(_47);
            int _166 = int(_164);
            float _168 = trunc(_49);
            int _170 = int(_168);
            int _172 = _170 << 1;
            int _174 = _172 + _166;
            int _176 = _174 << 4;
            bool _178 = _176 == 0;
            bool _180 = _176 == 16;
            bool _182 = _176 == 32;
            bool _184 = _176 == 48;
            float _186 = 0.0;
            float _188 = as_type<float>(_170);
            int _190 = _166;
            _152 = 255.0;
            _154 = 255.0;
            _156 = 255.0;
            _158 = 255.0;
            if (_178)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _192 = _186;
            float _194 = 0.0;
            float _196 = _192;
            if (_178)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _198 = _194;
            float _200 = 0.0;
            float _202 = _198;
            if (_178)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _204 = _200;
            float _206 = 0.0;
            float _208 = _204;
            if (_178)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _210 = _206;
            float _212 = _210;
            if (_178)
            {
                _116 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _214 = _116;
            int _216 = 0;
            float _218 = _214;
            if (_178)
            {
                _216 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _220 = _216;
            int _222 = _220;
            if (_178)
            {
                _118 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _224 = _118;
            float _226 = _224;
            if (_178)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _228 = _188;
            float _230 = _228;
            if (_178)
            {
                _190 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _232 = _190;
            int _234 = _232;
            if (_180)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _236 = _196;
            float _238 = _236;
            if (_180)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _240 = _202;
            float _242 = _240;
            if (_180)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _244 = _208;
            float _246 = _244;
            if (_180)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _248 = _212;
            float _250 = _248;
            if (_180)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _252 = _218;
            float _254 = _252;
            if (_180)
            {
                _222 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _256 = _222;
            int _258 = _256;
            if (_180)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _260 = _226;
            float _262 = _260;
            if (_180)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _264 = _230;
            float _266 = _264;
            if (_180)
            {
                _234 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _268 = _234;
            int _270 = _268;
            if (_182)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _272 = _238;
            float _274 = _272;
            if (_182)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _276 = _242;
            float _278 = _276;
            if (_182)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _280 = _246;
            float _282 = _280;
            if (_182)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _284 = _250;
            float _286 = _284;
            if (_182)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _288 = _254;
            float _290 = _288;
            if (_182)
            {
                _258 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _292 = _258;
            int _294 = _292;
            if (_182)
            {
                _262 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _296 = _262;
            float _298 = _296;
            if (_182)
            {
                _266 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _300 = _266;
            float _302 = _300;
            if (_182)
            {
                _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _304 = _270;
            int _306 = _304;
            if (_184)
            {
                _274 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _308 = _274;
            _144 = _308;
            if (_184)
            {
                _278 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _310 = _278;
            _142 = _310;
            if (_184)
            {
                _282 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _312 = _282;
            _146 = _312;
            if (_184)
            {
                _286 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _314 = _286;
            _140 = _314;
            if (_184)
            {
                _290 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _316 = _290;
            _138 = _316;
            if (_184)
            {
                _294 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _318 = _294;
            _148 = _318;
            if (_184)
            {
                _298 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _320 = _298;
            _150 = _320;
            if (_184)
            {
                _302 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _322 = _302;
            _124 = _322;
            if (_184)
            {
                _306 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
            int _324 = _306;
            _160 = _324;
            _162 = true;
        }
    }
    else
    {
        int _326 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _328 = _326 != 0;
        uint _331 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _333 = int(_331) & 15;
        bool _335 = !_328;
        _136 = _328;
        if (!_335)
        {
            uint _337 = min(uint(_333), 13u);
            float _339 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _341 = int(_337) << 2;
            uint _343 = uint(int(uint(_341) >> uint(2)));
            uint _345 = uint(int(uint(int(_343)) >> uint(2)));
            int _347 = int(_343) & 3;
            float _349 = (*spvDescriptorSet0.vp_c1)._m0[int(_345)][_347];
            float _351 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _353 = _339 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _355 = _339 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _357 = _351 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _359 = _351 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _361 = as_type<int>(_349) >> 31;
            bool _363 = as_type<int>(_349) == 1808;
            float _365 = _353;
            float _367 = _355;
            float _369 = _349;
            float _371 = as_type<float>(_361);
            float _373 = _359;
            if (!_363)
            {
                bool _375 = as_type<int>(_349) == 1856;
                _377 = _375;
                if (!_377)
                {
                    bool _379 = as_type<int>(_349) == 1920;
                    _381 = _379;
                    if (!_381)
                    {
                        bool _383 = as_type<int>(_349) == 1984;
                        _385 = _383;
                        if (!_385)
                        {
                            bool _387 = as_type<int>(_349) == 2064;
                            _389 = _387;
                            if (!_389)
                            {
                                bool _391 = as_type<int>(_349) == 2144;
                                _393 = _391;
                                if (!_393)
                                {
                                    bool _395 = as_type<int>(_349) == 2240;
                                    _397 = _395;
                                    if (!_397)
                                    {
                                        bool _399 = as_type<int>(_349) == 2320;
                                        _401 = _399;
                                        if (!_401)
                                        {
                                            bool _403 = as_type<int>(_349) == 2416;
                                            _405 = _403;
                                            if (!_405)
                                            {
                                                bool _407 = as_type<int>(_349) == 2480;
                                                _409 = _407;
                                                if (!_409)
                                                {
                                                    bool _411 = as_type<int>(_349) == 2560;
                                                    _413 = _411;
                                                    if (!_413)
                                                    {
                                                        bool _415 = as_type<int>(_349) == 2624;
                                                        _417 = _415;
                                                        if (!_417)
                                                        {
                                                            _419 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _425;
            float _427;
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
                                    if (!_401)
                                    {
                                        if (!_405)
                                        {
                                            if (!_409)
                                            {
                                                if (!_413)
                                                {
                                                    if (!_417)
                                                    {
                                                        if (!_419)
                                                        {
                                                            float _421 = _353 * _47;
                                                            float _423 = _357 * _49;
                                                            _425 = _423;
                                                            _427 = _421;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389) || _385) || _381) || _377)
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
                                    if ((!_401) || _377)
                                    {
                                        if ((!_405) || _377)
                                        {
                                            if ((!_409) || _377)
                                            {
                                                if ((!_413) || _377)
                                                {
                                                    if ((!_417) || _377)
                                                    {
                                                        if ((!_419) || _377)
                                                        {
                                                            _377 = false;
                                                            float _429 = -_355;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = _357 * _49;
                                                            float _435 = fma(_355, _47, _431);
                                                            _425 = _433;
                                                            _427 = _435;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389) || _385) || _381)
                {
                    if ((!_385) || _381)
                    {
                        if ((!_389) || _381)
                        {
                            if ((!_393) || _381)
                            {
                                if ((!_397) || _381)
                                {
                                    if ((!_401) || _381)
                                    {
                                        if ((!_405) || _381)
                                        {
                                            if ((!_409) || _381)
                                            {
                                                if ((!_413) || _381)
                                                {
                                                    if ((!_417) || _381)
                                                    {
                                                        if ((!_419) || _381)
                                                        {
                                                            _381 = false;
                                                            float _437 = -_359;
                                                            float _439 = _437 + 1.0;
                                                            float _441 = _353 * _47;
                                                            float _443 = fma(_359, _49, _439);
                                                            _425 = _443;
                                                            _427 = _441;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389) || _385)
                    {
                        if ((!_389) || _385)
                        {
                            if ((!_393) || _385)
                            {
                                if ((!_397) || _385)
                                {
                                    if ((!_401) || _385)
                                    {
                                        if ((!_405) || _385)
                                        {
                                            if ((!_409) || _385)
                                            {
                                                if ((!_413) || _385)
                                                {
                                                    if ((!_417) || _385)
                                                    {
                                                        if ((!_419) || _385)
                                                        {
                                                            _385 = false;
                                                            float _445 = -_355;
                                                            float _447 = _445 + 1.0;
                                                            float _449 = -_359;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = fma(_355, _47, _447);
                                                            float _455 = fma(_359, _49, _451);
                                                            _425 = _455;
                                                            _427 = _453;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389)
                        {
                            if ((!_393) || _389)
                            {
                                if ((!_397) || _389)
                                {
                                    if ((!_401) || _389)
                                    {
                                        if ((!_405) || _389)
                                        {
                                            if ((!_409) || _389)
                                            {
                                                if ((!_413) || _389)
                                                {
                                                    if ((!_417) || _389)
                                                    {
                                                        if ((!_419) || _389)
                                                        {
                                                            _389 = false;
                                                            float _457 = -_357;
                                                            float _459 = _457 + 1.0;
                                                            float _461 = -_359;
                                                            float _463 = _461 + _459;
                                                            float _465 = _353 * _47;
                                                            float _467 = fma(_463, _49, _357);
                                                            _425 = _467;
                                                            _427 = _465;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393)
                            {
                                if ((!_397) || _393)
                                {
                                    if ((!_401) || _393)
                                    {
                                        if ((!_405) || _393)
                                        {
                                            if ((!_409) || _393)
                                            {
                                                if ((!_413) || _393)
                                                {
                                                    if ((!_417) || _393)
                                                    {
                                                        if ((!_419) || _393)
                                                        {
                                                            _393 = false;
                                                            float _469 = -_357;
                                                            float _471 = _469 + 1.0;
                                                            float _473 = -_355;
                                                            float _475 = _473 + 1.0;
                                                            float _477 = -_359;
                                                            float _479 = _477 + _471;
                                                            float _481 = fma(_355, _47, _475);
                                                            float _483 = fma(_479, _49, _357);
                                                            _425 = _483;
                                                            _427 = _481;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397)
                                {
                                    if ((!_401) || _397)
                                    {
                                        if ((!_405) || _397)
                                        {
                                            if ((!_409) || _397)
                                            {
                                                if ((!_413) || _397)
                                                {
                                                    if ((!_417) || _397)
                                                    {
                                                        if ((!_419) || _397)
                                                        {
                                                            _397 = false;
                                                            float _485 = -_353;
                                                            float _487 = _485 + 1.0;
                                                            float _489 = -_355;
                                                            float _491 = _489 + _487;
                                                            float _493 = _357 * _49;
                                                            float _495 = fma(_491, _47, _353);
                                                            _425 = _493;
                                                            _427 = _495;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _419) || _417) || _413) || _409) || _405) || _401)
                                    {
                                        if ((!_405) || _401)
                                        {
                                            if ((!_409) || _401)
                                            {
                                                if ((!_413) || _401)
                                                {
                                                    if ((!_417) || _401)
                                                    {
                                                        if ((!_419) || _401)
                                                        {
                                                            _401 = false;
                                                            float _497 = -_353;
                                                            float _499 = _497 + 1.0;
                                                            float _501 = -_359;
                                                            float _503 = _501 + 1.0;
                                                            float _505 = -_355;
                                                            float _507 = _505 + _499;
                                                            float _509 = fma(_359, _49, _503);
                                                            float _511 = fma(_507, _47, _353);
                                                            _425 = _509;
                                                            _427 = _511;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _419) || _417) || _413) || _409) || _405)
                                        {
                                            if ((!_409) || _405)
                                            {
                                                if ((!_413) || _405)
                                                {
                                                    if ((!_417) || _405)
                                                    {
                                                        if ((!_419) || _405)
                                                        {
                                                            _405 = false;
                                                            float _513 = -_355;
                                                            float _515 = _513 + 1.0;
                                                            float _517 = _357 * _49;
                                                            float _519 = _515 * _47;
                                                            _425 = _517;
                                                            _427 = _519;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _419) || _417) || _413) || _409)
                                            {
                                                if ((!_413) || _409)
                                                {
                                                    if ((!_417) || _409)
                                                    {
                                                        if ((!_419) || _409)
                                                        {
                                                            _409 = false;
                                                            float _521 = -_355;
                                                            float _523 = _521 + 1.0;
                                                            float _525 = -_359;
                                                            float _527 = _525 + 1.0;
                                                            float _529 = fma(_355, _47, _523);
                                                            float _531 = _527 * _49;
                                                            _425 = _531;
                                                            _427 = _529;
                                                        }
                                                    }
                                                }
                                                if (((false || _419) || _417) || _413)
                                                {
                                                    if ((!_417) || _413)
                                                    {
                                                        if ((!_419) || _413)
                                                        {
                                                            _413 = false;
                                                            float _533 = -_357;
                                                            float _535 = _533 + 1.0;
                                                            float _537 = _353 * _47;
                                                            float _539 = fma(_535, _49, _357);
                                                            _425 = _539;
                                                            _427 = _537;
                                                        }
                                                    }
                                                    if ((false || _419) || _417)
                                                    {
                                                        if ((!_419) || _417)
                                                        {
                                                            _417 = false;
                                                            float _541 = -_353;
                                                            float _543 = _541 + 1.0;
                                                            float _545 = -_359;
                                                            float _547 = _545 + 1.0;
                                                            float _549 = fma(_543, _47, _353);
                                                            float _551 = fma(_359, _49, _547);
                                                            _425 = _551;
                                                            _427 = _549;
                                                        }
                                                        if (false || _419)
                                                        {
                                                            _419 = false;
                                                            bool _553 = _333 != 12;
                                                            if (!_553)
                                                            {
                                                                float _555 = -_357;
                                                                float _557 = _555 + 1.0;
                                                                _365 = _557;
                                                            }
                                                            float _559 = _365;
                                                            if (!_553)
                                                            {
                                                                float _561 = -_355;
                                                                float _563 = _561 + 1.0;
                                                                _367 = _563;
                                                            }
                                                            float _565 = _367;
                                                            if (_553)
                                                            {
                                                                _369 = 0.0;
                                                                _371 = 0.0;
                                                            }
                                                            float _567 = _369;
                                                            float _569 = _371;
                                                            float _571 = _569;
                                                            _425 = _567;
                                                            if (!_553)
                                                            {
                                                                float _573 = -_359;
                                                                float _575 = _573 + _559;
                                                                _373 = _575;
                                                            }
                                                            float _577 = _373;
                                                            if (!_553)
                                                            {
                                                                float _579 = _47 * _565;
                                                                _571 = _579;
                                                            }
                                                            float _581 = _571;
                                                            _427 = _581;
                                                            if (!_553)
                                                            {
                                                                float _583 = _49 * _577;
                                                                _425 = _583;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _585 = _425;
            float _587 = _427;
            float _589 = -_585;
            float _591 = _589 + 1.0;
            float _593 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _595 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _597 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _599 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _601 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _603 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _605 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _607 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _609 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].x, _593);
            float _611 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].x, _595);
            float _613 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].y, _597);
            float _615 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].y, _599);
            float _617 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].z, _601);
            float _619 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].z, _603);
            float _621 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].w, _605);
            float _623 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].w, _607);
            float _625 = _609 * _587;
            float _627 = _613 * _587;
            float _629 = _617 * _587;
            float _631 = -_587;
            float _633 = _631 + 1.0;
            float _635 = _623 * _587;
            float _637 = fma(_633, _611, _625);
            float _639 = fma(_633, _615, _627);
            float _641 = fma(_633, _619, _629);
            float _643 = fma(_633, _621, _635);
            _138 = _49;
            _140 = _47;
            _142 = _49;
            _144 = _47;
            _146 = 1.0;
            _148 = 1065353216;
            _150 = _47;
            _152 = _637;
            _154 = _639;
            _156 = _641;
            _158 = _643;
            _160 = 1065353216;
            _162 = true;
        }
        else
        {
            float _645 = trunc(_47);
            int _647 = int(_645);
            bool _649 = _333 != 13;
            float _651 = trunc(_49);
            int _653 = int(_651);
            int _655 = _653 << 1;
            int _657 = _655 + _647;
            int _659 = _657 << 4;
            bool _661 = _659 == 0;
            bool _663 = _659 == 16;
            bool _665 = _659 == 32;
            bool _667 = _659 == 48;
            float _669 = 0.0;
            if (_661)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _671 = _669;
            float _673 = 0.0;
            float _675 = _671;
            if (_661)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _677 = _673;
            float _679 = 0.0;
            float _681 = _677;
            if (_661)
            {
                _679 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _683 = _679;
            float _685 = 0.0;
            float _687 = _683;
            if (_661)
            {
                _685 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _689 = _685;
            float _691 = _689;
            if (_661)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _693 = _120;
            int _695 = 0;
            float _697 = _693;
            if (_661)
            {
                _695 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _699 = _695;
            int _701 = _699;
            if (_661)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _703 = _122;
            float _705 = 0.0;
            float _707 = _703;
            if (_661)
            {
                _705 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _709 = _705;
            int _711 = 0;
            float _713 = _709;
            if (_661)
            {
                _711 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _715 = _711;
            int _717 = _715;
            if (_663)
            {
                _675 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _719 = _675;
            float _721 = _719;
            if (_663)
            {
                _681 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _723 = _681;
            float _725 = _723;
            if (_663)
            {
                _687 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _727 = _687;
            float _729 = _727;
            if (_663)
            {
                _691 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _731 = _691;
            float _733 = _731;
            if (_663)
            {
                _697 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _735 = _697;
            float _737 = _735;
            if (_663)
            {
                _701 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _739 = _701;
            int _741 = _739;
            if (_663)
            {
                _707 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _743 = _707;
            float _745 = _743;
            if (_663)
            {
                _713 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _747 = _713;
            float _749 = _747;
            if (_663)
            {
                _717 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _751 = _717;
            int _753 = _751;
            if (_665)
            {
                _721 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _755 = _721;
            float _757 = _755;
            if (_665)
            {
                _725 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _759 = _725;
            float _761 = _759;
            if (_665)
            {
                _729 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _763 = _729;
            float _765 = _763;
            if (_665)
            {
                _733 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _767 = _733;
            float _769 = _767;
            if (_665)
            {
                _737 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _771 = _737;
            float _773 = _771;
            if (_665)
            {
                _741 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _775 = _741;
            int _777 = _775;
            if (_665)
            {
                _745 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _779 = _745;
            float _781 = _779;
            if (_665)
            {
                _749 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _783 = _749;
            float _785 = _783;
            if (_665)
            {
                _753 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _787 = _753;
            int _789 = _787;
            if (_667)
            {
                _757 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _791 = _757;
            _144 = _791;
            if (_667)
            {
                _761 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _793 = _761;
            _142 = _793;
            if (_667)
            {
                _765 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _795 = _765;
            _146 = _795;
            if (_667)
            {
                _769 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _797 = _769;
            _140 = _797;
            if (_667)
            {
                _773 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _799 = _773;
            _138 = _799;
            if (_667)
            {
                _777 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _801 = _777;
            _148 = _801;
            if (_667)
            {
                _781 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _803 = _781;
            _150 = _803;
            if (_667)
            {
                _785 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _805 = _785;
            if (_667)
            {
                _789 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
            int _807 = _789;
            if (!_649)
            {
                float _809 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _811 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _813 = _809 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _815 = -_813;
                float _817 = _815 + 1.0;
                float _819 = _811 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _821 = -_809;
                float _823 = fma(_821, (*spvDescriptorSet0.vp_c3)._m0[26].w, _817);
                float _825 = -_819;
                float _827 = _825 + 1.0;
                float _829 = fma(_823, _49, _813);
                float _831 = -_811;
                float _833 = fma(_831, (*spvDescriptorSet0.vp_c3)._m0[26].y, _827);
                float _835 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _837 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _839 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _841 = fma(_833, _47, _819);
                float _843 = -_829;
                float _845 = _843 + 1.0;
                float _847 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _849 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _851 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _853 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _855 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _857 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].x, _835);
                float _859 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].x, _837);
                float _861 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].y, _839);
                float _863 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].y, _847);
                float _865 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].z, _849);
                float _867 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].z, _851);
                float _869 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].w, _853);
                float _871 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].w, _855);
                float _873 = -_841;
                float _875 = _873 + 1.0;
                float _877 = _841 * _857;
                float _879 = _841 * _861;
                float _881 = _841 * _865;
                float _883 = _841 * _871;
                float _885 = fma(_875, _859, _877);
                float _887 = fma(_875, _863, _879);
                float _889 = fma(_875, _867, _881);
                float _891 = fma(_875, _869, _883);
                _124 = _805;
                _152 = _885;
                _154 = _887;
                _156 = _889;
                _158 = _891;
                _160 = _807;
                _162 = true;
            }
            else
            {
                int _893 = _657 << 4;
                int _895 = _893 + 464;
                uint _897 = uint(int(uint(_895) >> uint(2)));
                uint _899 = uint(int(uint(int(_897)) >> uint(2)));
                int _901 = int(_897) & 3;
                float _903 = (*spvDescriptorSet0.vp_c3)._m0[int(_899)][_901];
                int _905 = int(_897) + 1;
                uint _907 = uint(int(uint(_905) >> uint(2)));
                int _909 = _905 & 3;
                float _911 = (*spvDescriptorSet0.vp_c3)._m0[int(_907)][_909];
                int _913 = _895 + 8;
                uint _915 = uint(int(uint(_913) >> uint(2)));
                uint _917 = uint(int(uint(int(_915)) >> uint(2)));
                int _919 = int(_915) & 3;
                float _921 = (*spvDescriptorSet0.vp_c3)._m0[int(_917)][_919];
                int _923 = int(_915) + 1;
                uint _925 = uint(int(uint(_923) >> uint(2)));
                int _927 = _923 & 3;
                float _929 = (*spvDescriptorSet0.vp_c3)._m0[int(_925)][_927];
                _124 = _805;
                _152 = _903;
                _154 = _911;
                _156 = _921;
                _158 = _929;
                _160 = _807;
            }
        }
    }
    _162 = false;
    float _931 = _138;
    float _933 = _140;
    float _935 = _142;
    float _937 = _144;
    float _939 = _146;
    bool _941 = _136;
    int _943 = _148;
    float _945 = _150;
    float _947 = _124;
    float _949 = _152;
    float _951 = _154;
    float _953 = _156;
    float _955 = _158;
    int _957 = _160;
    bool _959 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _961 = !_959;
    float _963 = _935;
    float _965 = _933;
    float _967 = _931;
    float _969 = _937;
    float _971 = _935;
    float _973 = _933;
    float _975 = _931;
    int _977 = _943;
    float _979 = _945;
    float _981 = _947;
    int _983 = as_type<int>(_945);
    float _985 = _947;
    float _987 = _947;
    float _989 = _945;
    int _991 = _957;
    float _1011;
    int _1013;
    float _1015;
    if (!_961)
    {
        float _993 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _995 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _997 = _53 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _999 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _993);
        float _1001 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _995);
        float _1003 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[17].x, _997);
        float _1005 = _999 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _1007 = _1001 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _1009 = _1003 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _1011 = _1007;
        _1013 = as_type<int>(_1009);
        _1015 = _1005;
        _1017 = true;
    }
    else
    {
        int _1019 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1021 = _1019 != 0;
        if (!_1021)
        {
            _963 = _937;
        }
        float _1023 = _963;
        _1015 = _1023;
        if (!_1021)
        {
            _965 = _935;
        }
        float _1025 = _965;
        float _1027 = _1025;
        _1011 = _1025;
        if (!_1021)
        {
            _967 = _939;
        }
        float _1029 = _967;
        bool _1031 = !_1021;
        float _1033 = _1029;
        _1013 = as_type<int>(_1029);
        if (!_1031)
        {
            if (!_941)
            {
                _1027 = _937;
            }
            float _1035 = _1027;
            float _1037 = _1035;
            float _1039 = _1035;
            if (!_941)
            {
                _1033 = _935;
            }
            float _1041 = _1033;
            bool _1043 = !_941;
            float _1045 = _1041;
            int _1047 = as_type<int>(_1041);
            if (!_1043)
            {
                int _1049 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1051 = _1049 != 0;
                int _1053 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1055 = _1053 != 0;
                int _1057 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1059 = _1057 != 0;
                int _1061 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1063 = _1061 != 0;
                int _1065 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1067 = _1065 != 0;
                if (_1051)
                {
                    _1037 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1069 = _1037;
                float _1071 = _1069;
                if (_1051)
                {
                    _1045 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1073 = _1045;
                float _1075 = _1073;
                if (!_1051)
                {
                    _1071 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1077 = _1071;
                if (!_1051)
                {
                    _1075 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1079 = _1075;
                float _1081 = _1077 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1083 = _1079 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1063)
                {
                    float _1085 = _1081 * _937;
                    _969 = _1085;
                }
                float _1087 = _969;
                float _1089 = -_1081;
                float _1091 = _1089 + 1.0;
                float _1093 = _1087;
                if (_1067)
                {
                    float _1095 = _1083 * _935;
                    _971 = _1095;
                }
                float _1097 = _971;
                float _1099 = -_1083;
                float _1101 = _1099 + 1.0;
                int _1103 = as_type<int>(_1097);
                if (_1055)
                {
                    float _1105 = _1087 + _1091;
                    _1093 = _1105;
                }
                float _1107 = _1093;
                if (_1059)
                {
                    float _1109 = _1097 + _1101;
                    _1103 = as_type<int>(_1109);
                }
                int _1111 = _1103;
                _1047 = _1111;
                _1039 = _1107;
            }
            int _1113 = _1047;
            float _1115 = _1039;
            int _1117 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1119 = _1117 != 0;
            int _1121 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1123 = _1121 != 0;
            int _1125 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1127 = _1125 != 0;
            int _1129 = as_type<int>(_1115);
            int _1131 = _1113;
            _1013 = as_type<int>(_939);
            if (_1123)
            {
                float _1133 = -_1115;
                float _1135 = _1133 + 1.0;
                _1129 = as_type<int>(_1135);
            }
            int _1137 = _1129;
            if (_1127)
            {
                float _1139 = -as_type<float>(_1113);
                float _1141 = _1139 + 1.0;
                _1131 = as_type<int>(_1141);
            }
            int _1143 = _1131;
            bool _1145 = !_1119;
            float _1147 = _1145 ? as_type<float>(_1137) : as_type<float>(_1143);
            bool _1149 = !_1119;
            float _1151 = _1149 ? as_type<float>(_1143) : as_type<float>(_1137);
            _1011 = _1151;
            _1015 = _1147;
        }
    }
    _1017 = false;
    float _1153 = _1011;
    int _1155 = _1013;
    float _1157 = _1015;
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_1155);
    bool _1163 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _1165 = fma(_1157, (*spvDescriptorSet0.vp_c3)._m0[8].x, _1159);
    float _1167 = fma(_1157, (*spvDescriptorSet0.vp_c3)._m0[7].x, _1161);
    float _1169 = _1165 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _1171 = _1167 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _1173 = -_1169;
    float _1175 = _1173 + 1.0;
    out.m_27.x = _1171;
    out.m_27.y = _1175;
    bool _1177 = !_1163;
    float _1179 = _1171;
    float _1181 = as_type<float>(_1155);
    float _1201;
    float _1203;
    if (!_1177)
    {
        float _1183 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1185 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1187 = _53 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _1189 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _1183);
        float _1191 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1185);
        float _1193 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[21].x, _1187);
        float _1195 = _1189 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1197 = _1191 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _1199 = _1193 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _1201 = _1197;
        _977 = as_type<int>(_1199);
        _1203 = _1195;
        _1205 = true;
    }
    else
    {
        int _1207 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1209 = _1207 != 0;
        if (!_1209)
        {
            _1179 = _933;
        }
        float _1211 = _1179;
        float _1213 = _1211;
        _1203 = _1211;
        if (!_1209)
        {
            _1181 = _931;
        }
        float _1215 = _1181;
        bool _1217 = !_1209;
        float _1219 = _1215;
        _1201 = _1215;
        if (!_1217)
        {
            if (!_941)
            {
                _1213 = _933;
            }
            float _1221 = _1213;
            float _1223 = _1221;
            int _1225 = as_type<int>(_1221);
            if (!_941)
            {
                _1219 = _931;
            }
            float _1227 = _1219;
            bool _1229 = !_941;
            float _1231 = _1227;
            float _1233 = _1227;
            if (!_1229)
            {
                int _1235 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1237 = _1235 != 0;
                int _1239 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1241 = _1239 != 0;
                int _1243 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1245 = _1243 != 0;
                int _1247 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1249 = _1247 != 0;
                int _1251 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1253 = _1251 != 0;
                if (_1237)
                {
                    _1223 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1255 = _1223;
                float _1257 = _1255;
                if (_1237)
                {
                    _1231 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1259 = _1231;
                float _1261 = _1259;
                if (!_1237)
                {
                    _1257 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1263 = _1257;
                if (!_1237)
                {
                    _1261 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1265 = _1261;
                float _1267 = _1263 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1269 = _1265 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1249)
                {
                    float _1271 = _1267 * _933;
                    _973 = _1271;
                }
                float _1273 = _973;
                float _1275 = -_1267;
                float _1277 = _1275 + 1.0;
                int _1279 = as_type<int>(_1273);
                if (_1253)
                {
                    float _1281 = _1269 * _931;
                    _975 = _1281;
                }
                float _1283 = _975;
                float _1285 = -_1269;
                float _1287 = _1285 + 1.0;
                float _1289 = _1283;
                if (_1241)
                {
                    float _1291 = _1273 + _1277;
                    _1279 = as_type<int>(_1291);
                }
                int _1293 = _1279;
                if (_1245)
                {
                    float _1295 = _1283 + _1287;
                    _1289 = _1295;
                }
                float _1297 = _1289;
                _1225 = _1293;
                _1233 = _1297;
            }
            int _1299 = _1225;
            float _1301 = _1233;
            int _1303 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1305 = _1303 != 0;
            int _1307 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1309 = _1307 != 0;
            int _1311 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1313 = _1311 != 0;
            int _1315 = _1299;
            int _1317 = as_type<int>(_1301);
            if (_1309)
            {
                float _1319 = -as_type<float>(_1299);
                float _1321 = _1319 + 1.0;
                _1315 = as_type<int>(_1321);
            }
            int _1323 = _1315;
            if (_1313)
            {
                float _1325 = -_1301;
                float _1327 = _1325 + 1.0;
                _1317 = as_type<int>(_1327);
            }
            int _1329 = _1317;
            bool _1331 = !_1305;
            float _1333 = _1331 ? as_type<float>(_1323) : as_type<float>(_1329);
            bool _1335 = !_1305;
            float _1337 = _1335 ? as_type<float>(_1329) : as_type<float>(_1323);
            _1201 = _1337;
            _1203 = _1333;
        }
    }
    _1205 = false;
    float _1339 = _1201;
    int _1341 = _977;
    float _1343 = _1203;
    float _1345 = _1339 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_29.w = as_type<float>(_1341);
    bool _1349 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _1351 = fma(_1343, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1345);
    float _1353 = fma(_1343, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1347);
    float _1355 = _1351 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1357 = _1353 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1359 = -_1355;
    float _1361 = _1359 + 1.0;
    out.m_29.x = _1357;
    out.m_29.y = _1361;
    bool _1363 = !_1349;
    if (!_1363)
    {
        float _1365 = _53 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _1367 = _53 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _1369 = _53 * (*spvDescriptorSet0.vp_c3)._m0[25].y;
        float _1371 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[22].x, _1365);
        float _1373 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[23].x, _1367);
        float _1375 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[25].x, _1369);
        float _1377 = _1371 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _1379 = _1373 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        float _1381 = _1375 + (*spvDescriptorSet0.vp_c3)._m0[25].w;
        _987 = _1379;
        _989 = _1377;
        _991 = as_type<int>(_1381);
        _1383 = true;
    }
    else
    {
        int _1385 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1387 = _1385 != 0;
        bool _1389 = !_1387;
        if (!_1389)
        {
            bool _1391 = !_941;
            if (!_1391)
            {
                int _1393 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1395 = _1393 != 0;
                int _1397 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1399 = _1397 != 0;
                int _1401 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1403 = _1401 != 0;
                int _1405 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1407 = _1405 != 0;
                int _1409 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1411 = _1409 != 0;
                if (_1395)
                {
                    _126 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1413 = _126;
                float _1415 = _1413;
                if (_1395)
                {
                    _128 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1417 = _128;
                float _1419 = _1417;
                if (!_1395)
                {
                    _1415 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1421 = _1415;
                if (!_1395)
                {
                    _1419 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1423 = _1419;
                float _1425 = _1421 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1427 = _1423 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1407)
                {
                    float _1429 = _1425 * _945;
                    _979 = _1429;
                }
                float _1431 = _979;
                float _1433 = -_1425;
                float _1435 = _1433 + 1.0;
                int _1437 = as_type<int>(_1431);
                if (_1411)
                {
                    float _1439 = _1427 * _947;
                    _981 = _1439;
                }
                float _1441 = _981;
                float _1443 = -_1427;
                float _1445 = _1443 + 1.0;
                _985 = _1441;
                if (_1399)
                {
                    float _1447 = _1431 + _1435;
                    _1437 = as_type<int>(_1447);
                }
                int _1449 = _1437;
                _983 = _1449;
                if (_1403)
                {
                    float _1451 = _1441 + _1445;
                    _985 = _1451;
                }
            }
            int _1453 = _983;
            float _1455 = _985;
            int _1457 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1459 = _1457 != 0;
            int _1461 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1463 = _1461 != 0;
            int _1465 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1467 = _1465 != 0;
            int _1469 = _1453;
            int _1471 = as_type<int>(_1455);
            if (_1463)
            {
                float _1473 = -as_type<float>(_1453);
                float _1475 = _1473 + 1.0;
                _1469 = as_type<int>(_1475);
            }
            int _1477 = _1469;
            if (_1467)
            {
                float _1479 = -_1455;
                float _1481 = _1479 + 1.0;
                _1471 = as_type<int>(_1481);
            }
            int _1483 = _1471;
            bool _1485 = !_1459;
            float _1487 = _1485 ? as_type<float>(_1477) : as_type<float>(_1483);
            bool _1489 = !_1459;
            float _1491 = _1489 ? as_type<float>(_1483) : as_type<float>(_1477);
            _987 = _1491;
            _989 = _1487;
        }
    }
    _1383 = false;
    float _1493 = _987;
    float _1495 = _989;
    int _1497 = _991;
    float _1499 = _1493 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1501 = _1493 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _1503 = _949 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1505 = _951 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1499);
    float _1509 = fma(_1495, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1501);
    float _1511 = _953 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1513 = _955 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1515 = _1507 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1517 = _1509 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    out.m_31.w = as_type<float>(_1497);
    float _1519 = -_1515;
    float _1521 = _1519 + 1.0;
    out.m_33.x = _1503;
    out.m_33.y = _1505;
    out.m_33.z = _1511;
    out.m_33.w = _1513;
    out.m_31.x = _1517;
    out.m_31.y = _1521;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1383 = false;
    bool _1205 = false;
    bool _1017 = false;
    bool _162 = false;
    bool _419 = false;
    bool _417 = false;
    bool _413 = false;
    bool _409 = false;
    bool _405 = false;
    bool _401 = false;
    bool _397 = false;
    bool _393 = false;
    bool _389 = false;
    bool _385 = false;
    bool _381 = false;
    bool _377 = false;
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
    float _116 = _97;
    float _118 = _87;
    float _120 = _97;
    float _122 = _87;
    float _124 = _49;
    float _126 = _55;
    float _128 = _53;
    bool _136;
    float _138;
    float _140;
    float _142;
    float _144;
    float _146;
    int _148;
    float _150;
    float _152;
    float _154;
    float _156;
    float _158;
    int _160;
    if (!_114)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        bool _134 = !_132;
        _136 = _132;
        if (!_134)
        {
            _138 = _49;
            _140 = _47;
            _142 = _49;
            _144 = _47;
            _146 = 1.0;
            _148 = 1065353216;
            _150 = _47;
            _152 = 255.0;
            _154 = 255.0;
            _156 = 255.0;
            _158 = 255.0;
            _160 = 1065353216;
            _162 = true;
        }
        else
        {
            float _164 = trunc(_47);
            int _166 = int(_164);
            float _168 = trunc(_49);
            int _170 = int(_168);
            int _172 = _170 << 1;
            int _174 = _172 + _166;
            int _176 = _174 << 4;
            bool _178 = _176 == 0;
            bool _180 = _176 == 16;
            bool _182 = _176 == 32;
            bool _184 = _176 == 48;
            float _186 = 0.0;
            float _188 = as_type<float>(_170);
            int _190 = _166;
            _152 = 255.0;
            _154 = 255.0;
            _156 = 255.0;
            _158 = 255.0;
            if (_178)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _192 = _186;
            float _194 = 0.0;
            float _196 = _192;
            if (_178)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _198 = _194;
            float _200 = 0.0;
            float _202 = _198;
            if (_178)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _204 = _200;
            float _206 = 0.0;
            float _208 = _204;
            if (_178)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _210 = _206;
            float _212 = _210;
            if (_178)
            {
                _116 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _214 = _116;
            int _216 = 0;
            float _218 = _214;
            if (_178)
            {
                _216 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _220 = _216;
            int _222 = _220;
            if (_178)
            {
                _118 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _224 = _118;
            float _226 = _224;
            if (_178)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _228 = _188;
            float _230 = _228;
            if (_178)
            {
                _190 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _232 = _190;
            int _234 = _232;
            if (_180)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _236 = _196;
            float _238 = _236;
            if (_180)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _240 = _202;
            float _242 = _240;
            if (_180)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _244 = _208;
            float _246 = _244;
            if (_180)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _248 = _212;
            float _250 = _248;
            if (_180)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _252 = _218;
            float _254 = _252;
            if (_180)
            {
                _222 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _256 = _222;
            int _258 = _256;
            if (_180)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _260 = _226;
            float _262 = _260;
            if (_180)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _264 = _230;
            float _266 = _264;
            if (_180)
            {
                _234 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _268 = _234;
            int _270 = _268;
            if (_182)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _272 = _238;
            float _274 = _272;
            if (_182)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _276 = _242;
            float _278 = _276;
            if (_182)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _280 = _246;
            float _282 = _280;
            if (_182)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _284 = _250;
            float _286 = _284;
            if (_182)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _288 = _254;
            float _290 = _288;
            if (_182)
            {
                _258 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _292 = _258;
            int _294 = _292;
            if (_182)
            {
                _262 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _296 = _262;
            float _298 = _296;
            if (_182)
            {
                _266 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _300 = _266;
            float _302 = _300;
            if (_182)
            {
                _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _304 = _270;
            int _306 = _304;
            if (_184)
            {
                _274 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _308 = _274;
            _144 = _308;
            if (_184)
            {
                _278 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _310 = _278;
            _142 = _310;
            if (_184)
            {
                _282 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _312 = _282;
            _146 = _312;
            if (_184)
            {
                _286 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _314 = _286;
            _140 = _314;
            if (_184)
            {
                _290 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _316 = _290;
            _138 = _316;
            if (_184)
            {
                _294 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _318 = _294;
            _148 = _318;
            if (_184)
            {
                _298 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _320 = _298;
            _150 = _320;
            if (_184)
            {
                _302 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _322 = _302;
            _124 = _322;
            if (_184)
            {
                _306 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
            int _324 = _306;
            _160 = _324;
            _162 = true;
        }
    }
    else
    {
        int _326 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _328 = _326 != 0;
        uint _331 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _333 = int(_331) & 15;
        bool _335 = !_328;
        _136 = _328;
        if (!_335)
        {
            uint _337 = min(uint(_333), 13u);
            float _339 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _341 = int(_337) << 2;
            uint _343 = uint(int(uint(_341) >> uint(2)));
            uint _345 = uint(int(uint(int(_343)) >> uint(2)));
            int _347 = int(_343) & 3;
            float _349 = (*spvDescriptorSet0.vp_c1)._m0[int(_345)][_347];
            float _351 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _353 = _339 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _355 = _339 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _357 = _351 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _359 = _351 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _361 = as_type<int>(_349) >> 31;
            bool _363 = as_type<int>(_349) == 1808;
            float _365 = _353;
            float _367 = _355;
            float _369 = _349;
            float _371 = as_type<float>(_361);
            float _373 = _359;
            if (!_363)
            {
                bool _375 = as_type<int>(_349) == 1856;
                _377 = _375;
                if (!_377)
                {
                    bool _379 = as_type<int>(_349) == 1920;
                    _381 = _379;
                    if (!_381)
                    {
                        bool _383 = as_type<int>(_349) == 1984;
                        _385 = _383;
                        if (!_385)
                        {
                            bool _387 = as_type<int>(_349) == 2064;
                            _389 = _387;
                            if (!_389)
                            {
                                bool _391 = as_type<int>(_349) == 2144;
                                _393 = _391;
                                if (!_393)
                                {
                                    bool _395 = as_type<int>(_349) == 2240;
                                    _397 = _395;
                                    if (!_397)
                                    {
                                        bool _399 = as_type<int>(_349) == 2320;
                                        _401 = _399;
                                        if (!_401)
                                        {
                                            bool _403 = as_type<int>(_349) == 2416;
                                            _405 = _403;
                                            if (!_405)
                                            {
                                                bool _407 = as_type<int>(_349) == 2480;
                                                _409 = _407;
                                                if (!_409)
                                                {
                                                    bool _411 = as_type<int>(_349) == 2560;
                                                    _413 = _411;
                                                    if (!_413)
                                                    {
                                                        bool _415 = as_type<int>(_349) == 2624;
                                                        _417 = _415;
                                                        if (!_417)
                                                        {
                                                            _419 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _425;
            float _427;
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
                                    if (!_401)
                                    {
                                        if (!_405)
                                        {
                                            if (!_409)
                                            {
                                                if (!_413)
                                                {
                                                    if (!_417)
                                                    {
                                                        if (!_419)
                                                        {
                                                            float _421 = _353 * _47;
                                                            float _423 = _357 * _49;
                                                            _425 = _423;
                                                            _427 = _421;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389) || _385) || _381) || _377)
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
                                    if ((!_401) || _377)
                                    {
                                        if ((!_405) || _377)
                                        {
                                            if ((!_409) || _377)
                                            {
                                                if ((!_413) || _377)
                                                {
                                                    if ((!_417) || _377)
                                                    {
                                                        if ((!_419) || _377)
                                                        {
                                                            _377 = false;
                                                            float _429 = -_355;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = _357 * _49;
                                                            float _435 = fma(_355, _47, _431);
                                                            _425 = _433;
                                                            _427 = _435;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389) || _385) || _381)
                {
                    if ((!_385) || _381)
                    {
                        if ((!_389) || _381)
                        {
                            if ((!_393) || _381)
                            {
                                if ((!_397) || _381)
                                {
                                    if ((!_401) || _381)
                                    {
                                        if ((!_405) || _381)
                                        {
                                            if ((!_409) || _381)
                                            {
                                                if ((!_413) || _381)
                                                {
                                                    if ((!_417) || _381)
                                                    {
                                                        if ((!_419) || _381)
                                                        {
                                                            _381 = false;
                                                            float _437 = -_359;
                                                            float _439 = _437 + 1.0;
                                                            float _441 = _353 * _47;
                                                            float _443 = fma(_359, _49, _439);
                                                            _425 = _443;
                                                            _427 = _441;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389) || _385)
                    {
                        if ((!_389) || _385)
                        {
                            if ((!_393) || _385)
                            {
                                if ((!_397) || _385)
                                {
                                    if ((!_401) || _385)
                                    {
                                        if ((!_405) || _385)
                                        {
                                            if ((!_409) || _385)
                                            {
                                                if ((!_413) || _385)
                                                {
                                                    if ((!_417) || _385)
                                                    {
                                                        if ((!_419) || _385)
                                                        {
                                                            _385 = false;
                                                            float _445 = -_355;
                                                            float _447 = _445 + 1.0;
                                                            float _449 = -_359;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = fma(_355, _47, _447);
                                                            float _455 = fma(_359, _49, _451);
                                                            _425 = _455;
                                                            _427 = _453;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389)
                        {
                            if ((!_393) || _389)
                            {
                                if ((!_397) || _389)
                                {
                                    if ((!_401) || _389)
                                    {
                                        if ((!_405) || _389)
                                        {
                                            if ((!_409) || _389)
                                            {
                                                if ((!_413) || _389)
                                                {
                                                    if ((!_417) || _389)
                                                    {
                                                        if ((!_419) || _389)
                                                        {
                                                            _389 = false;
                                                            float _457 = -_357;
                                                            float _459 = _457 + 1.0;
                                                            float _461 = -_359;
                                                            float _463 = _461 + _459;
                                                            float _465 = _353 * _47;
                                                            float _467 = fma(_463, _49, _357);
                                                            _425 = _467;
                                                            _427 = _465;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393)
                            {
                                if ((!_397) || _393)
                                {
                                    if ((!_401) || _393)
                                    {
                                        if ((!_405) || _393)
                                        {
                                            if ((!_409) || _393)
                                            {
                                                if ((!_413) || _393)
                                                {
                                                    if ((!_417) || _393)
                                                    {
                                                        if ((!_419) || _393)
                                                        {
                                                            _393 = false;
                                                            float _469 = -_357;
                                                            float _471 = _469 + 1.0;
                                                            float _473 = -_355;
                                                            float _475 = _473 + 1.0;
                                                            float _477 = -_359;
                                                            float _479 = _477 + _471;
                                                            float _481 = fma(_355, _47, _475);
                                                            float _483 = fma(_479, _49, _357);
                                                            _425 = _483;
                                                            _427 = _481;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397)
                                {
                                    if ((!_401) || _397)
                                    {
                                        if ((!_405) || _397)
                                        {
                                            if ((!_409) || _397)
                                            {
                                                if ((!_413) || _397)
                                                {
                                                    if ((!_417) || _397)
                                                    {
                                                        if ((!_419) || _397)
                                                        {
                                                            _397 = false;
                                                            float _485 = -_353;
                                                            float _487 = _485 + 1.0;
                                                            float _489 = -_355;
                                                            float _491 = _489 + _487;
                                                            float _493 = _357 * _49;
                                                            float _495 = fma(_491, _47, _353);
                                                            _425 = _493;
                                                            _427 = _495;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _419) || _417) || _413) || _409) || _405) || _401)
                                    {
                                        if ((!_405) || _401)
                                        {
                                            if ((!_409) || _401)
                                            {
                                                if ((!_413) || _401)
                                                {
                                                    if ((!_417) || _401)
                                                    {
                                                        if ((!_419) || _401)
                                                        {
                                                            _401 = false;
                                                            float _497 = -_353;
                                                            float _499 = _497 + 1.0;
                                                            float _501 = -_359;
                                                            float _503 = _501 + 1.0;
                                                            float _505 = -_355;
                                                            float _507 = _505 + _499;
                                                            float _509 = fma(_359, _49, _503);
                                                            float _511 = fma(_507, _47, _353);
                                                            _425 = _509;
                                                            _427 = _511;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _419) || _417) || _413) || _409) || _405)
                                        {
                                            if ((!_409) || _405)
                                            {
                                                if ((!_413) || _405)
                                                {
                                                    if ((!_417) || _405)
                                                    {
                                                        if ((!_419) || _405)
                                                        {
                                                            _405 = false;
                                                            float _513 = -_355;
                                                            float _515 = _513 + 1.0;
                                                            float _517 = _357 * _49;
                                                            float _519 = _515 * _47;
                                                            _425 = _517;
                                                            _427 = _519;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _419) || _417) || _413) || _409)
                                            {
                                                if ((!_413) || _409)
                                                {
                                                    if ((!_417) || _409)
                                                    {
                                                        if ((!_419) || _409)
                                                        {
                                                            _409 = false;
                                                            float _521 = -_355;
                                                            float _523 = _521 + 1.0;
                                                            float _525 = -_359;
                                                            float _527 = _525 + 1.0;
                                                            float _529 = fma(_355, _47, _523);
                                                            float _531 = _527 * _49;
                                                            _425 = _531;
                                                            _427 = _529;
                                                        }
                                                    }
                                                }
                                                if (((false || _419) || _417) || _413)
                                                {
                                                    if ((!_417) || _413)
                                                    {
                                                        if ((!_419) || _413)
                                                        {
                                                            _413 = false;
                                                            float _533 = -_357;
                                                            float _535 = _533 + 1.0;
                                                            float _537 = _353 * _47;
                                                            float _539 = fma(_535, _49, _357);
                                                            _425 = _539;
                                                            _427 = _537;
                                                        }
                                                    }
                                                    if ((false || _419) || _417)
                                                    {
                                                        if ((!_419) || _417)
                                                        {
                                                            _417 = false;
                                                            float _541 = -_353;
                                                            float _543 = _541 + 1.0;
                                                            float _545 = -_359;
                                                            float _547 = _545 + 1.0;
                                                            float _549 = fma(_543, _47, _353);
                                                            float _551 = fma(_359, _49, _547);
                                                            _425 = _551;
                                                            _427 = _549;
                                                        }
                                                        if (false || _419)
                                                        {
                                                            _419 = false;
                                                            bool _553 = _333 != 12;
                                                            if (!_553)
                                                            {
                                                                float _555 = -_357;
                                                                float _557 = _555 + 1.0;
                                                                _365 = _557;
                                                            }
                                                            float _559 = _365;
                                                            if (!_553)
                                                            {
                                                                float _561 = -_355;
                                                                float _563 = _561 + 1.0;
                                                                _367 = _563;
                                                            }
                                                            float _565 = _367;
                                                            if (_553)
                                                            {
                                                                _369 = 0.0;
                                                                _371 = 0.0;
                                                            }
                                                            float _567 = _369;
                                                            float _569 = _371;
                                                            float _571 = _569;
                                                            _425 = _567;
                                                            if (!_553)
                                                            {
                                                                float _573 = -_359;
                                                                float _575 = _573 + _559;
                                                                _373 = _575;
                                                            }
                                                            float _577 = _373;
                                                            if (!_553)
                                                            {
                                                                float _579 = _47 * _565;
                                                                _571 = _579;
                                                            }
                                                            float _581 = _571;
                                                            _427 = _581;
                                                            if (!_553)
                                                            {
                                                                float _583 = _49 * _577;
                                                                _425 = _583;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _585 = _425;
            float _587 = _427;
            float _589 = -_585;
            float _591 = _589 + 1.0;
            float _593 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _595 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _597 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _599 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _601 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _603 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _605 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _607 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _609 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].x, _593);
            float _611 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].x, _595);
            float _613 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].y, _597);
            float _615 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].y, _599);
            float _617 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].z, _601);
            float _619 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].z, _603);
            float _621 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].w, _605);
            float _623 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].w, _607);
            float _625 = _609 * _587;
            float _627 = _613 * _587;
            float _629 = _617 * _587;
            float _631 = -_587;
            float _633 = _631 + 1.0;
            float _635 = _623 * _587;
            float _637 = fma(_633, _611, _625);
            float _639 = fma(_633, _615, _627);
            float _641 = fma(_633, _619, _629);
            float _643 = fma(_633, _621, _635);
            _138 = _49;
            _140 = _47;
            _142 = _49;
            _144 = _47;
            _146 = 1.0;
            _148 = 1065353216;
            _150 = _47;
            _152 = _637;
            _154 = _639;
            _156 = _641;
            _158 = _643;
            _160 = 1065353216;
            _162 = true;
        }
        else
        {
            float _645 = trunc(_47);
            int _647 = int(_645);
            bool _649 = _333 != 13;
            float _651 = trunc(_49);
            int _653 = int(_651);
            int _655 = _653 << 1;
            int _657 = _655 + _647;
            int _659 = _657 << 4;
            bool _661 = _659 == 0;
            bool _663 = _659 == 16;
            bool _665 = _659 == 32;
            bool _667 = _659 == 48;
            float _669 = 0.0;
            if (_661)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _671 = _669;
            float _673 = 0.0;
            float _675 = _671;
            if (_661)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _677 = _673;
            float _679 = 0.0;
            float _681 = _677;
            if (_661)
            {
                _679 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _683 = _679;
            float _685 = 0.0;
            float _687 = _683;
            if (_661)
            {
                _685 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _689 = _685;
            float _691 = _689;
            if (_661)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _693 = _120;
            int _695 = 0;
            float _697 = _693;
            if (_661)
            {
                _695 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _699 = _695;
            int _701 = _699;
            if (_661)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _703 = _122;
            float _705 = 0.0;
            float _707 = _703;
            if (_661)
            {
                _705 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _709 = _705;
            int _711 = 0;
            float _713 = _709;
            if (_661)
            {
                _711 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _715 = _711;
            int _717 = _715;
            if (_663)
            {
                _675 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _719 = _675;
            float _721 = _719;
            if (_663)
            {
                _681 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _723 = _681;
            float _725 = _723;
            if (_663)
            {
                _687 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _727 = _687;
            float _729 = _727;
            if (_663)
            {
                _691 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _731 = _691;
            float _733 = _731;
            if (_663)
            {
                _697 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _735 = _697;
            float _737 = _735;
            if (_663)
            {
                _701 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _739 = _701;
            int _741 = _739;
            if (_663)
            {
                _707 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _743 = _707;
            float _745 = _743;
            if (_663)
            {
                _713 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _747 = _713;
            float _749 = _747;
            if (_663)
            {
                _717 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _751 = _717;
            int _753 = _751;
            if (_665)
            {
                _721 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _755 = _721;
            float _757 = _755;
            if (_665)
            {
                _725 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _759 = _725;
            float _761 = _759;
            if (_665)
            {
                _729 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _763 = _729;
            float _765 = _763;
            if (_665)
            {
                _733 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _767 = _733;
            float _769 = _767;
            if (_665)
            {
                _737 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _771 = _737;
            float _773 = _771;
            if (_665)
            {
                _741 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _775 = _741;
            int _777 = _775;
            if (_665)
            {
                _745 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _779 = _745;
            float _781 = _779;
            if (_665)
            {
                _749 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _783 = _749;
            float _785 = _783;
            if (_665)
            {
                _753 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _787 = _753;
            int _789 = _787;
            if (_667)
            {
                _757 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _791 = _757;
            _144 = _791;
            if (_667)
            {
                _761 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _793 = _761;
            _142 = _793;
            if (_667)
            {
                _765 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _795 = _765;
            _146 = _795;
            if (_667)
            {
                _769 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _797 = _769;
            _140 = _797;
            if (_667)
            {
                _773 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _799 = _773;
            _138 = _799;
            if (_667)
            {
                _777 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _801 = _777;
            _148 = _801;
            if (_667)
            {
                _781 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _803 = _781;
            _150 = _803;
            if (_667)
            {
                _785 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _805 = _785;
            if (_667)
            {
                _789 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
            int _807 = _789;
            if (!_649)
            {
                float _809 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _811 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _813 = _809 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _815 = -_813;
                float _817 = _815 + 1.0;
                float _819 = _811 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _821 = -_809;
                float _823 = fma(_821, (*spvDescriptorSet0.vp_c3)._m0[26].w, _817);
                float _825 = -_819;
                float _827 = _825 + 1.0;
                float _829 = fma(_823, _49, _813);
                float _831 = -_811;
                float _833 = fma(_831, (*spvDescriptorSet0.vp_c3)._m0[26].y, _827);
                float _835 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _837 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _839 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _841 = fma(_833, _47, _819);
                float _843 = -_829;
                float _845 = _843 + 1.0;
                float _847 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _849 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _851 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _853 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _855 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _857 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].x, _835);
                float _859 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].x, _837);
                float _861 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].y, _839);
                float _863 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].y, _847);
                float _865 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].z, _849);
                float _867 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].z, _851);
                float _869 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].w, _853);
                float _871 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].w, _855);
                float _873 = -_841;
                float _875 = _873 + 1.0;
                float _877 = _841 * _857;
                float _879 = _841 * _861;
                float _881 = _841 * _865;
                float _883 = _841 * _871;
                float _885 = fma(_875, _859, _877);
                float _887 = fma(_875, _863, _879);
                float _889 = fma(_875, _867, _881);
                float _891 = fma(_875, _869, _883);
                _124 = _805;
                _152 = _885;
                _154 = _887;
                _156 = _889;
                _158 = _891;
                _160 = _807;
                _162 = true;
            }
            else
            {
                int _893 = _657 << 4;
                int _895 = _893 + 464;
                uint _897 = uint(int(uint(_895) >> uint(2)));
                uint _899 = uint(int(uint(int(_897)) >> uint(2)));
                int _901 = int(_897) & 3;
                float _903 = (*spvDescriptorSet0.vp_c3)._m0[int(_899)][_901];
                int _905 = int(_897) + 1;
                uint _907 = uint(int(uint(_905) >> uint(2)));
                int _909 = _905 & 3;
                float _911 = (*spvDescriptorSet0.vp_c3)._m0[int(_907)][_909];
                int _913 = _895 + 8;
                uint _915 = uint(int(uint(_913) >> uint(2)));
                uint _917 = uint(int(uint(int(_915)) >> uint(2)));
                int _919 = int(_915) & 3;
                float _921 = (*spvDescriptorSet0.vp_c3)._m0[int(_917)][_919];
                int _923 = int(_915) + 1;
                uint _925 = uint(int(uint(_923) >> uint(2)));
                int _927 = _923 & 3;
                float _929 = (*spvDescriptorSet0.vp_c3)._m0[int(_925)][_927];
                _124 = _805;
                _152 = _903;
                _154 = _911;
                _156 = _921;
                _158 = _929;
                _160 = _807;
            }
        }
    }
    _162 = false;
    float _931 = _138;
    float _933 = _140;
    float _935 = _142;
    float _937 = _144;
    float _939 = _146;
    bool _941 = _136;
    int _943 = _148;
    float _945 = _150;
    float _947 = _124;
    float _949 = _152;
    float _951 = _154;
    float _953 = _156;
    float _955 = _158;
    int _957 = _160;
    bool _959 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _961 = !_959;
    float _963 = _935;
    float _965 = _933;
    float _967 = _931;
    float _969 = _937;
    float _971 = _935;
    float _973 = _933;
    float _975 = _931;
    int _977 = _943;
    float _979 = _945;
    float _981 = _947;
    int _983 = as_type<int>(_945);
    float _985 = _947;
    float _987 = _947;
    float _989 = _945;
    int _991 = _957;
    float _1011;
    int _1013;
    float _1015;
    if (!_961)
    {
        float _993 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _995 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _997 = _53 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _999 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _993);
        float _1001 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _995);
        float _1003 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[17].x, _997);
        float _1005 = _999 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _1007 = _1001 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _1009 = _1003 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _1011 = _1007;
        _1013 = as_type<int>(_1009);
        _1015 = _1005;
        _1017 = true;
    }
    else
    {
        int _1019 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1021 = _1019 != 0;
        if (!_1021)
        {
            _963 = _937;
        }
        float _1023 = _963;
        _1015 = _1023;
        if (!_1021)
        {
            _965 = _935;
        }
        float _1025 = _965;
        float _1027 = _1025;
        _1011 = _1025;
        if (!_1021)
        {
            _967 = _939;
        }
        float _1029 = _967;
        bool _1031 = !_1021;
        float _1033 = _1029;
        _1013 = as_type<int>(_1029);
        if (!_1031)
        {
            if (!_941)
            {
                _1027 = _937;
            }
            float _1035 = _1027;
            float _1037 = _1035;
            float _1039 = _1035;
            if (!_941)
            {
                _1033 = _935;
            }
            float _1041 = _1033;
            bool _1043 = !_941;
            float _1045 = _1041;
            int _1047 = as_type<int>(_1041);
            if (!_1043)
            {
                int _1049 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1051 = _1049 != 0;
                int _1053 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1055 = _1053 != 0;
                int _1057 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1059 = _1057 != 0;
                int _1061 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1063 = _1061 != 0;
                int _1065 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1067 = _1065 != 0;
                if (_1051)
                {
                    _1037 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1069 = _1037;
                float _1071 = _1069;
                if (_1051)
                {
                    _1045 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1073 = _1045;
                float _1075 = _1073;
                if (!_1051)
                {
                    _1071 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1077 = _1071;
                if (!_1051)
                {
                    _1075 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1079 = _1075;
                float _1081 = _1077 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1083 = _1079 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1063)
                {
                    float _1085 = _1081 * _937;
                    _969 = _1085;
                }
                float _1087 = _969;
                float _1089 = -_1081;
                float _1091 = _1089 + 1.0;
                float _1093 = _1087;
                if (_1067)
                {
                    float _1095 = _1083 * _935;
                    _971 = _1095;
                }
                float _1097 = _971;
                float _1099 = -_1083;
                float _1101 = _1099 + 1.0;
                int _1103 = as_type<int>(_1097);
                if (_1055)
                {
                    float _1105 = _1087 + _1091;
                    _1093 = _1105;
                }
                float _1107 = _1093;
                if (_1059)
                {
                    float _1109 = _1097 + _1101;
                    _1103 = as_type<int>(_1109);
                }
                int _1111 = _1103;
                _1047 = _1111;
                _1039 = _1107;
            }
            int _1113 = _1047;
            float _1115 = _1039;
            int _1117 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1119 = _1117 != 0;
            int _1121 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1123 = _1121 != 0;
            int _1125 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1127 = _1125 != 0;
            int _1129 = as_type<int>(_1115);
            int _1131 = _1113;
            _1013 = as_type<int>(_939);
            if (_1123)
            {
                float _1133 = -_1115;
                float _1135 = _1133 + 1.0;
                _1129 = as_type<int>(_1135);
            }
            int _1137 = _1129;
            if (_1127)
            {
                float _1139 = -as_type<float>(_1113);
                float _1141 = _1139 + 1.0;
                _1131 = as_type<int>(_1141);
            }
            int _1143 = _1131;
            bool _1145 = !_1119;
            float _1147 = _1145 ? as_type<float>(_1137) : as_type<float>(_1143);
            bool _1149 = !_1119;
            float _1151 = _1149 ? as_type<float>(_1143) : as_type<float>(_1137);
            _1011 = _1151;
            _1015 = _1147;
        }
    }
    _1017 = false;
    float _1153 = _1011;
    int _1155 = _1013;
    float _1157 = _1015;
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_1155);
    bool _1163 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _1165 = fma(_1157, (*spvDescriptorSet0.vp_c3)._m0[8].x, _1159);
    float _1167 = fma(_1157, (*spvDescriptorSet0.vp_c3)._m0[7].x, _1161);
    float _1169 = _1165 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _1171 = _1167 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _1173 = -_1169;
    float _1175 = _1173 + 1.0;
    out.m_27.x = _1171;
    out.m_27.y = _1175;
    bool _1177 = !_1163;
    float _1179 = _1171;
    float _1181 = as_type<float>(_1155);
    float _1201;
    float _1203;
    if (!_1177)
    {
        float _1183 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1185 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1187 = _53 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _1189 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _1183);
        float _1191 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1185);
        float _1193 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[21].x, _1187);
        float _1195 = _1189 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1197 = _1191 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _1199 = _1193 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _1201 = _1197;
        _977 = as_type<int>(_1199);
        _1203 = _1195;
        _1205 = true;
    }
    else
    {
        int _1207 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1209 = _1207 != 0;
        if (!_1209)
        {
            _1179 = _933;
        }
        float _1211 = _1179;
        float _1213 = _1211;
        _1203 = _1211;
        if (!_1209)
        {
            _1181 = _931;
        }
        float _1215 = _1181;
        bool _1217 = !_1209;
        float _1219 = _1215;
        _1201 = _1215;
        if (!_1217)
        {
            if (!_941)
            {
                _1213 = _933;
            }
            float _1221 = _1213;
            float _1223 = _1221;
            int _1225 = as_type<int>(_1221);
            if (!_941)
            {
                _1219 = _931;
            }
            float _1227 = _1219;
            bool _1229 = !_941;
            float _1231 = _1227;
            float _1233 = _1227;
            if (!_1229)
            {
                int _1235 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1237 = _1235 != 0;
                int _1239 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1241 = _1239 != 0;
                int _1243 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1245 = _1243 != 0;
                int _1247 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1249 = _1247 != 0;
                int _1251 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1253 = _1251 != 0;
                if (_1237)
                {
                    _1223 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1255 = _1223;
                float _1257 = _1255;
                if (_1237)
                {
                    _1231 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1259 = _1231;
                float _1261 = _1259;
                if (!_1237)
                {
                    _1257 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1263 = _1257;
                if (!_1237)
                {
                    _1261 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1265 = _1261;
                float _1267 = _1263 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1269 = _1265 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1249)
                {
                    float _1271 = _1267 * _933;
                    _973 = _1271;
                }
                float _1273 = _973;
                float _1275 = -_1267;
                float _1277 = _1275 + 1.0;
                int _1279 = as_type<int>(_1273);
                if (_1253)
                {
                    float _1281 = _1269 * _931;
                    _975 = _1281;
                }
                float _1283 = _975;
                float _1285 = -_1269;
                float _1287 = _1285 + 1.0;
                float _1289 = _1283;
                if (_1241)
                {
                    float _1291 = _1273 + _1277;
                    _1279 = as_type<int>(_1291);
                }
                int _1293 = _1279;
                if (_1245)
                {
                    float _1295 = _1283 + _1287;
                    _1289 = _1295;
                }
                float _1297 = _1289;
                _1225 = _1293;
                _1233 = _1297;
            }
            int _1299 = _1225;
            float _1301 = _1233;
            int _1303 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1305 = _1303 != 0;
            int _1307 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1309 = _1307 != 0;
            int _1311 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1313 = _1311 != 0;
            int _1315 = _1299;
            int _1317 = as_type<int>(_1301);
            if (_1309)
            {
                float _1319 = -as_type<float>(_1299);
                float _1321 = _1319 + 1.0;
                _1315 = as_type<int>(_1321);
            }
            int _1323 = _1315;
            if (_1313)
            {
                float _1325 = -_1301;
                float _1327 = _1325 + 1.0;
                _1317 = as_type<int>(_1327);
            }
            int _1329 = _1317;
            bool _1331 = !_1305;
            float _1333 = _1331 ? as_type<float>(_1323) : as_type<float>(_1329);
            bool _1335 = !_1305;
            float _1337 = _1335 ? as_type<float>(_1329) : as_type<float>(_1323);
            _1201 = _1337;
            _1203 = _1333;
        }
    }
    _1205 = false;
    float _1339 = _1201;
    int _1341 = _977;
    float _1343 = _1203;
    float _1345 = _1339 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_29.w = as_type<float>(_1341);
    bool _1349 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _1351 = fma(_1343, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1345);
    float _1353 = fma(_1343, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1347);
    float _1355 = _1351 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1357 = _1353 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1359 = -_1355;
    float _1361 = _1359 + 1.0;
    out.m_29.x = _1357;
    out.m_29.y = _1361;
    bool _1363 = !_1349;
    if (!_1363)
    {
        float _1365 = _53 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _1367 = _53 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _1369 = _53 * (*spvDescriptorSet0.vp_c3)._m0[25].y;
        float _1371 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[22].x, _1365);
        float _1373 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[23].x, _1367);
        float _1375 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[25].x, _1369);
        float _1377 = _1371 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _1379 = _1373 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        float _1381 = _1375 + (*spvDescriptorSet0.vp_c3)._m0[25].w;
        _987 = _1379;
        _989 = _1377;
        _991 = as_type<int>(_1381);
        _1383 = true;
    }
    else
    {
        int _1385 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1387 = _1385 != 0;
        bool _1389 = !_1387;
        if (!_1389)
        {
            bool _1391 = !_941;
            if (!_1391)
            {
                int _1393 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1395 = _1393 != 0;
                int _1397 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1399 = _1397 != 0;
                int _1401 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1403 = _1401 != 0;
                int _1405 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1407 = _1405 != 0;
                int _1409 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1411 = _1409 != 0;
                if (_1395)
                {
                    _126 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1413 = _126;
                float _1415 = _1413;
                if (_1395)
                {
                    _128 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1417 = _128;
                float _1419 = _1417;
                if (!_1395)
                {
                    _1415 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1421 = _1415;
                if (!_1395)
                {
                    _1419 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1423 = _1419;
                float _1425 = _1421 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1427 = _1423 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1407)
                {
                    float _1429 = _1425 * _945;
                    _979 = _1429;
                }
                float _1431 = _979;
                float _1433 = -_1425;
                float _1435 = _1433 + 1.0;
                int _1437 = as_type<int>(_1431);
                if (_1411)
                {
                    float _1439 = _1427 * _947;
                    _981 = _1439;
                }
                float _1441 = _981;
                float _1443 = -_1427;
                float _1445 = _1443 + 1.0;
                _985 = _1441;
                if (_1399)
                {
                    float _1447 = _1431 + _1435;
                    _1437 = as_type<int>(_1447);
                }
                int _1449 = _1437;
                _983 = _1449;
                if (_1403)
                {
                    float _1451 = _1441 + _1445;
                    _985 = _1451;
                }
            }
            int _1453 = _983;
            float _1455 = _985;
            int _1457 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1459 = _1457 != 0;
            int _1461 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1463 = _1461 != 0;
            int _1465 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1467 = _1465 != 0;
            int _1469 = _1453;
            int _1471 = as_type<int>(_1455);
            if (_1463)
            {
                float _1473 = -as_type<float>(_1453);
                float _1475 = _1473 + 1.0;
                _1469 = as_type<int>(_1475);
            }
            int _1477 = _1469;
            if (_1467)
            {
                float _1479 = -_1455;
                float _1481 = _1479 + 1.0;
                _1471 = as_type<int>(_1481);
            }
            int _1483 = _1471;
            bool _1485 = !_1459;
            float _1487 = _1485 ? as_type<float>(_1477) : as_type<float>(_1483);
            bool _1489 = !_1459;
            float _1491 = _1489 ? as_type<float>(_1483) : as_type<float>(_1477);
            _987 = _1491;
            _989 = _1487;
        }
    }
    _1383 = false;
    float _1493 = _987;
    float _1495 = _989;
    int _1497 = _991;
    float _1499 = _1493 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1501 = _1493 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _1503 = _949 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1505 = _951 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1499);
    float _1509 = fma(_1495, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1501);
    float _1511 = _953 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1513 = _955 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1515 = _1507 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1517 = _1509 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    out.m_31.w = as_type<float>(_1497);
    float _1519 = -_1515;
    float _1521 = _1519 + 1.0;
    out.m_33.x = _1503;
    out.m_33.y = _1505;
    out.m_33.z = _1511;
    out.m_33.w = _1513;
    out.m_31.x = _1517;
    out.m_31.y = _1521;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1383 = false;
    bool _1205 = false;
    bool _1017 = false;
    bool _162 = false;
    bool _419 = false;
    bool _417 = false;
    bool _413 = false;
    bool _409 = false;
    bool _405 = false;
    bool _401 = false;
    bool _397 = false;
    bool _393 = false;
    bool _389 = false;
    bool _385 = false;
    bool _381 = false;
    bool _377 = false;
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
    float _116 = _97;
    float _118 = _87;
    float _120 = _97;
    float _122 = _87;
    float _124 = _49;
    float _126 = _55;
    float _128 = _53;
    bool _136;
    float _138;
    float _140;
    float _142;
    float _144;
    float _146;
    int _148;
    float _150;
    float _152;
    float _154;
    float _156;
    float _158;
    int _160;
    if (!_114)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        bool _134 = !_132;
        _136 = _132;
        if (!_134)
        {
            _138 = _49;
            _140 = _47;
            _142 = _49;
            _144 = _47;
            _146 = 1.0;
            _148 = 1065353216;
            _150 = _47;
            _152 = 255.0;
            _154 = 255.0;
            _156 = 255.0;
            _158 = 255.0;
            _160 = 1065353216;
            _162 = true;
        }
        else
        {
            float _164 = trunc(_47);
            int _166 = int(_164);
            float _168 = trunc(_49);
            int _170 = int(_168);
            int _172 = _170 << 1;
            int _174 = _172 + _166;
            int _176 = _174 << 4;
            bool _178 = _176 == 0;
            bool _180 = _176 == 16;
            bool _182 = _176 == 32;
            bool _184 = _176 == 48;
            float _186 = 0.0;
            float _188 = as_type<float>(_170);
            int _190 = _166;
            _152 = 255.0;
            _154 = 255.0;
            _156 = 255.0;
            _158 = 255.0;
            if (_178)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _192 = _186;
            float _194 = 0.0;
            float _196 = _192;
            if (_178)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _198 = _194;
            float _200 = 0.0;
            float _202 = _198;
            if (_178)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _204 = _200;
            float _206 = 0.0;
            float _208 = _204;
            if (_178)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _210 = _206;
            float _212 = _210;
            if (_178)
            {
                _116 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _214 = _116;
            int _216 = 0;
            float _218 = _214;
            if (_178)
            {
                _216 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _220 = _216;
            int _222 = _220;
            if (_178)
            {
                _118 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _224 = _118;
            float _226 = _224;
            if (_178)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _228 = _188;
            float _230 = _228;
            if (_178)
            {
                _190 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _232 = _190;
            int _234 = _232;
            if (_180)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _236 = _196;
            float _238 = _236;
            if (_180)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _240 = _202;
            float _242 = _240;
            if (_180)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _244 = _208;
            float _246 = _244;
            if (_180)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _248 = _212;
            float _250 = _248;
            if (_180)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _252 = _218;
            float _254 = _252;
            if (_180)
            {
                _222 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _256 = _222;
            int _258 = _256;
            if (_180)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _260 = _226;
            float _262 = _260;
            if (_180)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _264 = _230;
            float _266 = _264;
            if (_180)
            {
                _234 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _268 = _234;
            int _270 = _268;
            if (_182)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _272 = _238;
            float _274 = _272;
            if (_182)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _276 = _242;
            float _278 = _276;
            if (_182)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _280 = _246;
            float _282 = _280;
            if (_182)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _284 = _250;
            float _286 = _284;
            if (_182)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _288 = _254;
            float _290 = _288;
            if (_182)
            {
                _258 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _292 = _258;
            int _294 = _292;
            if (_182)
            {
                _262 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _296 = _262;
            float _298 = _296;
            if (_182)
            {
                _266 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _300 = _266;
            float _302 = _300;
            if (_182)
            {
                _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _304 = _270;
            int _306 = _304;
            if (_184)
            {
                _274 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _308 = _274;
            _144 = _308;
            if (_184)
            {
                _278 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _310 = _278;
            _142 = _310;
            if (_184)
            {
                _282 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _312 = _282;
            _146 = _312;
            if (_184)
            {
                _286 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _314 = _286;
            _140 = _314;
            if (_184)
            {
                _290 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _316 = _290;
            _138 = _316;
            if (_184)
            {
                _294 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _318 = _294;
            _148 = _318;
            if (_184)
            {
                _298 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _320 = _298;
            _150 = _320;
            if (_184)
            {
                _302 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _322 = _302;
            _124 = _322;
            if (_184)
            {
                _306 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
            int _324 = _306;
            _160 = _324;
            _162 = true;
        }
    }
    else
    {
        int _326 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _328 = _326 != 0;
        uint _331 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _333 = int(_331) & 15;
        bool _335 = !_328;
        _136 = _328;
        if (!_335)
        {
            uint _337 = min(uint(_333), 13u);
            float _339 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _341 = int(_337) << 2;
            uint _343 = uint(int(uint(_341) >> uint(2)));
            uint _345 = uint(int(uint(int(_343)) >> uint(2)));
            int _347 = int(_343) & 3;
            float _349 = (*spvDescriptorSet0.vp_c1)._m0[int(_345)][_347];
            float _351 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _353 = _339 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _355 = _339 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _357 = _351 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _359 = _351 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _361 = as_type<int>(_349) >> 31;
            bool _363 = as_type<int>(_349) == 1808;
            float _365 = _353;
            float _367 = _355;
            float _369 = _349;
            float _371 = as_type<float>(_361);
            float _373 = _359;
            if (!_363)
            {
                bool _375 = as_type<int>(_349) == 1856;
                _377 = _375;
                if (!_377)
                {
                    bool _379 = as_type<int>(_349) == 1920;
                    _381 = _379;
                    if (!_381)
                    {
                        bool _383 = as_type<int>(_349) == 1984;
                        _385 = _383;
                        if (!_385)
                        {
                            bool _387 = as_type<int>(_349) == 2064;
                            _389 = _387;
                            if (!_389)
                            {
                                bool _391 = as_type<int>(_349) == 2144;
                                _393 = _391;
                                if (!_393)
                                {
                                    bool _395 = as_type<int>(_349) == 2240;
                                    _397 = _395;
                                    if (!_397)
                                    {
                                        bool _399 = as_type<int>(_349) == 2320;
                                        _401 = _399;
                                        if (!_401)
                                        {
                                            bool _403 = as_type<int>(_349) == 2416;
                                            _405 = _403;
                                            if (!_405)
                                            {
                                                bool _407 = as_type<int>(_349) == 2480;
                                                _409 = _407;
                                                if (!_409)
                                                {
                                                    bool _411 = as_type<int>(_349) == 2560;
                                                    _413 = _411;
                                                    if (!_413)
                                                    {
                                                        bool _415 = as_type<int>(_349) == 2624;
                                                        _417 = _415;
                                                        if (!_417)
                                                        {
                                                            _419 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _425;
            float _427;
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
                                    if (!_401)
                                    {
                                        if (!_405)
                                        {
                                            if (!_409)
                                            {
                                                if (!_413)
                                                {
                                                    if (!_417)
                                                    {
                                                        if (!_419)
                                                        {
                                                            float _421 = _353 * _47;
                                                            float _423 = _357 * _49;
                                                            _425 = _423;
                                                            _427 = _421;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389) || _385) || _381) || _377)
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
                                    if ((!_401) || _377)
                                    {
                                        if ((!_405) || _377)
                                        {
                                            if ((!_409) || _377)
                                            {
                                                if ((!_413) || _377)
                                                {
                                                    if ((!_417) || _377)
                                                    {
                                                        if ((!_419) || _377)
                                                        {
                                                            _377 = false;
                                                            float _429 = -_355;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = _357 * _49;
                                                            float _435 = fma(_355, _47, _431);
                                                            _425 = _433;
                                                            _427 = _435;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389) || _385) || _381)
                {
                    if ((!_385) || _381)
                    {
                        if ((!_389) || _381)
                        {
                            if ((!_393) || _381)
                            {
                                if ((!_397) || _381)
                                {
                                    if ((!_401) || _381)
                                    {
                                        if ((!_405) || _381)
                                        {
                                            if ((!_409) || _381)
                                            {
                                                if ((!_413) || _381)
                                                {
                                                    if ((!_417) || _381)
                                                    {
                                                        if ((!_419) || _381)
                                                        {
                                                            _381 = false;
                                                            float _437 = -_359;
                                                            float _439 = _437 + 1.0;
                                                            float _441 = _353 * _47;
                                                            float _443 = fma(_359, _49, _439);
                                                            _425 = _443;
                                                            _427 = _441;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389) || _385)
                    {
                        if ((!_389) || _385)
                        {
                            if ((!_393) || _385)
                            {
                                if ((!_397) || _385)
                                {
                                    if ((!_401) || _385)
                                    {
                                        if ((!_405) || _385)
                                        {
                                            if ((!_409) || _385)
                                            {
                                                if ((!_413) || _385)
                                                {
                                                    if ((!_417) || _385)
                                                    {
                                                        if ((!_419) || _385)
                                                        {
                                                            _385 = false;
                                                            float _445 = -_355;
                                                            float _447 = _445 + 1.0;
                                                            float _449 = -_359;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = fma(_355, _47, _447);
                                                            float _455 = fma(_359, _49, _451);
                                                            _425 = _455;
                                                            _427 = _453;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393) || _389)
                        {
                            if ((!_393) || _389)
                            {
                                if ((!_397) || _389)
                                {
                                    if ((!_401) || _389)
                                    {
                                        if ((!_405) || _389)
                                        {
                                            if ((!_409) || _389)
                                            {
                                                if ((!_413) || _389)
                                                {
                                                    if ((!_417) || _389)
                                                    {
                                                        if ((!_419) || _389)
                                                        {
                                                            _389 = false;
                                                            float _457 = -_357;
                                                            float _459 = _457 + 1.0;
                                                            float _461 = -_359;
                                                            float _463 = _461 + _459;
                                                            float _465 = _353 * _47;
                                                            float _467 = fma(_463, _49, _357);
                                                            _425 = _467;
                                                            _427 = _465;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397) || _393)
                            {
                                if ((!_397) || _393)
                                {
                                    if ((!_401) || _393)
                                    {
                                        if ((!_405) || _393)
                                        {
                                            if ((!_409) || _393)
                                            {
                                                if ((!_413) || _393)
                                                {
                                                    if ((!_417) || _393)
                                                    {
                                                        if ((!_419) || _393)
                                                        {
                                                            _393 = false;
                                                            float _469 = -_357;
                                                            float _471 = _469 + 1.0;
                                                            float _473 = -_355;
                                                            float _475 = _473 + 1.0;
                                                            float _477 = -_359;
                                                            float _479 = _477 + _471;
                                                            float _481 = fma(_355, _47, _475);
                                                            float _483 = fma(_479, _49, _357);
                                                            _425 = _483;
                                                            _427 = _481;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _419) || _417) || _413) || _409) || _405) || _401) || _397)
                                {
                                    if ((!_401) || _397)
                                    {
                                        if ((!_405) || _397)
                                        {
                                            if ((!_409) || _397)
                                            {
                                                if ((!_413) || _397)
                                                {
                                                    if ((!_417) || _397)
                                                    {
                                                        if ((!_419) || _397)
                                                        {
                                                            _397 = false;
                                                            float _485 = -_353;
                                                            float _487 = _485 + 1.0;
                                                            float _489 = -_355;
                                                            float _491 = _489 + _487;
                                                            float _493 = _357 * _49;
                                                            float _495 = fma(_491, _47, _353);
                                                            _425 = _493;
                                                            _427 = _495;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _419) || _417) || _413) || _409) || _405) || _401)
                                    {
                                        if ((!_405) || _401)
                                        {
                                            if ((!_409) || _401)
                                            {
                                                if ((!_413) || _401)
                                                {
                                                    if ((!_417) || _401)
                                                    {
                                                        if ((!_419) || _401)
                                                        {
                                                            _401 = false;
                                                            float _497 = -_353;
                                                            float _499 = _497 + 1.0;
                                                            float _501 = -_359;
                                                            float _503 = _501 + 1.0;
                                                            float _505 = -_355;
                                                            float _507 = _505 + _499;
                                                            float _509 = fma(_359, _49, _503);
                                                            float _511 = fma(_507, _47, _353);
                                                            _425 = _509;
                                                            _427 = _511;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _419) || _417) || _413) || _409) || _405)
                                        {
                                            if ((!_409) || _405)
                                            {
                                                if ((!_413) || _405)
                                                {
                                                    if ((!_417) || _405)
                                                    {
                                                        if ((!_419) || _405)
                                                        {
                                                            _405 = false;
                                                            float _513 = -_355;
                                                            float _515 = _513 + 1.0;
                                                            float _517 = _357 * _49;
                                                            float _519 = _515 * _47;
                                                            _425 = _517;
                                                            _427 = _519;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _419) || _417) || _413) || _409)
                                            {
                                                if ((!_413) || _409)
                                                {
                                                    if ((!_417) || _409)
                                                    {
                                                        if ((!_419) || _409)
                                                        {
                                                            _409 = false;
                                                            float _521 = -_355;
                                                            float _523 = _521 + 1.0;
                                                            float _525 = -_359;
                                                            float _527 = _525 + 1.0;
                                                            float _529 = fma(_355, _47, _523);
                                                            float _531 = _527 * _49;
                                                            _425 = _531;
                                                            _427 = _529;
                                                        }
                                                    }
                                                }
                                                if (((false || _419) || _417) || _413)
                                                {
                                                    if ((!_417) || _413)
                                                    {
                                                        if ((!_419) || _413)
                                                        {
                                                            _413 = false;
                                                            float _533 = -_357;
                                                            float _535 = _533 + 1.0;
                                                            float _537 = _353 * _47;
                                                            float _539 = fma(_535, _49, _357);
                                                            _425 = _539;
                                                            _427 = _537;
                                                        }
                                                    }
                                                    if ((false || _419) || _417)
                                                    {
                                                        if ((!_419) || _417)
                                                        {
                                                            _417 = false;
                                                            float _541 = -_353;
                                                            float _543 = _541 + 1.0;
                                                            float _545 = -_359;
                                                            float _547 = _545 + 1.0;
                                                            float _549 = fma(_543, _47, _353);
                                                            float _551 = fma(_359, _49, _547);
                                                            _425 = _551;
                                                            _427 = _549;
                                                        }
                                                        if (false || _419)
                                                        {
                                                            _419 = false;
                                                            bool _553 = _333 != 12;
                                                            if (!_553)
                                                            {
                                                                float _555 = -_357;
                                                                float _557 = _555 + 1.0;
                                                                _365 = _557;
                                                            }
                                                            float _559 = _365;
                                                            if (!_553)
                                                            {
                                                                float _561 = -_355;
                                                                float _563 = _561 + 1.0;
                                                                _367 = _563;
                                                            }
                                                            float _565 = _367;
                                                            if (_553)
                                                            {
                                                                _369 = 0.0;
                                                                _371 = 0.0;
                                                            }
                                                            float _567 = _369;
                                                            float _569 = _371;
                                                            float _571 = _569;
                                                            _425 = _567;
                                                            if (!_553)
                                                            {
                                                                float _573 = -_359;
                                                                float _575 = _573 + _559;
                                                                _373 = _575;
                                                            }
                                                            float _577 = _373;
                                                            if (!_553)
                                                            {
                                                                float _579 = _47 * _565;
                                                                _571 = _579;
                                                            }
                                                            float _581 = _571;
                                                            _427 = _581;
                                                            if (!_553)
                                                            {
                                                                float _583 = _49 * _577;
                                                                _425 = _583;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _585 = _425;
            float _587 = _427;
            float _589 = -_585;
            float _591 = _589 + 1.0;
            float _593 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _595 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _597 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _599 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _601 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _603 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _605 = _585 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _607 = _585 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _609 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].x, _593);
            float _611 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].x, _595);
            float _613 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].y, _597);
            float _615 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].y, _599);
            float _617 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].z, _601);
            float _619 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].z, _603);
            float _621 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[29].w, _605);
            float _623 = fma(_591, (*spvDescriptorSet0.vp_c3)._m0[30].w, _607);
            float _625 = _609 * _587;
            float _627 = _613 * _587;
            float _629 = _617 * _587;
            float _631 = -_587;
            float _633 = _631 + 1.0;
            float _635 = _623 * _587;
            float _637 = fma(_633, _611, _625);
            float _639 = fma(_633, _615, _627);
            float _641 = fma(_633, _619, _629);
            float _643 = fma(_633, _621, _635);
            _138 = _49;
            _140 = _47;
            _142 = _49;
            _144 = _47;
            _146 = 1.0;
            _148 = 1065353216;
            _150 = _47;
            _152 = _637;
            _154 = _639;
            _156 = _641;
            _158 = _643;
            _160 = 1065353216;
            _162 = true;
        }
        else
        {
            float _645 = trunc(_47);
            int _647 = int(_645);
            bool _649 = _333 != 13;
            float _651 = trunc(_49);
            int _653 = int(_651);
            int _655 = _653 << 1;
            int _657 = _655 + _647;
            int _659 = _657 << 4;
            bool _661 = _659 == 0;
            bool _663 = _659 == 16;
            bool _665 = _659 == 32;
            bool _667 = _659 == 48;
            float _669 = 0.0;
            if (_661)
            {
                _669 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _671 = _669;
            float _673 = 0.0;
            float _675 = _671;
            if (_661)
            {
                _673 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _677 = _673;
            float _679 = 0.0;
            float _681 = _677;
            if (_661)
            {
                _679 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _683 = _679;
            float _685 = 0.0;
            float _687 = _683;
            if (_661)
            {
                _685 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _689 = _685;
            float _691 = _689;
            if (_661)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _693 = _120;
            int _695 = 0;
            float _697 = _693;
            if (_661)
            {
                _695 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _699 = _695;
            int _701 = _699;
            if (_661)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _703 = _122;
            float _705 = 0.0;
            float _707 = _703;
            if (_661)
            {
                _705 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _709 = _705;
            int _711 = 0;
            float _713 = _709;
            if (_661)
            {
                _711 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _715 = _711;
            int _717 = _715;
            if (_663)
            {
                _675 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _719 = _675;
            float _721 = _719;
            if (_663)
            {
                _681 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _723 = _681;
            float _725 = _723;
            if (_663)
            {
                _687 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _727 = _687;
            float _729 = _727;
            if (_663)
            {
                _691 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _731 = _691;
            float _733 = _731;
            if (_663)
            {
                _697 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _735 = _697;
            float _737 = _735;
            if (_663)
            {
                _701 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _739 = _701;
            int _741 = _739;
            if (_663)
            {
                _707 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _743 = _707;
            float _745 = _743;
            if (_663)
            {
                _713 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _747 = _713;
            float _749 = _747;
            if (_663)
            {
                _717 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _751 = _717;
            int _753 = _751;
            if (_665)
            {
                _721 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _755 = _721;
            float _757 = _755;
            if (_665)
            {
                _725 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _759 = _725;
            float _761 = _759;
            if (_665)
            {
                _729 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _763 = _729;
            float _765 = _763;
            if (_665)
            {
                _733 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _767 = _733;
            float _769 = _767;
            if (_665)
            {
                _737 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _771 = _737;
            float _773 = _771;
            if (_665)
            {
                _741 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _775 = _741;
            int _777 = _775;
            if (_665)
            {
                _745 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _779 = _745;
            float _781 = _779;
            if (_665)
            {
                _749 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _783 = _749;
            float _785 = _783;
            if (_665)
            {
                _753 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _787 = _753;
            int _789 = _787;
            if (_667)
            {
                _757 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _791 = _757;
            _144 = _791;
            if (_667)
            {
                _761 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _793 = _761;
            _142 = _793;
            if (_667)
            {
                _765 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _795 = _765;
            _146 = _795;
            if (_667)
            {
                _769 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _797 = _769;
            _140 = _797;
            if (_667)
            {
                _773 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _799 = _773;
            _138 = _799;
            if (_667)
            {
                _777 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _801 = _777;
            _148 = _801;
            if (_667)
            {
                _781 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _803 = _781;
            _150 = _803;
            if (_667)
            {
                _785 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _805 = _785;
            if (_667)
            {
                _789 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
            int _807 = _789;
            if (!_649)
            {
                float _809 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _811 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _813 = _809 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _815 = -_813;
                float _817 = _815 + 1.0;
                float _819 = _811 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _821 = -_809;
                float _823 = fma(_821, (*spvDescriptorSet0.vp_c3)._m0[26].w, _817);
                float _825 = -_819;
                float _827 = _825 + 1.0;
                float _829 = fma(_823, _49, _813);
                float _831 = -_811;
                float _833 = fma(_831, (*spvDescriptorSet0.vp_c3)._m0[26].y, _827);
                float _835 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _837 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _839 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _841 = fma(_833, _47, _819);
                float _843 = -_829;
                float _845 = _843 + 1.0;
                float _847 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _849 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _851 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _853 = _829 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _855 = _829 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _857 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].x, _835);
                float _859 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].x, _837);
                float _861 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].y, _839);
                float _863 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].y, _847);
                float _865 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].z, _849);
                float _867 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].z, _851);
                float _869 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[29].w, _853);
                float _871 = fma(_845, (*spvDescriptorSet0.vp_c3)._m0[30].w, _855);
                float _873 = -_841;
                float _875 = _873 + 1.0;
                float _877 = _841 * _857;
                float _879 = _841 * _861;
                float _881 = _841 * _865;
                float _883 = _841 * _871;
                float _885 = fma(_875, _859, _877);
                float _887 = fma(_875, _863, _879);
                float _889 = fma(_875, _867, _881);
                float _891 = fma(_875, _869, _883);
                _124 = _805;
                _152 = _885;
                _154 = _887;
                _156 = _889;
                _158 = _891;
                _160 = _807;
                _162 = true;
            }
            else
            {
                int _893 = _657 << 4;
                int _895 = _893 + 464;
                uint _897 = uint(int(uint(_895) >> uint(2)));
                uint _899 = uint(int(uint(int(_897)) >> uint(2)));
                int _901 = int(_897) & 3;
                float _903 = (*spvDescriptorSet0.vp_c3)._m0[int(_899)][_901];
                int _905 = int(_897) + 1;
                uint _907 = uint(int(uint(_905) >> uint(2)));
                int _909 = _905 & 3;
                float _911 = (*spvDescriptorSet0.vp_c3)._m0[int(_907)][_909];
                int _913 = _895 + 8;
                uint _915 = uint(int(uint(_913) >> uint(2)));
                uint _917 = uint(int(uint(int(_915)) >> uint(2)));
                int _919 = int(_915) & 3;
                float _921 = (*spvDescriptorSet0.vp_c3)._m0[int(_917)][_919];
                int _923 = int(_915) + 1;
                uint _925 = uint(int(uint(_923) >> uint(2)));
                int _927 = _923 & 3;
                float _929 = (*spvDescriptorSet0.vp_c3)._m0[int(_925)][_927];
                _124 = _805;
                _152 = _903;
                _154 = _911;
                _156 = _921;
                _158 = _929;
                _160 = _807;
            }
        }
    }
    _162 = false;
    float _931 = _138;
    float _933 = _140;
    float _935 = _142;
    float _937 = _144;
    float _939 = _146;
    bool _941 = _136;
    int _943 = _148;
    float _945 = _150;
    float _947 = _124;
    float _949 = _152;
    float _951 = _154;
    float _953 = _156;
    float _955 = _158;
    int _957 = _160;
    bool _959 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _961 = !_959;
    float _963 = _935;
    float _965 = _933;
    float _967 = _931;
    float _969 = _937;
    float _971 = _935;
    float _973 = _933;
    float _975 = _931;
    int _977 = _943;
    float _979 = _945;
    float _981 = _947;
    int _983 = as_type<int>(_945);
    float _985 = _947;
    float _987 = _947;
    float _989 = _945;
    int _991 = _957;
    float _1011;
    int _1013;
    float _1015;
    if (!_961)
    {
        float _993 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _995 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _997 = _53 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _999 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _993);
        float _1001 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _995);
        float _1003 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[17].x, _997);
        float _1005 = _999 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _1007 = _1001 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _1009 = _1003 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _1011 = _1007;
        _1013 = as_type<int>(_1009);
        _1015 = _1005;
        _1017 = true;
    }
    else
    {
        int _1019 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1021 = _1019 != 0;
        if (!_1021)
        {
            _963 = _937;
        }
        float _1023 = _963;
        _1015 = _1023;
        if (!_1021)
        {
            _965 = _935;
        }
        float _1025 = _965;
        float _1027 = _1025;
        _1011 = _1025;
        if (!_1021)
        {
            _967 = _939;
        }
        float _1029 = _967;
        bool _1031 = !_1021;
        float _1033 = _1029;
        _1013 = as_type<int>(_1029);
        if (!_1031)
        {
            if (!_941)
            {
                _1027 = _937;
            }
            float _1035 = _1027;
            float _1037 = _1035;
            float _1039 = _1035;
            if (!_941)
            {
                _1033 = _935;
            }
            float _1041 = _1033;
            bool _1043 = !_941;
            float _1045 = _1041;
            int _1047 = as_type<int>(_1041);
            if (!_1043)
            {
                int _1049 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1051 = _1049 != 0;
                int _1053 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1055 = _1053 != 0;
                int _1057 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1059 = _1057 != 0;
                int _1061 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1063 = _1061 != 0;
                int _1065 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1067 = _1065 != 0;
                if (_1051)
                {
                    _1037 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1069 = _1037;
                float _1071 = _1069;
                if (_1051)
                {
                    _1045 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1073 = _1045;
                float _1075 = _1073;
                if (!_1051)
                {
                    _1071 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1077 = _1071;
                if (!_1051)
                {
                    _1075 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1079 = _1075;
                float _1081 = _1077 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1083 = _1079 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1063)
                {
                    float _1085 = _1081 * _937;
                    _969 = _1085;
                }
                float _1087 = _969;
                float _1089 = -_1081;
                float _1091 = _1089 + 1.0;
                float _1093 = _1087;
                if (_1067)
                {
                    float _1095 = _1083 * _935;
                    _971 = _1095;
                }
                float _1097 = _971;
                float _1099 = -_1083;
                float _1101 = _1099 + 1.0;
                int _1103 = as_type<int>(_1097);
                if (_1055)
                {
                    float _1105 = _1087 + _1091;
                    _1093 = _1105;
                }
                float _1107 = _1093;
                if (_1059)
                {
                    float _1109 = _1097 + _1101;
                    _1103 = as_type<int>(_1109);
                }
                int _1111 = _1103;
                _1047 = _1111;
                _1039 = _1107;
            }
            int _1113 = _1047;
            float _1115 = _1039;
            int _1117 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1119 = _1117 != 0;
            int _1121 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1123 = _1121 != 0;
            int _1125 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1127 = _1125 != 0;
            int _1129 = as_type<int>(_1115);
            int _1131 = _1113;
            _1013 = as_type<int>(_939);
            if (_1123)
            {
                float _1133 = -_1115;
                float _1135 = _1133 + 1.0;
                _1129 = as_type<int>(_1135);
            }
            int _1137 = _1129;
            if (_1127)
            {
                float _1139 = -as_type<float>(_1113);
                float _1141 = _1139 + 1.0;
                _1131 = as_type<int>(_1141);
            }
            int _1143 = _1131;
            bool _1145 = !_1119;
            float _1147 = _1145 ? as_type<float>(_1137) : as_type<float>(_1143);
            bool _1149 = !_1119;
            float _1151 = _1149 ? as_type<float>(_1143) : as_type<float>(_1137);
            _1011 = _1151;
            _1015 = _1147;
        }
    }
    _1017 = false;
    float _1153 = _1011;
    int _1155 = _1013;
    float _1157 = _1015;
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_1155);
    bool _1163 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _1165 = fma(_1157, (*spvDescriptorSet0.vp_c3)._m0[8].x, _1159);
    float _1167 = fma(_1157, (*spvDescriptorSet0.vp_c3)._m0[7].x, _1161);
    float _1169 = _1165 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _1171 = _1167 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _1173 = -_1169;
    float _1175 = _1173 + 1.0;
    out.m_27.x = _1171;
    out.m_27.y = _1175;
    bool _1177 = !_1163;
    float _1179 = _1171;
    float _1181 = as_type<float>(_1155);
    float _1201;
    float _1203;
    if (!_1177)
    {
        float _1183 = _53 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _1185 = _53 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _1187 = _53 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _1189 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[18].x, _1183);
        float _1191 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[19].x, _1185);
        float _1193 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[21].x, _1187);
        float _1195 = _1189 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _1197 = _1191 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _1199 = _1193 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _1201 = _1197;
        _977 = as_type<int>(_1199);
        _1203 = _1195;
        _1205 = true;
    }
    else
    {
        int _1207 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1209 = _1207 != 0;
        if (!_1209)
        {
            _1179 = _933;
        }
        float _1211 = _1179;
        float _1213 = _1211;
        _1203 = _1211;
        if (!_1209)
        {
            _1181 = _931;
        }
        float _1215 = _1181;
        bool _1217 = !_1209;
        float _1219 = _1215;
        _1201 = _1215;
        if (!_1217)
        {
            if (!_941)
            {
                _1213 = _933;
            }
            float _1221 = _1213;
            float _1223 = _1221;
            int _1225 = as_type<int>(_1221);
            if (!_941)
            {
                _1219 = _931;
            }
            float _1227 = _1219;
            bool _1229 = !_941;
            float _1231 = _1227;
            float _1233 = _1227;
            if (!_1229)
            {
                int _1235 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1237 = _1235 != 0;
                int _1239 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1241 = _1239 != 0;
                int _1243 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1245 = _1243 != 0;
                int _1247 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1249 = _1247 != 0;
                int _1251 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1253 = _1251 != 0;
                if (_1237)
                {
                    _1223 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1255 = _1223;
                float _1257 = _1255;
                if (_1237)
                {
                    _1231 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1259 = _1231;
                float _1261 = _1259;
                if (!_1237)
                {
                    _1257 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1263 = _1257;
                if (!_1237)
                {
                    _1261 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1265 = _1261;
                float _1267 = _1263 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1269 = _1265 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1249)
                {
                    float _1271 = _1267 * _933;
                    _973 = _1271;
                }
                float _1273 = _973;
                float _1275 = -_1267;
                float _1277 = _1275 + 1.0;
                int _1279 = as_type<int>(_1273);
                if (_1253)
                {
                    float _1281 = _1269 * _931;
                    _975 = _1281;
                }
                float _1283 = _975;
                float _1285 = -_1269;
                float _1287 = _1285 + 1.0;
                float _1289 = _1283;
                if (_1241)
                {
                    float _1291 = _1273 + _1277;
                    _1279 = as_type<int>(_1291);
                }
                int _1293 = _1279;
                if (_1245)
                {
                    float _1295 = _1283 + _1287;
                    _1289 = _1295;
                }
                float _1297 = _1289;
                _1225 = _1293;
                _1233 = _1297;
            }
            int _1299 = _1225;
            float _1301 = _1233;
            int _1303 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1305 = _1303 != 0;
            int _1307 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1309 = _1307 != 0;
            int _1311 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1313 = _1311 != 0;
            int _1315 = _1299;
            int _1317 = as_type<int>(_1301);
            if (_1309)
            {
                float _1319 = -as_type<float>(_1299);
                float _1321 = _1319 + 1.0;
                _1315 = as_type<int>(_1321);
            }
            int _1323 = _1315;
            if (_1313)
            {
                float _1325 = -_1301;
                float _1327 = _1325 + 1.0;
                _1317 = as_type<int>(_1327);
            }
            int _1329 = _1317;
            bool _1331 = !_1305;
            float _1333 = _1331 ? as_type<float>(_1323) : as_type<float>(_1329);
            bool _1335 = !_1305;
            float _1337 = _1335 ? as_type<float>(_1329) : as_type<float>(_1323);
            _1201 = _1337;
            _1203 = _1333;
        }
    }
    _1205 = false;
    float _1339 = _1201;
    int _1341 = _977;
    float _1343 = _1203;
    float _1345 = _1339 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_29.w = as_type<float>(_1341);
    bool _1349 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _1351 = fma(_1343, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1345);
    float _1353 = fma(_1343, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1347);
    float _1355 = _1351 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1357 = _1353 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1359 = -_1355;
    float _1361 = _1359 + 1.0;
    out.m_29.x = _1357;
    out.m_29.y = _1361;
    bool _1363 = !_1349;
    if (!_1363)
    {
        float _1365 = _53 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _1367 = _53 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _1369 = _53 * (*spvDescriptorSet0.vp_c3)._m0[25].y;
        float _1371 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[22].x, _1365);
        float _1373 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[23].x, _1367);
        float _1375 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[25].x, _1369);
        float _1377 = _1371 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _1379 = _1373 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        float _1381 = _1375 + (*spvDescriptorSet0.vp_c3)._m0[25].w;
        _987 = _1379;
        _989 = _1377;
        _991 = as_type<int>(_1381);
        _1383 = true;
    }
    else
    {
        int _1385 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _1387 = _1385 != 0;
        bool _1389 = !_1387;
        if (!_1389)
        {
            bool _1391 = !_941;
            if (!_1391)
            {
                int _1393 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _1395 = _1393 != 0;
                int _1397 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _1399 = _1397 != 0;
                int _1401 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1403 = _1401 != 0;
                int _1405 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1407 = _1405 != 0;
                int _1409 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1411 = _1409 != 0;
                if (_1395)
                {
                    _126 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1413 = _126;
                float _1415 = _1413;
                if (_1395)
                {
                    _128 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1417 = _128;
                float _1419 = _1417;
                if (!_1395)
                {
                    _1415 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1421 = _1415;
                if (!_1395)
                {
                    _1419 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1423 = _1419;
                float _1425 = _1421 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1427 = _1423 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1407)
                {
                    float _1429 = _1425 * _945;
                    _979 = _1429;
                }
                float _1431 = _979;
                float _1433 = -_1425;
                float _1435 = _1433 + 1.0;
                int _1437 = as_type<int>(_1431);
                if (_1411)
                {
                    float _1439 = _1427 * _947;
                    _981 = _1439;
                }
                float _1441 = _981;
                float _1443 = -_1427;
                float _1445 = _1443 + 1.0;
                _985 = _1441;
                if (_1399)
                {
                    float _1447 = _1431 + _1435;
                    _1437 = as_type<int>(_1447);
                }
                int _1449 = _1437;
                _983 = _1449;
                if (_1403)
                {
                    float _1451 = _1441 + _1445;
                    _985 = _1451;
                }
            }
            int _1453 = _983;
            float _1455 = _985;
            int _1457 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1459 = _1457 != 0;
            int _1461 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1463 = _1461 != 0;
            int _1465 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1467 = _1465 != 0;
            int _1469 = _1453;
            int _1471 = as_type<int>(_1455);
            if (_1463)
            {
                float _1473 = -as_type<float>(_1453);
                float _1475 = _1473 + 1.0;
                _1469 = as_type<int>(_1475);
            }
            int _1477 = _1469;
            if (_1467)
            {
                float _1479 = -_1455;
                float _1481 = _1479 + 1.0;
                _1471 = as_type<int>(_1481);
            }
            int _1483 = _1471;
            bool _1485 = !_1459;
            float _1487 = _1485 ? as_type<float>(_1477) : as_type<float>(_1483);
            bool _1489 = !_1459;
            float _1491 = _1489 ? as_type<float>(_1483) : as_type<float>(_1477);
            _987 = _1491;
            _989 = _1487;
        }
    }
    _1383 = false;
    float _1493 = _987;
    float _1495 = _989;
    int _1497 = _991;
    float _1499 = _1493 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1501 = _1493 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _1503 = _949 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _1505 = _951 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1499);
    float _1509 = fma(_1495, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1501);
    float _1511 = _953 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _1513 = _955 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1515 = _1507 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1517 = _1509 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    out.m_31.w = as_type<float>(_1497);
    float _1519 = -_1515;
    float _1521 = _1519 + 1.0;
    out.m_33.x = _1503;
    out.m_33.y = _1505;
    out.m_33.z = _1511;
    out.m_33.w = _1513;
    out.m_31.x = _1517;
    out.m_31.y = _1521;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

