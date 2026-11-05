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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _741 = false;
    bool _152 = false;
    bool _299 = false;
    bool _297 = false;
    bool _293 = false;
    bool _289 = false;
    bool _285 = false;
    bool _281 = false;
    bool _277 = false;
    bool _273 = false;
    bool _269 = false;
    bool _265 = false;
    bool _261 = false;
    bool _257 = false;
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
    float _112 = _65;
    float _114 = _89;
    float _116 = _95;
    float _118 = _97;
    float _120 = _99;
    float _122 = _99;
    float _124 = _101;
    float _126 = _45;
    float _128 = _43;
    bool _134;
    float _138;
    float _142;
    float _146;
    float _150;
    if (!_110)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        _134 = _132;
        if (_132)
        {
            _112 = 255.0;
        }
        float _136 = _112;
        _138 = _136;
        if (_132)
        {
            _114 = 255.0;
        }
        float _140 = _114;
        _142 = _140;
        if (_132)
        {
            _116 = 255.0;
        }
        float _144 = _116;
        _146 = _144;
        if (_132)
        {
            _118 = 255.0;
        }
        float _148 = _118;
        _150 = _148;
        _152 = _132;
        if (!_152)
        {
            float _154 = trunc(_43);
            int _156 = int(_154);
            float _158 = trunc(_45);
            int _160 = int(_158);
            int _162 = _160 << 1;
            int _164 = _162 + _156;
            int _166 = _164 << 4;
            bool _168 = _166 == 0;
            bool _170 = _166 == 16;
            bool _172 = _166 == 32;
            bool _174 = _166 == 48;
            float _176 = as_type<float>(_166);
            _138 = 255.0;
            _142 = 255.0;
            _146 = 255.0;
            _150 = 255.0;
            if (_168)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _178 = _176;
            float _180 = _178;
            if (_168)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _182 = _120;
            float _184 = _182;
            if (_170)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _186 = _180;
            float _188 = _186;
            if (_170)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _190 = _184;
            float _192 = _190;
            if (_172)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _194 = _188;
            float _196 = _194;
            if (_172)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _198 = _192;
            float _200 = _198;
            if (_174)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _202 = _196;
            if (_174)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _204 = _200;
            _126 = _204;
            _128 = _202;
            _152 = true;
        }
    }
    else
    {
        int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _208 = _206 != 0;
        uint _211 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _213 = int(_211) & 15;
        bool _215 = !_208;
        float _217 = as_type<float>(_213);
        _134 = _208;
        if (!_215)
        {
            uint _219 = min(uint(_213), 13u);
            float _221 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _223 = int(_219) << 2;
            uint _225 = uint(int(uint(_223) >> uint(2)));
            uint _227 = uint(int(uint(int(_225)) >> uint(2)));
            int _229 = int(_225) & 3;
            float _231 = (*spvDescriptorSet0.vp_c1)._m0[int(_227)][_229];
            float _233 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _235 = _221 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _237 = _221 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _239 = _233 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _241 = _233 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _243 = as_type<int>(_231) >> 31;
            bool _245 = as_type<int>(_231) == 1248;
            float _247 = as_type<float>(_243);
            float _249 = _237;
            float _251 = _231;
            float _253 = _241;
            if (!_245)
            {
                bool _255 = as_type<int>(_231) == 1296;
                _257 = _255;
                if (!_257)
                {
                    bool _259 = as_type<int>(_231) == 1360;
                    _261 = _259;
                    if (!_261)
                    {
                        bool _263 = as_type<int>(_231) == 1424;
                        _265 = _263;
                        if (!_265)
                        {
                            bool _267 = as_type<int>(_231) == 1504;
                            _269 = _267;
                            if (!_269)
                            {
                                bool _271 = as_type<int>(_231) == 1584;
                                _273 = _271;
                                if (!_273)
                                {
                                    bool _275 = as_type<int>(_231) == 1680;
                                    _277 = _275;
                                    if (!_277)
                                    {
                                        bool _279 = as_type<int>(_231) == 1760;
                                        _281 = _279;
                                        if (!_281)
                                        {
                                            bool _283 = as_type<int>(_231) == 1856;
                                            _285 = _283;
                                            if (!_285)
                                            {
                                                bool _287 = as_type<int>(_231) == 1920;
                                                _289 = _287;
                                                if (!_289)
                                                {
                                                    bool _291 = as_type<int>(_231) == 2000;
                                                    _293 = _291;
                                                    if (!_293)
                                                    {
                                                        bool _295 = as_type<int>(_231) == 2064;
                                                        _297 = _295;
                                                        if (!_297)
                                                        {
                                                            _299 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _305;
            float _307;
            if (!_257)
            {
                if (!_261)
                {
                    if (!_265)
                    {
                        if (!_269)
                        {
                            if (!_273)
                            {
                                if (!_277)
                                {
                                    if (!_281)
                                    {
                                        if (!_285)
                                        {
                                            if (!_289)
                                            {
                                                if (!_293)
                                                {
                                                    if (!_297)
                                                    {
                                                        if (!_299)
                                                        {
                                                            float _301 = _235 * _43;
                                                            float _303 = _239 * _45;
                                                            _305 = _303;
                                                            _307 = _301;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269) || _265) || _261) || _257)
            {
                if ((!_261) || _257)
                {
                    if ((!_265) || _257)
                    {
                        if ((!_269) || _257)
                        {
                            if ((!_273) || _257)
                            {
                                if ((!_277) || _257)
                                {
                                    if ((!_281) || _257)
                                    {
                                        if ((!_285) || _257)
                                        {
                                            if ((!_289) || _257)
                                            {
                                                if ((!_293) || _257)
                                                {
                                                    if ((!_297) || _257)
                                                    {
                                                        if ((!_299) || _257)
                                                        {
                                                            _257 = false;
                                                            float _309 = -_237;
                                                            float _311 = _309 + 1.0;
                                                            float _313 = _239 * _45;
                                                            float _315 = fma(_237, _43, _311);
                                                            _305 = _313;
                                                            _307 = _315;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269) || _265) || _261)
                {
                    if ((!_265) || _261)
                    {
                        if ((!_269) || _261)
                        {
                            if ((!_273) || _261)
                            {
                                if ((!_277) || _261)
                                {
                                    if ((!_281) || _261)
                                    {
                                        if ((!_285) || _261)
                                        {
                                            if ((!_289) || _261)
                                            {
                                                if ((!_293) || _261)
                                                {
                                                    if ((!_297) || _261)
                                                    {
                                                        if ((!_299) || _261)
                                                        {
                                                            _261 = false;
                                                            float _317 = -_241;
                                                            float _319 = _317 + 1.0;
                                                            float _321 = _235 * _43;
                                                            float _323 = fma(_241, _45, _319);
                                                            _305 = _323;
                                                            _307 = _321;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269) || _265)
                    {
                        if ((!_269) || _265)
                        {
                            if ((!_273) || _265)
                            {
                                if ((!_277) || _265)
                                {
                                    if ((!_281) || _265)
                                    {
                                        if ((!_285) || _265)
                                        {
                                            if ((!_289) || _265)
                                            {
                                                if ((!_293) || _265)
                                                {
                                                    if ((!_297) || _265)
                                                    {
                                                        if ((!_299) || _265)
                                                        {
                                                            _265 = false;
                                                            float _325 = -_237;
                                                            float _327 = _325 + 1.0;
                                                            float _329 = -_241;
                                                            float _331 = _329 + 1.0;
                                                            float _333 = fma(_237, _43, _327);
                                                            float _335 = fma(_241, _45, _331);
                                                            _305 = _335;
                                                            _307 = _333;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269)
                        {
                            if ((!_273) || _269)
                            {
                                if ((!_277) || _269)
                                {
                                    if ((!_281) || _269)
                                    {
                                        if ((!_285) || _269)
                                        {
                                            if ((!_289) || _269)
                                            {
                                                if ((!_293) || _269)
                                                {
                                                    if ((!_297) || _269)
                                                    {
                                                        if ((!_299) || _269)
                                                        {
                                                            _269 = false;
                                                            float _337 = -_239;
                                                            float _339 = _337 + 1.0;
                                                            float _341 = _235 * _43;
                                                            float _343 = -_241;
                                                            float _345 = _343 + _339;
                                                            float _347 = fma(_345, _45, _239);
                                                            _305 = _347;
                                                            _307 = _341;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273)
                            {
                                if ((!_277) || _273)
                                {
                                    if ((!_281) || _273)
                                    {
                                        if ((!_285) || _273)
                                        {
                                            if ((!_289) || _273)
                                            {
                                                if ((!_293) || _273)
                                                {
                                                    if ((!_297) || _273)
                                                    {
                                                        if ((!_299) || _273)
                                                        {
                                                            _273 = false;
                                                            float _349 = -_239;
                                                            float _351 = _349 + 1.0;
                                                            float _353 = -_237;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = -_241;
                                                            float _359 = _357 + _351;
                                                            float _361 = fma(_237, _43, _355);
                                                            float _363 = fma(_359, _45, _239);
                                                            _305 = _363;
                                                            _307 = _361;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277)
                                {
                                    if ((!_281) || _277)
                                    {
                                        if ((!_285) || _277)
                                        {
                                            if ((!_289) || _277)
                                            {
                                                if ((!_293) || _277)
                                                {
                                                    if ((!_297) || _277)
                                                    {
                                                        if ((!_299) || _277)
                                                        {
                                                            _277 = false;
                                                            float _365 = -_235;
                                                            float _367 = _365 + 1.0;
                                                            float _369 = _239 * _45;
                                                            float _371 = -_237;
                                                            float _373 = _371 + _367;
                                                            float _375 = fma(_373, _43, _235);
                                                            _305 = _369;
                                                            _307 = _375;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _299) || _297) || _293) || _289) || _285) || _281)
                                    {
                                        if ((!_285) || _281)
                                        {
                                            if ((!_289) || _281)
                                            {
                                                if ((!_293) || _281)
                                                {
                                                    if ((!_297) || _281)
                                                    {
                                                        if ((!_299) || _281)
                                                        {
                                                            _281 = false;
                                                            float _377 = -_235;
                                                            float _379 = _377 + 1.0;
                                                            float _381 = -_241;
                                                            float _383 = _381 + 1.0;
                                                            float _385 = -_237;
                                                            float _387 = _385 + _379;
                                                            float _389 = fma(_241, _45, _383);
                                                            float _391 = fma(_387, _43, _235);
                                                            _305 = _389;
                                                            _307 = _391;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _299) || _297) || _293) || _289) || _285)
                                        {
                                            if ((!_289) || _285)
                                            {
                                                if ((!_293) || _285)
                                                {
                                                    if ((!_297) || _285)
                                                    {
                                                        if ((!_299) || _285)
                                                        {
                                                            _285 = false;
                                                            float _393 = -_237;
                                                            float _395 = _393 + 1.0;
                                                            float _397 = _239 * _45;
                                                            float _399 = _395 * _43;
                                                            _305 = _397;
                                                            _307 = _399;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _299) || _297) || _293) || _289)
                                            {
                                                if ((!_293) || _289)
                                                {
                                                    if ((!_297) || _289)
                                                    {
                                                        if ((!_299) || _289)
                                                        {
                                                            _289 = false;
                                                            float _401 = -_237;
                                                            float _403 = _401 + 1.0;
                                                            float _405 = -_241;
                                                            float _407 = _405 + 1.0;
                                                            float _409 = fma(_237, _43, _403);
                                                            float _411 = _407 * _45;
                                                            _305 = _411;
                                                            _307 = _409;
                                                        }
                                                    }
                                                }
                                                if (((false || _299) || _297) || _293)
                                                {
                                                    if ((!_297) || _293)
                                                    {
                                                        if ((!_299) || _293)
                                                        {
                                                            _293 = false;
                                                            float _413 = -_239;
                                                            float _415 = _413 + 1.0;
                                                            float _417 = _235 * _43;
                                                            float _419 = fma(_415, _45, _239);
                                                            _305 = _419;
                                                            _307 = _417;
                                                        }
                                                    }
                                                    if ((false || _299) || _297)
                                                    {
                                                        if ((!_299) || _297)
                                                        {
                                                            _297 = false;
                                                            float _421 = -_235;
                                                            float _423 = _421 + 1.0;
                                                            float _425 = -_241;
                                                            float _427 = _425 + 1.0;
                                                            float _429 = fma(_423, _43, _235);
                                                            float _431 = fma(_241, _45, _427);
                                                            _305 = _431;
                                                            _307 = _429;
                                                        }
                                                        if (false || _299)
                                                        {
                                                            _299 = false;
                                                            bool _433 = _213 != 12;
                                                            if (!_433)
                                                            {
                                                                float _435 = -_239;
                                                                float _437 = _435 + 1.0;
                                                                _247 = _437;
                                                            }
                                                            float _439 = _247;
                                                            if (!_433)
                                                            {
                                                                float _441 = -_237;
                                                                float _443 = _441 + 1.0;
                                                                _249 = _443;
                                                            }
                                                            float _445 = _249;
                                                            if (_433)
                                                            {
                                                                _251 = 0.0;
                                                            }
                                                            float _447 = _251;
                                                            float _449 = _447;
                                                            if (!_433)
                                                            {
                                                                float _451 = -_241;
                                                                float _453 = _451 + _439;
                                                                _253 = _453;
                                                            }
                                                            float _455 = _253;
                                                            if (_433)
                                                            {
                                                                _217 = 0.0;
                                                            }
                                                            float _457 = _217;
                                                            _305 = _457;
                                                            if (!_433)
                                                            {
                                                                float _459 = _43 * _445;
                                                                _449 = _459;
                                                            }
                                                            float _461 = _449;
                                                            _307 = _461;
                                                            if (!_433)
                                                            {
                                                                float _463 = _45 * _455;
                                                                _305 = _463;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _465 = _305;
            float _467 = _307;
            float _469 = -_465;
            float _471 = _469 + 1.0;
            float _473 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _475 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _477 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _479 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _481 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _483 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _485 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _487 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _489 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].x, _473);
            float _491 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].x, _475);
            float _493 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].y, _477);
            float _495 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].y, _479);
            float _497 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].z, _481);
            float _499 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].z, _483);
            float _501 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].w, _485);
            float _503 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].w, _487);
            float _505 = -_467;
            float _507 = _505 + 1.0;
            float _509 = _489 * _467;
            float _511 = _493 * _467;
            float _513 = _497 * _467;
            float _515 = _503 * _467;
            float _517 = fma(_507, _491, _509);
            float _519 = fma(_507, _495, _511);
            float _521 = fma(_507, _499, _513);
            float _523 = fma(_507, _501, _515);
            _138 = _517;
            _142 = _519;
            _146 = _521;
            _150 = _523;
            _152 = true;
        }
        else
        {
            float _525 = trunc(_43);
            int _527 = int(_525);
            float _529 = trunc(_45);
            int _531 = int(_529);
            int _533 = _531 << 1;
            int _535 = _533 + _527;
            int _537 = _535 << 4;
            bool _539 = _537 == 0;
            bool _541 = _537 == 16;
            bool _543 = _537 == 32;
            bool _545 = _537 == 48;
            if (_539)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _547 = _122;
            float _549 = _547;
            if (_539)
            {
                _124 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _551 = _124;
            bool _553 = _213 != 13;
            float _555 = _551;
            if (_541)
            {
                _549 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _557 = _549;
            float _559 = _557;
            if (_541)
            {
                _555 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _561 = _555;
            float _563 = _561;
            if (_543)
            {
                _559 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _565 = _559;
            float _567 = _565;
            if (_543)
            {
                _563 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _569 = _563;
            float _571 = _569;
            if (_545)
            {
                _567 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _573 = _567;
            if (_545)
            {
                _571 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _575 = _571;
            if (!_553)
            {
                float _577 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _579 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _581 = _577 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _583 = -_581;
                float _585 = _583 + 1.0;
                float _587 = _579 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _589 = -_577;
                float _591 = fma(_589, (*spvDescriptorSet0.vp_c3)._m0[26].w, _585);
                float _593 = -_587;
                float _595 = _593 + 1.0;
                float _597 = fma(_591, _45, _581);
                float _599 = -_579;
                float _601 = fma(_599, (*spvDescriptorSet0.vp_c3)._m0[26].y, _595);
                float _603 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _605 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _607 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _609 = fma(_601, _43, _587);
                float _611 = -_597;
                float _613 = _611 + 1.0;
                float _615 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _617 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _619 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _621 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _623 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _625 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].y, _603);
                float _627 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].x, _605);
                float _629 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].x, _607);
                float _631 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].y, _615);
                float _633 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].z, _617);
                float _635 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].z, _619);
                float _637 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].w, _621);
                float _639 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].w, _623);
                float _641 = -_609;
                float _643 = _641 + 1.0;
                float _645 = _609 * _625;
                float _647 = _609 * _627;
                float _649 = _609 * _633;
                float _651 = _609 * _639;
                float _653 = fma(_643, _631, _645);
                float _655 = fma(_643, _629, _647);
                float _657 = fma(_643, _635, _649);
                float _659 = fma(_643, _637, _651);
                _126 = _575;
                _128 = _573;
                _138 = _655;
                _142 = _653;
                _146 = _657;
                _150 = _659;
                _152 = true;
            }
            else
            {
                int _661 = _535 << 4;
                int _663 = _661 + 464;
                uint _665 = uint(int(uint(_663) >> uint(2)));
                uint _667 = uint(int(uint(int(_665)) >> uint(2)));
                int _669 = int(_665) & 3;
                float _671 = (*spvDescriptorSet0.vp_c3)._m0[int(_667)][_669];
                int _673 = int(_665) + 1;
                uint _675 = uint(int(uint(_673) >> uint(2)));
                int _677 = _673 & 3;
                float _679 = (*spvDescriptorSet0.vp_c3)._m0[int(_675)][_677];
                int _681 = _663 + 8;
                uint _683 = uint(int(uint(_681) >> uint(2)));
                uint _685 = uint(int(uint(int(_683)) >> uint(2)));
                int _687 = int(_683) & 3;
                float _689 = (*spvDescriptorSet0.vp_c3)._m0[int(_685)][_687];
                int _691 = int(_683) + 1;
                uint _693 = uint(int(uint(_691) >> uint(2)));
                int _695 = _691 & 3;
                float _697 = (*spvDescriptorSet0.vp_c3)._m0[int(_693)][_695];
                _126 = _575;
                _128 = _573;
                _138 = _671;
                _142 = _679;
                _146 = _689;
                _150 = _697;
            }
        }
    }
    _152 = false;
    float _699 = _126;
    float _701 = _128;
    bool _703 = _134;
    float _705 = _138;
    float _707 = _142;
    float _709 = _146;
    float _711 = _150;
    bool _713 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    bool _715 = !_713;
    float _717 = _699;
    float _719 = _701;
    float _721 = _701;
    float _723 = _699;
    float _737;
    float _739;
    if (!_715)
    {
        float _725 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _727 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _729 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _725);
        float _731 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _727);
        float _733 = _729 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _735 = _731 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _737 = _735;
        _739 = _733;
        _741 = true;
    }
    else
    {
        int _743 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _745 = _743 != 0;
        if (!_745)
        {
            _717 = _701;
        }
        float _747 = _717;
        float _749 = _747;
        _739 = _747;
        if (!_745)
        {
            _719 = _699;
        }
        float _751 = _719;
        bool _753 = !_745;
        float _755 = _751;
        _737 = _751;
        if (!_753)
        {
            if (!_703)
            {
                _749 = _701;
            }
            float _757 = _749;
            float _759 = _757;
            int _761 = as_type<int>(_757);
            if (!_703)
            {
                _755 = _699;
            }
            float _763 = _755;
            bool _765 = !_703;
            float _767 = _763;
            float _769 = _763;
            if (!_765)
            {
                int _771 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _773 = _771 != 0;
                int _775 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _777 = _775 != 0;
                int _779 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _781 = _779 != 0;
                int _783 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _785 = _783 != 0;
                int _787 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _789 = _787 != 0;
                if (_773)
                {
                    _759 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _791 = _759;
                float _793 = _791;
                if (_773)
                {
                    _767 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _795 = _767;
                float _797 = _795;
                if (!_773)
                {
                    _793 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _799 = _793;
                if (!_773)
                {
                    _797 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _801 = _797;
                float _803 = _799 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _805 = _801 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_785)
                {
                    float _807 = _803 * _701;
                    _721 = _807;
                }
                float _809 = _721;
                float _811 = -_803;
                float _813 = _811 + 1.0;
                int _815 = as_type<int>(_809);
                if (_789)
                {
                    float _817 = _805 * _699;
                    _723 = _817;
                }
                float _819 = _723;
                float _821 = -_805;
                float _823 = _821 + 1.0;
                float _825 = _819;
                if (_777)
                {
                    float _827 = _809 + _813;
                    _815 = as_type<int>(_827);
                }
                int _829 = _815;
                if (_781)
                {
                    float _831 = _819 + _823;
                    _825 = _831;
                }
                float _833 = _825;
                _761 = _829;
                _769 = _833;
            }
            int _835 = _761;
            float _837 = _769;
            int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _841 = _839 != 0;
            int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _845 = _843 != 0;
            int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _849 = _847 != 0;
            int _851 = _835;
            int _853 = as_type<int>(_837);
            if (_845)
            {
                float _855 = -as_type<float>(_835);
                float _857 = _855 + 1.0;
                _851 = as_type<int>(_857);
            }
            int _859 = _851;
            if (_849)
            {
                float _861 = -_837;
                float _863 = _861 + 1.0;
                _853 = as_type<int>(_863);
            }
            int _865 = _853;
            bool _867 = !_841;
            float _869 = _867 ? as_type<float>(_859) : as_type<float>(_865);
            bool _871 = !_841;
            float _873 = _871 ? as_type<float>(_865) : as_type<float>(_859);
            _737 = _873;
            _739 = _869;
        }
    }
    _741 = false;
    float _875 = _737;
    float _877 = _739;
    float _879 = _875 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _881 = _875 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _883 = _705 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _885 = _707 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _887 = fma(_877, (*spvDescriptorSet0.vp_c3)._m0[10].x, _879);
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c3)._m0[9].x, _881);
    float _891 = _709 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _893 = _711 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _895 = _887 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _897 = _889 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _899 = -_895;
    float _901 = _899 + 1.0;
    out.m_27.x = _883;
    out.m_27.y = _885;
    out.m_27.z = _891;
    out.m_27.w = _893;
    out.m_29.x = _897;
    out.m_29.y = _901;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _741 = false;
    bool _152 = false;
    bool _299 = false;
    bool _297 = false;
    bool _293 = false;
    bool _289 = false;
    bool _285 = false;
    bool _281 = false;
    bool _277 = false;
    bool _273 = false;
    bool _269 = false;
    bool _265 = false;
    bool _261 = false;
    bool _257 = false;
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
    float _112 = _65;
    float _114 = _89;
    float _116 = _95;
    float _118 = _97;
    float _120 = _99;
    float _122 = _99;
    float _124 = _101;
    float _126 = _45;
    float _128 = _43;
    bool _134;
    float _138;
    float _142;
    float _146;
    float _150;
    if (!_110)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        _134 = _132;
        if (_132)
        {
            _112 = 255.0;
        }
        float _136 = _112;
        _138 = _136;
        if (_132)
        {
            _114 = 255.0;
        }
        float _140 = _114;
        _142 = _140;
        if (_132)
        {
            _116 = 255.0;
        }
        float _144 = _116;
        _146 = _144;
        if (_132)
        {
            _118 = 255.0;
        }
        float _148 = _118;
        _150 = _148;
        _152 = _132;
        if (!_152)
        {
            float _154 = trunc(_43);
            int _156 = int(_154);
            float _158 = trunc(_45);
            int _160 = int(_158);
            int _162 = _160 << 1;
            int _164 = _162 + _156;
            int _166 = _164 << 4;
            bool _168 = _166 == 0;
            bool _170 = _166 == 16;
            bool _172 = _166 == 32;
            bool _174 = _166 == 48;
            float _176 = as_type<float>(_166);
            _138 = 255.0;
            _142 = 255.0;
            _146 = 255.0;
            _150 = 255.0;
            if (_168)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _178 = _176;
            float _180 = _178;
            if (_168)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _182 = _120;
            float _184 = _182;
            if (_170)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _186 = _180;
            float _188 = _186;
            if (_170)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _190 = _184;
            float _192 = _190;
            if (_172)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _194 = _188;
            float _196 = _194;
            if (_172)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _198 = _192;
            float _200 = _198;
            if (_174)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _202 = _196;
            if (_174)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _204 = _200;
            _126 = _204;
            _128 = _202;
            _152 = true;
        }
    }
    else
    {
        int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _208 = _206 != 0;
        uint _211 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _213 = int(_211) & 15;
        bool _215 = !_208;
        float _217 = as_type<float>(_213);
        _134 = _208;
        if (!_215)
        {
            uint _219 = min(uint(_213), 13u);
            float _221 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _223 = int(_219) << 2;
            uint _225 = uint(int(uint(_223) >> uint(2)));
            uint _227 = uint(int(uint(int(_225)) >> uint(2)));
            int _229 = int(_225) & 3;
            float _231 = (*spvDescriptorSet0.vp_c1)._m0[int(_227)][_229];
            float _233 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _235 = _221 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _237 = _221 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _239 = _233 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _241 = _233 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _243 = as_type<int>(_231) >> 31;
            bool _245 = as_type<int>(_231) == 1248;
            float _247 = as_type<float>(_243);
            float _249 = _237;
            float _251 = _231;
            float _253 = _241;
            if (!_245)
            {
                bool _255 = as_type<int>(_231) == 1296;
                _257 = _255;
                if (!_257)
                {
                    bool _259 = as_type<int>(_231) == 1360;
                    _261 = _259;
                    if (!_261)
                    {
                        bool _263 = as_type<int>(_231) == 1424;
                        _265 = _263;
                        if (!_265)
                        {
                            bool _267 = as_type<int>(_231) == 1504;
                            _269 = _267;
                            if (!_269)
                            {
                                bool _271 = as_type<int>(_231) == 1584;
                                _273 = _271;
                                if (!_273)
                                {
                                    bool _275 = as_type<int>(_231) == 1680;
                                    _277 = _275;
                                    if (!_277)
                                    {
                                        bool _279 = as_type<int>(_231) == 1760;
                                        _281 = _279;
                                        if (!_281)
                                        {
                                            bool _283 = as_type<int>(_231) == 1856;
                                            _285 = _283;
                                            if (!_285)
                                            {
                                                bool _287 = as_type<int>(_231) == 1920;
                                                _289 = _287;
                                                if (!_289)
                                                {
                                                    bool _291 = as_type<int>(_231) == 2000;
                                                    _293 = _291;
                                                    if (!_293)
                                                    {
                                                        bool _295 = as_type<int>(_231) == 2064;
                                                        _297 = _295;
                                                        if (!_297)
                                                        {
                                                            _299 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _305;
            float _307;
            if (!_257)
            {
                if (!_261)
                {
                    if (!_265)
                    {
                        if (!_269)
                        {
                            if (!_273)
                            {
                                if (!_277)
                                {
                                    if (!_281)
                                    {
                                        if (!_285)
                                        {
                                            if (!_289)
                                            {
                                                if (!_293)
                                                {
                                                    if (!_297)
                                                    {
                                                        if (!_299)
                                                        {
                                                            float _301 = _235 * _43;
                                                            float _303 = _239 * _45;
                                                            _305 = _303;
                                                            _307 = _301;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269) || _265) || _261) || _257)
            {
                if ((!_261) || _257)
                {
                    if ((!_265) || _257)
                    {
                        if ((!_269) || _257)
                        {
                            if ((!_273) || _257)
                            {
                                if ((!_277) || _257)
                                {
                                    if ((!_281) || _257)
                                    {
                                        if ((!_285) || _257)
                                        {
                                            if ((!_289) || _257)
                                            {
                                                if ((!_293) || _257)
                                                {
                                                    if ((!_297) || _257)
                                                    {
                                                        if ((!_299) || _257)
                                                        {
                                                            _257 = false;
                                                            float _309 = -_237;
                                                            float _311 = _309 + 1.0;
                                                            float _313 = _239 * _45;
                                                            float _315 = fma(_237, _43, _311);
                                                            _305 = _313;
                                                            _307 = _315;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269) || _265) || _261)
                {
                    if ((!_265) || _261)
                    {
                        if ((!_269) || _261)
                        {
                            if ((!_273) || _261)
                            {
                                if ((!_277) || _261)
                                {
                                    if ((!_281) || _261)
                                    {
                                        if ((!_285) || _261)
                                        {
                                            if ((!_289) || _261)
                                            {
                                                if ((!_293) || _261)
                                                {
                                                    if ((!_297) || _261)
                                                    {
                                                        if ((!_299) || _261)
                                                        {
                                                            _261 = false;
                                                            float _317 = -_241;
                                                            float _319 = _317 + 1.0;
                                                            float _321 = _235 * _43;
                                                            float _323 = fma(_241, _45, _319);
                                                            _305 = _323;
                                                            _307 = _321;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269) || _265)
                    {
                        if ((!_269) || _265)
                        {
                            if ((!_273) || _265)
                            {
                                if ((!_277) || _265)
                                {
                                    if ((!_281) || _265)
                                    {
                                        if ((!_285) || _265)
                                        {
                                            if ((!_289) || _265)
                                            {
                                                if ((!_293) || _265)
                                                {
                                                    if ((!_297) || _265)
                                                    {
                                                        if ((!_299) || _265)
                                                        {
                                                            _265 = false;
                                                            float _325 = -_237;
                                                            float _327 = _325 + 1.0;
                                                            float _329 = -_241;
                                                            float _331 = _329 + 1.0;
                                                            float _333 = fma(_237, _43, _327);
                                                            float _335 = fma(_241, _45, _331);
                                                            _305 = _335;
                                                            _307 = _333;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269)
                        {
                            if ((!_273) || _269)
                            {
                                if ((!_277) || _269)
                                {
                                    if ((!_281) || _269)
                                    {
                                        if ((!_285) || _269)
                                        {
                                            if ((!_289) || _269)
                                            {
                                                if ((!_293) || _269)
                                                {
                                                    if ((!_297) || _269)
                                                    {
                                                        if ((!_299) || _269)
                                                        {
                                                            _269 = false;
                                                            float _337 = -_239;
                                                            float _339 = _337 + 1.0;
                                                            float _341 = _235 * _43;
                                                            float _343 = -_241;
                                                            float _345 = _343 + _339;
                                                            float _347 = fma(_345, _45, _239);
                                                            _305 = _347;
                                                            _307 = _341;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273)
                            {
                                if ((!_277) || _273)
                                {
                                    if ((!_281) || _273)
                                    {
                                        if ((!_285) || _273)
                                        {
                                            if ((!_289) || _273)
                                            {
                                                if ((!_293) || _273)
                                                {
                                                    if ((!_297) || _273)
                                                    {
                                                        if ((!_299) || _273)
                                                        {
                                                            _273 = false;
                                                            float _349 = -_239;
                                                            float _351 = _349 + 1.0;
                                                            float _353 = -_237;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = -_241;
                                                            float _359 = _357 + _351;
                                                            float _361 = fma(_237, _43, _355);
                                                            float _363 = fma(_359, _45, _239);
                                                            _305 = _363;
                                                            _307 = _361;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277)
                                {
                                    if ((!_281) || _277)
                                    {
                                        if ((!_285) || _277)
                                        {
                                            if ((!_289) || _277)
                                            {
                                                if ((!_293) || _277)
                                                {
                                                    if ((!_297) || _277)
                                                    {
                                                        if ((!_299) || _277)
                                                        {
                                                            _277 = false;
                                                            float _365 = -_235;
                                                            float _367 = _365 + 1.0;
                                                            float _369 = _239 * _45;
                                                            float _371 = -_237;
                                                            float _373 = _371 + _367;
                                                            float _375 = fma(_373, _43, _235);
                                                            _305 = _369;
                                                            _307 = _375;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _299) || _297) || _293) || _289) || _285) || _281)
                                    {
                                        if ((!_285) || _281)
                                        {
                                            if ((!_289) || _281)
                                            {
                                                if ((!_293) || _281)
                                                {
                                                    if ((!_297) || _281)
                                                    {
                                                        if ((!_299) || _281)
                                                        {
                                                            _281 = false;
                                                            float _377 = -_235;
                                                            float _379 = _377 + 1.0;
                                                            float _381 = -_241;
                                                            float _383 = _381 + 1.0;
                                                            float _385 = -_237;
                                                            float _387 = _385 + _379;
                                                            float _389 = fma(_241, _45, _383);
                                                            float _391 = fma(_387, _43, _235);
                                                            _305 = _389;
                                                            _307 = _391;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _299) || _297) || _293) || _289) || _285)
                                        {
                                            if ((!_289) || _285)
                                            {
                                                if ((!_293) || _285)
                                                {
                                                    if ((!_297) || _285)
                                                    {
                                                        if ((!_299) || _285)
                                                        {
                                                            _285 = false;
                                                            float _393 = -_237;
                                                            float _395 = _393 + 1.0;
                                                            float _397 = _239 * _45;
                                                            float _399 = _395 * _43;
                                                            _305 = _397;
                                                            _307 = _399;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _299) || _297) || _293) || _289)
                                            {
                                                if ((!_293) || _289)
                                                {
                                                    if ((!_297) || _289)
                                                    {
                                                        if ((!_299) || _289)
                                                        {
                                                            _289 = false;
                                                            float _401 = -_237;
                                                            float _403 = _401 + 1.0;
                                                            float _405 = -_241;
                                                            float _407 = _405 + 1.0;
                                                            float _409 = fma(_237, _43, _403);
                                                            float _411 = _407 * _45;
                                                            _305 = _411;
                                                            _307 = _409;
                                                        }
                                                    }
                                                }
                                                if (((false || _299) || _297) || _293)
                                                {
                                                    if ((!_297) || _293)
                                                    {
                                                        if ((!_299) || _293)
                                                        {
                                                            _293 = false;
                                                            float _413 = -_239;
                                                            float _415 = _413 + 1.0;
                                                            float _417 = _235 * _43;
                                                            float _419 = fma(_415, _45, _239);
                                                            _305 = _419;
                                                            _307 = _417;
                                                        }
                                                    }
                                                    if ((false || _299) || _297)
                                                    {
                                                        if ((!_299) || _297)
                                                        {
                                                            _297 = false;
                                                            float _421 = -_235;
                                                            float _423 = _421 + 1.0;
                                                            float _425 = -_241;
                                                            float _427 = _425 + 1.0;
                                                            float _429 = fma(_423, _43, _235);
                                                            float _431 = fma(_241, _45, _427);
                                                            _305 = _431;
                                                            _307 = _429;
                                                        }
                                                        if (false || _299)
                                                        {
                                                            _299 = false;
                                                            bool _433 = _213 != 12;
                                                            if (!_433)
                                                            {
                                                                float _435 = -_239;
                                                                float _437 = _435 + 1.0;
                                                                _247 = _437;
                                                            }
                                                            float _439 = _247;
                                                            if (!_433)
                                                            {
                                                                float _441 = -_237;
                                                                float _443 = _441 + 1.0;
                                                                _249 = _443;
                                                            }
                                                            float _445 = _249;
                                                            if (_433)
                                                            {
                                                                _251 = 0.0;
                                                            }
                                                            float _447 = _251;
                                                            float _449 = _447;
                                                            if (!_433)
                                                            {
                                                                float _451 = -_241;
                                                                float _453 = _451 + _439;
                                                                _253 = _453;
                                                            }
                                                            float _455 = _253;
                                                            if (_433)
                                                            {
                                                                _217 = 0.0;
                                                            }
                                                            float _457 = _217;
                                                            _305 = _457;
                                                            if (!_433)
                                                            {
                                                                float _459 = _43 * _445;
                                                                _449 = _459;
                                                            }
                                                            float _461 = _449;
                                                            _307 = _461;
                                                            if (!_433)
                                                            {
                                                                float _463 = _45 * _455;
                                                                _305 = _463;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _465 = _305;
            float _467 = _307;
            float _469 = -_465;
            float _471 = _469 + 1.0;
            float _473 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _475 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _477 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _479 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _481 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _483 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _485 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _487 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _489 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].x, _473);
            float _491 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].x, _475);
            float _493 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].y, _477);
            float _495 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].y, _479);
            float _497 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].z, _481);
            float _499 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].z, _483);
            float _501 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].w, _485);
            float _503 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].w, _487);
            float _505 = -_467;
            float _507 = _505 + 1.0;
            float _509 = _489 * _467;
            float _511 = _493 * _467;
            float _513 = _497 * _467;
            float _515 = _503 * _467;
            float _517 = fma(_507, _491, _509);
            float _519 = fma(_507, _495, _511);
            float _521 = fma(_507, _499, _513);
            float _523 = fma(_507, _501, _515);
            _138 = _517;
            _142 = _519;
            _146 = _521;
            _150 = _523;
            _152 = true;
        }
        else
        {
            float _525 = trunc(_43);
            int _527 = int(_525);
            float _529 = trunc(_45);
            int _531 = int(_529);
            int _533 = _531 << 1;
            int _535 = _533 + _527;
            int _537 = _535 << 4;
            bool _539 = _537 == 0;
            bool _541 = _537 == 16;
            bool _543 = _537 == 32;
            bool _545 = _537 == 48;
            if (_539)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _547 = _122;
            float _549 = _547;
            if (_539)
            {
                _124 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _551 = _124;
            bool _553 = _213 != 13;
            float _555 = _551;
            if (_541)
            {
                _549 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _557 = _549;
            float _559 = _557;
            if (_541)
            {
                _555 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _561 = _555;
            float _563 = _561;
            if (_543)
            {
                _559 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _565 = _559;
            float _567 = _565;
            if (_543)
            {
                _563 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _569 = _563;
            float _571 = _569;
            if (_545)
            {
                _567 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _573 = _567;
            if (_545)
            {
                _571 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _575 = _571;
            if (!_553)
            {
                float _577 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _579 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _581 = _577 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _583 = -_581;
                float _585 = _583 + 1.0;
                float _587 = _579 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _589 = -_577;
                float _591 = fma(_589, (*spvDescriptorSet0.vp_c3)._m0[26].w, _585);
                float _593 = -_587;
                float _595 = _593 + 1.0;
                float _597 = fma(_591, _45, _581);
                float _599 = -_579;
                float _601 = fma(_599, (*spvDescriptorSet0.vp_c3)._m0[26].y, _595);
                float _603 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _605 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _607 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _609 = fma(_601, _43, _587);
                float _611 = -_597;
                float _613 = _611 + 1.0;
                float _615 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _617 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _619 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _621 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _623 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _625 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].y, _603);
                float _627 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].x, _605);
                float _629 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].x, _607);
                float _631 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].y, _615);
                float _633 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].z, _617);
                float _635 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].z, _619);
                float _637 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].w, _621);
                float _639 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].w, _623);
                float _641 = -_609;
                float _643 = _641 + 1.0;
                float _645 = _609 * _625;
                float _647 = _609 * _627;
                float _649 = _609 * _633;
                float _651 = _609 * _639;
                float _653 = fma(_643, _631, _645);
                float _655 = fma(_643, _629, _647);
                float _657 = fma(_643, _635, _649);
                float _659 = fma(_643, _637, _651);
                _126 = _575;
                _128 = _573;
                _138 = _655;
                _142 = _653;
                _146 = _657;
                _150 = _659;
                _152 = true;
            }
            else
            {
                int _661 = _535 << 4;
                int _663 = _661 + 464;
                uint _665 = uint(int(uint(_663) >> uint(2)));
                uint _667 = uint(int(uint(int(_665)) >> uint(2)));
                int _669 = int(_665) & 3;
                float _671 = (*spvDescriptorSet0.vp_c3)._m0[int(_667)][_669];
                int _673 = int(_665) + 1;
                uint _675 = uint(int(uint(_673) >> uint(2)));
                int _677 = _673 & 3;
                float _679 = (*spvDescriptorSet0.vp_c3)._m0[int(_675)][_677];
                int _681 = _663 + 8;
                uint _683 = uint(int(uint(_681) >> uint(2)));
                uint _685 = uint(int(uint(int(_683)) >> uint(2)));
                int _687 = int(_683) & 3;
                float _689 = (*spvDescriptorSet0.vp_c3)._m0[int(_685)][_687];
                int _691 = int(_683) + 1;
                uint _693 = uint(int(uint(_691) >> uint(2)));
                int _695 = _691 & 3;
                float _697 = (*spvDescriptorSet0.vp_c3)._m0[int(_693)][_695];
                _126 = _575;
                _128 = _573;
                _138 = _671;
                _142 = _679;
                _146 = _689;
                _150 = _697;
            }
        }
    }
    _152 = false;
    float _699 = _126;
    float _701 = _128;
    bool _703 = _134;
    float _705 = _138;
    float _707 = _142;
    float _709 = _146;
    float _711 = _150;
    bool _713 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    bool _715 = !_713;
    float _717 = _699;
    float _719 = _701;
    float _721 = _701;
    float _723 = _699;
    float _737;
    float _739;
    if (!_715)
    {
        float _725 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _727 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _729 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _725);
        float _731 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _727);
        float _733 = _729 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _735 = _731 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _737 = _735;
        _739 = _733;
        _741 = true;
    }
    else
    {
        int _743 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _745 = _743 != 0;
        if (!_745)
        {
            _717 = _701;
        }
        float _747 = _717;
        float _749 = _747;
        _739 = _747;
        if (!_745)
        {
            _719 = _699;
        }
        float _751 = _719;
        bool _753 = !_745;
        float _755 = _751;
        _737 = _751;
        if (!_753)
        {
            if (!_703)
            {
                _749 = _701;
            }
            float _757 = _749;
            float _759 = _757;
            int _761 = as_type<int>(_757);
            if (!_703)
            {
                _755 = _699;
            }
            float _763 = _755;
            bool _765 = !_703;
            float _767 = _763;
            float _769 = _763;
            if (!_765)
            {
                int _771 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _773 = _771 != 0;
                int _775 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _777 = _775 != 0;
                int _779 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _781 = _779 != 0;
                int _783 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _785 = _783 != 0;
                int _787 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _789 = _787 != 0;
                if (_773)
                {
                    _759 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _791 = _759;
                float _793 = _791;
                if (_773)
                {
                    _767 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _795 = _767;
                float _797 = _795;
                if (!_773)
                {
                    _793 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _799 = _793;
                if (!_773)
                {
                    _797 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _801 = _797;
                float _803 = _799 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _805 = _801 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_785)
                {
                    float _807 = _803 * _701;
                    _721 = _807;
                }
                float _809 = _721;
                float _811 = -_803;
                float _813 = _811 + 1.0;
                int _815 = as_type<int>(_809);
                if (_789)
                {
                    float _817 = _805 * _699;
                    _723 = _817;
                }
                float _819 = _723;
                float _821 = -_805;
                float _823 = _821 + 1.0;
                float _825 = _819;
                if (_777)
                {
                    float _827 = _809 + _813;
                    _815 = as_type<int>(_827);
                }
                int _829 = _815;
                if (_781)
                {
                    float _831 = _819 + _823;
                    _825 = _831;
                }
                float _833 = _825;
                _761 = _829;
                _769 = _833;
            }
            int _835 = _761;
            float _837 = _769;
            int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _841 = _839 != 0;
            int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _845 = _843 != 0;
            int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _849 = _847 != 0;
            int _851 = _835;
            int _853 = as_type<int>(_837);
            if (_845)
            {
                float _855 = -as_type<float>(_835);
                float _857 = _855 + 1.0;
                _851 = as_type<int>(_857);
            }
            int _859 = _851;
            if (_849)
            {
                float _861 = -_837;
                float _863 = _861 + 1.0;
                _853 = as_type<int>(_863);
            }
            int _865 = _853;
            bool _867 = !_841;
            float _869 = _867 ? as_type<float>(_859) : as_type<float>(_865);
            bool _871 = !_841;
            float _873 = _871 ? as_type<float>(_865) : as_type<float>(_859);
            _737 = _873;
            _739 = _869;
        }
    }
    _741 = false;
    float _875 = _737;
    float _877 = _739;
    float _879 = _875 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _881 = _875 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _883 = _705 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _885 = _707 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _887 = fma(_877, (*spvDescriptorSet0.vp_c3)._m0[10].x, _879);
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c3)._m0[9].x, _881);
    float _891 = _709 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _893 = _711 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _895 = _887 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _897 = _889 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _899 = -_895;
    float _901 = _899 + 1.0;
    out.m_27.x = _883;
    out.m_27.y = _885;
    out.m_27.z = _891;
    out.m_27.w = _893;
    out.m_29.x = _897;
    out.m_29.y = _901;
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
    bool _741 = false;
    bool _152 = false;
    bool _299 = false;
    bool _297 = false;
    bool _293 = false;
    bool _289 = false;
    bool _285 = false;
    bool _281 = false;
    bool _277 = false;
    bool _273 = false;
    bool _269 = false;
    bool _265 = false;
    bool _261 = false;
    bool _257 = false;
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
    float _112 = _65;
    float _114 = _89;
    float _116 = _95;
    float _118 = _97;
    float _120 = _99;
    float _122 = _99;
    float _124 = _101;
    float _126 = _45;
    float _128 = _43;
    bool _134;
    float _138;
    float _142;
    float _146;
    float _150;
    if (!_110)
    {
        int _130 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _132 = _130 != 0;
        _134 = _132;
        if (_132)
        {
            _112 = 255.0;
        }
        float _136 = _112;
        _138 = _136;
        if (_132)
        {
            _114 = 255.0;
        }
        float _140 = _114;
        _142 = _140;
        if (_132)
        {
            _116 = 255.0;
        }
        float _144 = _116;
        _146 = _144;
        if (_132)
        {
            _118 = 255.0;
        }
        float _148 = _118;
        _150 = _148;
        _152 = _132;
        if (!_152)
        {
            float _154 = trunc(_43);
            int _156 = int(_154);
            float _158 = trunc(_45);
            int _160 = int(_158);
            int _162 = _160 << 1;
            int _164 = _162 + _156;
            int _166 = _164 << 4;
            bool _168 = _166 == 0;
            bool _170 = _166 == 16;
            bool _172 = _166 == 32;
            bool _174 = _166 == 48;
            float _176 = as_type<float>(_166);
            _138 = 255.0;
            _142 = 255.0;
            _146 = 255.0;
            _150 = 255.0;
            if (_168)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _178 = _176;
            float _180 = _178;
            if (_168)
            {
                _120 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _182 = _120;
            float _184 = _182;
            if (_170)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _186 = _180;
            float _188 = _186;
            if (_170)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _190 = _184;
            float _192 = _190;
            if (_172)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _194 = _188;
            float _196 = _194;
            if (_172)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _198 = _192;
            float _200 = _198;
            if (_174)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _202 = _196;
            if (_174)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _204 = _200;
            _126 = _204;
            _128 = _202;
            _152 = true;
        }
    }
    else
    {
        int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _208 = _206 != 0;
        uint _211 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
        int _213 = int(_211) & 15;
        bool _215 = !_208;
        float _217 = as_type<float>(_213);
        _134 = _208;
        if (!_215)
        {
            uint _219 = min(uint(_213), 13u);
            float _221 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
            int _223 = int(_219) << 2;
            uint _225 = uint(int(uint(_223) >> uint(2)));
            uint _227 = uint(int(uint(int(_225)) >> uint(2)));
            int _229 = int(_225) & 3;
            float _231 = (*spvDescriptorSet0.vp_c1)._m0[int(_227)][_229];
            float _233 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
            float _235 = _221 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
            float _237 = _221 * (*spvDescriptorSet0.vp_c3)._m0[26].y;
            float _239 = _233 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
            float _241 = _233 * (*spvDescriptorSet0.vp_c3)._m0[26].w;
            int _243 = as_type<int>(_231) >> 31;
            bool _245 = as_type<int>(_231) == 1248;
            float _247 = as_type<float>(_243);
            float _249 = _237;
            float _251 = _231;
            float _253 = _241;
            if (!_245)
            {
                bool _255 = as_type<int>(_231) == 1296;
                _257 = _255;
                if (!_257)
                {
                    bool _259 = as_type<int>(_231) == 1360;
                    _261 = _259;
                    if (!_261)
                    {
                        bool _263 = as_type<int>(_231) == 1424;
                        _265 = _263;
                        if (!_265)
                        {
                            bool _267 = as_type<int>(_231) == 1504;
                            _269 = _267;
                            if (!_269)
                            {
                                bool _271 = as_type<int>(_231) == 1584;
                                _273 = _271;
                                if (!_273)
                                {
                                    bool _275 = as_type<int>(_231) == 1680;
                                    _277 = _275;
                                    if (!_277)
                                    {
                                        bool _279 = as_type<int>(_231) == 1760;
                                        _281 = _279;
                                        if (!_281)
                                        {
                                            bool _283 = as_type<int>(_231) == 1856;
                                            _285 = _283;
                                            if (!_285)
                                            {
                                                bool _287 = as_type<int>(_231) == 1920;
                                                _289 = _287;
                                                if (!_289)
                                                {
                                                    bool _291 = as_type<int>(_231) == 2000;
                                                    _293 = _291;
                                                    if (!_293)
                                                    {
                                                        bool _295 = as_type<int>(_231) == 2064;
                                                        _297 = _295;
                                                        if (!_297)
                                                        {
                                                            _299 = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _305;
            float _307;
            if (!_257)
            {
                if (!_261)
                {
                    if (!_265)
                    {
                        if (!_269)
                        {
                            if (!_273)
                            {
                                if (!_277)
                                {
                                    if (!_281)
                                    {
                                        if (!_285)
                                        {
                                            if (!_289)
                                            {
                                                if (!_293)
                                                {
                                                    if (!_297)
                                                    {
                                                        if (!_299)
                                                        {
                                                            float _301 = _235 * _43;
                                                            float _303 = _239 * _45;
                                                            _305 = _303;
                                                            _307 = _301;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((((((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269) || _265) || _261) || _257)
            {
                if ((!_261) || _257)
                {
                    if ((!_265) || _257)
                    {
                        if ((!_269) || _257)
                        {
                            if ((!_273) || _257)
                            {
                                if ((!_277) || _257)
                                {
                                    if ((!_281) || _257)
                                    {
                                        if ((!_285) || _257)
                                        {
                                            if ((!_289) || _257)
                                            {
                                                if ((!_293) || _257)
                                                {
                                                    if ((!_297) || _257)
                                                    {
                                                        if ((!_299) || _257)
                                                        {
                                                            _257 = false;
                                                            float _309 = -_237;
                                                            float _311 = _309 + 1.0;
                                                            float _313 = _239 * _45;
                                                            float _315 = fma(_237, _43, _311);
                                                            _305 = _313;
                                                            _307 = _315;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (((((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269) || _265) || _261)
                {
                    if ((!_265) || _261)
                    {
                        if ((!_269) || _261)
                        {
                            if ((!_273) || _261)
                            {
                                if ((!_277) || _261)
                                {
                                    if ((!_281) || _261)
                                    {
                                        if ((!_285) || _261)
                                        {
                                            if ((!_289) || _261)
                                            {
                                                if ((!_293) || _261)
                                                {
                                                    if ((!_297) || _261)
                                                    {
                                                        if ((!_299) || _261)
                                                        {
                                                            _261 = false;
                                                            float _317 = -_241;
                                                            float _319 = _317 + 1.0;
                                                            float _321 = _235 * _43;
                                                            float _323 = fma(_241, _45, _319);
                                                            _305 = _323;
                                                            _307 = _321;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269) || _265)
                    {
                        if ((!_269) || _265)
                        {
                            if ((!_273) || _265)
                            {
                                if ((!_277) || _265)
                                {
                                    if ((!_281) || _265)
                                    {
                                        if ((!_285) || _265)
                                        {
                                            if ((!_289) || _265)
                                            {
                                                if ((!_293) || _265)
                                                {
                                                    if ((!_297) || _265)
                                                    {
                                                        if ((!_299) || _265)
                                                        {
                                                            _265 = false;
                                                            float _325 = -_237;
                                                            float _327 = _325 + 1.0;
                                                            float _329 = -_241;
                                                            float _331 = _329 + 1.0;
                                                            float _333 = fma(_237, _43, _327);
                                                            float _335 = fma(_241, _45, _331);
                                                            _305 = _335;
                                                            _307 = _333;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273) || _269)
                        {
                            if ((!_273) || _269)
                            {
                                if ((!_277) || _269)
                                {
                                    if ((!_281) || _269)
                                    {
                                        if ((!_285) || _269)
                                        {
                                            if ((!_289) || _269)
                                            {
                                                if ((!_293) || _269)
                                                {
                                                    if ((!_297) || _269)
                                                    {
                                                        if ((!_299) || _269)
                                                        {
                                                            _269 = false;
                                                            float _337 = -_239;
                                                            float _339 = _337 + 1.0;
                                                            float _341 = _235 * _43;
                                                            float _343 = -_241;
                                                            float _345 = _343 + _339;
                                                            float _347 = fma(_345, _45, _239);
                                                            _305 = _347;
                                                            _307 = _341;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277) || _273)
                            {
                                if ((!_277) || _273)
                                {
                                    if ((!_281) || _273)
                                    {
                                        if ((!_285) || _273)
                                        {
                                            if ((!_289) || _273)
                                            {
                                                if ((!_293) || _273)
                                                {
                                                    if ((!_297) || _273)
                                                    {
                                                        if ((!_299) || _273)
                                                        {
                                                            _273 = false;
                                                            float _349 = -_239;
                                                            float _351 = _349 + 1.0;
                                                            float _353 = -_237;
                                                            float _355 = _353 + 1.0;
                                                            float _357 = -_241;
                                                            float _359 = _357 + _351;
                                                            float _361 = fma(_237, _43, _355);
                                                            float _363 = fma(_359, _45, _239);
                                                            _305 = _363;
                                                            _307 = _361;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (((((((false || _299) || _297) || _293) || _289) || _285) || _281) || _277)
                                {
                                    if ((!_281) || _277)
                                    {
                                        if ((!_285) || _277)
                                        {
                                            if ((!_289) || _277)
                                            {
                                                if ((!_293) || _277)
                                                {
                                                    if ((!_297) || _277)
                                                    {
                                                        if ((!_299) || _277)
                                                        {
                                                            _277 = false;
                                                            float _365 = -_235;
                                                            float _367 = _365 + 1.0;
                                                            float _369 = _239 * _45;
                                                            float _371 = -_237;
                                                            float _373 = _371 + _367;
                                                            float _375 = fma(_373, _43, _235);
                                                            _305 = _369;
                                                            _307 = _375;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((((((false || _299) || _297) || _293) || _289) || _285) || _281)
                                    {
                                        if ((!_285) || _281)
                                        {
                                            if ((!_289) || _281)
                                            {
                                                if ((!_293) || _281)
                                                {
                                                    if ((!_297) || _281)
                                                    {
                                                        if ((!_299) || _281)
                                                        {
                                                            _281 = false;
                                                            float _377 = -_235;
                                                            float _379 = _377 + 1.0;
                                                            float _381 = -_241;
                                                            float _383 = _381 + 1.0;
                                                            float _385 = -_237;
                                                            float _387 = _385 + _379;
                                                            float _389 = fma(_241, _45, _383);
                                                            float _391 = fma(_387, _43, _235);
                                                            _305 = _389;
                                                            _307 = _391;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if (((((false || _299) || _297) || _293) || _289) || _285)
                                        {
                                            if ((!_289) || _285)
                                            {
                                                if ((!_293) || _285)
                                                {
                                                    if ((!_297) || _285)
                                                    {
                                                        if ((!_299) || _285)
                                                        {
                                                            _285 = false;
                                                            float _393 = -_237;
                                                            float _395 = _393 + 1.0;
                                                            float _397 = _239 * _45;
                                                            float _399 = _395 * _43;
                                                            _305 = _397;
                                                            _307 = _399;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((((false || _299) || _297) || _293) || _289)
                                            {
                                                if ((!_293) || _289)
                                                {
                                                    if ((!_297) || _289)
                                                    {
                                                        if ((!_299) || _289)
                                                        {
                                                            _289 = false;
                                                            float _401 = -_237;
                                                            float _403 = _401 + 1.0;
                                                            float _405 = -_241;
                                                            float _407 = _405 + 1.0;
                                                            float _409 = fma(_237, _43, _403);
                                                            float _411 = _407 * _45;
                                                            _305 = _411;
                                                            _307 = _409;
                                                        }
                                                    }
                                                }
                                                if (((false || _299) || _297) || _293)
                                                {
                                                    if ((!_297) || _293)
                                                    {
                                                        if ((!_299) || _293)
                                                        {
                                                            _293 = false;
                                                            float _413 = -_239;
                                                            float _415 = _413 + 1.0;
                                                            float _417 = _235 * _43;
                                                            float _419 = fma(_415, _45, _239);
                                                            _305 = _419;
                                                            _307 = _417;
                                                        }
                                                    }
                                                    if ((false || _299) || _297)
                                                    {
                                                        if ((!_299) || _297)
                                                        {
                                                            _297 = false;
                                                            float _421 = -_235;
                                                            float _423 = _421 + 1.0;
                                                            float _425 = -_241;
                                                            float _427 = _425 + 1.0;
                                                            float _429 = fma(_423, _43, _235);
                                                            float _431 = fma(_241, _45, _427);
                                                            _305 = _431;
                                                            _307 = _429;
                                                        }
                                                        if (false || _299)
                                                        {
                                                            _299 = false;
                                                            bool _433 = _213 != 12;
                                                            if (!_433)
                                                            {
                                                                float _435 = -_239;
                                                                float _437 = _435 + 1.0;
                                                                _247 = _437;
                                                            }
                                                            float _439 = _247;
                                                            if (!_433)
                                                            {
                                                                float _441 = -_237;
                                                                float _443 = _441 + 1.0;
                                                                _249 = _443;
                                                            }
                                                            float _445 = _249;
                                                            if (_433)
                                                            {
                                                                _251 = 0.0;
                                                            }
                                                            float _447 = _251;
                                                            float _449 = _447;
                                                            if (!_433)
                                                            {
                                                                float _451 = -_241;
                                                                float _453 = _451 + _439;
                                                                _253 = _453;
                                                            }
                                                            float _455 = _253;
                                                            if (_433)
                                                            {
                                                                _217 = 0.0;
                                                            }
                                                            float _457 = _217;
                                                            _305 = _457;
                                                            if (!_433)
                                                            {
                                                                float _459 = _43 * _445;
                                                                _449 = _459;
                                                            }
                                                            float _461 = _449;
                                                            _307 = _461;
                                                            if (!_433)
                                                            {
                                                                float _463 = _45 * _455;
                                                                _305 = _463;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _465 = _305;
            float _467 = _307;
            float _469 = -_465;
            float _471 = _469 + 1.0;
            float _473 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
            float _475 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
            float _477 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
            float _479 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
            float _481 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
            float _483 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
            float _485 = _465 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
            float _487 = _465 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
            float _489 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].x, _473);
            float _491 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].x, _475);
            float _493 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].y, _477);
            float _495 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].y, _479);
            float _497 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].z, _481);
            float _499 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].z, _483);
            float _501 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[29].w, _485);
            float _503 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[30].w, _487);
            float _505 = -_467;
            float _507 = _505 + 1.0;
            float _509 = _489 * _467;
            float _511 = _493 * _467;
            float _513 = _497 * _467;
            float _515 = _503 * _467;
            float _517 = fma(_507, _491, _509);
            float _519 = fma(_507, _495, _511);
            float _521 = fma(_507, _499, _513);
            float _523 = fma(_507, _501, _515);
            _138 = _517;
            _142 = _519;
            _146 = _521;
            _150 = _523;
            _152 = true;
        }
        else
        {
            float _525 = trunc(_43);
            int _527 = int(_525);
            float _529 = trunc(_45);
            int _531 = int(_529);
            int _533 = _531 << 1;
            int _535 = _533 + _527;
            int _537 = _535 << 4;
            bool _539 = _537 == 0;
            bool _541 = _537 == 16;
            bool _543 = _537 == 32;
            bool _545 = _537 == 48;
            if (_539)
            {
                _122 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _547 = _122;
            float _549 = _547;
            if (_539)
            {
                _124 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _551 = _124;
            bool _553 = _213 != 13;
            float _555 = _551;
            if (_541)
            {
                _549 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _557 = _549;
            float _559 = _557;
            if (_541)
            {
                _555 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _561 = _555;
            float _563 = _561;
            if (_543)
            {
                _559 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _565 = _559;
            float _567 = _565;
            if (_543)
            {
                _563 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _569 = _563;
            float _571 = _569;
            if (_545)
            {
                _567 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _573 = _567;
            if (_545)
            {
                _571 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _575 = _571;
            if (!_553)
            {
                float _577 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].y;
                float _579 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[27].x;
                float _581 = _577 * (*spvDescriptorSet0.vp_c3)._m0[26].z;
                float _583 = -_581;
                float _585 = _583 + 1.0;
                float _587 = _579 * (*spvDescriptorSet0.vp_c3)._m0[26].x;
                float _589 = -_577;
                float _591 = fma(_589, (*spvDescriptorSet0.vp_c3)._m0[26].w, _585);
                float _593 = -_587;
                float _595 = _593 + 1.0;
                float _597 = fma(_591, _45, _581);
                float _599 = -_579;
                float _601 = fma(_599, (*spvDescriptorSet0.vp_c3)._m0[26].y, _595);
                float _603 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
                float _605 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].x;
                float _607 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].x;
                float _609 = fma(_601, _43, _587);
                float _611 = -_597;
                float _613 = _611 + 1.0;
                float _615 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
                float _617 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].z;
                float _619 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].z;
                float _621 = _597 * (*spvDescriptorSet0.vp_c3)._m0[31].w;
                float _623 = _597 * (*spvDescriptorSet0.vp_c3)._m0[32].w;
                float _625 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].y, _603);
                float _627 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].x, _605);
                float _629 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].x, _607);
                float _631 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].y, _615);
                float _633 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].z, _617);
                float _635 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].z, _619);
                float _637 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[29].w, _621);
                float _639 = fma(_613, (*spvDescriptorSet0.vp_c3)._m0[30].w, _623);
                float _641 = -_609;
                float _643 = _641 + 1.0;
                float _645 = _609 * _625;
                float _647 = _609 * _627;
                float _649 = _609 * _633;
                float _651 = _609 * _639;
                float _653 = fma(_643, _631, _645);
                float _655 = fma(_643, _629, _647);
                float _657 = fma(_643, _635, _649);
                float _659 = fma(_643, _637, _651);
                _126 = _575;
                _128 = _573;
                _138 = _655;
                _142 = _653;
                _146 = _657;
                _150 = _659;
                _152 = true;
            }
            else
            {
                int _661 = _535 << 4;
                int _663 = _661 + 464;
                uint _665 = uint(int(uint(_663) >> uint(2)));
                uint _667 = uint(int(uint(int(_665)) >> uint(2)));
                int _669 = int(_665) & 3;
                float _671 = (*spvDescriptorSet0.vp_c3)._m0[int(_667)][_669];
                int _673 = int(_665) + 1;
                uint _675 = uint(int(uint(_673) >> uint(2)));
                int _677 = _673 & 3;
                float _679 = (*spvDescriptorSet0.vp_c3)._m0[int(_675)][_677];
                int _681 = _663 + 8;
                uint _683 = uint(int(uint(_681) >> uint(2)));
                uint _685 = uint(int(uint(int(_683)) >> uint(2)));
                int _687 = int(_683) & 3;
                float _689 = (*spvDescriptorSet0.vp_c3)._m0[int(_685)][_687];
                int _691 = int(_683) + 1;
                uint _693 = uint(int(uint(_691) >> uint(2)));
                int _695 = _691 & 3;
                float _697 = (*spvDescriptorSet0.vp_c3)._m0[int(_693)][_695];
                _126 = _575;
                _128 = _573;
                _138 = _671;
                _142 = _679;
                _146 = _689;
                _150 = _697;
            }
        }
    }
    _152 = false;
    float _699 = _126;
    float _701 = _128;
    bool _703 = _134;
    float _705 = _138;
    float _707 = _142;
    float _709 = _146;
    float _711 = _150;
    bool _713 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    bool _715 = !_713;
    float _717 = _699;
    float _719 = _701;
    float _721 = _701;
    float _723 = _699;
    float _737;
    float _739;
    if (!_715)
    {
        float _725 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _727 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _729 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _725);
        float _731 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _727);
        float _733 = _729 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _735 = _731 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _737 = _735;
        _739 = _733;
        _741 = true;
    }
    else
    {
        int _743 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _745 = _743 != 0;
        if (!_745)
        {
            _717 = _701;
        }
        float _747 = _717;
        float _749 = _747;
        _739 = _747;
        if (!_745)
        {
            _719 = _699;
        }
        float _751 = _719;
        bool _753 = !_745;
        float _755 = _751;
        _737 = _751;
        if (!_753)
        {
            if (!_703)
            {
                _749 = _701;
            }
            float _757 = _749;
            float _759 = _757;
            int _761 = as_type<int>(_757);
            if (!_703)
            {
                _755 = _699;
            }
            float _763 = _755;
            bool _765 = !_703;
            float _767 = _763;
            float _769 = _763;
            if (!_765)
            {
                int _771 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _773 = _771 != 0;
                int _775 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _777 = _775 != 0;
                int _779 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _781 = _779 != 0;
                int _783 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _785 = _783 != 0;
                int _787 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _789 = _787 != 0;
                if (_773)
                {
                    _759 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _791 = _759;
                float _793 = _791;
                if (_773)
                {
                    _767 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _795 = _767;
                float _797 = _795;
                if (!_773)
                {
                    _793 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _799 = _793;
                if (!_773)
                {
                    _797 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _801 = _797;
                float _803 = _799 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _805 = _801 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_785)
                {
                    float _807 = _803 * _701;
                    _721 = _807;
                }
                float _809 = _721;
                float _811 = -_803;
                float _813 = _811 + 1.0;
                int _815 = as_type<int>(_809);
                if (_789)
                {
                    float _817 = _805 * _699;
                    _723 = _817;
                }
                float _819 = _723;
                float _821 = -_805;
                float _823 = _821 + 1.0;
                float _825 = _819;
                if (_777)
                {
                    float _827 = _809 + _813;
                    _815 = as_type<int>(_827);
                }
                int _829 = _815;
                if (_781)
                {
                    float _831 = _819 + _823;
                    _825 = _831;
                }
                float _833 = _825;
                _761 = _829;
                _769 = _833;
            }
            int _835 = _761;
            float _837 = _769;
            int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _841 = _839 != 0;
            int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _845 = _843 != 0;
            int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _849 = _847 != 0;
            int _851 = _835;
            int _853 = as_type<int>(_837);
            if (_845)
            {
                float _855 = -as_type<float>(_835);
                float _857 = _855 + 1.0;
                _851 = as_type<int>(_857);
            }
            int _859 = _851;
            if (_849)
            {
                float _861 = -_837;
                float _863 = _861 + 1.0;
                _853 = as_type<int>(_863);
            }
            int _865 = _853;
            bool _867 = !_841;
            float _869 = _867 ? as_type<float>(_859) : as_type<float>(_865);
            bool _871 = !_841;
            float _873 = _871 ? as_type<float>(_865) : as_type<float>(_859);
            _737 = _873;
            _739 = _869;
        }
    }
    _741 = false;
    float _875 = _737;
    float _877 = _739;
    float _879 = _875 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _881 = _875 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _883 = _705 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _885 = _707 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _887 = fma(_877, (*spvDescriptorSet0.vp_c3)._m0[10].x, _879);
    float _889 = fma(_877, (*spvDescriptorSet0.vp_c3)._m0[9].x, _881);
    float _891 = _709 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _893 = _711 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _895 = _887 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _897 = _889 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _899 = -_895;
    float _901 = _899 + 1.0;
    out.m_27.x = _883;
    out.m_27.y = _885;
    out.m_27.z = _891;
    out.m_27.w = _893;
    out.m_29.x = _897;
    out.m_29.y = _901;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

