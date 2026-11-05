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
    float4 m_27 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _885 = false;
    bool _707 = false;
    bool _150 = false;
    bool _327 = false;
    bool _325 = false;
    bool _321 = false;
    bool _317 = false;
    bool _313 = false;
    bool _309 = false;
    bool _305 = false;
    bool _301 = false;
    bool _297 = false;
    bool _293 = false;
    bool _289 = false;
    bool _285 = false;
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
    float _73 = _67 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _79 = _67 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].x, _73);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].z, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].z, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].z, _85);
    float _95 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].z, _87);
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _97;
    out.gl_Position.y = _99;
    out.gl_Position.z = _101;
    out.gl_Position.w = _103;
    int _106 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _110 = _106 != 0;
    bool _112 = !_110;
    float _114 = _89;
    float _116 = _91;
    float _118 = _67;
    float _120 = _97;
    float _122 = _99;
    float _124 = _47;
    float _126 = _45;
    bool _132;
    float _136;
    float _142;
    float _148;
    if (!_112)
    {
        int _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _130 = _128 != 0;
        _132 = _130;
        if (_130)
        {
            _114 = 255.0;
        }
        float _134 = _114;
        _136 = _134;
        if (_130)
        {
            _116 = _45;
        }
        float _138 = _116;
        float _140 = _138;
        _142 = _138;
        if (_130)
        {
            _118 = _47;
        }
        float _144 = _118;
        float _146 = _144;
        _148 = _144;
        _150 = _130;
        if (!_150)
        {
            float _152 = trunc(_45);
            int _154 = int(_152);
            float _156 = trunc(_47);
            int _158 = int(_156);
            int _160 = _158 << 1;
            int _162 = _160 + _154;
            int _164 = _162 << 4;
            bool _166 = _164 == 0;
            bool _168 = _164 == 16;
            bool _170 = _164 == 32;
            bool _172 = _164 == 48;
            float _174 = as_type<float>(_154);
            float _176 = as_type<float>(_158);
            _136 = 255.0;
            if (_166)
            {
                _140 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _178 = _140;
            float _180 = _178;
            if (_166)
            {
                _146 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _182 = _146;
            float _184 = _182;
            if (_166)
            {
                _174 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _186 = _174;
            float _188 = _186;
            if (_166)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _190 = _176;
            float _192 = _190;
            if (_168)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _194 = _180;
            float _196 = _194;
            if (_168)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _198 = _184;
            float _200 = _198;
            if (_168)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _202 = _188;
            float _204 = _202;
            if (_168)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _206 = _192;
            float _208 = _206;
            if (_170)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _210 = _196;
            float _212 = _210;
            if (_170)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _214 = _200;
            float _216 = _214;
            if (_170)
            {
                _204 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _218 = _204;
            float _220 = _218;
            if (_170)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _222 = _208;
            float _224 = _222;
            if (_172)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _226 = _212;
            _142 = _226;
            if (_172)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _228 = _216;
            _148 = _228;
            if (_172)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _230 = _220;
            _126 = _230;
            if (_172)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _232 = _224;
            _124 = _232;
            _150 = true;
        }
    }
    else
    {
        int _234 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _236 = _234 != 0;
        uint _239 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _241 = int(_239) & 15;
        bool _243 = !_236;
        float _245 = as_type<float>(_241);
        _132 = _236;
        if (!_243)
        {
            uint _247 = min(uint(_241), 13u);
            float _249 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _251 = int(_247) << 2;
            uint _253 = uint(int(uint(_251) >> uint(2)));
            uint _255 = uint(int(uint(int(_253)) >> uint(2)));
            int _257 = int(_253) & 3;
            float _259 = (*spvDescriptorSet0.vp_c1)._m0[int(_255)][_257];
            float _261 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _263 = _249 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _265 = _249 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _267 = _261 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _269 = _261 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _271 = as_type<int>(_259) >> 31;
            bool _273 = as_type<int>(_259) == 1280;
            float _275 = as_type<float>(_271);
            float _277 = _265;
            float _279 = _259;
            float _281 = _269;
            if (!_273)
            {
                bool _283 = as_type<int>(_259) == 1328;
                _285 = _283;
                if (!_285)
                {
                    bool _287 = as_type<int>(_259) == 1392;
                    _289 = _287;
                    if (!_289)
                    {
                        bool _291 = as_type<int>(_259) == 1456;
                        _293 = _291;
                        if (!_293)
                        {
                            bool _295 = as_type<int>(_259) == 1536;
                            _297 = _295;
                            if (!_297)
                            {
                                bool _299 = as_type<int>(_259) == 1616;
                                _301 = _299;
                                if (!_301)
                                {
                                    bool _303 = as_type<int>(_259) == 1712;
                                    _305 = _303;
                                    if (!_305)
                                    {
                                        bool _307 = as_type<int>(_259) == 1792;
                                        _309 = _307;
                                        if (!_309)
                                        {
                                            bool _311 = as_type<int>(_259) == 1888;
                                            _313 = _311;
                                            if (!_313)
                                            {
                                                bool _315 = as_type<int>(_259) == 1952;
                                                _317 = _315;
                                                if (!_317)
                                                {
                                                    bool _319 = as_type<int>(_259) == 2032;
                                                    _321 = _319;
                                                    if (!_321)
                                                    {
                                                        bool _323 = as_type<int>(_259) == 2096;
                                                        _325 = _323;
                                                        if (!_325)
                                                        {
                                                            _327 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _333;
            float _335;
            if (!_285)
            {
                if (!_289)
                {
                    if (!_293)
                    {
                        if (!_297)
                        {
                            if (!_301)
                            {
                                if (!_305)
                                {
                                    if (!_309)
                                    {
                                        if (!_313)
                                        {
                                            if (!_317)
                                            {
                                                if (!_321)
                                                {
                                                    if (!_325)
                                                    {
                                                        if (!_327)
                                                        {
                                                            float _329 = _263 * _45;
                                                            float _331 = _267 * _47;
                                                            _333 = _331;
                                                            _335 = _329;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289) || _285)
            {
                if ((!_289) || _285)
                {
                    if ((!_293) || _285)
                    {
                        if ((!_297) || _285)
                        {
                            if ((!_301) || _285)
                            {
                                if ((!_305) || _285)
                                {
                                    if ((!_309) || _285)
                                    {
                                        if ((!_313) || _285)
                                        {
                                            if ((!_317) || _285)
                                            {
                                                if ((!_321) || _285)
                                                {
                                                    if ((!_325) || _285)
                                                    {
                                                        if ((!_327) || _285)
                                                        {
                                                            _285 = false;
                                                            float _337 = -_265;
                                                            float _339 = _337 + 1.0;
                                                            float _341 = _267 * _47;
                                                            float _343 = fma(_265, _45, _339);
                                                            _333 = _341;
                                                            _335 = _343;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289)
                {
                    if ((!_293) || _289)
                    {
                        if ((!_297) || _289)
                        {
                            if ((!_301) || _289)
                            {
                                if ((!_305) || _289)
                                {
                                    if ((!_309) || _289)
                                    {
                                        if ((!_313) || _289)
                                        {
                                            if ((!_317) || _289)
                                            {
                                                if ((!_321) || _289)
                                                {
                                                    if ((!_325) || _289)
                                                    {
                                                        if ((!_327) || _289)
                                                        {
                                                            _289 = false;
                                                            float _345 = -_269;
                                                            float _347 = _345 + 1.0;
                                                            float _349 = _263 * _45;
                                                            float _351 = fma(_269, _47, _347);
                                                            _333 = _351;
                                                            _335 = _349;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293)
                    {
                        if ((!_297) || _293)
                        {
                            if ((!_301) || _293)
                            {
                                if ((!_305) || _293)
                                {
                                    if ((!_309) || _293)
                                    {
                                        if ((!_313) || _293)
                                        {
                                            if ((!_317) || _293)
                                            {
                                                if ((!_321) || _293)
                                                {
                                                    if ((!_325) || _293)
                                                    {
                                                        if ((!_327) || _293)
                                                        {
                                                            _293 = false;
                                                            float _353 = -_265;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = -_269;
                                                            float _359 = _357 + 1.0;
                                                            float _361 = fma(_265, _45, _355);
                                                            float _363 = fma(_269, _47, _359);
                                                            _333 = _363;
                                                            _335 = _361;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297)
                        {
                            if ((!_301) || _297)
                            {
                                if ((!_305) || _297)
                                {
                                    if ((!_309) || _297)
                                    {
                                        if ((!_313) || _297)
                                        {
                                            if ((!_317) || _297)
                                            {
                                                if ((!_321) || _297)
                                                {
                                                    if ((!_325) || _297)
                                                    {
                                                        if ((!_327) || _297)
                                                        {
                                                            _297 = false;
                                                            float _365 = -_267;
                                                            float _367 = _365 + 1.0;
                                                            float _369 = _263 * _45;
                                                            float _371 = -_269;
                                                            float _373 = _371 + _367;
                                                            float _375 = fma(_373, _47, _267);
                                                            _333 = _375;
                                                            _335 = _369;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301)
                            {
                                if ((!_305) || _301)
                                {
                                    if ((!_309) || _301)
                                    {
                                        if ((!_313) || _301)
                                        {
                                            if ((!_317) || _301)
                                            {
                                                if ((!_321) || _301)
                                                {
                                                    if ((!_325) || _301)
                                                    {
                                                        if ((!_327) || _301)
                                                        {
                                                            _301 = false;
                                                            float _377 = -_267;
                                                            float _379 = _377 + 1.0;
                                                            float _381 = -_265;
                                                            float _383 = _381 + 1.0;
                                                            float _385 = -_269;
                                                            float _387 = _385 + _379;
                                                            float _389 = fma(_265, _45, _383);
                                                            float _391 = fma(_387, _47, _267);
                                                            _333 = _391;
                                                            _335 = _389;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305)
                                {
                                    if ((!_309) || _305)
                                    {
                                        if ((!_313) || _305)
                                        {
                                            if ((!_317) || _305)
                                            {
                                                if ((!_321) || _305)
                                                {
                                                    if ((!_325) || _305)
                                                    {
                                                        if ((!_327) || _305)
                                                        {
                                                            _305 = false;
                                                            float _393 = -_263;
                                                            float _395 = _393 + 1.0;
                                                            float _397 = _267 * _47;
                                                            float _399 = -_265;
                                                            float _401 = _399 + _395;
                                                            float _403 = fma(_401, _45, _263);
                                                            _333 = _397;
                                                            _335 = _403;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _327) || _325) || _321) || _317) || _313) || _309)
                                    {
                                        if ((!_313) || _309)
                                        {
                                            if ((!_317) || _309)
                                            {
                                                if ((!_321) || _309)
                                                {
                                                    if ((!_325) || _309)
                                                    {
                                                        if ((!_327) || _309)
                                                        {
                                                            _309 = false;
                                                            float _405 = -_263;
                                                            float _407 = _405 + 1.0;
                                                            float _409 = -_269;
                                                            float _411 = _409 + 1.0;
                                                            float _413 = -_265;
                                                            float _415 = _413 + _407;
                                                            float _417 = fma(_269, _47, _411);
                                                            float _419 = fma(_415, _45, _263);
                                                            _333 = _417;
                                                            _335 = _419;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _327) || _325) || _321) || _317) || _313)
                                        {
                                            if ((!_317) || _313)
                                            {
                                                if ((!_321) || _313)
                                                {
                                                    if ((!_325) || _313)
                                                    {
                                                        if ((!_327) || _313)
                                                        {
                                                            _313 = false;
                                                            float _421 = -_265;
                                                            float _423 = _421 + 1.0;
                                                            float _425 = _267 * _47;
                                                            float _427 = _423 * _45;
                                                            _333 = _425;
                                                            _335 = _427;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _327) || _325) || _321) || _317)
                                            {
                                                if ((!_321) || _317)
                                                {
                                                    if ((!_325) || _317)
                                                    {
                                                        if ((!_327) || _317)
                                                        {
                                                            _317 = false;
                                                            float _429 = -_265;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = -_269;
                                                            float _435 = _433 + 1.0;
                                                            float _437 = fma(_265, _45, _431);
                                                            float _439 = _435 * _47;
                                                            _333 = _439;
                                                            _335 = _437;
                                                        }
                                                    }
                                                }
                                                if (((false || _327) || _325) || _321)
                                                {
                                                    if ((!_325) || _321)
                                                    {
                                                        if ((!_327) || _321)
                                                        {
                                                            _321 = false;
                                                            float _441 = -_267;
                                                            float _443 = _441 + 1.0;
                                                            float _445 = _263 * _45;
                                                            float _447 = fma(_443, _47, _267);
                                                            _333 = _447;
                                                            _335 = _445;
                                                        }
                                                    }
                                                    if ((false || _327) || _325)
                                                    {
                                                        if ((!_327) || _325)
                                                        {
                                                            _325 = false;
                                                            float _449 = -_263;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = -_269;
                                                            float _455 = _453 + 1.0;
                                                            float _457 = fma(_451, _45, _263);
                                                            float _459 = fma(_269, _47, _455);
                                                            _333 = _459;
                                                            _335 = _457;
                                                        }
                                                        if (false || _327)
                                                        {
                                                            _327 = false;
                                                            bool _461 = _241 != 12;
                                                            if (!_461)
                                                            {
                                                                float _463 = -_267;
                                                                float _465 = _463 + 1.0;
                                                                _275 = _465;
                                                            }
                                                            float _467 = _275;
                                                            if (!_461)
                                                            {
                                                                float _469 = -_265;
                                                                float _471 = _469 + 1.0;
                                                                _277 = _471;
                                                            }
                                                            float _473 = _277;
                                                            if (_461)
                                                            {
                                                                _279 = 0.0;
                                                            }
                                                            float _475 = _279;
                                                            float _477 = _475;
                                                            if (!_461)
                                                            {
                                                                float _479 = -_269;
                                                                float _481 = _479 + _467;
                                                                _281 = _481;
                                                            }
                                                            float _483 = _281;
                                                            if (_461)
                                                            {
                                                                _245 = 0.0;
                                                            }
                                                            float _485 = _245;
                                                            _333 = _485;
                                                            if (!_461)
                                                            {
                                                                float _487 = _45 * _473;
                                                                _477 = _487;
                                                            }
                                                            float _489 = _477;
                                                            _335 = _489;
                                                            if (!_461)
                                                            {
                                                                float _491 = _47 * _483;
                                                                _333 = _491;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _493 = _333;
            float _495 = _335;
            float _497 = -_493;
            float _499 = _497 + 1.0;
            float _501 = _493 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _503 = _493 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _505 = -_495;
            float _507 = _505 + 1.0;
            float _509 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[30].w, _501);
            float _511 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[29].w, _503);
            float _513 = _509 * _495;
            float _515 = fma(_507, _511, _513);
            _142 = _45;
            _148 = _47;
            _136 = _515;
            _150 = true;
        }
        else
        {
            float _517 = trunc(_45);
            int _519 = int(_517);
            bool _521 = _241 != 13;
            float _523 = trunc(_47);
            int _525 = int(_523);
            int _527 = _525 << 1;
            int _529 = _527 + _519;
            int _531 = _529 << 4;
            bool _533 = _531 == 0;
            bool _535 = _531 == 16;
            bool _537 = _531 == 32;
            bool _539 = _531 == 48;
            float _541 = as_type<float>(_525);
            float _543 = as_type<float>(_531);
            if (_533)
            {
                _541 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _545 = _541;
            float _547 = _545;
            if (_533)
            {
                _543 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _549 = _543;
            float _551 = _549;
            if (_533)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _553 = _120;
            float _555 = _553;
            if (_533)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _557 = _122;
            float _559 = _557;
            if (_535)
            {
                _547 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _561 = _547;
            float _563 = _561;
            if (_535)
            {
                _551 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _565 = _551;
            float _567 = _565;
            if (_535)
            {
                _555 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _569 = _555;
            float _571 = _569;
            if (_535)
            {
                _559 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _573 = _559;
            float _575 = _573;
            if (_537)
            {
                _563 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _577 = _563;
            float _579 = _577;
            if (_537)
            {
                _567 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _581 = _567;
            float _583 = _581;
            if (_537)
            {
                _571 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _585 = _571;
            float _587 = _585;
            if (_537)
            {
                _575 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _589 = _575;
            float _591 = _589;
            if (_539)
            {
                _579 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _593 = _579;
            _142 = _593;
            if (_539)
            {
                _583 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _595 = _583;
            _148 = _595;
            if (_539)
            {
                _587 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _597 = _587;
            if (_539)
            {
                _591 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _599 = _591;
            if (!_521)
            {
                float _601 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _603 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _605 = _601 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _607 = -_605;
                float _609 = _607 + 1.0;
                float _611 = _603 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _613 = -_601;
                float _615 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[26].w, _609);
                float _617 = -_611;
                float _619 = _617 + 1.0;
                float _621 = fma(_615, _47, _605);
                float _623 = -_603;
                float _625 = fma(_623, (*spvDescriptorSet0.vp_c3)._m0[26].y, _619);
                float _627 = -_621;
                float _629 = _627 + 1.0;
                float _631 = _621 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _633 = _621 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _635 = fma(_625, _45, _611);
                float _637 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[30].w, _631);
                float _639 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[29].w, _633);
                float _641 = -_635;
                float _643 = _641 + 1.0;
                float _645 = _635 * _637;
                float _647 = fma(_643, _639, _645);
                _124 = _599;
                _126 = _597;
                _136 = _647;
                _150 = true;
            }
            else
            {
                int _649 = _529 << 4;
                int _651 = _649 + 464;
                int _653 = _651 + 12;
                uint _655 = uint(int(uint(_653) >> uint(2)));
                uint _657 = uint(int(uint(int(_655)) >> uint(2)));
                int _659 = int(_655) & 3;
                float _661 = (*spvDescriptorSet0.vp_c3)._m0[int(_657)][_659];
                _124 = _599;
                _126 = _597;
                _136 = _661;
            }
        }
    }
    _150 = false;
    float _663 = _124;
    float _665 = _126;
    float _667 = _142;
    float _669 = _148;
    bool _671 = _132;
    float _673 = _136;
    bool _675 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _677 = !_675;
    float _679 = _663;
    float _681 = _665;
    float _683 = _667;
    float _685 = _669;
    float _687 = _665;
    float _689 = _663;
    float _703;
    float _705;
    if (!_677)
    {
        float _691 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _693 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _695 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _691);
        float _697 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _693);
        float _699 = _695 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _701 = _697 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _703 = _701;
        _705 = _699;
        _707 = true;
    }
    else
    {
        int _709 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _711 = _709 != 0;
        if (!_711)
        {
            _679 = _667;
        }
        float _713 = _679;
        float _715 = _713;
        _705 = _713;
        if (!_711)
        {
            _681 = _669;
        }
        float _717 = _681;
        bool _719 = !_711;
        float _721 = _717;
        _703 = _717;
        if (!_719)
        {
            if (!_671)
            {
                _715 = _667;
            }
            float _723 = _715;
            float _725 = _723;
            int _727 = as_type<int>(_723);
            if (!_671)
            {
                _721 = _669;
            }
            float _729 = _721;
            bool _731 = !_671;
            float _733 = _729;
            float _735 = _729;
            if (!_731)
            {
                int _737 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _739 = _737 != 0;
                int _741 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _743 = _741 != 0;
                int _745 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _747 = _745 != 0;
                int _749 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _751 = _749 != 0;
                int _753 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _755 = _753 != 0;
                if (_739)
                {
                    _725 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _757 = _725;
                float _759 = _757;
                if (_739)
                {
                    _733 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _761 = _733;
                float _763 = _761;
                if (!_739)
                {
                    _759 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _765 = _759;
                if (!_739)
                {
                    _763 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _767 = _763;
                float _769 = _765 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _771 = _767 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_751)
                {
                    float _773 = _769 * _667;
                    _683 = _773;
                }
                float _775 = _683;
                float _777 = -_769;
                float _779 = _777 + 1.0;
                int _781 = as_type<int>(_775);
                if (_755)
                {
                    float _783 = _771 * _669;
                    _685 = _783;
                }
                float _785 = _685;
                float _787 = -_771;
                float _789 = _787 + 1.0;
                float _791 = _785;
                if (_743)
                {
                    float _793 = _775 + _779;
                    _781 = as_type<int>(_793);
                }
                int _795 = _781;
                if (_747)
                {
                    float _797 = _785 + _789;
                    _791 = _797;
                }
                float _799 = _791;
                _727 = _795;
                _735 = _799;
            }
            int _801 = _727;
            float _803 = _735;
            int _805 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _807 = _805 != 0;
            int _809 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _811 = _809 != 0;
            int _813 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _815 = _813 != 0;
            int _817 = _801;
            int _819 = as_type<int>(_803);
            if (_811)
            {
                float _821 = -as_type<float>(_801);
                float _823 = _821 + 1.0;
                _817 = as_type<int>(_823);
            }
            int _825 = _817;
            if (_815)
            {
                float _827 = -_803;
                float _829 = _827 + 1.0;
                _819 = as_type<int>(_829);
            }
            int _831 = _819;
            bool _833 = !_807;
            float _835 = _833 ? as_type<float>(_825) : as_type<float>(_831);
            bool _837 = !_807;
            float _839 = _837 ? as_type<float>(_831) : as_type<float>(_825);
            _703 = _839;
            _705 = _835;
        }
    }
    _707 = false;
    float _841 = _703;
    float _843 = _705;
    float _845 = _841 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _847 = _841 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _849 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _851 = fma(_843, (*spvDescriptorSet0.vp_c3)._m0[8].x, _845);
    float _853 = fma(_843, (*spvDescriptorSet0.vp_c3)._m0[7].x, _847);
    float _855 = _851 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _857 = _853 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _859 = -_855;
    float _861 = _859 + 1.0;
    out.m_27.x = _857;
    out.m_27.y = _861;
    bool _863 = !_849;
    float _865 = _861;
    float _867 = _857;
    float _881;
    float _883;
    if (!_863)
    {
        float _869 = _51 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _871 = _51 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _873 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[18].x, _869);
        float _875 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[19].x, _871);
        float _877 = _873 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _879 = _875 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _881 = _879;
        _883 = _877;
        _885 = true;
    }
    else
    {
        int _887 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _889 = _887 != 0;
        if (!_889)
        {
            _865 = _665;
        }
        float _891 = _865;
        float _893 = _891;
        _883 = _891;
        if (!_889)
        {
            _867 = _663;
        }
        float _895 = _867;
        bool _897 = !_889;
        float _899 = _895;
        _881 = _895;
        if (!_897)
        {
            if (!_671)
            {
                _893 = _665;
            }
            float _901 = _893;
            float _903 = _901;
            int _905 = as_type<int>(_901);
            if (!_671)
            {
                _899 = _663;
            }
            float _907 = _899;
            bool _909 = !_671;
            float _911 = _907;
            float _913 = _907;
            if (!_909)
            {
                int _915 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _917 = _915 != 0;
                int _919 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _921 = _919 != 0;
                int _923 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _925 = _923 != 0;
                int _927 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _929 = _927 != 0;
                int _931 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _933 = _931 != 0;
                if (_917)
                {
                    _903 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _935 = _903;
                float _937 = _935;
                if (_917)
                {
                    _911 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _939 = _911;
                float _941 = _939;
                if (!_917)
                {
                    _937 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _943 = _937;
                if (!_917)
                {
                    _941 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _945 = _941;
                float _947 = _943 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _949 = _945 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_929)
                {
                    float _951 = _947 * _665;
                    _687 = _951;
                }
                float _953 = _687;
                float _955 = -_947;
                float _957 = _955 + 1.0;
                int _959 = as_type<int>(_953);
                if (_933)
                {
                    float _961 = _949 * _663;
                    _689 = _961;
                }
                float _963 = _689;
                float _965 = -_949;
                float _967 = _965 + 1.0;
                float _969 = _963;
                if (_921)
                {
                    float _971 = _953 + _957;
                    _959 = as_type<int>(_971);
                }
                int _973 = _959;
                if (_925)
                {
                    float _975 = _963 + _967;
                    _969 = _975;
                }
                float _977 = _969;
                _905 = _973;
                _913 = _977;
            }
            int _979 = _905;
            float _981 = _913;
            int _983 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _985 = _983 != 0;
            int _987 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _989 = _987 != 0;
            int _991 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _993 = _991 != 0;
            int _995 = _979;
            int _997 = as_type<int>(_981);
            if (_989)
            {
                float _999 = -as_type<float>(_979);
                float _1001 = _999 + 1.0;
                _995 = as_type<int>(_1001);
            }
            int _1003 = _995;
            if (_993)
            {
                float _1005 = -_981;
                float _1007 = _1005 + 1.0;
                _997 = as_type<int>(_1007);
            }
            int _1009 = _997;
            bool _1011 = !_985;
            float _1013 = _1011 ? as_type<float>(_1003) : as_type<float>(_1009);
            bool _1015 = !_985;
            float _1017 = _1015 ? as_type<float>(_1009) : as_type<float>(_1003);
            _881 = _1017;
            _883 = _1013;
        }
    }
    _885 = false;
    float _1019 = _881;
    float _1021 = _883;
    float _1023 = _1019 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1025 = _1019 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1027 = _673 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1029 = fma(_1021, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1023);
    float _1031 = fma(_1021, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1025);
    out.m_29.w = _1027;
    float _1033 = _1029 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1035 = _1031 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1037 = -_1033;
    float _1039 = _1037 + 1.0;
    out.m_31.x = _1035;
    out.m_31.y = _1039;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _885 = false;
    bool _707 = false;
    bool _150 = false;
    bool _327 = false;
    bool _325 = false;
    bool _321 = false;
    bool _317 = false;
    bool _313 = false;
    bool _309 = false;
    bool _305 = false;
    bool _301 = false;
    bool _297 = false;
    bool _293 = false;
    bool _289 = false;
    bool _285 = false;
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
    float _73 = _67 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _79 = _67 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].x, _73);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].z, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].z, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].z, _85);
    float _95 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].z, _87);
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _97;
    out.gl_Position.y = _99;
    out.gl_Position.z = _101;
    out.gl_Position.w = _103;
    int _106 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _110 = _106 != 0;
    bool _112 = !_110;
    float _114 = _89;
    float _116 = _91;
    float _118 = _67;
    float _120 = _97;
    float _122 = _99;
    float _124 = _47;
    float _126 = _45;
    bool _132;
    float _136;
    float _142;
    float _148;
    if (!_112)
    {
        int _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _130 = _128 != 0;
        _132 = _130;
        if (_130)
        {
            _114 = 255.0;
        }
        float _134 = _114;
        _136 = _134;
        if (_130)
        {
            _116 = _45;
        }
        float _138 = _116;
        float _140 = _138;
        _142 = _138;
        if (_130)
        {
            _118 = _47;
        }
        float _144 = _118;
        float _146 = _144;
        _148 = _144;
        _150 = _130;
        if (!_150)
        {
            float _152 = trunc(_45);
            int _154 = int(_152);
            float _156 = trunc(_47);
            int _158 = int(_156);
            int _160 = _158 << 1;
            int _162 = _160 + _154;
            int _164 = _162 << 4;
            bool _166 = _164 == 0;
            bool _168 = _164 == 16;
            bool _170 = _164 == 32;
            bool _172 = _164 == 48;
            float _174 = as_type<float>(_154);
            float _176 = as_type<float>(_158);
            _136 = 255.0;
            if (_166)
            {
                _140 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _178 = _140;
            float _180 = _178;
            if (_166)
            {
                _146 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _182 = _146;
            float _184 = _182;
            if (_166)
            {
                _174 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _186 = _174;
            float _188 = _186;
            if (_166)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _190 = _176;
            float _192 = _190;
            if (_168)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _194 = _180;
            float _196 = _194;
            if (_168)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _198 = _184;
            float _200 = _198;
            if (_168)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _202 = _188;
            float _204 = _202;
            if (_168)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _206 = _192;
            float _208 = _206;
            if (_170)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _210 = _196;
            float _212 = _210;
            if (_170)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _214 = _200;
            float _216 = _214;
            if (_170)
            {
                _204 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _218 = _204;
            float _220 = _218;
            if (_170)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _222 = _208;
            float _224 = _222;
            if (_172)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _226 = _212;
            _142 = _226;
            if (_172)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _228 = _216;
            _148 = _228;
            if (_172)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _230 = _220;
            _126 = _230;
            if (_172)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _232 = _224;
            _124 = _232;
            _150 = true;
        }
    }
    else
    {
        int _234 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _236 = _234 != 0;
        uint _239 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _241 = int(_239) & 15;
        bool _243 = !_236;
        float _245 = as_type<float>(_241);
        _132 = _236;
        if (!_243)
        {
            uint _247 = min(uint(_241), 13u);
            float _249 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _251 = int(_247) << 2;
            uint _253 = uint(int(uint(_251) >> uint(2)));
            uint _255 = uint(int(uint(int(_253)) >> uint(2)));
            int _257 = int(_253) & 3;
            float _259 = (*spvDescriptorSet0.vp_c1)._m0[int(_255)][_257];
            float _261 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _263 = _249 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _265 = _249 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _267 = _261 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _269 = _261 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _271 = as_type<int>(_259) >> 31;
            bool _273 = as_type<int>(_259) == 1280;
            float _275 = as_type<float>(_271);
            float _277 = _265;
            float _279 = _259;
            float _281 = _269;
            if (!_273)
            {
                bool _283 = as_type<int>(_259) == 1328;
                _285 = _283;
                if (!_285)
                {
                    bool _287 = as_type<int>(_259) == 1392;
                    _289 = _287;
                    if (!_289)
                    {
                        bool _291 = as_type<int>(_259) == 1456;
                        _293 = _291;
                        if (!_293)
                        {
                            bool _295 = as_type<int>(_259) == 1536;
                            _297 = _295;
                            if (!_297)
                            {
                                bool _299 = as_type<int>(_259) == 1616;
                                _301 = _299;
                                if (!_301)
                                {
                                    bool _303 = as_type<int>(_259) == 1712;
                                    _305 = _303;
                                    if (!_305)
                                    {
                                        bool _307 = as_type<int>(_259) == 1792;
                                        _309 = _307;
                                        if (!_309)
                                        {
                                            bool _311 = as_type<int>(_259) == 1888;
                                            _313 = _311;
                                            if (!_313)
                                            {
                                                bool _315 = as_type<int>(_259) == 1952;
                                                _317 = _315;
                                                if (!_317)
                                                {
                                                    bool _319 = as_type<int>(_259) == 2032;
                                                    _321 = _319;
                                                    if (!_321)
                                                    {
                                                        bool _323 = as_type<int>(_259) == 2096;
                                                        _325 = _323;
                                                        if (!_325)
                                                        {
                                                            _327 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _333;
            float _335;
            if (!_285)
            {
                if (!_289)
                {
                    if (!_293)
                    {
                        if (!_297)
                        {
                            if (!_301)
                            {
                                if (!_305)
                                {
                                    if (!_309)
                                    {
                                        if (!_313)
                                        {
                                            if (!_317)
                                            {
                                                if (!_321)
                                                {
                                                    if (!_325)
                                                    {
                                                        if (!_327)
                                                        {
                                                            float _329 = _263 * _45;
                                                            float _331 = _267 * _47;
                                                            _333 = _331;
                                                            _335 = _329;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289) || _285)
            {
                if ((!_289) || _285)
                {
                    if ((!_293) || _285)
                    {
                        if ((!_297) || _285)
                        {
                            if ((!_301) || _285)
                            {
                                if ((!_305) || _285)
                                {
                                    if ((!_309) || _285)
                                    {
                                        if ((!_313) || _285)
                                        {
                                            if ((!_317) || _285)
                                            {
                                                if ((!_321) || _285)
                                                {
                                                    if ((!_325) || _285)
                                                    {
                                                        if ((!_327) || _285)
                                                        {
                                                            _285 = false;
                                                            float _337 = -_265;
                                                            float _339 = _337 + 1.0;
                                                            float _341 = _267 * _47;
                                                            float _343 = fma(_265, _45, _339);
                                                            _333 = _341;
                                                            _335 = _343;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289)
                {
                    if ((!_293) || _289)
                    {
                        if ((!_297) || _289)
                        {
                            if ((!_301) || _289)
                            {
                                if ((!_305) || _289)
                                {
                                    if ((!_309) || _289)
                                    {
                                        if ((!_313) || _289)
                                        {
                                            if ((!_317) || _289)
                                            {
                                                if ((!_321) || _289)
                                                {
                                                    if ((!_325) || _289)
                                                    {
                                                        if ((!_327) || _289)
                                                        {
                                                            _289 = false;
                                                            float _345 = -_269;
                                                            float _347 = _345 + 1.0;
                                                            float _349 = _263 * _45;
                                                            float _351 = fma(_269, _47, _347);
                                                            _333 = _351;
                                                            _335 = _349;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293)
                    {
                        if ((!_297) || _293)
                        {
                            if ((!_301) || _293)
                            {
                                if ((!_305) || _293)
                                {
                                    if ((!_309) || _293)
                                    {
                                        if ((!_313) || _293)
                                        {
                                            if ((!_317) || _293)
                                            {
                                                if ((!_321) || _293)
                                                {
                                                    if ((!_325) || _293)
                                                    {
                                                        if ((!_327) || _293)
                                                        {
                                                            _293 = false;
                                                            float _353 = -_265;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = -_269;
                                                            float _359 = _357 + 1.0;
                                                            float _361 = fma(_265, _45, _355);
                                                            float _363 = fma(_269, _47, _359);
                                                            _333 = _363;
                                                            _335 = _361;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297)
                        {
                            if ((!_301) || _297)
                            {
                                if ((!_305) || _297)
                                {
                                    if ((!_309) || _297)
                                    {
                                        if ((!_313) || _297)
                                        {
                                            if ((!_317) || _297)
                                            {
                                                if ((!_321) || _297)
                                                {
                                                    if ((!_325) || _297)
                                                    {
                                                        if ((!_327) || _297)
                                                        {
                                                            _297 = false;
                                                            float _365 = -_267;
                                                            float _367 = _365 + 1.0;
                                                            float _369 = _263 * _45;
                                                            float _371 = -_269;
                                                            float _373 = _371 + _367;
                                                            float _375 = fma(_373, _47, _267);
                                                            _333 = _375;
                                                            _335 = _369;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301)
                            {
                                if ((!_305) || _301)
                                {
                                    if ((!_309) || _301)
                                    {
                                        if ((!_313) || _301)
                                        {
                                            if ((!_317) || _301)
                                            {
                                                if ((!_321) || _301)
                                                {
                                                    if ((!_325) || _301)
                                                    {
                                                        if ((!_327) || _301)
                                                        {
                                                            _301 = false;
                                                            float _377 = -_267;
                                                            float _379 = _377 + 1.0;
                                                            float _381 = -_265;
                                                            float _383 = _381 + 1.0;
                                                            float _385 = -_269;
                                                            float _387 = _385 + _379;
                                                            float _389 = fma(_265, _45, _383);
                                                            float _391 = fma(_387, _47, _267);
                                                            _333 = _391;
                                                            _335 = _389;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305)
                                {
                                    if ((!_309) || _305)
                                    {
                                        if ((!_313) || _305)
                                        {
                                            if ((!_317) || _305)
                                            {
                                                if ((!_321) || _305)
                                                {
                                                    if ((!_325) || _305)
                                                    {
                                                        if ((!_327) || _305)
                                                        {
                                                            _305 = false;
                                                            float _393 = -_263;
                                                            float _395 = _393 + 1.0;
                                                            float _397 = _267 * _47;
                                                            float _399 = -_265;
                                                            float _401 = _399 + _395;
                                                            float _403 = fma(_401, _45, _263);
                                                            _333 = _397;
                                                            _335 = _403;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _327) || _325) || _321) || _317) || _313) || _309)
                                    {
                                        if ((!_313) || _309)
                                        {
                                            if ((!_317) || _309)
                                            {
                                                if ((!_321) || _309)
                                                {
                                                    if ((!_325) || _309)
                                                    {
                                                        if ((!_327) || _309)
                                                        {
                                                            _309 = false;
                                                            float _405 = -_263;
                                                            float _407 = _405 + 1.0;
                                                            float _409 = -_269;
                                                            float _411 = _409 + 1.0;
                                                            float _413 = -_265;
                                                            float _415 = _413 + _407;
                                                            float _417 = fma(_269, _47, _411);
                                                            float _419 = fma(_415, _45, _263);
                                                            _333 = _417;
                                                            _335 = _419;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _327) || _325) || _321) || _317) || _313)
                                        {
                                            if ((!_317) || _313)
                                            {
                                                if ((!_321) || _313)
                                                {
                                                    if ((!_325) || _313)
                                                    {
                                                        if ((!_327) || _313)
                                                        {
                                                            _313 = false;
                                                            float _421 = -_265;
                                                            float _423 = _421 + 1.0;
                                                            float _425 = _267 * _47;
                                                            float _427 = _423 * _45;
                                                            _333 = _425;
                                                            _335 = _427;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _327) || _325) || _321) || _317)
                                            {
                                                if ((!_321) || _317)
                                                {
                                                    if ((!_325) || _317)
                                                    {
                                                        if ((!_327) || _317)
                                                        {
                                                            _317 = false;
                                                            float _429 = -_265;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = -_269;
                                                            float _435 = _433 + 1.0;
                                                            float _437 = fma(_265, _45, _431);
                                                            float _439 = _435 * _47;
                                                            _333 = _439;
                                                            _335 = _437;
                                                        }
                                                    }
                                                }
                                                if (((false || _327) || _325) || _321)
                                                {
                                                    if ((!_325) || _321)
                                                    {
                                                        if ((!_327) || _321)
                                                        {
                                                            _321 = false;
                                                            float _441 = -_267;
                                                            float _443 = _441 + 1.0;
                                                            float _445 = _263 * _45;
                                                            float _447 = fma(_443, _47, _267);
                                                            _333 = _447;
                                                            _335 = _445;
                                                        }
                                                    }
                                                    if ((false || _327) || _325)
                                                    {
                                                        if ((!_327) || _325)
                                                        {
                                                            _325 = false;
                                                            float _449 = -_263;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = -_269;
                                                            float _455 = _453 + 1.0;
                                                            float _457 = fma(_451, _45, _263);
                                                            float _459 = fma(_269, _47, _455);
                                                            _333 = _459;
                                                            _335 = _457;
                                                        }
                                                        if (false || _327)
                                                        {
                                                            _327 = false;
                                                            bool _461 = _241 != 12;
                                                            if (!_461)
                                                            {
                                                                float _463 = -_267;
                                                                float _465 = _463 + 1.0;
                                                                _275 = _465;
                                                            }
                                                            float _467 = _275;
                                                            if (!_461)
                                                            {
                                                                float _469 = -_265;
                                                                float _471 = _469 + 1.0;
                                                                _277 = _471;
                                                            }
                                                            float _473 = _277;
                                                            if (_461)
                                                            {
                                                                _279 = 0.0;
                                                            }
                                                            float _475 = _279;
                                                            float _477 = _475;
                                                            if (!_461)
                                                            {
                                                                float _479 = -_269;
                                                                float _481 = _479 + _467;
                                                                _281 = _481;
                                                            }
                                                            float _483 = _281;
                                                            if (_461)
                                                            {
                                                                _245 = 0.0;
                                                            }
                                                            float _485 = _245;
                                                            _333 = _485;
                                                            if (!_461)
                                                            {
                                                                float _487 = _45 * _473;
                                                                _477 = _487;
                                                            }
                                                            float _489 = _477;
                                                            _335 = _489;
                                                            if (!_461)
                                                            {
                                                                float _491 = _47 * _483;
                                                                _333 = _491;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _493 = _333;
            float _495 = _335;
            float _497 = -_493;
            float _499 = _497 + 1.0;
            float _501 = _493 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _503 = _493 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _505 = -_495;
            float _507 = _505 + 1.0;
            float _509 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[30].w, _501);
            float _511 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[29].w, _503);
            float _513 = _509 * _495;
            float _515 = fma(_507, _511, _513);
            _142 = _45;
            _148 = _47;
            _136 = _515;
            _150 = true;
        }
        else
        {
            float _517 = trunc(_45);
            int _519 = int(_517);
            bool _521 = _241 != 13;
            float _523 = trunc(_47);
            int _525 = int(_523);
            int _527 = _525 << 1;
            int _529 = _527 + _519;
            int _531 = _529 << 4;
            bool _533 = _531 == 0;
            bool _535 = _531 == 16;
            bool _537 = _531 == 32;
            bool _539 = _531 == 48;
            float _541 = as_type<float>(_525);
            float _543 = as_type<float>(_531);
            if (_533)
            {
                _541 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _545 = _541;
            float _547 = _545;
            if (_533)
            {
                _543 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _549 = _543;
            float _551 = _549;
            if (_533)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _553 = _120;
            float _555 = _553;
            if (_533)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _557 = _122;
            float _559 = _557;
            if (_535)
            {
                _547 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _561 = _547;
            float _563 = _561;
            if (_535)
            {
                _551 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _565 = _551;
            float _567 = _565;
            if (_535)
            {
                _555 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _569 = _555;
            float _571 = _569;
            if (_535)
            {
                _559 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _573 = _559;
            float _575 = _573;
            if (_537)
            {
                _563 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _577 = _563;
            float _579 = _577;
            if (_537)
            {
                _567 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _581 = _567;
            float _583 = _581;
            if (_537)
            {
                _571 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _585 = _571;
            float _587 = _585;
            if (_537)
            {
                _575 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _589 = _575;
            float _591 = _589;
            if (_539)
            {
                _579 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _593 = _579;
            _142 = _593;
            if (_539)
            {
                _583 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _595 = _583;
            _148 = _595;
            if (_539)
            {
                _587 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _597 = _587;
            if (_539)
            {
                _591 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _599 = _591;
            if (!_521)
            {
                float _601 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _603 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _605 = _601 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _607 = -_605;
                float _609 = _607 + 1.0;
                float _611 = _603 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _613 = -_601;
                float _615 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[26].w, _609);
                float _617 = -_611;
                float _619 = _617 + 1.0;
                float _621 = fma(_615, _47, _605);
                float _623 = -_603;
                float _625 = fma(_623, (*spvDescriptorSet0.vp_c3)._m0[26].y, _619);
                float _627 = -_621;
                float _629 = _627 + 1.0;
                float _631 = _621 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _633 = _621 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _635 = fma(_625, _45, _611);
                float _637 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[30].w, _631);
                float _639 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[29].w, _633);
                float _641 = -_635;
                float _643 = _641 + 1.0;
                float _645 = _635 * _637;
                float _647 = fma(_643, _639, _645);
                _124 = _599;
                _126 = _597;
                _136 = _647;
                _150 = true;
            }
            else
            {
                int _649 = _529 << 4;
                int _651 = _649 + 464;
                int _653 = _651 + 12;
                uint _655 = uint(int(uint(_653) >> uint(2)));
                uint _657 = uint(int(uint(int(_655)) >> uint(2)));
                int _659 = int(_655) & 3;
                float _661 = (*spvDescriptorSet0.vp_c3)._m0[int(_657)][_659];
                _124 = _599;
                _126 = _597;
                _136 = _661;
            }
        }
    }
    _150 = false;
    float _663 = _124;
    float _665 = _126;
    float _667 = _142;
    float _669 = _148;
    bool _671 = _132;
    float _673 = _136;
    bool _675 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _677 = !_675;
    float _679 = _663;
    float _681 = _665;
    float _683 = _667;
    float _685 = _669;
    float _687 = _665;
    float _689 = _663;
    float _703;
    float _705;
    if (!_677)
    {
        float _691 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _693 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _695 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _691);
        float _697 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _693);
        float _699 = _695 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _701 = _697 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _703 = _701;
        _705 = _699;
        _707 = true;
    }
    else
    {
        int _709 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _711 = _709 != 0;
        if (!_711)
        {
            _679 = _667;
        }
        float _713 = _679;
        float _715 = _713;
        _705 = _713;
        if (!_711)
        {
            _681 = _669;
        }
        float _717 = _681;
        bool _719 = !_711;
        float _721 = _717;
        _703 = _717;
        if (!_719)
        {
            if (!_671)
            {
                _715 = _667;
            }
            float _723 = _715;
            float _725 = _723;
            int _727 = as_type<int>(_723);
            if (!_671)
            {
                _721 = _669;
            }
            float _729 = _721;
            bool _731 = !_671;
            float _733 = _729;
            float _735 = _729;
            if (!_731)
            {
                int _737 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _739 = _737 != 0;
                int _741 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _743 = _741 != 0;
                int _745 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _747 = _745 != 0;
                int _749 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _751 = _749 != 0;
                int _753 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _755 = _753 != 0;
                if (_739)
                {
                    _725 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _757 = _725;
                float _759 = _757;
                if (_739)
                {
                    _733 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _761 = _733;
                float _763 = _761;
                if (!_739)
                {
                    _759 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _765 = _759;
                if (!_739)
                {
                    _763 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _767 = _763;
                float _769 = _765 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _771 = _767 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_751)
                {
                    float _773 = _769 * _667;
                    _683 = _773;
                }
                float _775 = _683;
                float _777 = -_769;
                float _779 = _777 + 1.0;
                int _781 = as_type<int>(_775);
                if (_755)
                {
                    float _783 = _771 * _669;
                    _685 = _783;
                }
                float _785 = _685;
                float _787 = -_771;
                float _789 = _787 + 1.0;
                float _791 = _785;
                if (_743)
                {
                    float _793 = _775 + _779;
                    _781 = as_type<int>(_793);
                }
                int _795 = _781;
                if (_747)
                {
                    float _797 = _785 + _789;
                    _791 = _797;
                }
                float _799 = _791;
                _727 = _795;
                _735 = _799;
            }
            int _801 = _727;
            float _803 = _735;
            int _805 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _807 = _805 != 0;
            int _809 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _811 = _809 != 0;
            int _813 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _815 = _813 != 0;
            int _817 = _801;
            int _819 = as_type<int>(_803);
            if (_811)
            {
                float _821 = -as_type<float>(_801);
                float _823 = _821 + 1.0;
                _817 = as_type<int>(_823);
            }
            int _825 = _817;
            if (_815)
            {
                float _827 = -_803;
                float _829 = _827 + 1.0;
                _819 = as_type<int>(_829);
            }
            int _831 = _819;
            bool _833 = !_807;
            float _835 = _833 ? as_type<float>(_825) : as_type<float>(_831);
            bool _837 = !_807;
            float _839 = _837 ? as_type<float>(_831) : as_type<float>(_825);
            _703 = _839;
            _705 = _835;
        }
    }
    _707 = false;
    float _841 = _703;
    float _843 = _705;
    float _845 = _841 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _847 = _841 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _849 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _851 = fma(_843, (*spvDescriptorSet0.vp_c3)._m0[8].x, _845);
    float _853 = fma(_843, (*spvDescriptorSet0.vp_c3)._m0[7].x, _847);
    float _855 = _851 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _857 = _853 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _859 = -_855;
    float _861 = _859 + 1.0;
    out.m_27.x = _857;
    out.m_27.y = _861;
    bool _863 = !_849;
    float _865 = _861;
    float _867 = _857;
    float _881;
    float _883;
    if (!_863)
    {
        float _869 = _51 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _871 = _51 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _873 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[18].x, _869);
        float _875 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[19].x, _871);
        float _877 = _873 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _879 = _875 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _881 = _879;
        _883 = _877;
        _885 = true;
    }
    else
    {
        int _887 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _889 = _887 != 0;
        if (!_889)
        {
            _865 = _665;
        }
        float _891 = _865;
        float _893 = _891;
        _883 = _891;
        if (!_889)
        {
            _867 = _663;
        }
        float _895 = _867;
        bool _897 = !_889;
        float _899 = _895;
        _881 = _895;
        if (!_897)
        {
            if (!_671)
            {
                _893 = _665;
            }
            float _901 = _893;
            float _903 = _901;
            int _905 = as_type<int>(_901);
            if (!_671)
            {
                _899 = _663;
            }
            float _907 = _899;
            bool _909 = !_671;
            float _911 = _907;
            float _913 = _907;
            if (!_909)
            {
                int _915 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _917 = _915 != 0;
                int _919 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _921 = _919 != 0;
                int _923 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _925 = _923 != 0;
                int _927 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _929 = _927 != 0;
                int _931 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _933 = _931 != 0;
                if (_917)
                {
                    _903 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _935 = _903;
                float _937 = _935;
                if (_917)
                {
                    _911 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _939 = _911;
                float _941 = _939;
                if (!_917)
                {
                    _937 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _943 = _937;
                if (!_917)
                {
                    _941 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _945 = _941;
                float _947 = _943 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _949 = _945 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_929)
                {
                    float _951 = _947 * _665;
                    _687 = _951;
                }
                float _953 = _687;
                float _955 = -_947;
                float _957 = _955 + 1.0;
                int _959 = as_type<int>(_953);
                if (_933)
                {
                    float _961 = _949 * _663;
                    _689 = _961;
                }
                float _963 = _689;
                float _965 = -_949;
                float _967 = _965 + 1.0;
                float _969 = _963;
                if (_921)
                {
                    float _971 = _953 + _957;
                    _959 = as_type<int>(_971);
                }
                int _973 = _959;
                if (_925)
                {
                    float _975 = _963 + _967;
                    _969 = _975;
                }
                float _977 = _969;
                _905 = _973;
                _913 = _977;
            }
            int _979 = _905;
            float _981 = _913;
            int _983 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _985 = _983 != 0;
            int _987 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _989 = _987 != 0;
            int _991 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _993 = _991 != 0;
            int _995 = _979;
            int _997 = as_type<int>(_981);
            if (_989)
            {
                float _999 = -as_type<float>(_979);
                float _1001 = _999 + 1.0;
                _995 = as_type<int>(_1001);
            }
            int _1003 = _995;
            if (_993)
            {
                float _1005 = -_981;
                float _1007 = _1005 + 1.0;
                _997 = as_type<int>(_1007);
            }
            int _1009 = _997;
            bool _1011 = !_985;
            float _1013 = _1011 ? as_type<float>(_1003) : as_type<float>(_1009);
            bool _1015 = !_985;
            float _1017 = _1015 ? as_type<float>(_1009) : as_type<float>(_1003);
            _881 = _1017;
            _883 = _1013;
        }
    }
    _885 = false;
    float _1019 = _881;
    float _1021 = _883;
    float _1023 = _1019 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1025 = _1019 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1027 = _673 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1029 = fma(_1021, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1023);
    float _1031 = fma(_1021, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1025);
    out.m_29.w = _1027;
    float _1033 = _1029 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1035 = _1031 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1037 = -_1033;
    float _1039 = _1037 + 1.0;
    out.m_31.x = _1035;
    out.m_31.y = _1039;
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _885 = false;
    bool _707 = false;
    bool _150 = false;
    bool _327 = false;
    bool _325 = false;
    bool _321 = false;
    bool _317 = false;
    bool _313 = false;
    bool _309 = false;
    bool _305 = false;
    bool _301 = false;
    bool _297 = false;
    bool _293 = false;
    bool _289 = false;
    bool _285 = false;
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
    float _73 = _67 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _79 = _67 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].x, _73);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[0].z, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[1].z, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[2].z, _85);
    float _95 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[3].z, _87);
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _97;
    out.gl_Position.y = _99;
    out.gl_Position.z = _101;
    out.gl_Position.w = _103;
    int _106 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _110 = _106 != 0;
    bool _112 = !_110;
    float _114 = _89;
    float _116 = _91;
    float _118 = _67;
    float _120 = _97;
    float _122 = _99;
    float _124 = _47;
    float _126 = _45;
    bool _132;
    float _136;
    float _142;
    float _148;
    if (!_112)
    {
        int _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _130 = _128 != 0;
        _132 = _130;
        if (_130)
        {
            _114 = 255.0;
        }
        float _134 = _114;
        _136 = _134;
        if (_130)
        {
            _116 = _45;
        }
        float _138 = _116;
        float _140 = _138;
        _142 = _138;
        if (_130)
        {
            _118 = _47;
        }
        float _144 = _118;
        float _146 = _144;
        _148 = _144;
        _150 = _130;
        if (!_150)
        {
            float _152 = trunc(_45);
            int _154 = int(_152);
            float _156 = trunc(_47);
            int _158 = int(_156);
            int _160 = _158 << 1;
            int _162 = _160 + _154;
            int _164 = _162 << 4;
            bool _166 = _164 == 0;
            bool _168 = _164 == 16;
            bool _170 = _164 == 32;
            bool _172 = _164 == 48;
            float _174 = as_type<float>(_154);
            float _176 = as_type<float>(_158);
            _136 = 255.0;
            if (_166)
            {
                _140 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _178 = _140;
            float _180 = _178;
            if (_166)
            {
                _146 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _182 = _146;
            float _184 = _182;
            if (_166)
            {
                _174 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _186 = _174;
            float _188 = _186;
            if (_166)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _190 = _176;
            float _192 = _190;
            if (_168)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _194 = _180;
            float _196 = _194;
            if (_168)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _198 = _184;
            float _200 = _198;
            if (_168)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _202 = _188;
            float _204 = _202;
            if (_168)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _206 = _192;
            float _208 = _206;
            if (_170)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _210 = _196;
            float _212 = _210;
            if (_170)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _214 = _200;
            float _216 = _214;
            if (_170)
            {
                _204 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _218 = _204;
            float _220 = _218;
            if (_170)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _222 = _208;
            float _224 = _222;
            if (_172)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _226 = _212;
            _142 = _226;
            if (_172)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _228 = _216;
            _148 = _228;
            if (_172)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _230 = _220;
            _126 = _230;
            if (_172)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _232 = _224;
            _124 = _232;
            _150 = true;
        }
    }
    else
    {
        int _234 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _236 = _234 != 0;
        uint _239 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _241 = int(_239) & 15;
        bool _243 = !_236;
        float _245 = as_type<float>(_241);
        _132 = _236;
        if (!_243)
        {
            uint _247 = min(uint(_241), 13u);
            float _249 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _251 = int(_247) << 2;
            uint _253 = uint(int(uint(_251) >> uint(2)));
            uint _255 = uint(int(uint(int(_253)) >> uint(2)));
            int _257 = int(_253) & 3;
            float _259 = (*spvDescriptorSet0.vp_c1)._m0[int(_255)][_257];
            float _261 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _263 = _249 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _265 = _249 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _267 = _261 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _269 = _261 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _271 = as_type<int>(_259) >> 31;
            bool _273 = as_type<int>(_259) == 1280;
            float _275 = as_type<float>(_271);
            float _277 = _265;
            float _279 = _259;
            float _281 = _269;
            if (!_273)
            {
                bool _283 = as_type<int>(_259) == 1328;
                _285 = _283;
                if (!_285)
                {
                    bool _287 = as_type<int>(_259) == 1392;
                    _289 = _287;
                    if (!_289)
                    {
                        bool _291 = as_type<int>(_259) == 1456;
                        _293 = _291;
                        if (!_293)
                        {
                            bool _295 = as_type<int>(_259) == 1536;
                            _297 = _295;
                            if (!_297)
                            {
                                bool _299 = as_type<int>(_259) == 1616;
                                _301 = _299;
                                if (!_301)
                                {
                                    bool _303 = as_type<int>(_259) == 1712;
                                    _305 = _303;
                                    if (!_305)
                                    {
                                        bool _307 = as_type<int>(_259) == 1792;
                                        _309 = _307;
                                        if (!_309)
                                        {
                                            bool _311 = as_type<int>(_259) == 1888;
                                            _313 = _311;
                                            if (!_313)
                                            {
                                                bool _315 = as_type<int>(_259) == 1952;
                                                _317 = _315;
                                                if (!_317)
                                                {
                                                    bool _319 = as_type<int>(_259) == 2032;
                                                    _321 = _319;
                                                    if (!_321)
                                                    {
                                                        bool _323 = as_type<int>(_259) == 2096;
                                                        _325 = _323;
                                                        if (!_325)
                                                        {
                                                            _327 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _333;
            float _335;
            if (!_285)
            {
                if (!_289)
                {
                    if (!_293)
                    {
                        if (!_297)
                        {
                            if (!_301)
                            {
                                if (!_305)
                                {
                                    if (!_309)
                                    {
                                        if (!_313)
                                        {
                                            if (!_317)
                                            {
                                                if (!_321)
                                                {
                                                    if (!_325)
                                                    {
                                                        if (!_327)
                                                        {
                                                            float _329 = _263 * _45;
                                                            float _331 = _267 * _47;
                                                            _333 = _331;
                                                            _335 = _329;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289) || _285)
            {
                if ((!_289) || _285)
                {
                    if ((!_293) || _285)
                    {
                        if ((!_297) || _285)
                        {
                            if ((!_301) || _285)
                            {
                                if ((!_305) || _285)
                                {
                                    if ((!_309) || _285)
                                    {
                                        if ((!_313) || _285)
                                        {
                                            if ((!_317) || _285)
                                            {
                                                if ((!_321) || _285)
                                                {
                                                    if ((!_325) || _285)
                                                    {
                                                        if ((!_327) || _285)
                                                        {
                                                            _285 = false;
                                                            float _337 = -_265;
                                                            float _339 = _337 + 1.0;
                                                            float _341 = _267 * _47;
                                                            float _343 = fma(_265, _45, _339);
                                                            _333 = _341;
                                                            _335 = _343;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293) || _289)
                {
                    if ((!_293) || _289)
                    {
                        if ((!_297) || _289)
                        {
                            if ((!_301) || _289)
                            {
                                if ((!_305) || _289)
                                {
                                    if ((!_309) || _289)
                                    {
                                        if ((!_313) || _289)
                                        {
                                            if ((!_317) || _289)
                                            {
                                                if ((!_321) || _289)
                                                {
                                                    if ((!_325) || _289)
                                                    {
                                                        if ((!_327) || _289)
                                                        {
                                                            _289 = false;
                                                            float _345 = -_269;
                                                            float _347 = _345 + 1.0;
                                                            float _349 = _263 * _45;
                                                            float _351 = fma(_269, _47, _347);
                                                            _333 = _351;
                                                            _335 = _349;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297) || _293)
                    {
                        if ((!_297) || _293)
                        {
                            if ((!_301) || _293)
                            {
                                if ((!_305) || _293)
                                {
                                    if ((!_309) || _293)
                                    {
                                        if ((!_313) || _293)
                                        {
                                            if ((!_317) || _293)
                                            {
                                                if ((!_321) || _293)
                                                {
                                                    if ((!_325) || _293)
                                                    {
                                                        if ((!_327) || _293)
                                                        {
                                                            _293 = false;
                                                            float _353 = -_265;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = -_269;
                                                            float _359 = _357 + 1.0;
                                                            float _361 = fma(_265, _45, _355);
                                                            float _363 = fma(_269, _47, _359);
                                                            _333 = _363;
                                                            _335 = _361;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301) || _297)
                        {
                            if ((!_301) || _297)
                            {
                                if ((!_305) || _297)
                                {
                                    if ((!_309) || _297)
                                    {
                                        if ((!_313) || _297)
                                        {
                                            if ((!_317) || _297)
                                            {
                                                if ((!_321) || _297)
                                                {
                                                    if ((!_325) || _297)
                                                    {
                                                        if ((!_327) || _297)
                                                        {
                                                            _297 = false;
                                                            float _365 = -_267;
                                                            float _367 = _365 + 1.0;
                                                            float _369 = _263 * _45;
                                                            float _371 = -_269;
                                                            float _373 = _371 + _367;
                                                            float _375 = fma(_373, _47, _267);
                                                            _333 = _375;
                                                            _335 = _369;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305) || _301)
                            {
                                if ((!_305) || _301)
                                {
                                    if ((!_309) || _301)
                                    {
                                        if ((!_313) || _301)
                                        {
                                            if ((!_317) || _301)
                                            {
                                                if ((!_321) || _301)
                                                {
                                                    if ((!_325) || _301)
                                                    {
                                                        if ((!_327) || _301)
                                                        {
                                                            _301 = false;
                                                            float _377 = -_267;
                                                            float _379 = _377 + 1.0;
                                                            float _381 = -_265;
                                                            float _383 = _381 + 1.0;
                                                            float _385 = -_269;
                                                            float _387 = _385 + _379;
                                                            float _389 = fma(_265, _45, _383);
                                                            float _391 = fma(_387, _47, _267);
                                                            _333 = _391;
                                                            _335 = _389;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _327) || _325) || _321) || _317) || _313) || _309) || _305)
                                {
                                    if ((!_309) || _305)
                                    {
                                        if ((!_313) || _305)
                                        {
                                            if ((!_317) || _305)
                                            {
                                                if ((!_321) || _305)
                                                {
                                                    if ((!_325) || _305)
                                                    {
                                                        if ((!_327) || _305)
                                                        {
                                                            _305 = false;
                                                            float _393 = -_263;
                                                            float _395 = _393 + 1.0;
                                                            float _397 = _267 * _47;
                                                            float _399 = -_265;
                                                            float _401 = _399 + _395;
                                                            float _403 = fma(_401, _45, _263);
                                                            _333 = _397;
                                                            _335 = _403;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _327) || _325) || _321) || _317) || _313) || _309)
                                    {
                                        if ((!_313) || _309)
                                        {
                                            if ((!_317) || _309)
                                            {
                                                if ((!_321) || _309)
                                                {
                                                    if ((!_325) || _309)
                                                    {
                                                        if ((!_327) || _309)
                                                        {
                                                            _309 = false;
                                                            float _405 = -_263;
                                                            float _407 = _405 + 1.0;
                                                            float _409 = -_269;
                                                            float _411 = _409 + 1.0;
                                                            float _413 = -_265;
                                                            float _415 = _413 + _407;
                                                            float _417 = fma(_269, _47, _411);
                                                            float _419 = fma(_415, _45, _263);
                                                            _333 = _417;
                                                            _335 = _419;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _327) || _325) || _321) || _317) || _313)
                                        {
                                            if ((!_317) || _313)
                                            {
                                                if ((!_321) || _313)
                                                {
                                                    if ((!_325) || _313)
                                                    {
                                                        if ((!_327) || _313)
                                                        {
                                                            _313 = false;
                                                            float _421 = -_265;
                                                            float _423 = _421 + 1.0;
                                                            float _425 = _267 * _47;
                                                            float _427 = _423 * _45;
                                                            _333 = _425;
                                                            _335 = _427;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _327) || _325) || _321) || _317)
                                            {
                                                if ((!_321) || _317)
                                                {
                                                    if ((!_325) || _317)
                                                    {
                                                        if ((!_327) || _317)
                                                        {
                                                            _317 = false;
                                                            float _429 = -_265;
                                                            float _431 = _429 + 1.0;
                                                            float _433 = -_269;
                                                            float _435 = _433 + 1.0;
                                                            float _437 = fma(_265, _45, _431);
                                                            float _439 = _435 * _47;
                                                            _333 = _439;
                                                            _335 = _437;
                                                        }
                                                    }
                                                }
                                                if (((false || _327) || _325) || _321)
                                                {
                                                    if ((!_325) || _321)
                                                    {
                                                        if ((!_327) || _321)
                                                        {
                                                            _321 = false;
                                                            float _441 = -_267;
                                                            float _443 = _441 + 1.0;
                                                            float _445 = _263 * _45;
                                                            float _447 = fma(_443, _47, _267);
                                                            _333 = _447;
                                                            _335 = _445;
                                                        }
                                                    }
                                                    if ((false || _327) || _325)
                                                    {
                                                        if ((!_327) || _325)
                                                        {
                                                            _325 = false;
                                                            float _449 = -_263;
                                                            float _451 = _449 + 1.0;
                                                            float _453 = -_269;
                                                            float _455 = _453 + 1.0;
                                                            float _457 = fma(_451, _45, _263);
                                                            float _459 = fma(_269, _47, _455);
                                                            _333 = _459;
                                                            _335 = _457;
                                                        }
                                                        if (false || _327)
                                                        {
                                                            _327 = false;
                                                            bool _461 = _241 != 12;
                                                            if (!_461)
                                                            {
                                                                float _463 = -_267;
                                                                float _465 = _463 + 1.0;
                                                                _275 = _465;
                                                            }
                                                            float _467 = _275;
                                                            if (!_461)
                                                            {
                                                                float _469 = -_265;
                                                                float _471 = _469 + 1.0;
                                                                _277 = _471;
                                                            }
                                                            float _473 = _277;
                                                            if (_461)
                                                            {
                                                                _279 = 0.0;
                                                            }
                                                            float _475 = _279;
                                                            float _477 = _475;
                                                            if (!_461)
                                                            {
                                                                float _479 = -_269;
                                                                float _481 = _479 + _467;
                                                                _281 = _481;
                                                            }
                                                            float _483 = _281;
                                                            if (_461)
                                                            {
                                                                _245 = 0.0;
                                                            }
                                                            float _485 = _245;
                                                            _333 = _485;
                                                            if (!_461)
                                                            {
                                                                float _487 = _45 * _473;
                                                                _477 = _487;
                                                            }
                                                            float _489 = _477;
                                                            _335 = _489;
                                                            if (!_461)
                                                            {
                                                                float _491 = _47 * _483;
                                                                _333 = _491;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _493 = _333;
            float _495 = _335;
            float _497 = -_493;
            float _499 = _497 + 1.0;
            float _501 = _493 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _503 = _493 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _505 = -_495;
            float _507 = _505 + 1.0;
            float _509 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[30].w, _501);
            float _511 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[29].w, _503);
            float _513 = _509 * _495;
            float _515 = fma(_507, _511, _513);
            _142 = _45;
            _148 = _47;
            _136 = _515;
            _150 = true;
        }
        else
        {
            float _517 = trunc(_45);
            int _519 = int(_517);
            bool _521 = _241 != 13;
            float _523 = trunc(_47);
            int _525 = int(_523);
            int _527 = _525 << 1;
            int _529 = _527 + _519;
            int _531 = _529 << 4;
            bool _533 = _531 == 0;
            bool _535 = _531 == 16;
            bool _537 = _531 == 32;
            bool _539 = _531 == 48;
            float _541 = as_type<float>(_525);
            float _543 = as_type<float>(_531);
            if (_533)
            {
                _541 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _545 = _541;
            float _547 = _545;
            if (_533)
            {
                _543 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _549 = _543;
            float _551 = _549;
            if (_533)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _553 = _120;
            float _555 = _553;
            if (_533)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _557 = _122;
            float _559 = _557;
            if (_535)
            {
                _547 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _561 = _547;
            float _563 = _561;
            if (_535)
            {
                _551 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _565 = _551;
            float _567 = _565;
            if (_535)
            {
                _555 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _569 = _555;
            float _571 = _569;
            if (_535)
            {
                _559 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _573 = _559;
            float _575 = _573;
            if (_537)
            {
                _563 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _577 = _563;
            float _579 = _577;
            if (_537)
            {
                _567 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _581 = _567;
            float _583 = _581;
            if (_537)
            {
                _571 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _585 = _571;
            float _587 = _585;
            if (_537)
            {
                _575 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _589 = _575;
            float _591 = _589;
            if (_539)
            {
                _579 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _593 = _579;
            _142 = _593;
            if (_539)
            {
                _583 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _595 = _583;
            _148 = _595;
            if (_539)
            {
                _587 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _597 = _587;
            if (_539)
            {
                _591 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _599 = _591;
            if (!_521)
            {
                float _601 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _603 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _605 = _601 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _607 = -_605;
                float _609 = _607 + 1.0;
                float _611 = _603 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _613 = -_601;
                float _615 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[26].w, _609);
                float _617 = -_611;
                float _619 = _617 + 1.0;
                float _621 = fma(_615, _47, _605);
                float _623 = -_603;
                float _625 = fma(_623, (*spvDescriptorSet0.vp_c3)._m0[26].y, _619);
                float _627 = -_621;
                float _629 = _627 + 1.0;
                float _631 = _621 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _633 = _621 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _635 = fma(_625, _45, _611);
                float _637 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[30].w, _631);
                float _639 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[29].w, _633);
                float _641 = -_635;
                float _643 = _641 + 1.0;
                float _645 = _635 * _637;
                float _647 = fma(_643, _639, _645);
                _124 = _599;
                _126 = _597;
                _136 = _647;
                _150 = true;
            }
            else
            {
                int _649 = _529 << 4;
                int _651 = _649 + 464;
                int _653 = _651 + 12;
                uint _655 = uint(int(uint(_653) >> uint(2)));
                uint _657 = uint(int(uint(int(_655)) >> uint(2)));
                int _659 = int(_655) & 3;
                float _661 = (*spvDescriptorSet0.vp_c3)._m0[int(_657)][_659];
                _124 = _599;
                _126 = _597;
                _136 = _661;
            }
        }
    }
    _150 = false;
    float _663 = _124;
    float _665 = _126;
    float _667 = _142;
    float _669 = _148;
    bool _671 = _132;
    float _673 = _136;
    bool _675 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _677 = !_675;
    float _679 = _663;
    float _681 = _665;
    float _683 = _667;
    float _685 = _669;
    float _687 = _665;
    float _689 = _663;
    float _703;
    float _705;
    if (!_677)
    {
        float _691 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _693 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _695 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _691);
        float _697 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _693);
        float _699 = _695 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _701 = _697 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _703 = _701;
        _705 = _699;
        _707 = true;
    }
    else
    {
        int _709 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _711 = _709 != 0;
        if (!_711)
        {
            _679 = _667;
        }
        float _713 = _679;
        float _715 = _713;
        _705 = _713;
        if (!_711)
        {
            _681 = _669;
        }
        float _717 = _681;
        bool _719 = !_711;
        float _721 = _717;
        _703 = _717;
        if (!_719)
        {
            if (!_671)
            {
                _715 = _667;
            }
            float _723 = _715;
            float _725 = _723;
            int _727 = as_type<int>(_723);
            if (!_671)
            {
                _721 = _669;
            }
            float _729 = _721;
            bool _731 = !_671;
            float _733 = _729;
            float _735 = _729;
            if (!_731)
            {
                int _737 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _739 = _737 != 0;
                int _741 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _743 = _741 != 0;
                int _745 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _747 = _745 != 0;
                int _749 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _751 = _749 != 0;
                int _753 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _755 = _753 != 0;
                if (_739)
                {
                    _725 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _757 = _725;
                float _759 = _757;
                if (_739)
                {
                    _733 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _761 = _733;
                float _763 = _761;
                if (!_739)
                {
                    _759 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _765 = _759;
                if (!_739)
                {
                    _763 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _767 = _763;
                float _769 = _765 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _771 = _767 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_751)
                {
                    float _773 = _769 * _667;
                    _683 = _773;
                }
                float _775 = _683;
                float _777 = -_769;
                float _779 = _777 + 1.0;
                int _781 = as_type<int>(_775);
                if (_755)
                {
                    float _783 = _771 * _669;
                    _685 = _783;
                }
                float _785 = _685;
                float _787 = -_771;
                float _789 = _787 + 1.0;
                float _791 = _785;
                if (_743)
                {
                    float _793 = _775 + _779;
                    _781 = as_type<int>(_793);
                }
                int _795 = _781;
                if (_747)
                {
                    float _797 = _785 + _789;
                    _791 = _797;
                }
                float _799 = _791;
                _727 = _795;
                _735 = _799;
            }
            int _801 = _727;
            float _803 = _735;
            int _805 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _807 = _805 != 0;
            int _809 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _811 = _809 != 0;
            int _813 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _815 = _813 != 0;
            int _817 = _801;
            int _819 = as_type<int>(_803);
            if (_811)
            {
                float _821 = -as_type<float>(_801);
                float _823 = _821 + 1.0;
                _817 = as_type<int>(_823);
            }
            int _825 = _817;
            if (_815)
            {
                float _827 = -_803;
                float _829 = _827 + 1.0;
                _819 = as_type<int>(_829);
            }
            int _831 = _819;
            bool _833 = !_807;
            float _835 = _833 ? as_type<float>(_825) : as_type<float>(_831);
            bool _837 = !_807;
            float _839 = _837 ? as_type<float>(_831) : as_type<float>(_825);
            _703 = _839;
            _705 = _835;
        }
    }
    _707 = false;
    float _841 = _703;
    float _843 = _705;
    float _845 = _841 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _847 = _841 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _849 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _851 = fma(_843, (*spvDescriptorSet0.vp_c3)._m0[8].x, _845);
    float _853 = fma(_843, (*spvDescriptorSet0.vp_c3)._m0[7].x, _847);
    float _855 = _851 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _857 = _853 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _859 = -_855;
    float _861 = _859 + 1.0;
    out.m_27.x = _857;
    out.m_27.y = _861;
    bool _863 = !_849;
    float _865 = _861;
    float _867 = _857;
    float _881;
    float _883;
    if (!_863)
    {
        float _869 = _51 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _871 = _51 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _873 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[18].x, _869);
        float _875 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[19].x, _871);
        float _877 = _873 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _879 = _875 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _881 = _879;
        _883 = _877;
        _885 = true;
    }
    else
    {
        int _887 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _889 = _887 != 0;
        if (!_889)
        {
            _865 = _665;
        }
        float _891 = _865;
        float _893 = _891;
        _883 = _891;
        if (!_889)
        {
            _867 = _663;
        }
        float _895 = _867;
        bool _897 = !_889;
        float _899 = _895;
        _881 = _895;
        if (!_897)
        {
            if (!_671)
            {
                _893 = _665;
            }
            float _901 = _893;
            float _903 = _901;
            int _905 = as_type<int>(_901);
            if (!_671)
            {
                _899 = _663;
            }
            float _907 = _899;
            bool _909 = !_671;
            float _911 = _907;
            float _913 = _907;
            if (!_909)
            {
                int _915 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _917 = _915 != 0;
                int _919 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _921 = _919 != 0;
                int _923 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _925 = _923 != 0;
                int _927 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _929 = _927 != 0;
                int _931 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _933 = _931 != 0;
                if (_917)
                {
                    _903 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _935 = _903;
                float _937 = _935;
                if (_917)
                {
                    _911 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _939 = _911;
                float _941 = _939;
                if (!_917)
                {
                    _937 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _943 = _937;
                if (!_917)
                {
                    _941 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _945 = _941;
                float _947 = _943 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _949 = _945 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_929)
                {
                    float _951 = _947 * _665;
                    _687 = _951;
                }
                float _953 = _687;
                float _955 = -_947;
                float _957 = _955 + 1.0;
                int _959 = as_type<int>(_953);
                if (_933)
                {
                    float _961 = _949 * _663;
                    _689 = _961;
                }
                float _963 = _689;
                float _965 = -_949;
                float _967 = _965 + 1.0;
                float _969 = _963;
                if (_921)
                {
                    float _971 = _953 + _957;
                    _959 = as_type<int>(_971);
                }
                int _973 = _959;
                if (_925)
                {
                    float _975 = _963 + _967;
                    _969 = _975;
                }
                float _977 = _969;
                _905 = _973;
                _913 = _977;
            }
            int _979 = _905;
            float _981 = _913;
            int _983 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _985 = _983 != 0;
            int _987 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _989 = _987 != 0;
            int _991 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _993 = _991 != 0;
            int _995 = _979;
            int _997 = as_type<int>(_981);
            if (_989)
            {
                float _999 = -as_type<float>(_979);
                float _1001 = _999 + 1.0;
                _995 = as_type<int>(_1001);
            }
            int _1003 = _995;
            if (_993)
            {
                float _1005 = -_981;
                float _1007 = _1005 + 1.0;
                _997 = as_type<int>(_1007);
            }
            int _1009 = _997;
            bool _1011 = !_985;
            float _1013 = _1011 ? as_type<float>(_1003) : as_type<float>(_1009);
            bool _1015 = !_985;
            float _1017 = _1015 ? as_type<float>(_1009) : as_type<float>(_1003);
            _881 = _1017;
            _883 = _1013;
        }
    }
    _885 = false;
    float _1019 = _881;
    float _1021 = _883;
    float _1023 = _1019 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _1025 = _1019 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _1027 = _673 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _1029 = fma(_1021, (*spvDescriptorSet0.vp_c3)._m0[10].x, _1023);
    float _1031 = fma(_1021, (*spvDescriptorSet0.vp_c3)._m0[9].x, _1025);
    out.m_29.w = _1027;
    float _1033 = _1029 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _1035 = _1031 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _1037 = -_1033;
    float _1039 = _1037 + 1.0;
    out.m_31.x = _1035;
    out.m_31.y = _1039;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

